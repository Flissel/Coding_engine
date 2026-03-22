#!/bin/bash
# claude-runner-entrypoint.sh — Persistent Claude Code CLI runner
#
# Watches a git repo for new branches, runs Claude Code to apply/build/test.
# Terminal output visible via VNC (tmux in xterm on Xvfb).
#
# Environment:
#   ANTHROPIC_API_KEY  - Required (Claude API key)
#   WATCH_REPO         - Path to git repo (default: /repo)
#   POLL_INTERVAL      - Seconds between git polls (default: 30)
#   BRANCH_PREFIX      - Comma-separated prefixes to watch (default: update/,pr/,feature/)

set -e

echo "=== Claude Code Runner Starting ==="
echo "Watch Repo:   ${WATCH_REPO:-/repo}"
echo "Poll Interval: ${POLL_INTERVAL:-30}s"
echo "Branch Prefixes: ${BRANCH_PREFIX:-update/,pr/,feature/}"

# ============================================================================
# STATUS REPORTING
# ============================================================================

STATUS_DIR="/status"
STATUS_FILE="${STATUS_DIR}/runner-status.json"
mkdir -p "$STATUS_DIR"

write_status() {
    local state="$1"
    local message="$2"
    local branch="${3:-}"
    local details="${4:-}"
    cat > "$STATUS_FILE" << EOF
{
    "state": "${state}",
    "message": "${message}",
    "branch": "${branch}",
    "details": "${details}",
    "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "uptime_seconds": ${SECONDS}
}
EOF
}

write_status "starting" "Initializing Claude Runner..." "" ""

# ============================================================================
# VNC SETUP (pattern from sandbox-entrypoint.sh)
# ============================================================================

start_xvfb() {
    if ! pgrep -x Xvfb > /dev/null; then
        echo "[VNC] Starting Xvfb on display :99..."
        Xvfb :99 -screen 0 1280x800x24 &
        sleep 2
    fi
    export DISPLAY=:99
}

start_vnc() {
    echo "=== Starting VNC Screen Streaming ==="
    start_xvfb

    if ! pgrep -x "x11vnc" > /dev/null; then
        x11vnc -display :99 -nopw -forever -shared \
               -rfbport "${VNC_PORT:-5900}" -bg -o /tmp/x11vnc.log
        sleep 1
    fi

    websockify --web=/usr/share/novnc "${NOVNC_PORT:-6080}" \
               localhost:"${VNC_PORT:-5900}" &
    sleep 1

    echo "[VNC] x11vnc on port ${VNC_PORT:-5900}"
    echo "[VNC] noVNC at: http://localhost:${NOVNC_PORT:-6080}/vnc.html"
}

# ============================================================================
# TMUX SESSION (visible in VNC via xterm)
# ============================================================================

setup_tmux() {
    echo "=== Setting up tmux session ==="

    # Create tmux session (160x40 is good for 1280x800 display)
    tmux new-session -d -s claude-runner -x 160 -y 40

    # Split: top 70% for Claude Code, bottom 30% for status
    tmux split-window -v -p 30 -t claude-runner

    # Bottom pane: live status watch
    tmux send-keys -t claude-runner:0.1 \
        "watch -n 5 'cat ${STATUS_FILE} 2>/dev/null | jq . 2>/dev/null || echo \"Waiting for status...\"'" C-m

    # Display tmux in xterm on the Xvfb display
    xterm -display :99 -maximized -fa "DejaVu Sans Mono" -fs 11 \
          -bg black -fg green \
          -e "tmux attach -t claude-runner" &

    sleep 1
    echo "[tmux] Session created and displayed in VNC"
}

# ============================================================================
# GIT WATCHER
# ============================================================================

KNOWN_BRANCHES_FILE="/tmp/known_branches.txt"
PROCESSED_FILE="/tmp/processed_branches.txt"

initialize_git() {
    cd "${WATCH_REPO}"

    if [ ! -d ".git" ]; then
        echo "ERROR: ${WATCH_REPO} is not a git repository"
        write_status "error" "Not a git repository" "" "${WATCH_REPO}"
        exit 1
    fi

    # Handle Windows line endings
    git config core.autocrlf input 2>/dev/null || true

    # Record existing branches so we don't process old ones
    git fetch --all --prune 2>/dev/null || true
    git branch -r --format='%(refname:short)' > "$KNOWN_BRANCHES_FILE"
    touch "$PROCESSED_FILE"

    echo "[Git] Initialized. Known remote branches:"
    cat "$KNOWN_BRANCHES_FILE" | sed 's/^/  /'
}

# Check if branch name matches any watched prefix
matches_prefix() {
    local branch="$1"
    local short_branch="${branch#origin/}"
    local IFS=','
    for prefix in ${BRANCH_PREFIX}; do
        prefix=$(echo "$prefix" | xargs)
        if [[ "$short_branch" == ${prefix}* ]]; then
            return 0
        fi
    done
    return 1
}

# ============================================================================
# AUTO-DEPENDENCY INSTALL
# ============================================================================
# Detects project type and installs dependencies before Claude Code runs.
# This ensures the environment is ready for building and testing.

install_dependencies() {
    local repo_dir="$1"
    echo "[Deps] Detecting project type in ${repo_dir}..."

    # --- Node.js ---
    if [ -f "${repo_dir}/package.json" ]; then
        echo "[Deps] Found package.json — installing Node dependencies..."
        cd "${repo_dir}"
        if [ -f "pnpm-lock.yaml" ]; then
            echo "[Deps]   Using pnpm..."
            pnpm install --frozen-lockfile 2>/dev/null || pnpm install 2>/dev/null || true
        elif [ -f "yarn.lock" ]; then
            echo "[Deps]   Using yarn..."
            yarn install --frozen-lockfile 2>/dev/null || yarn install 2>/dev/null || true
        else
            echo "[Deps]   Using npm..."
            npm ci 2>/dev/null || npm install 2>/dev/null || true
        fi
    fi

    # --- Python ---
    if [ -f "${repo_dir}/requirements.txt" ]; then
        echo "[Deps] Found requirements.txt — installing Python dependencies..."
        pip3 install --no-cache-dir --break-system-packages -r "${repo_dir}/requirements.txt" 2>/dev/null || true
    fi
    if [ -f "${repo_dir}/pyproject.toml" ]; then
        echo "[Deps] Found pyproject.toml — installing Python project..."
        cd "${repo_dir}"
        pip3 install --no-cache-dir --break-system-packages -e ".[dev]" 2>/dev/null || \
        pip3 install --no-cache-dir --break-system-packages -e . 2>/dev/null || true
    fi
    if [ -f "${repo_dir}/setup.py" ]; then
        echo "[Deps] Found setup.py — installing Python project..."
        cd "${repo_dir}"
        pip3 install --no-cache-dir --break-system-packages -e . 2>/dev/null || true
    fi

    # --- Rust ---
    if [ -f "${repo_dir}/Cargo.toml" ]; then
        echo "[Deps] Found Cargo.toml — fetching Rust dependencies..."
        cd "${repo_dir}"
        cargo fetch 2>/dev/null || true
    fi

    # --- Go ---
    if [ -f "${repo_dir}/go.mod" ]; then
        echo "[Deps] Found go.mod — downloading Go modules..."
        cd "${repo_dir}"
        go mod download 2>/dev/null || true
    fi

    echo "[Deps] Dependency installation complete."
}

# ============================================================================
# PROCESS BRANCH
# ============================================================================

# Process a single branch with Claude Code
process_branch() {
    local branch="$1"
    local short_branch="${branch#origin/}"

    echo ""
    echo "========================================"
    echo "  Processing: $short_branch"
    echo "  Time: $(date)"
    echo "========================================"

    write_status "processing" "Checking out ${short_branch}..." "$short_branch" ""

    # Checkout the branch
    git checkout -f "$short_branch" 2>/dev/null || \
        git checkout -f -b "$short_branch" "$branch" 2>/dev/null || {
            echo "ERROR: Could not checkout $short_branch"
            write_status "error" "Checkout failed" "$short_branch" "git checkout failed"
            return 1
        }

    git pull origin "$short_branch" 2>/dev/null || true

    # Auto-install dependencies before Claude Code runs
    write_status "processing" "Installing dependencies for ${short_branch}..." "$short_branch" "Auto-detecting project type"
    install_dependencies "${WATCH_REPO}"

    write_status "processing" "Claude Code analyzing changes..." "$short_branch" "Running diff, build, test"

    # Build the Claude Code prompt
    local prompt="You are inside a git repository on branch '${short_branch}'.
The environment has Node.js 20, Python 3, Rust, and Go pre-installed.
Dependencies from package.json/requirements.txt/Cargo.toml/go.mod have been auto-installed.

Please do the following:
1. Run: git diff main...HEAD --stat   (to see what changed)
2. Review the changes on this branch compared to main
3. If there are additional dependencies needed, install them (npm install X, pip install X, cargo add X, etc.)
4. Build the project (npm run build, make, cargo build, go build, etc.)
5. Run any available tests (npm test, pytest, cargo test, go test ./..., etc.)
6. If tests fail, try to fix the issues and re-run
7. Commit any fixes you make with a clear message
8. Provide a summary: what changed, does it build, do tests pass, what did you fix?"

    # Run Claude Code in headless mode
    local output_file="/tmp/claude-output-${short_branch//\//_}.txt"

    if claude -p "$prompt" \
        --dangerously-skip-permissions \
        > "$output_file" 2>&1; then

        local summary
        summary=$(tail -20 "$output_file" | head -c 500)
        echo "Claude Code completed successfully"
        write_status "completed" "Branch ${short_branch} processed" "$short_branch" "$summary"
    else
        local exit_code=$?
        echo "Claude Code failed (exit code: $exit_code)"
        local err_summary
        err_summary=$(tail -10 "$output_file" | head -c 300)
        write_status "failed" "Claude Code failed on ${short_branch}" "$short_branch" "Exit: $exit_code. $err_summary"
    fi

    # Return to main branch
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || true

    # Mark as processed
    echo "$branch" >> "$PROCESSED_FILE"
}

# Main polling loop
poll_loop() {
    echo "[Watcher] Starting git poll loop (every ${POLL_INTERVAL:-30}s)..."
    write_status "idle" "Watching for new branches..." "" "Polling every ${POLL_INTERVAL:-30}s"

    while true; do
        cd "${WATCH_REPO}"

        # Fetch remote changes
        if ! git fetch --all --prune 2>/dev/null; then
            echo "[Watcher] git fetch failed, retrying next cycle"
            sleep "${POLL_INTERVAL:-30}"
            continue
        fi

        # Get current remote branches
        local current_branches
        current_branches=$(git branch -r --format='%(refname:short)')

        # Find new branches matching our prefix filter
        local found_new=false
        while IFS= read -r branch; do
            [ -z "$branch" ] && continue

            # Skip if already processed
            grep -qxF "$branch" "$PROCESSED_FILE" 2>/dev/null && continue

            # Skip if already known (was there at startup)
            grep -qxF "$branch" "$KNOWN_BRANCHES_FILE" 2>/dev/null && continue

            # Check prefix match
            if matches_prefix "$branch"; then
                found_new=true
                echo ""
                echo "[Watcher] New branch detected: $branch"

                # Run process_branch inside tmux top pane so it's visible in VNC
                tmux send-keys -t claude-runner:0.0 "" C-c 2>/dev/null || true
                sleep 0.5
                tmux send-keys -t claude-runner:0.0 \
                    "cd ${WATCH_REPO} && source /usr/local/bin/claude-runner-entrypoint.sh && process_branch '$branch'" C-m
            fi
        done <<< "$current_branches"

        # Update known branches
        echo "$current_branches" > "$KNOWN_BRANCHES_FILE"

        if [ "$found_new" = false ]; then
            write_status "idle" "Watching for new branches..." "" \
                "Last check: $(date +%H:%M:%S). Next in ${POLL_INTERVAL:-30}s"
        fi

        sleep "${POLL_INTERVAL:-30}"
    done
}

# ============================================================================
# MAIN
# ============================================================================

main() {
    if [ -z "$ANTHROPIC_API_KEY" ]; then
        echo "ERROR: ANTHROPIC_API_KEY not set"
        write_status "error" "ANTHROPIC_API_KEY not set" "" "Set via -e ANTHROPIC_API_KEY=..."
        exit 1
    fi

    # Start VNC stack
    start_vnc

    # Setup tmux (visible in VNC)
    setup_tmux

    # Initialize git repo
    initialize_git

    # Pre-install dependencies from main branch so builds are fast
    echo "[Init] Pre-installing dependencies from main branch..."
    install_dependencies "${WATCH_REPO}"

    # Start the poll loop in tmux top pane (visible in VNC)
    tmux send-keys -t claude-runner:0.0 \
        "source /usr/local/bin/claude-runner-entrypoint.sh && poll_loop" C-m

    write_status "idle" "Runner started, watching for branches..." "" ""
    echo "=== Claude Code Runner Ready ==="
    echo "VNC: http://localhost:${NOVNC_PORT:-6080}/vnc.html"

    # Keep container alive
    tail -f /dev/null
}

# Allow sourcing for individual function calls (from tmux panes)
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main
fi

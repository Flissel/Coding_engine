#!/bin/bash
# continuous-debug-loop.sh — Runs inside sandbox container.
# Every POLL_INTERVAL seconds:
#   1. Detect source file changes
#   2. Rebuild + restart app
#   3. If errors → call KiloCLI (via OpenRouter) to auto-fix
#   4. Switch VNC browser from loading page to real app
#
# KiloCLI config must be at /root/.kilocode/cli/config.json

set -uo pipefail

POLL_INTERVAL="${RELOAD_POLL_INTERVAL:-30}"
APP_DIR="/app"
MAX_FIX_ATTEMPTS="${MAX_KILO_FIX_ATTEMPTS:-5}"
CHECKSUM_FILE="/tmp/.src_checksum"
PKG_CHECKSUM_FILE="/tmp/.pkg_checksum"
BROWSER_SWITCHED="false"
LOG_FILE="/tmp/debug-loop.log"

# ── Logging ──────────────────────────────────────────────

log() { echo "[debug-loop] $(date +%H:%M:%S) $*" | tee -a "$LOG_FILE"; }

# ── Checksums ────────────────────────────────────────────

compute_src_checksum() {
    find "$APP_DIR/src" "$APP_DIR/prisma" \
        -type f \( -name '*.ts' -o -name '*.tsx' -o -name '*.js' -o -name '*.json' \) \
        2>/dev/null | sort | xargs md5sum 2>/dev/null | md5sum | awk '{print $1}'
}

compute_pkg_checksum() {
    md5sum "$APP_DIR/package.json" 2>/dev/null | awk '{print $1}'
}

# ── App lifecycle ────────────────────────────────────────

app_is_responding() {
    local code
    for port in 3000 5173 8000; do
        code=$(curl -s -o /dev/null -w '%{http_code}' "http://localhost:$port" 2>/dev/null || echo "000")
        if [ "$code" != "000" ]; then return 0; fi
    done
    return 1
}

find_app_pid() {
    ps aux 2>/dev/null | grep -E 'ts-node|node.*main|npm.*start|uvicorn|gunicorn' \
        | grep -v grep | head -1 | awk '{print $2}'
}

kill_app() {
    local pid
    pid=$(find_app_pid)
    if [ -n "$pid" ]; then
        log "Stopping app (PID $pid)"
        kill "$pid" 2>/dev/null || true
        sleep 2
        kill -9 "$pid" 2>/dev/null || true
    fi
}

start_app() {
    cd "$APP_DIR"
    if [ -f "package.json" ] && grep -q '"start"' package.json 2>/dev/null; then
        npm start > /tmp/app_stdout.log 2>&1 &
        log "App started via npm start (PID $!)"
    elif [ -f "main.py" ]; then
        python3 main.py > /tmp/app_stdout.log 2>&1 &
        log "App started via python3 main.py (PID $!)"
    fi
}

# ── Build ────────────────────────────────────────────────

do_install() {
    local new_pkg old_pkg
    new_pkg=$(compute_pkg_checksum)
    old_pkg=$(cat "$PKG_CHECKSUM_FILE" 2>/dev/null || echo "")
    if [ "$new_pkg" != "$old_pkg" ]; then
        log "package.json changed — npm install"
        cd "$APP_DIR"
        npm install --force --legacy-peer-deps 2>&1 | tail -5
        echo "$new_pkg" > "$PKG_CHECKSUM_FILE"
    fi
}

do_build() {
    cd "$APP_DIR"
    local output
    output=$(npm run build 2>&1) || true
    local exit_code=$?
    echo "$output" > /tmp/last_build.log

    if [ $exit_code -ne 0 ] || echo "$output" | grep -qi "error TS"; then
        log "Build errors detected"
        echo "$output" | grep -i "error" | tail -20
        return 1
    fi

    if [ -f "prisma/schema.prisma" ]; then
        npx prisma generate 2>&1 | tail -3 || true
    fi

    log "Build OK"
    return 0
}

# ── KiloCLI auto-fix ─────────────────────────────────────

kilo_fix() {
    local error_log="$1"
    local attempt="$2"

    if ! command -v kilocode &>/dev/null; then
        log "KiloCLI not installed — skipping fix"
        return 1
    fi

    if [ ! -f /root/.kilocode/cli/config.json ]; then
        log "KiloCLI config missing — skipping fix"
        return 1
    fi

    log "=== KiloCLI fix attempt $attempt/$MAX_FIX_ATTEMPTS ==="

    local prompt
    prompt="Fix these build/runtime errors in the project at /app.
This is attempt $attempt of $MAX_FIX_ATTEMPTS.

ERROR OUTPUT:
$(echo "$error_log" | tail -40)

INSTRUCTIONS:
1. Read the error messages carefully
2. Find and fix the source files causing errors
3. Minimal changes only — do NOT refactor or add features
4. If a Prisma model is missing, add it to prisma/schema.prisma
5. If an import is wrong, fix the import path
6. If a type is missing, check the generated Prisma client or DTOs"

    cd "$APP_DIR"

    # Run KiloCLI v0.26 in autonomous debug mode
    local fix_output
    fix_output=$(timeout 180 kilocode --auto --yolo -w "$APP_DIR" -m debug "$prompt" 2>&1) || true
    echo "$fix_output" > "/tmp/kilo_fix_${attempt}.log"

    log "KiloCLI fix attempt $attempt done ($(echo "$fix_output" | wc -l) lines output)"
    return 0
}

runtime_check() {
    sleep 5
    if app_is_responding; then
        log "App responding — runtime OK"
        return 0
    fi

    local app_log
    app_log=$(tail -50 /tmp/app_stdout.log 2>/dev/null || echo "")
    if echo "$app_log" | grep -qiE "error|exception|EADDRINUSE|cannot find module"; then
        log "Runtime errors detected"
        echo "$app_log" | grep -iE "error|exception|cannot" | tail -10
        return 1
    fi

    sleep 10
    if app_is_responding; then return 0; fi

    log "App not responding after 15s"
    return 1
}

# ── Browser management ───────────────────────────────────

switch_browser() {
    if [ "$BROWSER_SWITCHED" = "true" ]; then return; fi
    if [ "${ENABLE_VNC:-}" != "true" ]; then return; fi

    local url=""
    for try_url in "http://localhost:3000" "http://localhost:5173" "http://localhost:8000"; do
        local code
        code=$(curl -s -o /dev/null -w '%{http_code}' "$try_url" 2>/dev/null || echo "000")
        if [ "$code" != "000" ]; then
            url="$try_url"
            break
        fi
    done

    if [ -z "$url" ]; then return; fi

    log "Switching browser → $url"

    # Kill loading-page browser
    kill $(ps aux 2>/dev/null | grep 'loading.html' | grep -v grep | awk '{print $2}') 2>/dev/null || true
    sleep 2

    DISPLAY=:99 chromium \
        --no-sandbox --disable-gpu --disable-software-rasterizer \
        --disable-dev-shm-usage --disable-extensions \
        --window-size=1280,800 --window-position=0,0 \
        --start-maximized --kiosk \
        --app="$url" --display=:99 &

    BROWSER_SWITCHED="true"
    log "Browser showing $url"
}

refresh_browser() {
    if command -v xdotool &>/dev/null; then
        DISPLAY=:99 xdotool key F5 2>/dev/null || true
        log "Browser refreshed"
    fi
}

# ── Main loop ────────────────────────────────────────────

log "=== Continuous Debug Loop started ==="
log "Poll interval: ${POLL_INTERVAL}s | Max fix attempts: $MAX_FIX_ATTEMPTS"
log "KiloCLI: $(command -v kilocode 2>/dev/null || echo 'NOT FOUND')"
log "KiloCLI config: $([ -f /root/.kilocode/cli/config.json ] && echo 'present' || echo 'MISSING')"

# Init checksums
compute_src_checksum > "$CHECKSUM_FILE" 2>/dev/null || echo "init" > "$CHECKSUM_FILE"
compute_pkg_checksum > "$PKG_CHECKSUM_FILE" 2>/dev/null || echo "init" > "$PKG_CHECKSUM_FILE"

# Initial wait for entrypoint to finish first build attempt
sleep 15

# If app already responding, just switch browser
if app_is_responding; then
    switch_browser
fi

while true; do
    # Step 1: Switch browser if needed
    if [ "$BROWSER_SWITCHED" = "false" ] && app_is_responding; then
        switch_browser
    fi

    # Step 2: Detect file changes
    new_checksum=$(compute_src_checksum 2>/dev/null || echo "err")
    old_checksum=$(cat "$CHECKSUM_FILE" 2>/dev/null || echo "")

    if [ "$new_checksum" != "$old_checksum" ] && [ "$new_checksum" != "err" ]; then
        log "=== Source changes detected ==="
        echo "$new_checksum" > "$CHECKSUM_FILE"

        kill_app
        do_install

        # Build → if fail → KiloCLI fix loop
        fix_attempt=0
        while [ $fix_attempt -lt $MAX_FIX_ATTEMPTS ]; do
            if do_build; then
                break
            fi

            fix_attempt=$((fix_attempt + 1))
            error_log=$(cat /tmp/last_build.log 2>/dev/null | tail -50)
            kilo_fix "$error_log" "$fix_attempt"
            do_install
        done

        # Start app
        start_app

        # Runtime check → if fail → KiloCLI fix
        if ! runtime_check; then
            rt_attempt=0
            while [ $rt_attempt -lt $MAX_FIX_ATTEMPTS ]; do
                rt_attempt=$((rt_attempt + 1))
                runtime_log=$(tail -50 /tmp/app_stdout.log 2>/dev/null || echo "App not responding")
                kilo_fix "$runtime_log" "$rt_attempt"
                do_install
                do_build || true
                kill_app
                start_app
                if runtime_check; then break; fi
            done
        fi

        # Refresh or switch browser
        if app_is_responding; then
            if [ "$BROWSER_SWITCHED" = "true" ]; then
                refresh_browser
            else
                switch_browser
            fi
        fi
    fi

    sleep "$POLL_INTERVAL"
done

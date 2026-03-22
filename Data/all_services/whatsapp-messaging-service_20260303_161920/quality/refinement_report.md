# Refinement Report

**Generated:** 2026-03-03T23:02:32.863656

## Summary

- **Iterations:** 1
- **Overall Score:** 78.6% → 96.0%
- **Gaps Found:** 225
- **Gaps Fixed:** 116
- **Gaps Remaining:** 110
- **LLM Calls:** 5
- **Cost:** $0.0020
- **Duration:** 19.4s

## Score Breakdown

| Dimension | Before | After | Delta | Status |
|-----------|--------|-------|-------|--------|
| Requirement -> Story | 100.0% | 100.0% | +0.0% | PASS |
| Story -> Test | 100.0% | 100.0% | +0.0% | PASS |
| Story -> Screen | 46.0% | 100.0% | +54.0% | PASS |
| API -> Requirement | 100.0% | 100.0% | +0.0% | PASS |
| Entity -> Requirement | 100.0% | 100.0% | +0.0% | PASS |
| State Machine Density | 55.6% | 100.0% | +44.4% | PASS |
| Task Backlinks | 100.0% | 100.0% | +0.0% | PASS |
| Task Ratio | 33.5% | 100.0% | +66.5% | PASS |
| Component Count | 20.8% | 20.8% | +0.0% | — |
| Flow Coverage | 35.7% | 100.0% | +64.3% | PASS |
| Quality Gates | 100.0% | 100.0% | +0.0% | PASS |
| Test <-> API Linkage | 100.0% | 100.0% | +0.0% | PASS |

## Gaps Found

### HIGH (1)

- **GAP-111** [task_ratio] Task ratio 0.7 below threshold 2.0 *(fix: auto_link)*

### MEDIUM (222)

- **GAP-001** [story_to_screen] Story US-014 has no screen *(fix: auto_link)*
- **GAP-002** [story_to_screen] Story US-015 has no screen *(fix: auto_link)*
- **GAP-003** [story_to_screen] Story US-016 has no screen *(fix: auto_link)*
- **GAP-004** [story_to_screen] Story US-017 has no screen *(fix: auto_link)*
- **GAP-005** [story_to_screen] Story US-018 has no screen *(fix: auto_link)*
- **GAP-006** [story_to_screen] Story US-019 has no screen *(fix: auto_link)*
- **GAP-007** [story_to_screen] Story US-021 has no screen *(fix: auto_link)*
- **GAP-008** [story_to_screen] Story US-022 has no screen *(fix: auto_link)*
- **GAP-009** [story_to_screen] Story US-023 has no screen *(fix: auto_link)*
- **GAP-010** [story_to_screen] Story US-024 has no screen *(fix: auto_link)*
- **GAP-011** [story_to_screen] Story US-025 has no screen *(fix: auto_link)*
- **GAP-012** [story_to_screen] Story US-026 has no screen *(fix: auto_link)*
- **GAP-013** [story_to_screen] Story US-028 has no screen *(fix: auto_link)*
- **GAP-014** [story_to_screen] Story US-029 has no screen *(fix: auto_link)*
- **GAP-015** [story_to_screen] Story US-030 has no screen *(fix: auto_link)*
- **GAP-016** [story_to_screen] Story US-031 has no screen *(fix: auto_link)*
- **GAP-017** [story_to_screen] Story US-032 has no screen *(fix: auto_link)*
- **GAP-018** [story_to_screen] Story US-033 has no screen *(fix: auto_link)*
- **GAP-019** [story_to_screen] Story US-034 has no screen *(fix: auto_link)*
- **GAP-020** [story_to_screen] Story US-035 has no screen *(fix: auto_link)*
- **GAP-021** [story_to_screen] Story US-037 has no screen *(fix: auto_link)*
- **GAP-022** [story_to_screen] Story US-038 has no screen *(fix: auto_link)*
- **GAP-023** [story_to_screen] Story US-039 has no screen *(fix: auto_link)*
- **GAP-024** [story_to_screen] Story US-041 has no screen *(fix: auto_link)*
- **GAP-025** [story_to_screen] Story US-050 has no screen *(fix: auto_link)*
- **GAP-026** [story_to_screen] Story US-051 has no screen *(fix: auto_link)*
- **GAP-027** [story_to_screen] Story US-052 has no screen *(fix: auto_link)*
- **GAP-028** [story_to_screen] Story US-053 has no screen *(fix: auto_link)*
- **GAP-029** [story_to_screen] Story US-055 has no screen *(fix: auto_link)*
- **GAP-030** [story_to_screen] Story US-056 has no screen *(fix: auto_link)*
- **GAP-031** [story_to_screen] Story US-057 has no screen *(fix: auto_link)*
- **GAP-032** [story_to_screen] Story US-059 has no screen *(fix: auto_link)*
- **GAP-033** [story_to_screen] Story US-061 has no screen *(fix: auto_link)*
- **GAP-034** [story_to_screen] Story US-063 has no screen *(fix: auto_link)*
- **GAP-035** [story_to_screen] Story US-064 has no screen *(fix: auto_link)*
- **GAP-036** [story_to_screen] Story US-065 has no screen *(fix: auto_link)*
- **GAP-037** [story_to_screen] Story US-066 has no screen *(fix: auto_link)*
- **GAP-038** [story_to_screen] Story US-067 has no screen *(fix: auto_link)*
- **GAP-039** [story_to_screen] Story US-068 has no screen *(fix: auto_link)*
- **GAP-040** [story_to_screen] Story US-069 has no screen *(fix: auto_link)*
- **GAP-041** [story_to_screen] Story US-070 has no screen *(fix: auto_link)*
- **GAP-042** [story_to_screen] Story US-071 has no screen *(fix: auto_link)*
- **GAP-043** [story_to_screen] Story US-072 has no screen *(fix: auto_link)*
- **GAP-044** [story_to_screen] Story US-073 has no screen *(fix: auto_link)*
- **GAP-045** [story_to_screen] Story US-074 has no screen *(fix: auto_link)*
- **GAP-046** [story_to_screen] Story US-076 has no screen *(fix: auto_link)*
- **GAP-047** [story_to_screen] Story US-077 has no screen *(fix: auto_link)*
- **GAP-048** [story_to_screen] Story US-079 has no screen *(fix: auto_link)*
- **GAP-049** [story_to_screen] Story US-080 has no screen *(fix: auto_link)*
- **GAP-050** [story_to_screen] Story US-081 has no screen *(fix: auto_link)*
- **GAP-051** [story_to_screen] Story US-084 has no screen *(fix: auto_link)*
- **GAP-052** [story_to_screen] Story US-085 has no screen *(fix: auto_link)*
- **GAP-053** [story_to_screen] Story US-086 has no screen *(fix: auto_link)*
- **GAP-054** [story_to_screen] Story US-088 has no screen *(fix: auto_link)*
- **GAP-055** [story_to_screen] Story US-089 has no screen *(fix: auto_link)*
- **GAP-056** [story_to_screen] Story US-090 has no screen *(fix: auto_link)*
- **GAP-057** [story_to_screen] Story US-091 has no screen *(fix: auto_link)*
- **GAP-058** [story_to_screen] Story US-093 has no screen *(fix: auto_link)*
- **GAP-059** [story_to_screen] Story US-097 has no screen *(fix: auto_link)*
- **GAP-060** [story_to_screen] Story US-098 has no screen *(fix: auto_link)*
- **GAP-061** [story_to_screen] Story US-099 has no screen *(fix: auto_link)*
- **GAP-062** [story_to_screen] Story US-100 has no screen *(fix: auto_link)*
- **GAP-063** [story_to_screen] Story US-101 has no screen *(fix: auto_link)*
- **GAP-064** [story_to_screen] Story US-102 has no screen *(fix: auto_link)*
- **GAP-065** [story_to_screen] Story US-103 has no screen *(fix: auto_link)*
- **GAP-066** [story_to_screen] Story US-104 has no screen *(fix: auto_link)*
- **GAP-067** [story_to_screen] Story US-105 has no screen *(fix: auto_link)*
- **GAP-068** [story_to_screen] Story US-106 has no screen *(fix: auto_link)*
- **GAP-069** [story_to_screen] Story US-107 has no screen *(fix: auto_link)*
- **GAP-070** [story_to_screen] Story US-108 has no screen *(fix: auto_link)*
- **GAP-071** [story_to_screen] Story US-109 has no screen *(fix: auto_link)*
- **GAP-072** [story_to_screen] Story US-110 has no screen *(fix: auto_link)*
- **GAP-073** [story_to_screen] Story US-111 has no screen *(fix: auto_link)*
- **GAP-074** [story_to_screen] Story US-112 has no screen *(fix: auto_link)*
- **GAP-075** [story_to_screen] Story US-113 has no screen *(fix: auto_link)*
- **GAP-076** [story_to_screen] Story US-114 has no screen *(fix: auto_link)*
- **GAP-077** [story_to_screen] Story US-115 has no screen *(fix: auto_link)*
- **GAP-078** [story_to_screen] Story US-116 has no screen *(fix: auto_link)*
- **GAP-079** [story_to_screen] Story US-117 has no screen *(fix: auto_link)*
- **GAP-080** [story_to_screen] Story US-118 has no screen *(fix: auto_link)*
- **GAP-081** [story_to_screen] Story US-119 has no screen *(fix: auto_link)*
- **GAP-082** [story_to_screen] Story US-120 has no screen *(fix: auto_link)*
- **GAP-083** [story_to_screen] Story US-122 has no screen *(fix: auto_link)*
- **GAP-084** [story_to_screen] Story US-123 has no screen *(fix: auto_link)*
- **GAP-085** [story_to_screen] Story US-124 has no screen *(fix: auto_link)*
- **GAP-086** [story_to_screen] Story US-125 has no screen *(fix: auto_link)*
- **GAP-087** [story_to_screen] Story US-126 has no screen *(fix: auto_link)*
- **GAP-088** [story_to_screen] Story US-128 has no screen *(fix: auto_link)*
- **GAP-089** [story_to_screen] Story US-135 has no screen *(fix: auto_link)*
- **GAP-090** [story_to_screen] Story US-136 has no screen *(fix: auto_link)*
- **GAP-091** [story_to_screen] Story US-139 has no screen *(fix: auto_link)*
- **GAP-092** [story_to_screen] Story US-148 has no screen *(fix: auto_link)*
- **GAP-093** [story_to_screen] Story US-150 has no screen *(fix: auto_link)*
- **GAP-094** [story_to_screen] Story US-151 has no screen *(fix: auto_link)*
- **GAP-095** [story_to_screen] Story US-153 has no screen *(fix: auto_link)*
- **GAP-096** [story_to_screen] Story US-154 has no screen *(fix: auto_link)*
- **GAP-097** [story_to_screen] Story US-155 has no screen *(fix: auto_link)*
- **GAP-098** [story_to_screen] Story US-156 has no screen *(fix: auto_link)*
- **GAP-099** [story_to_screen] Story US-158 has no screen *(fix: auto_link)*
- **GAP-100** [story_to_screen] Story US-160 has no screen *(fix: auto_link)*
- **GAP-101** [story_to_screen] Story US-161 has no screen *(fix: auto_link)*
- **GAP-102** [story_to_screen] Story US-162 has no screen *(fix: auto_link)*
- **GAP-103** [story_to_screen] Story US-163 has no screen *(fix: auto_link)*
- **GAP-104** [entity_to_req] Entity 'User' not linked to any requirement *(fix: llm_extend)*
- **GAP-105** [entity_to_req] Entity 'UserAuthMethod' not linked to any requirement *(fix: llm_extend)*
- **GAP-106** [entity_to_req] Entity 'contact' not linked to any requirement *(fix: llm_extend)*
- **GAP-107** [entity_to_req] Entity 'session' not linked to any requirement *(fix: llm_extend)*
- **GAP-108** [entity_to_req] Entity 'resilience_policy' not linked to any requirement *(fix: llm_extend)*
- **GAP-112** [component_count] Only 10 components for 40 screens *(fix: generator)*
- **GAP-113** [flow_coverage] Epic EPIC-001 has no matching user flow *(fix: auto_link)*
- **GAP-114** [flow_coverage] Epic EPIC-002 has no matching user flow *(fix: auto_link)*
- **GAP-115** [flow_coverage] Epic EPIC-003 has no matching user flow *(fix: auto_link)*
- **GAP-116** [flow_coverage] Epic EPIC-005 has no matching user flow *(fix: auto_link)*
- **GAP-117** [flow_coverage] Epic EPIC-007 has no matching user flow *(fix: auto_link)*
- **GAP-118** [test_api_linkage] API GET /api/v1/passkeys has no matching test *(fix: generator)*
- **GAP-119** [test_api_linkage] API GET /api/v1/devices has no matching test *(fix: generator)*
- **GAP-120** [test_api_linkage] API POST /api/v1/devices/batch has no matching test *(fix: generator)*
- **GAP-121** [test_api_linkage] API GET /api/v1/sessions has no matching test *(fix: generator)*
- **GAP-122** [test_api_linkage] API GET /internal/health has no matching test *(fix: generator)*
- **GAP-123** [test_api_linkage] API GET /internal/metrics has no matching test *(fix: generator)*
- **GAP-124** [test_api_linkage] API GET /internal/ready has no matching test *(fix: generator)*
- **GAP-125** [test_api_linkage] API GET /api/v1/users/{id} has no matching test *(fix: generator)*
- **GAP-126** [test_api_linkage] API POST /api/v1/users has no matching test *(fix: generator)*
- **GAP-127** [test_api_linkage] API PUT /api/v1/users/{id} has no matching test *(fix: generator)*
- **GAP-128** [test_api_linkage] API GET /api/v1/conversations has no matching test *(fix: generator)*
- **GAP-129** [test_api_linkage] API GET /api/v1/conversations/{id} has no matching test *(fix: generator)*
- **GAP-130** [test_api_linkage] API PUT /api/v1/conversations/{id} has no matching test *(fix: generator)*
- **GAP-131** [test_api_linkage] API DELETE /api/v1/conversations/{id} has no matching test *(fix: generator)*
- **GAP-132** [test_api_linkage] API GET /api/v1/profiles has no matching test *(fix: generator)*
- **GAP-133** [test_api_linkage] API GET /api/v1/presence/{userId} has no matching test *(fix: generator)*
- **GAP-134** [test_api_linkage] API POST /api/v1/presence/set has no matching test *(fix: generator)*
- **GAP-135** [test_api_linkage] API POST /api/v1/presence has no matching test *(fix: generator)*
- **GAP-136** [test_api_linkage] API GET /api/v1/media has no matching test *(fix: generator)*
- **GAP-137** [test_api_linkage] API DELETE /api/v1/media/{id} has no matching test *(fix: generator)*
- **GAP-138** [test_api_linkage] API GET /api/v1/presence has no matching test *(fix: generator)*
- **GAP-139** [test_api_linkage] API GET /api/v1/presence/{id} has no matching test *(fix: generator)*
- **GAP-140** [test_api_linkage] API PUT /api/v1/presence/{id} has no matching test *(fix: generator)*
- **GAP-141** [test_api_linkage] API DELETE /api/v1/presence/{id} has no matching test *(fix: generator)*
- **GAP-142** [test_api_linkage] API GET /api/v1/groups has no matching test *(fix: generator)*
- **GAP-143** [test_api_linkage] API GET /api/v1/presence/{presenceId} has no matching test *(fix: generator)*
- **GAP-144** [test_api_linkage] API PUT /api/v1/presence/{presenceId} has no matching test *(fix: generator)*
- **GAP-145** [test_api_linkage] API DELETE /api/v1/presence/{presenceId} has no matching test *(fix: generator)*
- **GAP-146** [test_api_linkage] API GET /api/v1/conversations/{conversationId}/polls has no matching test *(fix: generator)*
- **GAP-147** [test_api_linkage] API GET /api/v1/polls/{pollId} has no matching test *(fix: generator)*
- **GAP-148** [test_api_linkage] API PATCH /api/v1/polls/{pollId} has no matching test *(fix: generator)*
- **GAP-149** [test_api_linkage] API DELETE /api/v1/polls/{pollId} has no matching test *(fix: generator)*
- **GAP-150** [test_api_linkage] API GET /api/v1/polls/{pollId}/votes has no matching test *(fix: generator)*
- **GAP-151** [test_api_linkage] API GET /api/v1/group-events/{id}/rsvps/{userId} has no matching test *(fix: generator)*
- **GAP-152** [test_api_linkage] API DELETE /api/v1/group-events/{id}/rsvps/{userId} has no matching test *(fix: generator)*
- **GAP-153** [test_api_linkage] API GET /api/v1/screen-shares has no matching test *(fix: generator)*
- **GAP-154** [test_api_linkage] API GET /api/v1/screen-shares/{screenShareId} has no matching test *(fix: generator)*
- **GAP-155** [test_api_linkage] API PUT /api/v1/screen-shares/{screenShareId} has no matching test *(fix: generator)*
- **GAP-156** [test_api_linkage] API DELETE /api/v1/screen-shares/{screenShareId} has no matching test *(fix: generator)*
- **GAP-157** [test_api_linkage] API PUT /api/v1/presence/{userId} has no matching test *(fix: generator)*
- **GAP-158** [test_api_linkage] API PUT /api/v1/presence has no matching test *(fix: generator)*
- **GAP-159** [test_api_linkage] API GET /api/v1/presenceStatuses has no matching test *(fix: generator)*
- **GAP-160** [test_api_linkage] API DELETE /api/v1/media/{mediaId} has no matching test *(fix: generator)*
- **GAP-161** [test_api_linkage] API GET /api/v1/push-tokens has no matching test *(fix: generator)*
- **GAP-162** [test_api_linkage] API GET /api/v1/presences has no matching test *(fix: generator)*
- **GAP-163** [test_api_linkage] API GET /api/v1/presences/{presenceId} has no matching test *(fix: generator)*
- **GAP-164** [test_api_linkage] API PUT /api/v1/presences/{presenceId} has no matching test *(fix: generator)*
- **GAP-165** [test_api_linkage] API DELETE /api/v1/presences/{presenceId} has no matching test *(fix: generator)*
- **GAP-166** [test_api_linkage] API POST /api/v1/contacts/labels/batch has no matching test *(fix: generator)*
- **GAP-167** [test_api_linkage] API GET /api/v1/unknown-senders has no matching test *(fix: generator)*
- **GAP-168** [test_api_linkage] API GET /api/v1/unknown-senders/{id} has no matching test *(fix: generator)*
- **GAP-169** [test_api_linkage] API PUT /api/v1/unknown-senders/{id} has no matching test *(fix: generator)*
- **GAP-170** [test_api_linkage] API DELETE /api/v1/unknown-senders/{id} has no matching test *(fix: generator)*
- **GAP-171** [test_api_linkage] API POST /api/v1/presence/batch has no matching test *(fix: generator)*
- **GAP-172** [test_api_linkage] API GET /api/v1/chats has no matching test *(fix: generator)*
- **GAP-173** [test_api_linkage] API GET /api/v1/chat-archives/{archiveId} has no matching test *(fix: generator)*
- **GAP-174** [test_api_linkage] API PUT /api/v1/chat-archives/{archiveId} has no matching test *(fix: generator)*
- **GAP-175** [test_api_linkage] API GET /api/v1/businesses has no matching test *(fix: generator)*
- **GAP-176** [test_api_linkage] API GET /api/v1/businesses/{id} has no matching test *(fix: generator)*
- **GAP-177** [test_api_linkage] API PUT /api/v1/businesses/{id} has no matching test *(fix: generator)*
- **GAP-178** [test_api_linkage] API DELETE /api/v1/businesses/{id} has no matching test *(fix: generator)*
- **GAP-179** [test_api_linkage] API GET /api/v1/catalogs has no matching test *(fix: generator)*
- **GAP-180** [test_api_linkage] API GET /api/v1/catalogs/{id} has no matching test *(fix: generator)*
- **GAP-181** [test_api_linkage] API PUT /api/v1/catalogs/{id} has no matching test *(fix: generator)*
- **GAP-182** [test_api_linkage] API DELETE /api/v1/catalogs/{id} has no matching test *(fix: generator)*
- **GAP-183** [test_api_linkage] API GET /api/v1/products has no matching test *(fix: generator)*
- **GAP-184** [test_api_linkage] API GET /api/v1/products/{id} has no matching test *(fix: generator)*
- **GAP-185** [test_api_linkage] API DELETE /api/v1/products/{id} has no matching test *(fix: generator)*
- **GAP-186** [test_api_linkage] API GET /api/v1/carts has no matching test *(fix: generator)*
- **GAP-187** [test_api_linkage] API GET /api/v1/carts/{id} has no matching test *(fix: generator)*
- **GAP-188** [test_api_linkage] API DELETE /api/v1/carts/{id} has no matching test *(fix: generator)*
- **GAP-189** [test_api_linkage] API GET /api/v1/battery-settings has no matching test *(fix: generator)*
- **GAP-190** [test_api_linkage] API GET /api/v1/battery-settings/{id} has no matching test *(fix: generator)*
- **GAP-191** [test_api_linkage] API PUT /api/v1/battery-settings/{id} has no matching test *(fix: generator)*
- **GAP-192** [test_api_linkage] API DELETE /api/v1/battery-settings/{id} has no matching test *(fix: generator)*
- **GAP-193** [test_api_linkage] API GET /api/v1/battery-metrics has no matching test *(fix: generator)*
- **GAP-194** [test_api_linkage] API GET /api/v1/widgets has no matching test *(fix: generator)*
- **GAP-195** [test_api_linkage] API GET /api/v1/desktopApps has no matching test *(fix: generator)*
- **GAP-196** [test_api_linkage] API GET /api/v1/web-clients has no matching test *(fix: generator)*
- **GAP-197** [test_api_linkage] API GET /api/v1/web-clients/{id} has no matching test *(fix: generator)*
- **GAP-198** [test_api_linkage] API PUT /api/v1/web-clients/{id} has no matching test *(fix: generator)*
- **GAP-199** [test_api_linkage] API DELETE /api/v1/web-clients/{id} has no matching test *(fix: generator)*
- **GAP-200** [test_api_linkage] API GET /api/v1/ai-assistants has no matching test *(fix: generator)*
- **GAP-201** [test_api_linkage] API GET /api/v1/ai-assistants/{assistantId} has no matching test *(fix: generator)*
- **GAP-202** [test_api_linkage] API PUT /api/v1/ai-assistants/{assistantId} has no matching test *(fix: generator)*
- **GAP-203** [test_api_linkage] API DELETE /api/v1/ai-assistants/{assistantId} has no matching test *(fix: generator)*
- **GAP-204** [test_api_linkage] API GET /api/v1/ai-sessions has no matching test *(fix: generator)*
- **GAP-205** [test_api_linkage] API GET /api/v1/conversations/{conversationId} has no matching test *(fix: generator)*
- **GAP-206** [test_api_linkage] API PUT /api/v1/conversations/{conversationId} has no matching test *(fix: generator)*
- **GAP-207** [test_api_linkage] API DELETE /api/v1/conversations/{conversationId} has no matching test *(fix: generator)*
- **GAP-208** [test_api_linkage] API POST /api/v1/push-tokens/batch has no matching test *(fix: generator)*
- **GAP-209** [test_api_linkage] API GET /api/v1/backups has no matching test *(fix: generator)*
- **GAP-210** [test_api_linkage] API GET /api/v1/restores/{restoreId} has no matching test *(fix: generator)*
- **GAP-211** [test_api_linkage] API PUT /api/v1/restores/{restoreId} has no matching test *(fix: generator)*
- **GAP-212** [test_api_linkage] API DELETE /api/v1/restores/{restoreId} has no matching test *(fix: generator)*
- **GAP-213** [test_api_linkage] API GET /api/v1/sync-jobs has no matching test *(fix: generator)*
- **GAP-214** [test_api_linkage] API GET /api/v1/sync-jobs/{syncJobId} has no matching test *(fix: generator)*
- **GAP-215** [test_api_linkage] API PUT /api/v1/sync-jobs/{syncJobId} has no matching test *(fix: generator)*
- **GAP-216** [test_api_linkage] API GET /api/v1/blocks has no matching test *(fix: generator)*
- **GAP-217** [test_api_linkage] API GET /api/v1/reports has no matching test *(fix: generator)*
- **GAP-218** [test_api_linkage] API GET /api/v1/moderation-cases has no matching test *(fix: generator)*
- **GAP-219** [test_api_linkage] API GET /api/v1/moderation-cases/{id} has no matching test *(fix: generator)*
- **GAP-220** [test_api_linkage] API PUT /api/v1/moderation-cases/{id} has no matching test *(fix: generator)*
- **GAP-221** [test_api_linkage] API GET /api/v1/integrations has no matching test *(fix: generator)*
- **GAP-222** [test_api_linkage] API GET /api/v1/bots has no matching test *(fix: generator)*
- **GAP-223** [test_api_linkage] API GET /api/v1/bots/{botId} has no matching test *(fix: generator)*
- **GAP-224** [test_api_linkage] API PUT /api/v1/bots/{botId} has no matching test *(fix: generator)*
- **GAP-225** [test_api_linkage] API DELETE /api/v1/bots/{botId} has no matching test *(fix: generator)*

### LOW (2)

- **GAP-109** [state_machine_density] Entity 'Chat' has no state machine *(fix: auto_link)*
- **GAP-110** [state_machine_density] Entity 'session' has no state machine *(fix: auto_link)*

## Fix Log

- Linked story US-119 -> screen SCREEN-008 via composition (keyword overlap=4)
- Linked story US-022 -> screen SCREEN-002 via composition (keyword overlap=3)
- Linked story US-025 -> screen SCREEN-013 via composition (keyword overlap=2)
- Linked story US-163 -> screen SCREEN-029 via composition (keyword overlap=2)
- Linked story US-031 -> screen SCREEN-012 via composition (keyword overlap=4)
- Linked story US-069 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-117 -> screen SCREEN-001 via composition (keyword overlap=3)
- Linked story US-098 -> screen SCREEN-012 via composition (keyword overlap=2)
- Linked story US-016 -> screen SCREEN-007 via composition (keyword overlap=2)
- Linked story US-076 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-081 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-026 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-024 -> screen SCREEN-018 via composition (keyword overlap=3)
- Linked story US-090 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-063 -> screen SCREEN-004 via composition (keyword overlap=3)
- Linked story US-068 -> screen SCREEN-006 via composition (keyword overlap=2)
- Linked story US-019 -> screen SCREEN-002 via composition (keyword overlap=2)
- Linked story US-123 -> screen SCREEN-005 via composition (keyword overlap=2)
- Linked story US-034 -> screen SCREEN-012 via composition (keyword overlap=2)
- Linked story US-111 -> screen SCREEN-001 via composition (keyword overlap=3)
- Linked story US-055 -> screen SCREEN-018 via composition (keyword overlap=6)
- Linked story US-061 -> screen SCREEN-006 via composition (keyword overlap=2)
- Linked story US-084 -> screen SCREEN-008 via composition (keyword overlap=2)
- Linked story US-074 -> screen SCREEN-006 via composition (keyword overlap=2)
- Linked story US-124 -> screen SCREEN-024 via composition (keyword overlap=3)
- Linked story US-105 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-067 -> screen SCREEN-018 via composition (keyword overlap=4)
- Linked story US-100 -> screen SCREEN-036 via composition (keyword overlap=2)
- Linked story US-085 -> screen SCREEN-007 via composition (keyword overlap=3)
- Linked story US-113 -> screen SCREEN-007 via composition (keyword overlap=2)
- Linked story US-135 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-038 -> screen SCREEN-026 via composition (keyword overlap=3)
- Linked story US-089 -> screen SCREEN-001 via composition (keyword overlap=2)
- Linked story US-125 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-080 -> screen SCREEN-003 via composition (keyword overlap=2)
- Linked story US-073 -> screen SCREEN-005 via composition (keyword overlap=2)
- Linked story US-017 -> screen SCREEN-024 via composition (keyword overlap=3)
- Linked story US-052 -> screen SCREEN-007 via composition (keyword overlap=2)
- Linked story US-015 -> screen SCREEN-007 via composition (keyword overlap=2)
- Linked story US-107 -> screen SCREEN-024 via composition (keyword overlap=2)
- Linked story US-116 -> screen SCREEN-004 via composition (keyword overlap=3)
- Linked story US-057 -> screen SCREEN-007 via composition (keyword overlap=4)
- Linked story US-120 -> screen SCREEN-007 via composition (keyword overlap=2)
- Linked story US-072 -> screen SCREEN-006 via composition (keyword overlap=2)
- Linked story US-101 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-033 -> screen SCREEN-018 via composition (keyword overlap=5)
- Linked story US-093 -> screen SCREEN-020 via composition (keyword overlap=2)
- Linked story US-103 -> screen SCREEN-028 via composition (keyword overlap=3)
- Linked story US-021 -> screen SCREEN-007 via composition (keyword overlap=3)
- Linked story US-126 -> screen SCREEN-018 via composition (keyword overlap=4)
- Linked story US-028 -> screen SCREEN-030 via composition (keyword overlap=2)
- Linked story US-051 -> screen SCREEN-018 via composition (keyword overlap=4)
- Linked story US-039 -> screen SCREEN-020 via composition (keyword overlap=4)
- Linked story US-155 -> screen SCREEN-028 via composition (keyword overlap=2)
- Linked story US-059 -> screen SCREEN-001 via composition (keyword overlap=3)
- Linked story US-037 -> screen SCREEN-005 via composition (keyword overlap=4)
- Linked story US-088 -> screen SCREEN-006 via composition (keyword overlap=3)
- Linked story US-071 -> screen SCREEN-028 via composition (keyword overlap=3)
- Linked story US-091 -> screen SCREEN-012 via composition (keyword overlap=2)
- Linked story US-114 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-035 -> screen SCREEN-006 via composition (keyword overlap=2)
- Linked story US-115 -> screen SCREEN-007 via composition (keyword overlap=3)
- Linked story US-065 -> screen SCREEN-004 via composition (keyword overlap=2)
- Linked story US-029 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-018 -> screen SCREEN-007 via composition (keyword overlap=3)
- Linked story US-097 -> screen SCREEN-010 via composition (keyword overlap=3)
- Linked story US-050 -> screen SCREEN-018 via composition (keyword overlap=4)
- Linked story US-108 -> screen SCREEN-001 via composition (keyword overlap=2)
- Linked story US-118 -> screen SCREEN-004 via composition (keyword overlap=3)
- Linked story US-053 -> screen SCREEN-018 via composition (keyword overlap=5)
- Linked story US-086 -> screen SCREEN-001 via composition (keyword overlap=2)
- Linked story US-032 -> screen SCREEN-012 via composition (keyword overlap=3)
- Linked story US-104 -> screen SCREEN-036 via composition (keyword overlap=2)
- Linked story US-102 -> screen SCREEN-006 via composition (keyword overlap=3)
- Created composition 'ungrouped' linking 15 stories (epic: ungrouped)
- Created composition 'Einstellungen, Barrierefreiheit und Lokalisierung' linking 3 stories (epic: EPIC-003)
- Created composition 'Nachrichten, Präsenz und Benachrichtigungen' linking 5 stories (epic: EPIC-004)
- Created composition 'Profil, Kontakte und Suche' linking 2 stories (epic: EPIC-002)
- Created composition 'Medien und Anhänge' linking 2 stories (epic: EPIC-007)
- Created composition 'Erweiterte Nachrichten und Status' linking 1 stories (epic: EPIC-005)
- Created composition 'Gruppen, Communities und Kanäle' linking 1 stories (epic: EPIC-006)
- Created stub flow FLOW-REFINE-030 for epic EPIC-001 (Authentifizierung und Kontoschutz)
- Created stub flow FLOW-REFINE-031 for epic EPIC-002 (Profil, Kontakte und Suche)
- Created stub flow FLOW-REFINE-032 for epic EPIC-003 (Einstellungen, Barrierefreiheit und Lokalisierung)
- Created stub flow FLOW-REFINE-033 for epic EPIC-005 (Erweiterte Nachrichten und Status)
- Created stub flow FLOW-REFINE-034 for epic EPIC-007 (Medien und Anhänge)
- Created stub state machine for entity 'Chat' (4 states, 3 transitions)
- Created stub state machine for entity 'session' (4 states, 3 transitions)
- Created 185 stub tasks to meet task ratio (93 -> 278 tasks, target: 278)
- [LLM] Linked entity 'User' -> WA-AUTH-001 (This requirement defines the primary identification and registration process for the User entity via phone number.)
- [LLM] Linked entity 'User' -> WA-PROF-001 (Defines the profile management capabilities (profile picture) directly associated with the User entity.)
- [LLM] Linked entity 'User' -> WA-PROF-002 (Defines the display name attribute, which is a core field of the User entity.)
- [LLM] Linked entity 'UserAuthMethod' -> WA-AUTH-002 (This requirement specifies the implementation of 2FA (PIN), which is a specific method of user authentication stored in this entity.)
- [LLM] Linked entity 'UserAuthMethod' -> WA-AUTH-003 (Biometric authentication (Fingerprint, Face ID) represents a distinct authentication method type for the user.)
- [LLM] Linked entity 'UserAuthMethod' -> WA-AUTH-005 (Passkeys are a modern authentication method that would be represented as a record within the UserAuthMethod entity.)
- [LLM] Linked entity 'contact' -> WA-MSG-015 (This requirement explicitly defines the system's ability to share contact data, making the 'contact' entity a direct subject of this functional requirement.)
- [LLM] Linked entity 'session' -> WA-AUTH-004 (The 'session' entity is technically required to manage and track the state of multiple active devices/logins as specified in the Multi-Device Support requirement.)
- [LLM] Linked entity 'resilience_policy' -> NFR-052 (The entity 'resilience_policy' directly relates to the definition of RPO/RTO targets and system recovery strategies described in NFR-052.)


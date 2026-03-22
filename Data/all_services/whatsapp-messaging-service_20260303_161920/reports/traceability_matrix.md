# Traceability Matrix

**Generated:** 2026-03-03T23:01:02.262854

## Summary

- Requirements: 163
- User Stories: 163
- Test Cases: 1500
- API Endpoints: 509
- Screens: 60
- Entities: 32

---

## Full Traceability

| Requirement | Type | Priority | Epic | User Stories | Test Cases | API Endpoints | Screens | Entities |
|-------------|------|----------|------|--------------|------------|---------------|---------|----------|
| WA-AUTH-001 | functional | must | EPIC-001 | US-001 | TC-001, TC-002, TC-003, TC-004, TC-005 (+3) | - | SCREEN-009, SCREEN-AUTH-PHONE, SCREEN-SETTINGS-PROFILE-PHONE | - |
| WA-AUTH-002 | functional | must | EPIC-001 | US-002 | TC-009, TC-010, TC-011, TC-012, TC-013 (+4) | - | SCREEN-001, SCREEN-SETTINGS-SECURITY-2FA | - |
| WA-AUTH-003 | functional | should | EPIC-001 | US-003 | TC-018, TC-019, TC-020, TC-021, TC-022 (+3) | - | SCREEN-016, SCREEN-SETTINGS-SECURITY-BIOMETRICS | - |
| WA-AUTH-004 | functional | must | - | US-004 | TC-026, TC-027, TC-028, TC-029, TC-030 (+2) | - | SCREEN-022, SCREEN-SETTINGS-DEVICES-OVERVIEW, SCREEN-SETTINGS-HELP-SUPPORT | - |
| WA-AUTH-005 | functional | should | EPIC-001 | US-005 | TC-033, TC-034, TC-035, TC-036, TC-037 (+5) | GET /api/v1/passkeys, POST /api/v1/passkeys, GET /api/v1/passkeys/{id} (+19) | SCREEN-010 | Device, session |
| WA-PROF-001 | functional | must | EPIC-002 | US-006 | TC-043, TC-044, TC-045, TC-046, TC-047 (+4) | POST /api/v1/users/{userId}/profile-images, GET /api/v1/users/{userId}/profile-images, GET /api/v1/users/{userId}/profile-images/{imageId} (+12) | SCREEN-027, SCREEN-SETTINGS-PROFILE-AVATAR | User |
| WA-PROF-002 | functional | must | EPIC-002 | US-007 | TC-052, TC-053, TC-054, TC-055, TC-056 (+3) | GET /api/v1/users, GET /api/v1/users/{id}, POST /api/v1/users (+16) | SCREEN-030, SCREEN-SETTINGS-PROFILE-DISPLAY-NAME | Message [SM], User |
| WA-PROF-003 | functional | must | EPIC-002 | US-008 | TC-060, TC-061, TC-062, TC-063, TC-064 (+1) | - | SCREEN-003, SCREEN-CHATS-CHATID-INFO, SCREEN-SETTINGS-PROFILE-STATUS | - |
| WA-PROF-004 | functional | must | EPIC-002 | US-009 | TC-066, TC-067, TC-068, TC-069, TC-070 (+3) | GET /api/v1/profiles, GET /api/v1/profiles/{profileId}, POST /api/v1/profiles (+9) | SCREEN-033 | Device, Message [SM], User (+1) |
| WA-PROF-005 | functional | should | EPIC-002 | US-010 | TC-074, TC-075, TC-076, TC-077, TC-078 (+3) | - | SCREEN-036, SCREEN-SETTINGS-PROFILE, SCREEN-SETTINGS-PROFILE-QR | - |
| WA-MSG-001 | functional | must | EPIC-004 | US-011 | TC-082, TC-083, TC-084, TC-085, TC-086 (+4) | - | SCREEN-002 | - |
| WA-MSG-002 | functional | must | EPIC-004 | US-012 | TC-091, TC-092, TC-093, TC-094, TC-095 (+5) | - | SCREEN-038 | - |
| WA-MSG-003 | functional | must | EPIC-004 | US-013 | TC-101, TC-102, TC-103, TC-104, TC-105 (+3) | GET /api/v1/messages/{messageId}, PATCH /api/v1/messages/{messageId}, DELETE /api/v1/messages/{messageId} (+1) | SCREEN-040 | Message [SM] |
| WA-MSG-004 | functional | must | EPIC-004 | US-014 | TC-109, TC-110, TC-111, TC-112, TC-113 (+5) | - | - | - |
| WA-MSG-005 | functional | must | EPIC-004 | US-015 | TC-119, TC-120, TC-121, TC-122, TC-123 (+1) | - | - | - |
| WA-MSG-006 | functional | must | EPIC-004 | US-016 | TC-125, TC-126, TC-127, TC-128, TC-129 (+5) | - | - | - |
| WA-MSG-007 | functional | must | EPIC-004 | US-017 | TC-135, TC-136, TC-137, TC-138, TC-139 (+3) | - | - | - |
| WA-MSG-008 | functional | must | EPIC-005 | US-018 | TC-143, TC-144, TC-145, TC-146, TC-147 (+4) | - | - | - |
| WA-MSG-009 | functional | must | EPIC-005 | US-019 | TC-152, TC-153, TC-154, TC-155, TC-156 (+5) | GET /api/v1/media, GET /api/v1/media/{id}, POST /api/v1/media (+6) | - | Message [SM], User, media |
| WA-MSG-010 | functional | should | EPIC-005 | US-020 | TC-162, TC-163, TC-164, TC-165, TC-166 (+5) | - | SCREEN-011, SCREEN-CHATS-CHATID, SCREEN-CHATS-CHATID-SETTINGS | - |
| WA-MSG-011 | functional | must | EPIC-005 | US-021 | TC-172, TC-173, TC-174, TC-175, TC-176 (+5) | POST /api/v1/broadcast-lists, GET /api/v1/broadcast-lists, GET /api/v1/broadcast-lists/{broadcastListId} (+8) | - | Message [SM] |
| WA-MSG-012 | functional | must | EPIC-004 | US-022 | TC-182, TC-183, TC-184, TC-185, TC-186 (+6) | - | - | - |
| WA-MSG-013 | functional | must | EPIC-005 | US-023 | TC-193, TC-194, TC-195, TC-196, TC-197 (+5) | - | - | - |
| WA-MSG-014 | functional | must | EPIC-005 | US-024 | TC-203, TC-204, TC-205, TC-206, TC-207 (+5) | - | - | - |
| WA-MSG-015 | functional | must | EPIC-005 | US-025 | TC-213, TC-214, TC-215, TC-216, TC-217 (+2) | POST /api/v1/shared-contacts, GET /api/v1/shared-contacts, GET /api/v1/shared-contacts/{id} (+7) | - | contact |
| WA-GRP-001 | functional | must | EPIC-006 | US-026 | TC-220, TC-221, TC-222, TC-223, TC-224 (+2) | GET /api/v1/groups, GET /api/v1/groups/{groupId}, POST /api/v1/groups (+8) | - | Device, Group [SM] |
| WA-GRP-002 | functional | must | EPIC-006 | US-027 | TC-227, TC-228, TC-229, TC-230, TC-231 (+5) | - | SCREEN-008 | - |
| WA-GRP-003 | functional | must | EPIC-006 | US-028 | TC-237, TC-238, TC-239, TC-240, TC-241 (+3) | - | - | - |
| WA-GRP-004 | functional | must | EPIC-006 | US-029 | TC-245, TC-246, TC-247, TC-248, TC-249 (+5) | POST /api/v1/group-invitations, GET /api/v1/group-invitations, GET /api/v1/group-invitations/{id} (+5) | - | Group [SM], Message [SM] |
| WA-GRP-005 | functional | must | EPIC-006 | US-030 | TC-255, TC-256, TC-257, TC-258, TC-259 (+2) | PUT /api/v1/groups/{groupId}, POST /api/v1/groups/{groupId}/members/leave, POST /api/v1/presence/status | - | Group [SM] |
| WA-GRP-006 | functional | must | EPIC-006 | US-031 | TC-262, TC-263, TC-264, TC-265, TC-266 (+4) | - | - | - |
| WA-GRP-007 | functional | should | EPIC-006 | US-032 | TC-271, TC-272, TC-273, TC-274, TC-275 (+3) | - | - | - |
| WA-GRP-008 | functional | should | EPIC-006 | US-033 | TC-279, TC-280, TC-281, TC-282, TC-283 (+3) | GET /api/v1/conversations/{conversationId}/polls, POST /api/v1/conversations/{conversationId}/polls, GET /api/v1/polls/{pollId} (+12) | - | - |
| WA-GRP-009 | functional | should | EPIC-006 | US-034 | TC-287, TC-288, TC-289, TC-290, TC-291 (+4) | GET /api/v1/group-events, GET /api/v1/group-events/{id}, POST /api/v1/group-events (+10) | - | Group [SM], User, media |
| WA-CALL-001 | functional | must | - | US-035 | TC-296, TC-297, TC-298, TC-299, TC-300 (+4) | - | - | - |
| WA-CALL-002 | functional | must | - | US-036 | TC-305, TC-306, TC-307, TC-308, TC-309 (+7) | - | SCREEN-005, SCREEN-CALLS-VIDEO-CALLID | - |
| WA-CALL-003 | functional | must | - | US-037 | TC-317, TC-318, TC-319, TC-320, TC-321 (+7) | - | - | - |
| WA-CALL-004 | functional | should | - | US-038 | TC-329, TC-330, TC-331, TC-332, TC-333 (+5) | GET /api/v1/screen-shares, GET /api/v1/screen-shares/{screenShareId}, POST /api/v1/screen-shares (+5) | - | Message [SM], User |
| WA-CALL-005 | functional | should | - | US-039 | TC-339, TC-340, TC-341, TC-342, TC-343 (+3) | GET /api/v1/call-links, POST /api/v1/call-links, GET /api/v1/call-links/{callLinkId} (+5) | - | - |
| WA-CALL-006 | functional | must | - | US-040 | TC-347, TC-348, TC-349, TC-350, TC-351 (+3) | - | SCREEN-AUTH-PHONE-VERIFY, SCREEN-CALLS-VIDEO-CALLID-ONBOARDING, SCREEN-CALLS-VIDEO-CALLID-RECOVERY | - |
| WA-CALL-007 | functional | must | - | US-041 | TC-355, TC-356, TC-357, TC-358, TC-359 (+1) | - | - | - |
| WA-STS-001 | functional | must | EPIC-005 | US-042 | TC-361, TC-362, TC-363, TC-364, TC-365 (+4) | - | SCREEN-012 | - |
| WA-STS-002 | functional | must | EPIC-005 | US-043 | TC-370, TC-371, TC-372, TC-373, TC-374 (+5) | - | SCREEN-019 | - |
| WA-STS-003 | functional | must | EPIC-005 | US-044 | TC-380, TC-381, TC-382, TC-383, TC-384 (+3) | - | SCREEN-024 | - |
| WA-STS-004 | functional | must | EPIC-005 | US-045 | TC-388, TC-389, TC-390, TC-391, TC-392 (+2) | GET /api/v1/statusVisibilityConfigs, GET /api/v1/statusVisibilityConfigs/{id}, POST /api/v1/statusVisibilityConfigs (+13) | SCREEN-029 | - |
| WA-STS-005 | functional | should | EPIC-005 | US-046 | TC-395, TC-396, TC-397, TC-398, TC-399 (+3) | - | SCREEN-032 | - |
| WA-MED-001 | functional | must | EPIC-007 | US-047 | TC-403, TC-404, TC-405, TC-406, TC-407 (+3) | - | SCREEN-018 | - |
| WA-MED-002 | functional | must | EPIC-007 | US-048 | TC-411, TC-412, TC-413, TC-414, TC-415 (+1) | - | SCREEN-023 | - |
| WA-MED-003 | functional | must | EPIC-007 | US-049 | TC-417, TC-418, TC-419, TC-420, TC-421 (+2) | - | SCREEN-028 | - |
| WA-MED-004 | functional | must | EPIC-007 | US-050 | TC-424, TC-425, TC-426, TC-427, TC-428 (+4) | - | - | - |
| WA-MED-005 | functional | must | EPIC-007 | US-051 | TC-433, TC-434, TC-435, TC-436, TC-437 (+1) | - | - | - |
| WA-MED-006 | functional | must | EPIC-007 | US-052 | TC-439, TC-440, TC-441, TC-442, TC-443 (+4) | - | - | - |
| WA-MED-007 | functional | must | EPIC-007 | US-053 | TC-448, TC-449, TC-450, TC-451, TC-452 (+4) | GET /api/v1/media/{mediaId}, PUT /api/v1/media/{mediaId}, DELETE /api/v1/media/{mediaId} (+1) | - | Chat, Message [SM], media |
| WA-MED-008 | functional | must | EPIC-007 | US-054 | TC-457, TC-458, TC-459, TC-460, TC-461 (+6) | GET /api/v1/audio-messages, GET /api/v1/audio-messages/{id}, POST /api/v1/audio-messages (+3) | SCREEN-007 | Message [SM] |
| WA-MED-009 | functional | must | EPIC-007 | US-055 | TC-468, TC-469, TC-470, TC-471, TC-472 (+5) | - | - | - |
| WA-MED-010 | functional | should | EPIC-007 | US-056 | TC-478, TC-479, TC-480, TC-481, TC-482 (+3) | - | - | - |
| WA-SEC-001 | functional | must | - | US-057 | TC-486, TC-487, TC-488, TC-489, TC-490 (+3) | GET /api/v1/read-receipts/{receiptId}, PUT /api/v1/read-receipts/{receiptId}, DELETE /api/v1/read-receipts/{receiptId} | - | - |
| WA-SEC-002 | functional | must | - | US-058 | TC-494, TC-495, TC-496, TC-497, TC-498 (+2) | - | SCREEN-SETTINGS-SECURITY-2FA-VERIFY | - |
| WA-SEC-003 | functional | must | - | US-059 | TC-501, TC-502, TC-503, TC-504, TC-505 (+5) | GET /api/v1/app-locks, GET /api/v1/app-locks/{lockId}, POST /api/v1/app-locks (+4) | - | - |
| WA-SEC-004 | functional | must | - | US-060 | TC-511, TC-512, TC-513, TC-514, TC-515 (+1) | - | SCREEN-006 | - |
| WA-SEC-005 | functional | must | - | US-061 | TC-517, TC-518, TC-519, TC-520, TC-521 (+4) | - | - | - |
| WA-SEC-006 | functional | must | EPIC-001 | US-062 | TC-526, TC-527, TC-528, TC-529, TC-530 (+5) | - | - | - |
| WA-SEC-007 | functional | should | - | US-063 | TC-536, TC-537, TC-538, TC-539, TC-540 (+3) | - | - | - |
| WA-SEC-008 | functional | should | - | US-064 | TC-544, TC-545, TC-546, TC-547, TC-548 (+3) | - | - | - |
| WA-NOT-001 | functional | must | EPIC-004 | US-065 | TC-552, TC-553, TC-554, TC-555, TC-556 (+4) | GET /api/v1/notifications, GET /api/v1/notifications/{notificationId}, POST /api/v1/notifications (+8) | - | User |
| WA-NOT-002 | functional | must | EPIC-004 | US-066 | TC-561, TC-562, TC-563, TC-564, TC-565 (+4) | - | - | - |
| WA-NOT-003 | functional | must | EPIC-004 | US-067 | TC-570, TC-571, TC-572, TC-573, TC-574 (+3) | - | - | - |
| WA-NOT-004 | functional | must | EPIC-004 | US-068 | TC-578, TC-579, TC-580, TC-581, TC-582 (+3) | GET /api/v1/dnd-settings, GET /api/v1/dnd-settings/{id}, POST /api/v1/dnd-settings (+3) | - | - |
| WA-NOT-005 | functional | should | EPIC-004 | US-069 | TC-586, TC-587, TC-588, TC-589, TC-590 (+3) | - | - | - |
| WA-NOT-006 | functional | must | EPIC-004 | US-070 | TC-594, TC-595, TC-596, TC-597, TC-598 (+2) | - | - | - |
| WA-CON-001 | functional | must | EPIC-002 | US-071 | TC-601, TC-602, TC-603, TC-604, TC-605 (+4) | GET /api/v1/contacts, GET /api/v1/contacts/{id}, POST /api/v1/contacts (+5) | - | contact |
| WA-CON-002 | functional | must | EPIC-002 | US-072 | TC-610, TC-611, TC-612, TC-613, TC-614 (+5) | GET /api/v1/contacts/{contactId}, PUT /api/v1/contacts/{contactId}, DELETE /api/v1/contacts/{contactId} (+5) | - | contact |
| WA-CON-003 | functional | should | EPIC-002 | US-073 | TC-620, TC-621, TC-622, TC-623, TC-624 (+4) | - | - | - |
| WA-CON-004 | functional | should | EPIC-002 | US-074 | TC-629, TC-630, TC-631, TC-632, TC-633 (+3) | GET /api/v1/contact-labels, POST /api/v1/contact-labels, GET /api/v1/contact-labels/{labelId} (+7) | - | contact |
| WA-CON-005 | functional | must | EPIC-002 | US-075 | TC-637, TC-638, TC-639, TC-640, TC-641 (+3) | GET /api/v1/unknown-senders, POST /api/v1/unknown-senders, GET /api/v1/unknown-senders/{id} (+6) | SCREEN-031 | - |
| WA-SRC-001 | functional | must | EPIC-002 | US-076 | TC-645, TC-646, TC-647, TC-648, TC-649 (+5) | GET /api/v1/messages/search | - | Message [SM] |
| WA-SRC-002 | functional | must | EPIC-002 | US-077 | TC-655, TC-656, TC-657, TC-658, TC-659 (+2) | PUT /api/v1/media/{id}, GET /api/v1/messages/{id}/read-receipts | - | Message [SM], media |
| WA-SRC-003 | functional | must | EPIC-002 | US-078 | TC-662, TC-663, TC-664, TC-665, TC-666 (+6) | - | SCREEN-034 | - |
| WA-SRC-004 | functional | should | EPIC-002 | US-079 | TC-673, TC-674, TC-675, TC-676, TC-677 (+3) | - | - | - |
| WA-SET-001 | functional | must | EPIC-003 | US-080 | TC-681, TC-682, TC-683, TC-684, TC-685 (+3) | - | - | - |
| WA-SET-002 | functional | must | EPIC-003 | US-081 | TC-689, TC-690, TC-691, TC-692, TC-693 (+3) | POST /api/v1/readReceipts/batch, POST /api/v1/messages/{id}/readReceipts, GET /api/v1/messages/{id}/readReceipts (+2) | - | Message [SM] |
| WA-SET-003 | functional | must | EPIC-003 | US-082 | TC-697, TC-698, TC-699, TC-700, TC-701 (+1) | GET /api/v1/profile-picture-visibilities, GET /api/v1/profile-picture-visibilities/{id}, POST /api/v1/profile-picture-visibilities (+5) | - | User |
| WA-SET-004 | functional | must | EPIC-003 | US-083 | TC-703, TC-704, TC-705, TC-706, TC-707 (+1) | - | - | - |
| WA-SET-005 | functional | must | EPIC-003 | US-084 | TC-709, TC-710, TC-711, TC-712, TC-713 (+5) | - | - | - |
| WA-SET-006 | functional | must | EPIC-003 | US-085 | TC-719, TC-720, TC-721, TC-722, TC-723 (+4) | - | - | - |
| WA-SET-007 | functional | must | EPIC-003 | US-086 | TC-728, TC-729, TC-730, TC-731, TC-732 (+3) | - | - | - |
| WA-SET-008 | functional | should | EPIC-003 | US-087 | TC-736, TC-737, TC-738, TC-739, TC-740 (+5) | - | SCREEN-037 | - |
| WA-SET-009 | functional | must | EPIC-003 | US-088 | TC-746, TC-747, TC-748, TC-749, TC-750 (+4) | - | - | - |
| WA-SET-010 | functional | must | EPIC-003 | US-089 | TC-755, TC-756, TC-757, TC-758, TC-759 (+4) | - | - | - |
| WA-BAK-001 | functional | must | - | US-090 | TC-764, TC-765, TC-766, TC-767, TC-768 (+4) | - | - | - |
| WA-BAK-002 | functional | must | - | US-091 | TC-773, TC-774, TC-775, TC-776, TC-777 (+5) | - | - | - |
| WA-BAK-003 | functional | must | - | US-092 | TC-783, TC-784, TC-785, TC-786, TC-787 (+2) | GET /api/v1/chats, GET /api/v1/chats/{id}, POST /api/v1/chats (+8) | SCREEN-039 | Chat |
| WA-BAK-004 | functional | must | - | US-093 | TC-790, TC-791, TC-792, TC-793, TC-794 (+3) | - | - | - |
| WA-BAK-005 | functional | must | - | US-094 | TC-798, TC-799, TC-800, TC-801, TC-802 (+1) | GET /api/v1/chats/{chatId}, PUT /api/v1/chats/{chatId}, DELETE /api/v1/chats/{chatId} (+9) | - | Chat |
| WA-BAK-006 | functional | must | - | US-095 | TC-804, TC-805, TC-806, TC-807, TC-808 (+1) | - | - | - |
| WA-BUS-001 | functional | must | - | US-096 | TC-810, TC-811, TC-812, TC-813, TC-814 (+5) | - | - | - |
| WA-BUS-002 | functional | should | - | US-097 | TC-820, TC-821, TC-822, TC-823, TC-824 (+3) | POST /api/v1/businesses, GET /api/v1/businesses, GET /api/v1/businesses/{id} (+9) | - | - |
| WA-BUS-003 | functional | must | - | US-098 | TC-828, TC-829, TC-830, TC-831, TC-832 (+3) | GET /api/v1/businesses/{businessId}/quick-replies, GET /api/v1/businesses/{businessId}/quick-replies/{quickReplyId}, POST /api/v1/businesses/{businessId}/quick-replies (+8) | - | Chat |
| WA-BUS-004 | functional | must | - | US-099 | TC-836, TC-837, TC-838, TC-839, TC-840 (+5) | GET /api/v1/absence-messages, GET /api/v1/absence-messages/{id}, POST /api/v1/absence-messages (+4) | - | Message [SM] |
| WA-BUS-005 | functional | must | - | US-100 | TC-846, TC-847, TC-848, TC-849, TC-850 (+4) | - | - | - |
| WA-BUS-006 | functional | must | - | US-101 | TC-855, TC-856, TC-857, TC-858, TC-859 (+5) | GET /api/v1/catalogs, POST /api/v1/catalogs, GET /api/v1/catalogs/{id} (+9) | - | media |
| WA-BUS-007 | functional | should | - | US-102 | TC-865, TC-866, TC-867, TC-868, TC-869 (+5) | GET /api/v1/carts, POST /api/v1/carts, GET /api/v1/carts/{id} (+8) | - | - |
| WA-BUS-008 | functional | could | - | US-103 | TC-875, TC-876, TC-877, TC-878, TC-879 (+3) | - | - | - |
| WA-BUS-009 | functional | must | - | US-104 | TC-883, TC-884, TC-885, TC-886, TC-887 (+4) | - | - | - |
| WA-BUS-010 | functional | must | - | US-105 | TC-892, TC-893, TC-894, TC-895, TC-896 (+3) | - | - | - |
| WA-ACC-001 | functional | must | EPIC-003 | US-106 | TC-900, TC-901, TC-902, TC-903, TC-904 (+3) | - | - | - |
| WA-ACC-002 | functional | must | EPIC-003 | US-107 | TC-908, TC-909, TC-910, TC-911, TC-912 (+5) | GET /api/v1/font-sizes, GET /api/v1/font-sizes/{id}, POST /api/v1/font-sizes (+4) | - | - |
| WA-ACC-003 | functional | must | EPIC-003 | US-108 | TC-918, TC-919, TC-920, TC-921, TC-922 (+6) | - | - | - |
| WA-ACC-004 | functional | should | EPIC-003 | US-109 | TC-929, TC-930, TC-931, TC-932, TC-933 (+5) | - | - | - |
| WA-PERF-001 | functional | must | - | US-110 | TC-939, TC-940, TC-941, TC-942, TC-943 (+5) | - | - | - |
| WA-PERF-002 | functional | must | - | US-111 | TC-949, TC-950, TC-951, TC-952, TC-953 (+2) | - | - | - |
| WA-PERF-003 | functional | must | - | US-112 | TC-956, TC-957, TC-958, TC-959, TC-960 (+3) | - | - | - |
| WA-PERF-004 | functional | must | - | US-113 | TC-964, TC-965, TC-966, TC-967, TC-968 (+2) | GET /api/v1/battery-settings, POST /api/v1/battery-settings, GET /api/v1/battery-settings/{id} (+9) | - | - |
| WA-PERF-005 | functional | must | - | US-114 | TC-971, TC-972, TC-973, TC-974, TC-975 (+3) | GET /api/v1/storage-policies, POST /api/v1/storage-policies, GET /api/v1/storage-policies/{id} (+2) | - | - |
| WA-INT-001 | functional | must | - | US-115 | TC-979, TC-980, TC-981, TC-982, TC-983 (+5) | - | - | - |
| WA-INT-002 | functional | should | - | US-116 | TC-989, TC-990, TC-991, TC-992, TC-993 (+6) | - | - | - |
| WA-INT-003 | functional | should | - | US-117 | TC-1000, TC-1001, TC-1002, TC-1003, TC-1004 (+5) | GET /api/v1/widgets, GET /api/v1/widgets/{id}, POST /api/v1/widgets (+3) | - | - |
| WA-INT-004 | functional | should | - | US-118 | TC-1010, TC-1011, TC-1012, TC-1013, TC-1014 (+3) | - | - | - |
| WA-INT-005 | functional | must | - | US-119 | TC-1018, TC-1019, TC-1020, TC-1021, TC-1022 (+3) | GET /api/v1/desktopApps, GET /api/v1/desktopApps/{id}, POST /api/v1/desktopApps (+8) | - | - |
| WA-INT-006 | functional | must | - | US-120 | TC-1026, TC-1027, TC-1028, TC-1029, TC-1030 (+3) | GET /api/v1/web-clients, GET /api/v1/web-clients/{id}, POST /api/v1/web-clients (+2) | - | - |
| WA-AI-001 | functional | should | EPIC-004 | US-121 | TC-1034, TC-1035, TC-1036, TC-1037, TC-1038 (+4) | GET /api/v1/ai-assistants, POST /api/v1/ai-assistants, GET /api/v1/ai-assistants/{assistantId} (+10) | - | session |
| WA-AI-002 | functional | could | EPIC-004 | US-122 | TC-1043, TC-1044, TC-1045, TC-1046, TC-1047 (+3) | - | - | - |
| WA-AI-003 | functional | could | EPIC-004 | US-123 | TC-1051, TC-1052, TC-1053, TC-1054, TC-1055 (+2) | GET /api/v1/stickerSuggestions, GET /api/v1/stickerSuggestions/{id}, POST /api/v1/stickerSuggestions (+4) | - | - |
| WA-LOC-001 | functional | must | EPIC-003 | US-124 | TC-1058, TC-1059, TC-1060, TC-1061, TC-1062 (+4) | - | - | - |
| WA-LOC-002 | functional | must | EPIC-003 | US-125 | TC-1067, TC-1068, TC-1069, TC-1070, TC-1071 (+5) | GET /api/v1/users/{userId}/regional-formats, POST /api/v1/users/{userId}/regional-formats, GET /api/v1/users/{userId}/regional-formats/{regionalFormatId} (+3) | - | User |
| WA-LOC-003 | functional | could | EPIC-003 | US-126 | TC-1077, TC-1078, TC-1079, TC-1080, TC-1081 (+5) | - | - | - |
| REQ-016 | functional | must | - | US-127 | TC-1087, TC-1088, TC-1089, TC-1090, TC-1091 (+5) | - | SCREEN-015 | - |
| REQ-017 | functional | should | EPIC-004 | US-128 | TC-1097, TC-1098, TC-1099, TC-1100, TC-1101 (+5) | - | - | - |
| REQ-018 | functional | must | EPIC-004 | US-129 | TC-1107, TC-1108, TC-1109, TC-1110, TC-1111 (+5) | GET /api/v1/push-tokens/{id}, PUT /api/v1/push-tokens/{id}, DELETE /api/v1/push-tokens/{id} (+10) | SCREEN-004 | - |
| REQ-019 | functional | must | EPIC-007 | US-130 | TC-1117, TC-1118, TC-1119, TC-1120, TC-1121 (+5) | POST /api/v1/media/{id}/upload, GET /api/v1/media/{id}/preview, GET /api/v1/messages/{id}/attachments | SCREEN-013 | Message [SM], media |
| REQ-020 | functional | should | EPIC-002 | US-131 | TC-1127, TC-1128, TC-1129, TC-1130, TC-1131 (+3) | GET /api/v1/search, GET /api/v1/searches, POST /api/v1/searches (+3) | - | - |
| REQ-021 | functional | must | - | US-132 | TC-1135, TC-1136, TC-1137, TC-1138, TC-1139 (+5) | GET /api/v1/backups, GET /api/v1/backups/{backupId}, POST /api/v1/backups (+15) | - | - |
| REQ-022 | functional | must | EPIC-001 | US-133 | TC-1145, TC-1146, TC-1147, TC-1148, TC-1149 (+7) | - | SCREEN-035 | - |
| REQ-023 | functional | must | - | US-134 | TC-1157, TC-1158, TC-1159, TC-1160, TC-1161 (+4) | GET /api/v1/blocks, POST /api/v1/blocks, GET /api/v1/blocks/{id} (+18) | SCREEN-014 | - |
| REQ-024 | functional | should | EPIC-004 | US-135 | TC-1166, TC-1167, TC-1168, TC-1169, TC-1170 (+4) | - | - | - |
| REQ-025 | functional | could | - | US-136 | TC-1175, TC-1176, TC-1177, TC-1178, TC-1179 (+4) | - | - | - |
| REQ-026 | functional | should | - | US-137 | TC-1184, TC-1185, TC-1186, TC-1187, TC-1188 (+12) | - | SCREEN-020, SCREEN-CALLS-VIDEO-CALLID-EDGE-CASES | - |
| REQ-027 | functional | should | - | US-138 | TC-1201, TC-1202, TC-1203, TC-1204, TC-1205 (+7) | GET /api/v1/admin/analytics-reports, GET /api/v1/admin/analytics-reports/{id}, POST /api/v1/admin/analytics-reports (+8) | SCREEN-021 | - |
| REQ-028 | functional | could | - | US-139 | TC-1213, TC-1214, TC-1215, TC-1216, TC-1217 (+3) | GET /api/v1/integrations, POST /api/v1/integrations, GET /api/v1/integrations/{integrationId} (+14) | - | - |
| NFR-029 | non_functional | must | - | US-140 | TC-1221, TC-1222, TC-1223, TC-1224, TC-1225 (+5) | - | - | - |
| NFR-030 | non_functional | should | EPIC-007 | US-141 | TC-1231, TC-1232, TC-1233, TC-1234, TC-1235 (+7) | - | SCREEN-025 | - |
| NFR-031 | non_functional | must | - | US-142 | TC-1243, TC-1244, TC-1245, TC-1246, TC-1247 (+3) | - | - | - |
| NFR-032 | non_functional | should | - | US-143 | TC-1251, TC-1252, TC-1253, TC-1254, TC-1255 (+5) | - | - | - |
| NFR-033 | non_functional | must | - | US-144 | TC-1261, TC-1262, TC-1263, TC-1264, TC-1265 (+6) | - | - | - |
| NFR-034 | non_functional | should | - | US-145 | TC-1272, TC-1273, TC-1274, TC-1275, TC-1276 (+3) | - | - | - |
| NFR-035 | non_functional | must | - | US-146 | TC-1280, TC-1281, TC-1282, TC-1283, TC-1284 (+10) | - | - | - |
| NFR-036 | non_functional | must | EPIC-001 | US-147 | TC-1295, TC-1296, TC-1297, TC-1298, TC-1299 (+5) | - | SCREEN-017 | - |
| NFR-037 | non_functional | must | - | US-148 | TC-1305, TC-1306, TC-1307, TC-1308, TC-1309 (+6) | - | - | - |
| NFR-038 | non_functional | should | - | US-149 | TC-1316, TC-1317, TC-1318, TC-1319, TC-1320 (+5) | - | SCREEN-026 | - |
| NFR-039 | non_functional | must | - | US-150 | TC-1326, TC-1327, TC-1328, TC-1329, TC-1330 (+5) | - | - | - |
| NFR-040 | non_functional | should | - | US-151 | TC-1336, TC-1337, TC-1338, TC-1339, TC-1340 (+4) | - | - | - |
| NFR-041 | non_functional | must | - | US-152 | TC-1345, TC-1346, TC-1347, TC-1348, TC-1349 (+5) | - | - | - |
| NFR-042 | non_functional | should | - | US-153 | TC-1355, TC-1356, TC-1357, TC-1358, TC-1359 (+6) | - | - | - |
| NFR-043 | non_functional | must | - | US-154 | TC-1366, TC-1367, TC-1368, TC-1369, TC-1370 (+4) | - | - | - |
| NFR-044 | non_functional | should | - | US-155 | TC-1375, TC-1376, TC-1377, TC-1378, TC-1379 (+4) | - | - | - |
| NFR-045 | non_functional | must | EPIC-003 | US-156 | TC-1384, TC-1385, TC-1386, TC-1387, TC-1388 (+5) | - | - | - |
| NFR-046 | non_functional | should | EPIC-003 | US-157 | TC-1394, TC-1395, TC-1396, TC-1397, TC-1398 (+4) | - | - | - |
| NFR-047 | non_functional | must | - | US-158 | TC-1403, TC-1404, TC-1405, TC-1406, TC-1407 (+5) | - | - | - |
| NFR-048 | non_functional | should | - | US-159 | TC-1413, TC-1414, TC-1415, TC-1416, TC-1417 (+5) | - | - | - |
| NFR-049 | non_functional | must | - | US-160 | TC-1423, TC-1424, TC-1425, TC-1426, TC-1427 (+5) | - | - | - |
| NFR-050 | non_functional | must | EPIC-007 | US-161 | TC-1433, TC-1434, TC-1435, TC-1436, TC-1437 (+5) | - | - | - |
| NFR-051 | non_functional | must | - | US-162 | TC-1443, TC-1444, TC-1445, TC-1446, TC-1447 (+4) | - | - | - |
| NFR-052 | non_functional | must | - | US-163 | TC-1452, TC-1453, TC-1454, TC-1455, TC-1456 (+6) | - | - | - |

---

## Coverage Statistics

- Requirements with User Stories: 163/163 (100.0%)
- User Stories with Test Cases: 163/163 (100.0%)
- User Stories with Screens: 42/163 (25.8%)
- Functional Requirements with API Endpoints: 53/139 (38.1%)

### Orphan Analysis

All functional requirements are covered by user stories. [PASS]

All user stories are covered by test cases. [PASS]

---

*Traceability matrix generated by AI-Scientist Requirements Engineering System*

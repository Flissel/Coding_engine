# whatsapp-messaging-service API - API Documentation

**Version:** 1.0.0
**Generated:** 2026-03-03T19:47:56.734883

## Endpoints

### AbsenceMessages

#### `GET` /api/v1/absence-messages

**List absence messages**

Returns a paginated list of absence messages with optional filtering, sorting, and full-text search.

*Requirement:* WA-BUS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Responses:**

- `200`: OK - List returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/absence-messages/{id}

**Get absence message by ID**

Returns a single absence message by ID.

*Requirement:* WA-BUS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Absence message ID |

**Responses:**

- `200`: OK - Item returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Absence message does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/absence-messages

**Create absence message**

Creates a new absence message with encrypted content.

*Requirement:* WA-BUS-004

**Request Body:** `CreateAbsenceMessageRequest`

**Responses:**

- `201`: Created - Absence message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Missing or invalid fields
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Absence message already exists
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/absence-messages/{id}

**Update absence message**

Updates an existing absence message by ID.

*Requirement:* WA-BUS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Absence message ID |

**Request Body:** `UpdateAbsenceMessageRequest`

**Responses:**

- `200`: OK - Absence message updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid fields
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Absence message does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/absence-messages/{id}

**Delete absence message**

Deletes an absence message by ID.

*Requirement:* WA-BUS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Absence message ID |

**Responses:**

- `200`: OK - Absence message deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Absence message does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/absence-messages/batch

**Batch create absence messages**

Creates multiple absence messages in a single request.

*Requirement:* WA-BUS-004

**Request Body:** `BatchCreateAbsenceMessagesRequest`

**Responses:**

- `201`: Created - Batch created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

### AdminAnalytics

#### `GET` /api/v1/admin/analytics-reports

**List analytics reports**

Retrieve system-level analytics and throughput reports with filtering, sorting, and full-text search.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:throughput,status:generated) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `500`: Internal Server Error - Failed to retrieve reports

---

#### `GET` /api/v1/admin/analytics-reports/{id}

**Get analytics report by ID**

Retrieve a specific analytics report with throughput and system metrics.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Responses:**

- `200`: OK - Report retrieved successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Report ID does not exist
- `500`: Internal Server Error - Failed to retrieve report

---

#### `POST` /api/v1/admin/analytics-reports

**Create analytics report**

Create a new analytics report definition for system-level analytics and throughput metrics.

*Requirement:* REQ-027

**Request Body:** `CreateAnalyticsReportRequest`

**Responses:**

- `201`: Created - Report created successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid report configuration
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `409`: Conflict - Report with the same parameters already exists
- `500`: Internal Server Error - Failed to create report

---

#### `PUT` /api/v1/admin/analytics-reports/{id}

**Update analytics report**

Update an existing analytics report definition.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Request Body:** `UpdateAnalyticsReportRequest`

**Responses:**

- `200`: OK - Report updated successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Report ID does not exist
- `500`: Internal Server Error - Failed to update report

---

#### `DELETE` /api/v1/admin/analytics-reports/{id}

**Delete analytics report**

Delete an analytics report definition.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Responses:**

- `200`: OK - Report deleted successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Report ID does not exist
- `500`: Internal Server Error - Failed to delete report

---

### AiAssistants

#### `GET` /api/v1/ai-assistants

**List AI assistants**

Retrieve a paginated list of AI assistants with search, filter, and sort options.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve assistants

---

#### `POST` /api/v1/ai-assistants

**Create AI assistant**

Create a new AI assistant configuration.

*Requirement:* WA-AI-001

**Request Body:** `CreateAiAssistantRequest`

**Responses:**

- `201`: Created - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid assistant payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Assistant already exists

---

#### `GET` /api/v1/ai-assistants/{assistantId}

**Get AI assistant**

Retrieve an AI assistant by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| assistantId | path | string | True | Assistant ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Assistant not found

---

#### `PUT` /api/v1/ai-assistants/{assistantId}

**Update AI assistant**

Update AI assistant configuration.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| assistantId | path | string | True | Assistant ID |

**Request Body:** `UpdateAiAssistantRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid assistant update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Assistant not found

---

#### `DELETE` /api/v1/ai-assistants/{assistantId}

**Delete AI assistant**

Delete an AI assistant by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| assistantId | path | string | True | Assistant ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Assistant not found

---

### AiSessions

#### `GET` /api/v1/ai-sessions

**List AI sessions**

Retrieve a paginated list of AI sessions.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve AI sessions

---

#### `POST` /api/v1/ai-sessions

**Create AI session**

Create a new AI conversation session.

*Requirement:* WA-AI-001

**Request Body:** `CreateAiSessionRequest`

**Responses:**

- `201`: Created - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid AI session payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - AI session already exists

---

#### `GET` /api/v1/ai-sessions/{sessionId}

**Get AI session**

Retrieve an AI session by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - AI session not found

---

#### `PUT` /api/v1/ai-sessions/{sessionId}

**Update AI session**

Update AI session status or metadata.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Request Body:** `UpdateAiSessionRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid AI session update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - AI session not found

---

#### `DELETE` /api/v1/ai-sessions/{sessionId}

**Delete AI session**

Delete an AI session by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - AI session not found

---

### AppLocks

#### `GET` /api/v1/app-locks

**List app locks**

Returns a paginated list of app lock configurations with optional filtering, sorting, and full-text search.

*Requirement:* WA-SEC-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |

**Request Body:** `ListAppLocksRequest`

**Responses:**

- `200`: OK - App locks retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `500`: Internal Server Error - Failed to fetch app locks (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/app-locks/{lockId}

**Get app lock**

Retrieves a single app lock configuration by ID.

*Requirement:* WA-SEC-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| lockId | path | string | True | App lock ID |

**Request Body:** `GetAppLockRequest`

**Responses:**

- `200`: OK - App lock retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - App lock does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/app-locks

**Create app lock**

Creates a new app lock configuration for a user.

*Requirement:* WA-SEC-003

**Request Body:** `CreateAppLockRequest`

**Responses:**

- `201`: Created - App lock created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid app lock configuration (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `409`: Conflict - App lock already exists for user (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/app-locks/{lockId}

**Update app lock**

Updates an existing app lock configuration.

*Requirement:* WA-SEC-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| lockId | path | string | True | App lock ID |

**Request Body:** `UpdateAppLockRequest`

**Responses:**

- `200`: OK - App lock updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - App lock does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/app-locks/{lockId}

**Delete app lock**

Deletes an app lock configuration.

*Requirement:* WA-SEC-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| lockId | path | string | True | App lock ID |

**Request Body:** `DeleteAppLockRequest`

**Responses:**

- `200`: OK - App lock deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - App lock does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/app-locks/batch

**Batch create app locks**

Creates multiple app lock configurations in a single request.

*Requirement:* WA-SEC-003

**Request Body:** `BatchCreateAppLocksRequest`

**Responses:**

- `201`: Created - App locks created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/app-locks/{lockId}/verify

**Verify app lock**

Verifies an app lock credential to unlock the app.

*Requirement:* WA-SEC-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| lockId | path | string | True | App lock ID |

**Request Body:** `VerifyAppLockRequest`

**Responses:**

- `200`: OK - Verification completed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Invalid credential (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - App lock does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### AudioMessages

#### `GET` /api/v1/audio-messages

**List audio messages**

Retrieve a paginated list of audio messages with optional filtering, sorting, and full-text search.

*Requirement:* WA-MED-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |

**Request Body:** `ListAudioMessagesRequest`

**Responses:**

- `200`: OK - List retrieved (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `500`: Internal Server Error - Unexpected error (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/audio-messages/{id}

**Get audio message**

Retrieve a single audio message metadata by ID.

*Requirement:* WA-MED-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audio message ID |

**Request Body:** `GetAudioMessageRequest`

**Responses:**

- `200`: OK - Resource retrieved (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Audio message not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/audio-messages

**Upload audio message**

Upload an end-to-end encrypted audio file and create an audio message.

*Requirement:* WA-MED-008

**Request Body:** `CreateAudioMessageRequest`

**Responses:**

- `201`: Created - Audio message uploaded (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid audio metadata or missing fields (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `413`: Payload Too Large - Audio file exceeds allowed size (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/audio-messages/{id}

**Update audio message metadata**

Update audio message metadata such as duration or MIME type.

*Requirement:* WA-MED-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audio message ID |

**Request Body:** `UpdateAudioMessageRequest`

**Responses:**

- `200`: OK - Audio message updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Audio message not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/audio-messages/{id}

**Delete audio message**

Delete an audio message by ID.

*Requirement:* WA-MED-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audio message ID |

**Request Body:** `DeleteAudioMessageRequest`

**Responses:**

- `200`: OK - Audio message deleted (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Audio message not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/audio-messages/batch

**Batch create audio messages**

Create multiple audio messages in a single request for offline queue sync.

*Requirement:* WA-MED-008

**Request Body:** `CreateAudioMessagesBatchRequest`

**Responses:**

- `201`: Created - Batch audio messages uploaded (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### AuditLogs

#### `GET` /api/v1/admin/audit-logs

**List audit logs**

Retrieve audit logs for compliance with filtering, sorting, and full-text search.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., actorId:123,action:login) |
| sort | query | string | False | Sort fields (e.g., timestamp:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `500`: Internal Server Error - Failed to retrieve audit logs

---

#### `GET` /api/v1/admin/audit-logs/{id}

**Get audit log by ID**

Retrieve a specific audit log entry for compliance review.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audit log ID |

**Responses:**

- `200`: OK - Audit log retrieved successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Audit log ID does not exist
- `500`: Internal Server Error - Failed to retrieve audit log

---

#### `POST` /api/v1/admin/audit-logs

**Create audit log entry**

Create a new audit log entry for compliance tracking.

*Requirement:* REQ-027

**Request Body:** `CreateAuditLogRequest`

**Responses:**

- `201`: Created - Audit log created successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid audit log payload
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `409`: Conflict - Duplicate audit log detected
- `500`: Internal Server Error - Failed to create audit log

---

#### `PUT` /api/v1/admin/audit-logs/{id}

**Update audit log entry**

Update an existing audit log entry for compliance corrections.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audit log ID |

**Request Body:** `UpdateAuditLogRequest`

**Responses:**

- `200`: OK - Audit log updated successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Audit log ID does not exist
- `500`: Internal Server Error - Failed to update audit log

---

#### `DELETE` /api/v1/admin/audit-logs/{id}

**Delete audit log entry**

Delete an audit log entry per retention or compliance policies.

*Requirement:* REQ-027

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Audit log ID |

**Responses:**

- `200`: OK - Audit log deleted successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `404`: Not Found - Audit log ID does not exist
- `500`: Internal Server Error - Failed to delete audit log

---

#### `POST` /api/v1/admin/audit-logs/batch

**Batch create audit logs**

Create multiple audit log entries in a single request for high-volume ingestion.

*Requirement:* REQ-027

**Request Body:** `BatchCreateAuditLogsRequest`

**Responses:**

- `201`: Created - Batch created successfully (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid admin token
- `403`: Forbidden - Insufficient privileges
- `500`: Internal Server Error - Failed to create audit logs

---

### Auth

#### `POST` /api/v1/auth/passkeys/registration/options

**Get registration options**

Generate WebAuthn registration options for passkey creation. Public endpoint for authenticated or pre-auth flows. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyRegistrationOptionsRequest`

**Responses:**

- `200`: OK - Options returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid request payload
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/auth/passkeys/registration/verify

**Verify registration**

Verify WebAuthn registration response and complete passkey enrollment. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyRegistrationVerifyRequest`

**Responses:**

- `201`: Created - Passkey verified and created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid WebAuthn response
- `409`: Conflict - Passkey already registered

---

#### `POST` /api/v1/auth/passkeys/authentication/options

**Get authentication options**

Generate WebAuthn authentication options for passkey login. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyAuthOptionsRequest`

**Responses:**

- `200`: OK - Options returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid request payload
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/auth/passkeys/authentication/verify

**Verify authentication**

Verify WebAuthn authentication response and issue session token. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyAuthVerifyRequest`

**Responses:**

- `201`: Created - Session issued with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid WebAuthn response
- `401`: Unauthorized - Authentication failed

---

### Backups

#### `GET` /api/v1/backups

**List backups**

Retrieve a paginated list of backups for the authenticated user or device, with optional filtering and search.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListBackupsRequest`

**Responses:**

- `200`: OK - Backups retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions to list backups.

---

#### `GET` /api/v1/backups/{backupId}

**Get backup by ID**

Retrieve a specific backup's metadata by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| backupId | path | string | True | Backup ID |

**Request Body:** `GetBackupRequest`

**Responses:**

- `200`: OK - Backup retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Backup does not exist.

---

#### `POST` /api/v1/backups

**Create backup**

Create a new encrypted backup with metadata and binary payload.

*Requirement:* REQ-021

**Request Body:** `CreateBackupRequest`

**Responses:**

- `201`: Created - Backup created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid backup payload or metadata.
- `401`: Unauthorized - Missing or invalid token.
- `413`: Payload Too Large - Backup file exceeds allowed limits.

---

#### `PUT` /api/v1/backups/{backupId}

**Update backup metadata**

Update metadata associated with an existing backup.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| backupId | path | string | True | Backup ID |

**Request Body:** `UpdateBackupRequest`

**Responses:**

- `200`: OK - Backup updated. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid metadata fields.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Backup does not exist.

---

#### `DELETE` /api/v1/backups/{backupId}

**Delete backup**

Delete a backup by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| backupId | path | string | True | Backup ID |

**Request Body:** `DeleteBackupRequest`

**Responses:**

- `200`: OK - Backup deleted. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Backup does not exist.

---

#### `POST` /api/v1/backups/batch

**Batch create backups metadata**

Create multiple backup metadata records in a single request for high-volume operations.

*Requirement:* REQ-021

**Request Body:** `BatchCreateBackupsRequest`

**Responses:**

- `201`: Created - Backups metadata created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.

---

### Batch

#### `POST` /api/v1/contacts/batch

**Batch create contacts**

Create multiple contacts in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `BatchCreateContactsRequest`

**Responses:**

- `201`: Created - Contacts created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

### BatteryMetrics

#### `GET` /api/v1/battery-metrics

**List battery metrics**

Retrieve battery telemetry with pagination, filtering, sorting, and full-text search.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., deviceId:eq:123) |
| sort | query | string | False | Sort fields (e.g., timestamp:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Battery metrics retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/battery-metrics

**Create battery metric**

Create a battery telemetry record.

*Requirement:* WA-PERF-004

**Request Body:** `CreateBatteryMetricRequest`

**Responses:**

- `201`: Created - Battery metric created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid metric payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/battery-metrics/{id}

**Get battery metric by ID**

Retrieve a specific battery metric record by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Metric ID |

**Responses:**

- `200`: OK - Battery metric retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery metric not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PATCH` /api/v1/battery-metrics/{id}

**Update battery metric**

Update a battery telemetry record by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Metric ID |

**Request Body:** `UpdateBatteryMetricRequest`

**Responses:**

- `200`: OK - Battery metric updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery metric not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/battery-metrics/{id}

**Delete battery metric**

Delete a battery telemetry record by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Metric ID |

**Responses:**

- `200`: OK - Battery metric deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery metric not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/battery-metrics/batch

**Batch create battery metrics**

Create multiple battery telemetry records in a single request.

*Requirement:* WA-PERF-004

**Request Body:** `BatchCreateBatteryMetricsRequest`

**Responses:**

- `201`: Created - Battery metrics batch created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### BatterySettings

#### `GET` /api/v1/battery-settings

**List battery settings**

Retrieve battery optimization settings with pagination, filtering, sorting, and full-text search.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., deviceId:eq:123) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Battery settings retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `429`: Too Many Requests - Rate limit exceeded (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/battery-settings

**Create battery settings**

Create battery optimization settings for a device.

*Requirement:* WA-PERF-004

**Request Body:** `CreateBatterySettingsRequest`

**Responses:**

- `201`: Created - Battery settings created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid battery settings payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `409`: Conflict - Battery settings already exist for device (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/battery-settings/{id}

**Get battery settings by ID**

Retrieve a specific battery settings record by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Battery settings ID |

**Responses:**

- `200`: OK - Battery settings retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery settings not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/battery-settings/{id}

**Update battery settings**

Update battery optimization settings by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Battery settings ID |

**Request Body:** `UpdateBatterySettingsRequest`

**Responses:**

- `200`: OK - Battery settings updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery settings not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/battery-settings/{id}

**Delete battery settings**

Delete battery optimization settings by ID.

*Requirement:* WA-PERF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Battery settings ID |

**Responses:**

- `200`: OK - Battery settings deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Battery settings not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/battery-settings/batch

**Batch create battery settings**

Create multiple battery settings records in a single request.

*Requirement:* WA-PERF-004

**Request Body:** `BatchCreateBatterySettingsRequest`

**Responses:**

- `201`: Created - Battery settings batch created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### Blocks

#### `GET` /api/v1/blocks

**List user blocks**

Retrieve a paginated list of user blocks with optional filtering and full-text search.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., blockerId:123) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Blocks retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not permitted to view blocks

---

#### `POST` /api/v1/blocks

**Create a user block**

Block a user to prevent interaction and messaging.

*Requirement:* REQ-023

**Request Body:** `CreateBlockRequest`

**Responses:**

- `201`: Created - Block created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - blockedId is required
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - User already blocked

---

#### `GET` /api/v1/blocks/{id}

**Get block by ID**

Retrieve a specific block by its ID.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Block ID |

**Responses:**

- `200`: OK - Block retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Block not found

---

#### `PUT` /api/v1/blocks/{id}

**Update a block**

Update block reason or metadata.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Block ID |

**Request Body:** `UpdateBlockRequest`

**Responses:**

- `200`: OK - Block updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Block not found

---

#### `DELETE` /api/v1/blocks/{id}

**Delete a block**

Unblock a user and remove the block.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Block ID |

**Responses:**

- `200`: OK - Block deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Block not found

---

#### `POST` /api/v1/blocks/batch

**Batch create or delete blocks**

Create or remove multiple blocks in a single request.

*Requirement:* REQ-023

**Request Body:** `BatchBlocksRequest`

**Responses:**

- `201`: Created - Batch processed (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Bots

#### `GET` /api/v1/bots

**List bots**

Retrieve a paginated list of bots with filter, sort, and full-text search support.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected bot lookup failure

---

#### `POST` /api/v1/bots

**Create bot**

Create a bot with identity keys for end-to-end encryption (Signal Protocol).

*Requirement:* REQ-028

**Request Body:** `CreateBotRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid bot payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Bot already exists

---

#### `GET` /api/v1/bots/{botId}

**Get bot**

Retrieve a bot by ID.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| botId | path | string | True | Bot ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Bot not found

---

#### `PUT` /api/v1/bots/{botId}

**Update bot**

Update bot metadata and status.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| botId | path | string | True | Bot ID |

**Request Body:** `UpdateBotRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid bot update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Bot not found

---

#### `DELETE` /api/v1/bots/{botId}

**Delete bot**

Delete a bot and revoke its access.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| botId | path | string | True | Bot ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Bot not found

---

#### `POST` /api/v1/bots/batch

**Batch create bots**

Create multiple bots in a single request for high-volume onboarding.

*Requirement:* REQ-028

**Request Body:** `BatchCreateBotsRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### BroadcastLists

#### `POST` /api/v1/broadcast-lists

**Create broadcast list**

Creates a broadcast list for mass messaging with up to 256 recipients.

*Requirement:* WA-MSG-011

**Request Body:** `CreateBroadcastListRequest`

**Responses:**

- `201`: Created - Broadcast list created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload or recipient limit exceeded. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `409`: Conflict - Broadcast list already exists. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists

**List broadcast lists**

Returns paginated broadcast lists with search, filter, and sort support.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Request Body:** `ListBroadcastListsRequest`

**Responses:**

- `200`: OK - List retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists/{broadcastListId}

**Get broadcast list**

Retrieves a broadcast list by ID.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `GetBroadcastListRequest`

**Responses:**

- `200`: OK - Broadcast list retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/broadcast-lists/{broadcastListId}

**Update broadcast list**

Updates broadcast list metadata.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `UpdateBroadcastListRequest`

**Responses:**

- `200`: OK - Broadcast list updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/broadcast-lists/{broadcastListId}

**Delete broadcast list**

Deletes a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `DeleteBroadcastListRequest`

**Responses:**

- `200`: OK - Broadcast list deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/broadcast-lists/{broadcastListId}/recipients

**Add recipients to broadcast list**

Adds one or more recipients to a broadcast list (max 256 recipients).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `AddRecipientsRequest`

**Responses:**

- `201`: Created - Recipients added. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid recipients or limit exceeded. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists/{broadcastListId}/recipients

**List recipients of broadcast list**

Returns paginated recipients for a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Request Body:** `ListRecipientsRequest`

**Responses:**

- `200`: OK - Recipients retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists/{broadcastListId}/recipients/{recipientId}

**Get broadcast list recipient**

Gets a specific recipient in a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| recipientId | path | string | True | Recipient user ID |

**Request Body:** `GetRecipientRequest`

**Responses:**

- `200`: OK - Recipient retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Recipient or broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/broadcast-lists/{broadcastListId}/recipients/{recipientId}

**Remove recipient from broadcast list**

Removes a recipient from a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| recipientId | path | string | True | Recipient user ID |

**Request Body:** `RemoveRecipientRequest`

**Responses:**

- `200`: OK - Recipient removed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Recipient or broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/broadcast-lists/{broadcastListId}/messages

**Send message to broadcast list**

Sends an end-to-end encrypted message to all recipients in the broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `SendBroadcastMessageRequest`

**Responses:**

- `201`: Created - Message queued/sent. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload or broadcast list too large. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### BusinessVerifications

#### `POST` /api/v1/businessVerifications

**Request business verification**

Submits a verification request for a business. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Request Body:** `CreateBusinessVerificationRequest`

**Responses:**

- `201`: Created - Verification request submitted. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid verification request.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Verification request already exists.

---

#### `GET` /api/v1/businessVerifications

**List business verifications**

Returns a paginated list of verification requests with filters. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| businessId | query | string | False | Filter by business ID |
| status | query | string | False | Filter by verification status |
| query | query | string | False | Full-text search query |
| sort | query | string | False | Sort field and direction, e.g., createdAt:desc |

**Request Body:** `ListBusinessVerificationsRequest`

**Responses:**

- `200`: OK - Verification requests retrieved. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination or filter parameters.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/businessVerifications/{id}

**Get verification by ID**

Retrieves a verification request by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Verification request ID |

**Request Body:** `GetBusinessVerificationRequest`

**Responses:**

- `200`: OK - Verification request retrieved. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Verification request does not exist.

---

#### `PUT` /api/v1/businessVerifications/{id}

**Update verification**

Updates a verification request (e.g., add evidence or update status by admin). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Verification request ID |

**Request Body:** `UpdateBusinessVerificationRequest`

**Responses:**

- `200`: OK - Verification request updated. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Verification request does not exist.

---

#### `DELETE` /api/v1/businessVerifications/{id}

**Delete verification request**

Deletes a verification request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Verification request ID |

**Request Body:** `DeleteBusinessVerificationRequest`

**Responses:**

- `200`: OK - Verification request deleted. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Verification request does not exist.

---

#### `POST` /api/v1/businessVerifications/batch

**Batch update verification status**

Processes multiple verification updates in one request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Request Body:** `BatchUpdateBusinessVerificationsRequest`

**Responses:**

- `201`: Created - Verification updates processed. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch update payload.
- `401`: Unauthorized - Missing or invalid token.

---

### Businesses

#### `POST` /api/v1/businesses

**Create business**

Creates a new business profile. Returns rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Request Body:** `CreateBusinessRequest`

**Responses:**

- `201`: Created - Business created successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid business fields.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Business already exists.

---

#### `GET` /api/v1/businesses

**List businesses**

Returns a paginated list of businesses with optional search, filter, and sort. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| query | query | string | False | Full-text search query |
| status | query | string | False | Filter by business status |
| sort | query | string | False | Sort field and direction, e.g., name:asc |

**Request Body:** `ListBusinessesRequest`

**Responses:**

- `200`: OK - Businesses retrieved successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination or filter parameters.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/businesses/{id}

**Get business by ID**

Retrieves a business by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Business ID |

**Request Body:** `GetBusinessRequest`

**Responses:**

- `200`: OK - Business retrieved successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Business does not exist.

---

#### `PUT` /api/v1/businesses/{id}

**Update business**

Updates a business profile. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Business ID |

**Request Body:** `UpdateBusinessRequest`

**Responses:**

- `200`: OK - Business updated successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Business does not exist.

---

#### `DELETE` /api/v1/businesses/{id}

**Delete business**

Deletes a business. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Business ID |

**Request Body:** `DeleteBusinessRequest`

**Responses:**

- `200`: OK - Business deleted successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Business does not exist.

---

#### `POST` /api/v1/businesses/batch

**Batch create businesses**

Creates multiple businesses in one request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-002

**Request Body:** `BatchCreateBusinessesRequest`

**Responses:**

- `201`: Created - Businesses created successfully. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.

---

### CallLinks

#### `GET` /api/v1/call-links

**List call links**

Retrieve a paginated list of call links for planned calls with optional filtering, sorting, and full-text search.

*Requirement:* WA-CALL-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `500`: Internal Server Error - Unexpected failure - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/call-links

**Create call link**

Create a planned call link supporting WebRTC for voice/video calls with Signal Protocol metadata.

*Requirement:* WA-CALL-005

**Request Body:** `CreateCallLinkRequest`

**Responses:**

- `201`: Created - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid call link payload - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `409`: Conflict - Call link already exists - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/call-links/{callLinkId}

**Get call link**

Retrieve a call link by ID.

*Requirement:* WA-CALL-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| callLinkId | path | string | True | Call link ID |

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Call link does not exist - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/call-links/{callLinkId}

**Update call link**

Update a planned call link details.

*Requirement:* WA-CALL-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| callLinkId | path | string | True | Call link ID |

**Request Body:** `UpdateCallLinkRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Call link does not exist - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/call-links/{callLinkId}

**Delete call link**

Delete a planned call link.

*Requirement:* WA-CALL-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| callLinkId | path | string | True | Call link ID |

**Responses:**

- `200`: OK - Deleted successfully - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Call link does not exist - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/call-links/batch

**Batch create call links**

Create multiple call links in a single request for high-volume scheduling.

*Requirement:* WA-CALL-005

**Request Body:** `BatchCreateCallLinksRequest`

**Responses:**

- `201`: Created - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/call-links/{callLinkId}/join

**Join call via link**

Generate a WebRTC join token for a call link.

*Requirement:* WA-CALL-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| callLinkId | path | string | True | Call link ID |

**Request Body:** `JoinCallLinkRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Call link does not exist - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `409`: Conflict - Call already started or expired - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### CartItems

#### `GET` /api/v1/cart-items

**List cart items**

Retrieve a paginated list of cart items with optional filtering, sorting, and full-text search. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned with rate limit headers
- `400`: Bad Request - Invalid pagination or query parameters
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/cart-items

**Create cart item**

Add an item to a cart. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Request Body:** `CreateCartItemRequest`

**Responses:**

- `201`: Created - Cart item created with rate limit headers
- `400`: Bad Request - Missing or invalid fields
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Item already exists in cart

---

#### `GET` /api/v1/cart-items/{id}

**Get cart item by ID**

Retrieve a cart item by its ID. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart item ID |

**Responses:**

- `200`: OK - Cart item returned with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart item does not exist

---

#### `PUT` /api/v1/cart-items/{id}

**Update cart item**

Update quantity or price of a cart item. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart item ID |

**Request Body:** `UpdateCartItemRequest`

**Responses:**

- `200`: OK - Cart item updated with rate limit headers
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart item does not exist

---

#### `DELETE` /api/v1/cart-items/{id}

**Delete cart item**

Remove a cart item by ID. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart item ID |

**Responses:**

- `200`: OK - Cart item deleted with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart item does not exist

---

#### `POST` /api/v1/cart-items/batch

**Batch add/update cart items**

Create or update multiple cart items in a single request. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Request Body:** `BatchUpsertCartItemsRequest`

**Responses:**

- `201`: Created - Batch processed with rate limit headers
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - One or more items conflicted

---

### Carts

#### `GET` /api/v1/carts

**List carts**

Retrieve a paginated list of carts with optional filtering, sorting, and full-text search. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned with rate limit headers
- `400`: Bad Request - Invalid pagination or query parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected processing failure

---

#### `POST` /api/v1/carts

**Create cart**

Create a new cart for a user. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Request Body:** `CreateCartRequest`

**Responses:**

- `201`: Created - Cart created with rate limit headers
- `400`: Bad Request - Missing or invalid fields
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Active cart already exists for user

---

#### `GET` /api/v1/carts/{id}

**Get cart by ID**

Retrieve a cart by its ID. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart ID |

**Responses:**

- `200`: OK - Cart returned with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart does not exist

---

#### `PUT` /api/v1/carts/{id}

**Update cart**

Update cart properties such as status or currency. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart ID |

**Request Body:** `UpdateCartRequest`

**Responses:**

- `200`: OK - Cart updated with rate limit headers
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart does not exist

---

#### `DELETE` /api/v1/carts/{id}

**Delete cart**

Delete a cart by ID. Includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BUS-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Cart ID |

**Responses:**

- `200`: OK - Cart deleted with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Cart does not exist

---

### Catalogs

#### `GET` /api/v1/catalogs

**List catalogs**

Retrieve a paginated list of business product catalogs with optional filtering, sorting, and full-text search.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| businessId | query | string | False | Filter by business ID |
| sort | query | string | False | Sort fields, e.g. name:asc |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Catalog list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unable to fetch catalogs

---

#### `POST` /api/v1/catalogs

**Create catalog**

Create a new product catalog for a business.

*Requirement:* WA-BUS-006

**Request Body:** `CreateCatalogRequest`

**Responses:**

- `201`: Created - Catalog created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Missing required fields or invalid input
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Catalog already exists

---

#### `GET` /api/v1/catalogs/{id}

**Get catalog**

Retrieve a catalog by ID.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Catalog ID |

**Responses:**

- `200`: OK - Catalog returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Catalog does not exist

---

#### `PUT` /api/v1/catalogs/{id}

**Update catalog**

Update an existing catalog.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Catalog ID |

**Request Body:** `UpdateCatalogRequest`

**Responses:**

- `200`: OK - Catalog updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid input
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Catalog does not exist

---

#### `DELETE` /api/v1/catalogs/{id}

**Delete catalog**

Delete a catalog by ID.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Catalog ID |

**Responses:**

- `200`: OK - Catalog deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Catalog does not exist

---

### ChatArchive

#### `POST` /api/v1/chats/{chatId}/archive

**Archive chat**

Archives a chat for the requesting user.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `ArchiveChatRequest`

**Responses:**

- `201`: Created - Chat archived (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/chats/{chatId}/archive

**Unarchive chat**

Removes archive state for a chat.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat unarchived (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/chat-archives

**List chat archives**

Retrieves a paginated list of archived chats.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Chat archives retrieved (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/chat-archives

**Create chat archive**

Creates an archive record for a chat.

*Requirement:* WA-BAK-005

**Request Body:** `CreateChatArchiveRequest`

**Responses:**

- `201`: Created - Chat archive created (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid archive data (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/chat-archives/{archiveId}

**Get chat archive**

Retrieves an archive record by ID.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| archiveId | path | string | True | Archive ID |

**Responses:**

- `200`: OK - Chat archive retrieved (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Archive does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/chat-archives/{archiveId}

**Update chat archive**

Updates an archive record.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| archiveId | path | string | True | Archive ID |

**Request Body:** `UpdateChatArchiveRequest`

**Responses:**

- `200`: OK - Chat archive updated (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid archive update (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Archive does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/chat-archives/{archiveId}

**Delete chat archive**

Deletes an archive record (unarchive).

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| archiveId | path | string | True | Archive ID |

**Responses:**

- `200`: OK - Chat archive deleted (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Archive does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/chat-archives/batch

**Batch create chat archives**

Creates multiple chat archive records.

*Requirement:* WA-BAK-005

**Request Body:** `BatchCreateChatArchivesRequest`

**Responses:**

- `201`: Created - Chat archives created (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### ChatExports

#### `GET` /api/v1/chat-exports

**List chat exports**

Retrieve a paginated list of chat export jobs with filtering, sorting, and search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Chat exports retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve exports

---

#### `GET` /api/v1/chat-exports/{id}

**Get chat export by ID**

Retrieve a single chat export job by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Export job ID |

**Responses:**

- `200`: OK - Chat export retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Export job does not exist
- `500`: Internal Server Error - Failed to retrieve export

---

#### `POST` /api/v1/chat-exports

**Create chat export**

Create an export job for a single chat. Supports encrypted export respecting end-to-end encryption. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Request Body:** `CreateChatExportRequest`

**Responses:**

- `201`: Created - Export job created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid export request payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Export job already exists

---

#### `PUT` /api/v1/chat-exports/{id}

**Update chat export**

Update export job metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Export job ID |

**Request Body:** `UpdateChatExportRequest`

**Responses:**

- `200`: OK - Export updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Export job does not exist

---

#### `DELETE` /api/v1/chat-exports/{id}

**Delete chat export**

Delete an export job. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Export job ID |

**Responses:**

- `200`: OK - Export deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Export job does not exist
- `500`: Internal Server Error - Failed to delete export

---

#### `POST` /api/v1/chat-exports/batch

**Batch create chat exports**

Create multiple export jobs in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Request Body:** `BatchCreateChatExportsRequest`

**Responses:**

- `201`: Created - Export jobs created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Chats

#### `GET` /api/v1/chats

**List chats**

Retrieve a paginated list of chats with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |
| archived | query | boolean | False | Filter by archived chats |

**Responses:**

- `200`: OK - Chats retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve chats

---

#### `GET` /api/v1/chats/{id}

**Get chat by ID**

Retrieve a single chat by its ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Chat does not exist
- `500`: Internal Server Error - Failed to retrieve chat

---

#### `POST` /api/v1/chats

**Create chat**

Create a new chat (direct or group). Group size limited to 1024. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Request Body:** `CreateChatRequest`

**Responses:**

- `201`: Created - Chat created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid chat payload or size limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Chat already exists

---

#### `PUT` /api/v1/chats/{id}

**Update chat**

Update chat metadata such as title. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Chat ID |

**Request Body:** `UpdateChatRequest`

**Responses:**

- `200`: OK - Chat updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Chat does not exist

---

#### `DELETE` /api/v1/chats/{id}

**Delete chat**

Delete a chat. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Chat does not exist
- `500`: Internal Server Error - Failed to delete chat

---

#### `GET` /api/v1/chats/{chatId}

**Get chat**

Retrieves a chat by ID.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat retrieved (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/chats/{chatId}

**Update chat**

Updates chat metadata.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `UpdateChatRequest`

**Responses:**

- `200`: OK - Chat updated (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/chats/{chatId}

**Delete chat**

Deletes a chat.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat deleted (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/chats/batch

**Batch create chats**

Creates multiple chats in a single request.

*Requirement:* WA-BAK-005

**Request Body:** `BatchCreateChatsRequest`

**Responses:**

- `201`: Created - Batch chats created (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### ContactLabelAssignments

#### `GET` /api/v1/contacts/{contactId}/labels

**List labels for a contact**

Returns a paginated list of labels assigned to a contact with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |
| page | query | integer | True | Page number (1-based) |
| pageSize | query | integer | True | Number of items per page |
| q | query | string | False | Full-text search query on label name |
| filter | query | string | False | Filter expression, e.g., color:eq:red |
| sort | query | string | False | Sort expression, e.g., name:asc |

**Responses:**

- `200`: OK - Labels returned successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Contact does not exist
- `500`: Internal Server Error - Failed to retrieve labels for contact

---

#### `POST` /api/v1/contacts/{contactId}/labels

**Assign labels to a contact**

Assigns one or more labels to a contact. Idempotent for existing assignments. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |

**Request Body:** `AssignLabelsToContactRequest`

**Responses:**

- `201`: Created - Labels assigned successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid label IDs
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Contact or labels do not exist
- `500`: Internal Server Error - Failed to assign labels

---

#### `DELETE` /api/v1/contacts/{contactId}/labels/{labelId}

**Remove label from a contact**

Removes a specific label assignment from a contact. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |
| labelId | path | string | True | Label ID |

**Responses:**

- `200`: OK - Label removed successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Contact or label assignment does not exist
- `500`: Internal Server Error - Failed to remove label

---

#### `POST` /api/v1/contacts/labels/batch

**Batch assign labels to contacts**

Assigns labels to multiple contacts in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Request Body:** `BatchAssignLabelsToContactsRequest`

**Responses:**

- `201`: Created - Batch assignments completed successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to batch assign labels

---

### ContactLabels

#### `GET` /api/v1/contact-labels

**List contact labels**

Returns a paginated list of contact labels with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number (1-based) |
| pageSize | query | integer | True | Number of items per page |
| q | query | string | False | Full-text search query on label name |
| filter | query | string | False | Filter expression, e.g., color:eq:red |
| sort | query | string | False | Sort expression, e.g., name:asc |

**Responses:**

- `200`: OK - Labels returned successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve labels

---

#### `POST` /api/v1/contact-labels

**Create contact label**

Creates a new label that can be assigned to contacts. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Request Body:** `CreateContactLabelRequest`

**Responses:**

- `201`: Created - Label created successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Label name is missing or invalid
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Label name already exists
- `500`: Internal Server Error - Failed to create label

---

#### `GET` /api/v1/contact-labels/{labelId}

**Get contact label by ID**

Returns a single contact label by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| labelId | path | string | True | Label ID |

**Responses:**

- `200`: OK - Label returned successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Label does not exist
- `500`: Internal Server Error - Failed to retrieve label

---

#### `PUT` /api/v1/contact-labels/{labelId}

**Update contact label**

Updates a contact label's name or color. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| labelId | path | string | True | Label ID |

**Request Body:** `UpdateContactLabelRequest`

**Responses:**

- `200`: OK - Label updated successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid label data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Label does not exist
- `409`: Conflict - Label name already exists
- `500`: Internal Server Error - Failed to update label

---

#### `DELETE` /api/v1/contact-labels/{labelId}

**Delete contact label**

Deletes a contact label and removes it from all contacts. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| labelId | path | string | True | Label ID |

**Responses:**

- `200`: OK - Label deleted successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Label does not exist
- `500`: Internal Server Error - Failed to delete label

---

#### `POST` /api/v1/contact-labels/batch

**Batch create contact labels**

Creates multiple contact labels in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-004

**Request Body:** `BatchCreateContactLabelsRequest`

**Responses:**

- `201`: Created - Labels created successfully with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to batch create labels

---

### Contacts

#### `GET` /api/v1/contacts

**List contacts**

Retrieve a paginated list of contacts with optional filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListContactsRequest`

**Responses:**

- `200`: OK - Contacts retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination or filter parameters. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `GET` /api/v1/contacts/{id}

**Get contact by ID**

Retrieve a single contact by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Contact ID |

**Request Body:** `GetContactRequest`

**Responses:**

- `200`: OK - Contact retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `404`: Not Found - Contact does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `POST` /api/v1/contacts

**Create contact**

Create a new contact entry. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `CreateContactRequest`

**Responses:**

- `201`: Created - Contact created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid contact data. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `409`: Conflict - Contact already exists. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `PUT` /api/v1/contacts/{id}

**Update contact**

Update an existing contact. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Contact ID |

**Request Body:** `UpdateContactRequest`

**Responses:**

- `200`: OK - Contact updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid contact data. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `404`: Not Found - Contact does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `DELETE` /api/v1/contacts/{id}

**Delete contact**

Delete a contact by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Contact ID |

**Request Body:** `DeleteContactRequest`

**Responses:**

- `200`: OK - Contact deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `404`: Not Found - Contact does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `POST` /api/v1/contacts/sync

**Synchronize device contacts**

Compare device contacts with WhatsApp users and return matches. Supports offline queue reconciliation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `SyncContactsRequest`

**Responses:**

- `201`: Created - Sync completed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid contact payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `POST` /api/v1/contacts/batch

**Batch create contacts**

Create multiple contacts in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `BatchCreateContactsRequest`

**Responses:**

- `201`: Created - Contacts created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `GET` /api/v1/contacts/{contactId}

**Get contact**

Retrieve a contact by ID.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |

**Responses:**

- `200`: OK - Contact retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Contact does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/contacts/{contactId}

**Update contact**

Update contact details.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |

**Request Body:** `UpdateContactRequest`

**Responses:**

- `200`: OK - Contact updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Contact does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/contacts/{contactId}

**Delete contact**

Remove a contact.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| contactId | path | string | True | Contact ID |

**Responses:**

- `200`: OK - Contact deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Contact does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### Conversations

#### `GET` /api/v1/conversations

**List conversations**

Retrieve a paginated list of conversations with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/conversations/{id}

**Get conversation by ID**

Retrieve a conversation by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Responses:**

- `200`: OK - Conversation retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations

**Create conversation**

Create a new conversation (group or direct). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateConversationRequest`

**Responses:**

- `201`: Created - Conversation created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid members or type
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Conversation already exists

---

#### `PUT` /api/v1/conversations/{id}

**Update conversation**

Update conversation metadata. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Request Body:** `UpdateConversationRequest`

**Responses:**

- `200`: OK - Conversation updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid title
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `DELETE` /api/v1/conversations/{id}

**Delete conversation**

Delete a conversation. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Responses:**

- `200`: OK - Conversation deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `GET` /api/v1/conversations/{conversationId}

**Get conversation**

Retrieve a conversation by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation not found

---

#### `PUT` /api/v1/conversations/{conversationId}

**Update conversation**

Update conversation metadata.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `UpdateConversationRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid conversation update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation not found

---

#### `DELETE` /api/v1/conversations/{conversationId}

**Delete conversation**

Delete a conversation by ID.

*Requirement:* WA-AI-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation not found

---

### DesktopAppVersions

#### `GET` /api/v1/desktopAppVersions

**List desktop app versions**

Retrieve a paginated list of desktop app versions with filter, sort, and full-text search.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `DesktopAppVersionListRequest`

**Responses:**

- `200`: OK - Desktop app versions retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve desktop app versions

---

#### `GET` /api/v1/desktopAppVersions/{id}

**Get desktop app version**

Retrieve a specific desktop app version by ID.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app version ID |

**Request Body:** `GetDesktopAppVersionRequest`

**Responses:**

- `200`: OK - Desktop app version retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app version not found
- `500`: Internal Server Error - Failed to retrieve desktop app version

---

#### `POST` /api/v1/desktopAppVersions

**Create desktop app version**

Create a new desktop app version for native distribution.

*Requirement:* WA-INT-005

**Request Body:** `CreateDesktopAppVersionRequest`

**Responses:**

- `201`: Created - Desktop app version created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid version data
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Version already exists
- `500`: Internal Server Error - Failed to create desktop app version

---

#### `PUT` /api/v1/desktopAppVersions/{id}

**Update desktop app version**

Update an existing desktop app version entry.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app version ID |

**Request Body:** `UpdateDesktopAppVersionRequest`

**Responses:**

- `200`: OK - Desktop app version updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app version not found
- `500`: Internal Server Error - Failed to update desktop app version

---

#### `DELETE` /api/v1/desktopAppVersions/{id}

**Delete desktop app version**

Delete a desktop app version entry.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app version ID |

**Request Body:** `DeleteDesktopAppVersionRequest`

**Responses:**

- `200`: OK - Desktop app version deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app version not found
- `500`: Internal Server Error - Failed to delete desktop app version

---

#### `GET` /api/v1/desktopAppVersions/{id}/download

**Get desktop app download link**

Retrieve a signed download link for the desktop app version package.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app version ID |

**Request Body:** `GetDesktopAppVersionDownloadRequest`

**Responses:**

- `200`: OK - Download URL retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app version not found
- `500`: Internal Server Error - Failed to create download URL

---

### DesktopApps

#### `GET` /api/v1/desktopApps

**List desktop apps**

Retrieve a paginated list of desktop applications available for native clients. Supports filtering, sorting, and full-text search.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `DesktopAppListRequest`

**Responses:**

- `200`: OK - Desktop apps retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions
- `500`: Internal Server Error - Failed to retrieve desktop apps

---

#### `GET` /api/v1/desktopApps/{id}

**Get desktop app by ID**

Retrieve a specific desktop app by its ID.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app ID |

**Request Body:** `GetDesktopAppRequest`

**Responses:**

- `200`: OK - Desktop app retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app not found
- `500`: Internal Server Error - Failed to retrieve desktop app

---

#### `POST` /api/v1/desktopApps

**Create desktop app**

Create a new desktop app entry for native desktop distribution.

*Requirement:* WA-INT-005

**Request Body:** `CreateDesktopAppRequest`

**Responses:**

- `201`: Created - Desktop app created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid desktop app data
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Desktop app already exists
- `500`: Internal Server Error - Failed to create desktop app

---

#### `PUT` /api/v1/desktopApps/{id}

**Update desktop app**

Update an existing desktop app entry.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app ID |

**Request Body:** `UpdateDesktopAppRequest`

**Responses:**

- `200`: OK - Desktop app updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app not found
- `500`: Internal Server Error - Failed to update desktop app

---

#### `DELETE` /api/v1/desktopApps/{id}

**Delete desktop app**

Delete a desktop app entry.

*Requirement:* WA-INT-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Desktop app ID |

**Request Body:** `DeleteDesktopAppRequest`

**Responses:**

- `200`: OK - Desktop app deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Desktop app not found
- `500`: Internal Server Error - Failed to delete desktop app

---

### Devices

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/devices/{id}

**Get device**

Retrieve device details by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `GetDeviceRequest`

**Responses:**

- `200`: OK - Device returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `PUT` /api/v1/devices/{id}

**Update device**

Update device metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Device updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `DELETE` /api/v1/devices/{id}

**Delete device**

Remove a device registration. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `POST` /api/v1/devices/batch

**Batch register devices**

Bulk register devices. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `BatchCreateDevicesRequest`

**Responses:**

- `201`: Created - Batch processed with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `GET` /api/v1/devices/{deviceId}

**Get device by ID**

Returns details of a registered device.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/devices/{deviceId}

**Update device**

Updates device information.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

### DndSettings

#### `GET` /api/v1/dnd-settings

**List Do Not Disturb settings**

Retrieve a paginated list of Do Not Disturb settings with filtering, sorting, and full-text search support.

*Requirement:* WA-NOT-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/dnd-settings/{id}

**Get Do Not Disturb setting by ID**

Retrieve a single Do Not Disturb setting by its ID.

*Requirement:* WA-NOT-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | DND setting ID |

**Responses:**

- `200`: OK - DND setting returned (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - DND setting does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/dnd-settings

**Create Do Not Disturb setting**

Create a Do Not Disturb setting for a user.

*Requirement:* WA-NOT-004

**Request Body:** `CreateDndSettingRequest`

**Responses:**

- `201`: Created - DND setting created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid DND setting payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - DND setting already exists for user
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/dnd-settings/{id}

**Update Do Not Disturb setting**

Update an existing Do Not Disturb setting.

*Requirement:* WA-NOT-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | DND setting ID |

**Request Body:** `UpdateDndSettingRequest`

**Responses:**

- `200`: OK - DND setting updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - DND setting does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/dnd-settings/{id}

**Delete Do Not Disturb setting**

Delete an existing Do Not Disturb setting.

*Requirement:* WA-NOT-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | DND setting ID |

**Responses:**

- `200`: OK - DND setting deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - DND setting does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/dnd-settings/batch

**Batch create or update Do Not Disturb settings**

Create or update multiple Do Not Disturb settings in a single request.

*Requirement:* WA-NOT-004

**Request Body:** `BatchUpsertDndSettingsRequest`

**Responses:**

- `201`: Created - Batch upsert completed (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

### FontSizes

#### `GET` /api/v1/font-sizes

**List font size preferences**

Retrieve paginated list of font size preferences. Supports filtering and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| userId | query | string | False | Filter by user ID |
| sort | query | string | False | Sort fields, e.g., createdAt:desc |
| filter | query | string | False | Filter expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListFontSizesRequest`

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/font-sizes/{id}

**Get font size preference by ID**

Retrieve a specific font size preference. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Font size preference ID |

**Request Body:** `GetFontSizeRequest`

**Responses:**

- `200`: OK - Resource retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Font size preference does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/font-sizes

**Create font size preference**

Create a new font size preference for a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Request Body:** `CreateFontSizeRequest`

**Responses:**

- `201`: Created - Resource created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid scale or preset
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Preference already exists for user
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/font-sizes/{id}

**Update font size preference**

Update an existing font size preference. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Font size preference ID |

**Request Body:** `UpdateFontSizeRequest`

**Responses:**

- `200`: OK - Resource updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid scale or preset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Font size preference does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/font-sizes/{id}

**Delete font size preference**

Delete a font size preference. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Font size preference ID |

**Request Body:** `DeleteFontSizeRequest`

**Responses:**

- `200`: OK - Resource deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Font size preference does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/font-sizes/batch

**Batch create/update font size preferences**

Create or update multiple font size preferences in bulk. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Request Body:** `BatchUpsertFontSizesRequest`

**Responses:**

- `201`: Created - Batch processed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

### GroupEvents

#### `GET` /api/v1/group-events

**List group events**

Retrieve a paginated list of group events. Supports filter, sort, and full-text search. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | query | string | True | Group ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., status:scheduled) |
| sort | query | string | False | Sort expression (e.g., startsAt:asc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved successfully (Rate limit headers included)
- `400`: Bad Request - Invalid pagination, filter, or sort parameters
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group

---

#### `GET` /api/v1/group-events/{id}

**Get group event by ID**

Retrieve details for a specific group event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Responses:**

- `200`: OK - Event retrieved successfully (Rate limit headers included)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `404`: Not Found - Event does not exist

---

#### `POST` /api/v1/group-events

**Create group event**

Create a new event in a group. Supports end-to-end encrypted payload metadata (Signal Protocol) and offline queue processing. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Request Body:** `CreateGroupEventRequest`

**Responses:**

- `201`: Created - Event created successfully (Rate limit headers included)
- `400`: Bad Request - Missing or invalid fields
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to create events in this group
- `409`: Conflict - Duplicate clientRequestId or event already exists

---

#### `PUT` /api/v1/group-events/{id}

**Update group event**

Update an existing group event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Request Body:** `UpdateGroupEventRequest`

**Responses:**

- `200`: OK - Event updated successfully (Rate limit headers included)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to update this event
- `404`: Not Found - Event does not exist

---

#### `DELETE` /api/v1/group-events/{id}

**Delete group event**

Delete a group event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Responses:**

- `200`: OK - Event deleted successfully (Rate limit headers included)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to delete this event
- `404`: Not Found - Event does not exist

---

#### `POST` /api/v1/group-events/batch

**Batch create group events**

Create multiple events in a single request for offline synchronization. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Request Body:** `BatchCreateGroupEventsRequest`

**Responses:**

- `201`: Created - Batch processed successfully (Rate limit headers included)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to create events in this group

---

#### `POST` /api/v1/group-events/{id}/media

**Upload media for group event**

Upload media files for an event. Supports documents up to 2GB and images up to 16MB. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Request Body:** `UploadGroupEventMediaRequest`

**Responses:**

- `201`: Created - Media uploaded successfully (Rate limit headers included)
- `400`: Bad Request - Invalid media type or size
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to upload media for this event
- `413`: Payload Too Large - Media exceeds size limits

---

#### `GET` /api/v1/group-events/{id}/rsvps

**List RSVPs for event**

Retrieve RSVP statuses for an event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter by status |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - RSVPs retrieved successfully (Rate limit headers included)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `404`: Not Found - Event does not exist

---

#### `GET` /api/v1/group-events/{id}/rsvps/{userId}

**Get RSVP by user**

Retrieve a user's RSVP for an event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |
| userId | path | string | True | User ID |

**Responses:**

- `200`: OK - RSVP retrieved successfully (Rate limit headers included)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `404`: Not Found - RSVP does not exist

---

#### `POST` /api/v1/group-events/{id}/rsvps

**Create RSVP**

Create an RSVP for an event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Request Body:** `CreateEventRsvpRequest`

**Responses:**

- `201`: Created - RSVP created successfully (Rate limit headers included)
- `400`: Bad Request - Invalid RSVP status
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `409`: Conflict - RSVP already exists

---

#### `PUT` /api/v1/group-events/{id}/rsvps/{userId}

**Update RSVP**

Update an RSVP status for an event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |
| userId | path | string | True | User ID |

**Request Body:** `UpdateEventRsvpRequest`

**Responses:**

- `200`: OK - RSVP updated successfully (Rate limit headers included)
- `400`: Bad Request - Invalid RSVP status
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `404`: Not Found - RSVP does not exist

---

#### `DELETE` /api/v1/group-events/{id}/rsvps/{userId}

**Delete RSVP**

Delete an RSVP for an event. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |
| userId | path | string | True | User ID |

**Responses:**

- `200`: OK - RSVP deleted successfully (Rate limit headers included)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group
- `404`: Not Found - RSVP does not exist

---

#### `POST` /api/v1/group-events/{id}/rsvps/batch

**Batch update RSVPs**

Update multiple RSVPs in a single request. Includes rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Event ID |

**Request Body:** `BatchUpdateEventRsvpsRequest`

**Responses:**

- `201`: Created - Batch processed successfully (Rate limit headers included)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not a member of the group

---

### GroupInvitations

#### `POST` /api/v1/group-invitations

**Create group invitation link**

Creates a new invitation link for a group with optional expiration and usage limits. Returns 201 with rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-GRP-004

**Request Body:** `CreateGroupInvitationRequest`

**Responses:**

- `201`: Created - Invitation link created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid groupId or constraints
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not allowed to invite to this group
- `409`: Conflict - Duplicate active invitation
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to create invitation

---

#### `GET` /api/v1/group-invitations

**List group invitations**

Returns paginated list of group invitations with optional filter, sort and search. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| groupId | query | string | False | Filter by group ID |
| status | query | string | False | Filter by status (active, expired, revoked) |
| sort | query | string | False | Sort by field, e.g. createdAt:desc |
| q | query | string | False | Full-text search |

**Request Body:** `ListGroupInvitationsRequest`

**Responses:**

- `200`: OK - List returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination parameters
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to fetch invitations

---

#### `GET` /api/v1/group-invitations/{id}

**Get group invitation by ID**

Returns a single group invitation by ID. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Invitation ID |

**Request Body:** `GetGroupInvitationRequest`

**Responses:**

- `200`: OK - Invitation returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Invitation ID does not exist
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to fetch invitation

---

#### `PATCH` /api/v1/group-invitations/{id}

**Update group invitation**

Updates properties of a group invitation such as expiration or maxUses. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Invitation ID |

**Request Body:** `UpdateGroupInvitationRequest`

**Responses:**

- `200`: OK - Invitation updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Invitation ID does not exist
- `409`: Conflict - Invitation already expired or revoked
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to update invitation

---

#### `DELETE` /api/v1/group-invitations/{id}

**Delete group invitation**

Deletes (revokes) a group invitation by ID. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Invitation ID |

**Request Body:** `DeleteGroupInvitationRequest`

**Responses:**

- `200`: OK - Invitation deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Invitation ID does not exist
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to delete invitation

---

#### `POST` /api/v1/group-invitations/batch

**Batch create group invitations**

Creates multiple group invitations in a single request. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Request Body:** `BatchCreateGroupInvitationsRequest`

**Responses:**

- `201`: Created - Batch invitations created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to create batch invitations

---

#### `POST` /api/v1/group-invitations/accept

**Accept group invitation link**

Accepts a group invitation using an invite token to join the group. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Request Body:** `AcceptGroupInvitationRequest`

**Responses:**

- `200`: OK - Invitation accepted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid or expired token
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Group is full or user not eligible
- `404`: Not Found - Invitation token not found
- `409`: Conflict - User already member
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to accept invitation

---

### Groups

#### `GET` /api/v1/groups

**List groups**

Returns a paginated list of group chats the authenticated user is a member of.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression for groups |
| sort | query | string | False | Sort expression, e.g., createdAt:desc |
| q | query | string | False | Full-text search query across group names |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/groups/{groupId}

**Get group by ID**

Returns details of a specific group chat.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Group does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/groups

**Create group**

Creates a new group chat with up to 1024 members and stores Signal Protocol encrypted group key data.

*Requirement:* WA-GRP-001

**Request Body:** `CreateGroupRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid input or member limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Duplicate group creation request
- `500`: Internal Server Error - Unexpected failure

---

#### `PATCH` /api/v1/groups/{groupId}

**Update group**

Updates group metadata such as name or description.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Request Body:** `UpdateGroupRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Group does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/groups/{groupId}

**Delete group**

Deletes a group chat for all members.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Group does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/groups/batch

**Batch create groups**

Creates multiple group chats in a single request for high-volume operations.

*Requirement:* WA-GRP-001

**Request Body:** `BatchCreateGroupsRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload or member limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/groups/{groupId}

**Update group**

Update group details. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-GRP-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Request Body:** `UpdateGroupRequest`

**Responses:**

- `200`: OK - Group updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Group does not exist.

---

#### `POST` /api/v1/groups/{groupId}/members/leave

**Leave group**

Allow a user to leave a group without notifying other members. Supports offline queueing. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-GRP-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Request Body:** `LeaveGroupRequest`

**Responses:**

- `200`: OK - Left group without notification. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - silent must be true.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Group or membership not found.

---

### Integrations

#### `GET` /api/v1/integrations

**List integrations**

Retrieve a paginated list of third-party integrations with filter, sort, and full-text search support.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected integration lookup failure

---

#### `POST` /api/v1/integrations

**Create integration**

Create a third-party integration with webhook endpoint and security configuration.

*Requirement:* REQ-028

**Request Body:** `CreateIntegrationRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid integration payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Integration already exists

---

#### `GET` /api/v1/integrations/{integrationId}

**Get integration**

Retrieve an integration by ID.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Integration not found

---

#### `PUT` /api/v1/integrations/{integrationId}

**Update integration**

Update integration configuration including webhook URL and scopes.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |

**Request Body:** `UpdateIntegrationRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Integration not found

---

#### `DELETE` /api/v1/integrations/{integrationId}

**Delete integration**

Remove a third-party integration.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Integration not found

---

#### `POST` /api/v1/integrations/batch

**Batch create integrations**

Create multiple integrations in a single request for high-volume onboarding.

*Requirement:* REQ-028

**Request Body:** `BatchCreateIntegrationsRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Internal

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

### Media

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `GET` /api/v1/media/{id}

**Get media by ID**

Retrieve media metadata by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `PATCH` /api/v1/media/{id}

**Update media metadata**

Update media metadata such as view-once flag before consumption.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `409`: Conflict - View-once media already consumed

---

#### `DELETE` /api/v1/media/{id}

**Delete media**

Delete media by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist

---

#### `POST` /api/v1/media/{id}/view-once

**Consume view-once media**

Marks a view-once media as consumed and returns a short-lived download URL. Subsequent requests return 410.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `ConsumeViewOnceRequest`

**Responses:**

- `200`: OK - View-once media consumed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `409`: Conflict - Media is not marked as view-once
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media/batch

**Batch create media metadata**

Create multiple media metadata entries in a single request for high-volume operations.

*Requirement:* WA-MSG-009

**Request Body:** `BatchCreateMediaRequest`

**Responses:**

- `201`: Created - Batch media created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/media/{mediaId}

**Get media item**

Retrieve a single media item by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-MED-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| mediaId | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media item returned with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media item does not exist
- `429`: Too Many Requests - Rate limit exceeded

---

#### `PUT` /api/v1/media/{mediaId}

**Update media metadata**

Update media metadata such as captions or tags. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-MED-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| mediaId | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated with rate limit headers
- `400`: Bad Request - Invalid metadata
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media item does not exist

---

#### `DELETE` /api/v1/media/{mediaId}

**Delete media item**

Delete a media item by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-MED-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| mediaId | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media deleted with rate limit headers
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media item does not exist
- `409`: Conflict - Media is referenced by messages

---

#### `POST` /api/v1/chats/{chatId}/media-messages

**Send camera media message**

Send a chat message containing camera-captured media. Uses end-to-end encryption metadata and supports offline queueing. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-MED-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `SendMediaMessageRequest`

**Responses:**

- `201`: Created - Media message queued/sent with rate limit headers
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Chat not found

---

#### `PUT` /api/v1/media/{id}

**Update media metadata**

Updates metadata for an existing media item.

*Requirement:* WA-SRC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Media not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/products/{id}/media

**Upload product media**

Upload product image or document. Max image size 16MB, max document size 2GB.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Product ID |

**Request Body:** `UploadProductMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/media/{id}/upload

**Upload media file**

Upload the media file content using multipart form data. Enforces size limits. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* REQ-019

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UploadMediaRequest`

**Responses:**

- `201`: Created - Upload completed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid file or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media not found
- `413`: Payload Too Large - File exceeds size limits
- `500`: Internal Server Error - Failed to upload media

---

#### `GET` /api/v1/media/{id}/preview

**Get media preview**

Retrieve preview URL or inline preview metadata for supported media. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* REQ-019

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Preview returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Preview not available
- `500`: Internal Server Error - Failed to retrieve preview

---

#### `GET` /api/v1/messages/{id}/attachments

**List message attachments**

Retrieve attachments for a message with pagination. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* REQ-019

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |

**Responses:**

- `200`: OK - Attachments returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message not found
- `500`: Internal Server Error - Failed to retrieve attachments

---

### Messages

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{id}

**Get message by ID**

Retrieve a message by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/messages/{id}

**Update message**

Update a message (metadata only). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid metadata
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `DELETE` /api/v1/messages/{id}

**Delete message**

Delete a message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PATCH` /api/v1/messages/{messageId}

**Update message metadata**

Update mutable message metadata (e.g., reactions). Encrypted content is immutable.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/broadcast-lists/{broadcastListId}/messages

**Send message to broadcast list**

Sends an end-to-end encrypted message to all recipients in the broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `SendBroadcastMessageRequest`

**Responses:**

- `201`: Created - Message queued/sent. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload or broadcast list too large. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/chats/{chatId}/media-messages

**Send camera media message**

Send a chat message containing camera-captured media. Uses end-to-end encryption metadata and supports offline queueing. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-MED-007

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `SendMediaMessageRequest`

**Responses:**

- `201`: Created - Media message queued/sent with rate limit headers
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Chat not found

---

#### `GET` /api/v1/messages/search

**Search messages**

Full-text search across messages with filters and sorting. Response includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SRC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| q | query | string | True | Full-text search query |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| hasAttachments | query | boolean | False | Filter messages with attachments |
| sort | query | string | False | Sort by relevance or time, e.g., relevance:desc |

**Responses:**

- `200`: OK - Search results returned successfully
- `400`: Bad Request - Invalid search parameters
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Unexpected error

---

#### `POST` /api/v1/messages/{id}/readReceipts

**Send read receipt for message**

Marks a message as read and emits read receipt event over WebSocket for real-time updates. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateMessageReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message ID or timestamp
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Message ID does not exist
- `500`: Internal Server Error - Unexpected error while recording read receipt

---

#### `GET` /api/v1/messages/{id}/readReceipts

**List read receipts for message**

Retrieves read receipts for a message with pagination. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| sort | query | string | False | Sort by field, e.g., readAt:desc |

**Responses:**

- `200`: OK - Read receipts retrieved successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Message ID does not exist
- `500`: Internal Server Error - Unexpected error while retrieving read receipts

---

#### `POST` /api/v1/messages/readReceipts/batch

**Batch create message read receipts**

Creates read receipts for multiple messages in one request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Request Body:** `BatchMessageReadReceiptRequest`

**Responses:**

- `201`: Created - Batch read receipts created successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid access token
- `500`: Internal Server Error - Unexpected error while creating batch read receipts

---

#### `GET` /api/v1/messages/{id}/attachments

**List message attachments**

Retrieve attachments for a message with pagination. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* REQ-019

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |

**Responses:**

- `200`: OK - Attachments returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message not found
- `500`: Internal Server Error - Failed to retrieve attachments

---

### Messaging

#### `POST` /api/v1/messages/{id}/read-receipts

**Create read receipt**

Submit a read receipt for a message, including view-once media consumption context if applicable.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid read receipt data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message ID does not exist

---

### ModerationActions

#### `GET` /api/v1/moderation-actions

**List moderation actions**

Retrieve a paginated list of actions taken on moderation cases.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., action:ban) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Moderation actions retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required

---

#### `POST` /api/v1/moderation-actions

**Create a moderation action**

Apply a moderation action such as warning, mute, or ban.

*Requirement:* REQ-023

**Request Body:** `CreateModerationActionRequest`

**Responses:**

- `201`: Created - Moderation action created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid action payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required

---

#### `GET` /api/v1/moderation-actions/{id}

**Get moderation action by ID**

Retrieve a specific moderation action by its ID.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Moderation action ID |

**Responses:**

- `200`: OK - Moderation action retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Moderation action not found

---

#### `PUT` /api/v1/moderation-actions/{id}

**Update a moderation action**

Update notes or metadata for a moderation action.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Moderation action ID |

**Request Body:** `UpdateModerationActionRequest`

**Responses:**

- `200`: OK - Moderation action updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Moderation action not found

---

### ModerationCases

#### `GET` /api/v1/moderation-cases

**List moderation cases**

Retrieve a paginated list of moderation cases for admin review.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., status:open) |
| sort | query | string | False | Sort expression (e.g., priority:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Moderation cases retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required

---

#### `POST` /api/v1/moderation-cases

**Create a moderation case**

Open a moderation case for an abuse report.

*Requirement:* REQ-023

**Request Body:** `CreateModerationCaseRequest`

**Responses:**

- `201`: Created - Moderation case created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid case payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required

---

#### `GET` /api/v1/moderation-cases/{id}

**Get moderation case by ID**

Retrieve a specific moderation case by its ID.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Moderation case ID |

**Responses:**

- `200`: OK - Moderation case retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Moderation case not found

---

#### `PUT` /api/v1/moderation-cases/{id}

**Update a moderation case**

Update case status, assignment, or priority.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Moderation case ID |

**Request Body:** `UpdateModerationCaseRequest`

**Responses:**

- `200`: OK - Moderation case updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Moderation case not found

---

#### `DELETE` /api/v1/moderation-cases/{id}

**Delete a moderation case**

Remove a moderation case (admin only).

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Moderation case ID |

**Responses:**

- `200`: OK - Moderation case deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Moderation case not found

---

### NotificationSettings

#### `GET` /api/v1/notification-settings

**List notification settings**

Retrieve paginated notification settings, including per-chat and per-type overrides.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| chatId | query | string | False | Filter by chat ID |
| type | query | string | False | Filter by notification type |
| sort | query | string | False | Sort by field, e.g., updatedAt:desc |
| q | query | string | False | Full-text search by chat name |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/notification-settings/{id}

**Get notification setting by ID**

Retrieve a specific notification setting.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Setting ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification setting does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/notification-settings

**Create notification setting**

Create per-chat or per-type notification settings.

*Requirement:* REQ-018

**Request Body:** `CreateNotificationSettingRequest`

**Responses:**

- `201`: Created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid notification type or quiet hours. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `409`: Conflict - Setting already exists for chat/type. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/notification-settings/{id}

**Update notification setting**

Update per-chat or per-type notification settings.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Setting ID |

**Request Body:** `UpdateNotificationSettingRequest`

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid quiet hours or sound. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification setting does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/notification-settings/{id}

**Delete notification setting**

Delete a notification setting for a chat or type.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Setting ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification setting does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/notification-settings/batch

**Batch update notification settings**

Update multiple notification settings in one request for high-volume changes.

*Requirement:* REQ-018

**Request Body:** `BatchUpdateNotificationSettingsRequest`

**Responses:**

- `201`: Created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - One or more updates invalid. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### Notifications

#### `GET` /api/v1/notifications

**List push notifications**

Returns a paginated list of push notifications for the authenticated user. Supports filtering, sorting, and full-text search. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |
| type | query | string | False | Filter by notification type |
| status | query | string | False | Filter by status (unread, read) |

**Responses:**

- `200`: OK - Notifications retrieved successfully
- `401`: Unauthorized - Missing or invalid access token
- `429`: Too Many Requests - Rate limit exceeded

---

#### `GET` /api/v1/notifications/{notificationId}

**Get a push notification by ID**

Returns a single push notification by ID. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| notificationId | path | string | True | Notification ID |

**Responses:**

- `200`: OK - Notification retrieved successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Notification ID does not exist

---

#### `POST` /api/v1/notifications

**Create a push notification**

Creates and queues a push notification for delivery. Supports encrypted payload metadata compatible with Signal Protocol. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Request Body:** `CreateNotificationRequest`

**Responses:**

- `201`: Created - Notification queued successfully
- `400`: Bad Request - Missing required fields or invalid payload
- `401`: Unauthorized - Missing or invalid access token
- `409`: Conflict - Duplicate notification detected

---

#### `PUT` /api/v1/notifications/{notificationId}

**Update a push notification**

Updates a queued push notification before delivery. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| notificationId | path | string | True | Notification ID |

**Request Body:** `UpdateNotificationRequest`

**Responses:**

- `200`: OK - Notification updated successfully
- `400`: Bad Request - Invalid update parameters
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Notification ID does not exist

---

#### `DELETE` /api/v1/notifications/{notificationId}

**Delete a push notification**

Deletes a queued push notification. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| notificationId | path | string | True | Notification ID |

**Responses:**

- `200`: OK - Notification deleted successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Notification ID does not exist

---

#### `POST` /api/v1/notifications/batch

**Create push notifications in batch**

Creates multiple push notifications in a single request for high-volume delivery. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Request Body:** `CreateNotificationsBatchRequest`

**Responses:**

- `201`: Created - Batch queued successfully
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid access token

---

#### `GET` /api/v1/notifications/{id}

**Get notification by ID**

Retrieve a specific notification by ID.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Notification ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/notifications/{id}

**Update a notification**

Update notification status (e.g., read).

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Notification ID |

**Request Body:** `UpdateNotificationRequest`

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/notifications/{id}

**Delete a notification**

Delete a notification record.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Notification ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Notification does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### Passkeys

#### `GET` /api/v1/passkeys

**List passkeys**

Retrieve a paginated list of registered passkeys for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListPasskeysRequest`

**Responses:**

- `200`: OK - Passkey list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/passkeys

**Create passkey**

Create a passkey record after successful WebAuthn registration verification. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreatePasskeyRequest`

**Responses:**

- `201`: Created - Passkey created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid passkey payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Passkey already exists

---

#### `GET` /api/v1/passkeys/{id}

**Get passkey**

Retrieve a specific passkey by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Passkey ID |

**Request Body:** `GetPasskeyRequest`

**Responses:**

- `200`: OK - Passkey returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Passkey does not exist

---

#### `PUT` /api/v1/passkeys/{id}

**Update passkey**

Update passkey metadata such as device name. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Passkey ID |

**Request Body:** `UpdatePasskeyRequest`

**Responses:**

- `200`: OK - Passkey updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Passkey does not exist

---

#### `DELETE` /api/v1/passkeys/{id}

**Delete passkey**

Remove a registered passkey. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Passkey ID |

**Request Body:** `DeletePasskeyRequest`

**Responses:**

- `200`: OK - Passkey deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Passkey does not exist

---

#### `POST` /api/v1/passkeys/batch

**Batch create passkeys**

Bulk create passkey records for migration or multi-device setup. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `BatchCreatePasskeysRequest`

**Responses:**

- `201`: Created - Batch processed with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/auth/passkeys/registration/options

**Get registration options**

Generate WebAuthn registration options for passkey creation. Public endpoint for authenticated or pre-auth flows. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyRegistrationOptionsRequest`

**Responses:**

- `200`: OK - Options returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid request payload
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/auth/passkeys/registration/verify

**Verify registration**

Verify WebAuthn registration response and complete passkey enrollment. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyRegistrationVerifyRequest`

**Responses:**

- `201`: Created - Passkey verified and created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid WebAuthn response
- `409`: Conflict - Passkey already registered

---

#### `POST` /api/v1/auth/passkeys/authentication/options

**Get authentication options**

Generate WebAuthn authentication options for passkey login. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyAuthOptionsRequest`

**Responses:**

- `200`: OK - Options returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid request payload
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/auth/passkeys/authentication/verify

**Verify authentication**

Verify WebAuthn authentication response and issue session token. Public endpoint. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `PasskeyAuthVerifyRequest`

**Responses:**

- `201`: Created - Session issued with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid WebAuthn response
- `401`: Unauthorized - Authentication failed

---

### PollVotes

#### `GET` /api/v1/polls/{pollId}/votes

**List votes for a poll**

Returns a paginated list of votes for a poll. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pollId | path | string | True | Poll ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression (e.g., optionId:1) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Votes retrieved (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Poll does not exist
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/polls/{pollId}/votes

**Cast a vote in a poll**

Creates a vote for the poll. The vote payload is end-to-end encrypted client-side. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pollId | path | string | True | Poll ID |

**Request Body:** `CreatePollVoteRequest`

**Responses:**

- `201`: Created - Vote recorded (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid vote options
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Poll does not exist
- `409`: Conflict - Duplicate vote

---

#### `GET` /api/v1/pollVotes/{voteId}

**Get poll vote by ID**

Returns a poll vote by ID. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| voteId | path | string | True | Vote ID |

**Responses:**

- `200`: OK - Vote retrieved (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Vote does not exist

---

#### `PATCH` /api/v1/pollVotes/{voteId}

**Update a poll vote**

Updates a poll vote selection. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| voteId | path | string | True | Vote ID |

**Request Body:** `UpdatePollVoteRequest`

**Responses:**

- `200`: OK - Vote updated (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid vote options
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Vote does not exist

---

#### `DELETE` /api/v1/pollVotes/{voteId}

**Delete a poll vote**

Deletes a poll vote. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| voteId | path | string | True | Vote ID |

**Responses:**

- `200`: OK - Vote deleted (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Vote does not exist

---

#### `POST` /api/v1/pollVotes/batch

**Batch create poll votes**

Creates multiple votes in bulk for high-volume operations. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Request Body:** `BatchCreatePollVotesRequest`

**Responses:**

- `201`: Created - Votes created (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Polls

#### `GET` /api/v1/conversations/{conversationId}/polls

**List polls in a conversation**

Returns a paginated list of polls for a group or direct conversation with optional filtering, sorting, and full-text search. Response headers include X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID (group or direct) |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression (e.g., status:open) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Polls retrieved (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/conversations/{conversationId}/polls

**Create a poll in a conversation**

Creates a new poll in a group or direct conversation. The poll payload is end-to-end encrypted client-side. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID (group or direct) |

**Request Body:** `CreatePollRequest`

**Responses:**

- `201`: Created - Poll created (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid poll payload or options count
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist
- `409`: Conflict - Duplicate poll detected

---

#### `GET` /api/v1/polls/{pollId}

**Get poll by ID**

Returns a poll by ID. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pollId | path | string | True | Poll ID |

**Responses:**

- `200`: OK - Poll retrieved (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Poll does not exist
- `429`: Too Many Requests - Rate limit exceeded

---

#### `PATCH` /api/v1/polls/{pollId}

**Update a poll**

Updates poll fields such as status or expiry. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pollId | path | string | True | Poll ID |

**Request Body:** `UpdatePollRequest`

**Responses:**

- `200`: OK - Poll updated (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status or expiry
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Poll does not exist

---

#### `DELETE` /api/v1/polls/{pollId}

**Delete a poll**

Deletes a poll. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pollId | path | string | True | Poll ID |

**Responses:**

- `200`: OK - Poll deleted (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Poll does not exist

---

#### `POST` /api/v1/polls/batch

**Batch create polls**

Creates multiple polls in bulk for high-volume operations. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Request Body:** `BatchCreatePollsRequest`

**Responses:**

- `201`: Created - Polls created (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Presence

#### `GET` /api/v1/presence/status

**Get presence status**

Retrieves presence status for a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | query | string | True | User ID |

**Request Body:** `GetPresenceStatusRequest`

**Responses:**

- `200`: OK - Presence status returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.

---

#### `PUT` /api/v1/presence/status

**Update presence status**

Updates presence status for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `UpdatePresenceStatusRequest`

**Responses:**

- `200`: OK - Presence status updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid status value.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `POST` /api/v1/presence/set

**Set user presence**

Update the current user's presence/status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Request Body:** `SetPresenceRequest`

**Responses:**

- `200`: OK - Presence updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid presence status.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Unexpected failure while updating presence.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/users/{id}/presence

**Get user presence**

Retrieve the current presence/status of a user.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - Presence returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User ID does not exist

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/presence/{id}

**Get presence by ID**

Returns the presence status for a single user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `PUT` /api/v1/presence/{id}

**Update presence**

Updates presence status for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid presence status
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `DELETE` /api/v1/presence/{id}

**Delete presence**

Deletes presence record for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `GET` /api/v1/presence/{presenceId}

**Get presence by ID**

Returns a specific presence record.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Presence record does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/presence/{presenceId}

**Update presence**

Updates presence status for a user.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Presence record does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/presence/{presenceId}

**Delete presence**

Deletes a presence record.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Presence record does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/presence/status

**Update presence status**

Update user presence status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-GRP-005

**Request Body:** `PresenceStatusRequest`

**Responses:**

- `200`: OK - Presence updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid status.
- `401`: Unauthorized - Missing or invalid token.

---

#### `PUT` /api/v1/presence/{userId}

**Update presence**

Update a user's presence status.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/presence

**Update presence**

Update user presence/status for real-time communication.

*Requirement:* WA-CALL-005

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid presence status - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presenceStatuses

**List presence statuses**

Retrieve paginated list of presence statuses. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Failed to retrieve presence list.

---

#### `GET` /api/v1/presenceStatuses/{id}

**Get presence status by ID**

Retrieve a specific presence status. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Presence retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Presence status does not exist.
- `500`: Internal Server Error - Failed to retrieve presence.

---

#### `POST` /api/v1/presenceStatuses

**Create presence status**

Create a presence status record for a user. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreatePresenceStatusRequest`

**Responses:**

- `201`: Created - Presence created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid presence payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Presence status already exists for user.
- `500`: Internal Server Error - Failed to create presence.

---

#### `PUT` /api/v1/presenceStatuses/{id}

**Update presence status**

Update a presence status. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Presence ID |

**Request Body:** `UpdatePresenceStatusRequest`

**Responses:**

- `200`: OK - Presence updated. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid presence payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Presence status does not exist.
- `500`: Internal Server Error - Failed to update presence.

---

#### `DELETE` /api/v1/presenceStatuses/{id}

**Delete presence status**

Delete a presence status. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Presence deleted. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Presence status does not exist.
- `500`: Internal Server Error - Failed to delete presence.

---

#### `DELETE` /api/v1/presence/{userId}

**Delete presence status**

Deletes presence status for a user. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Responses:**

- `200`: OK - Presence deleted successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - User ID does not exist

---

#### `GET` /api/v1/presences

**List presences**

Retrieve a paginated list of user presence statuses.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - Presences retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/presences/{presenceId}

**Get presence**

Retrieve a presence by ID.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Presence retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Presence does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/presences

**Create presence**

Create a presence record.

*Requirement:* WA-CON-002

**Request Body:** `CreatePresenceRequest`

**Responses:**

- `201`: Created - Presence created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid presence payload (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/presences/{presenceId}

**Update presence**

Update a presence record.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Presence does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/presences/{presenceId}

**Delete presence**

Delete a presence record.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Presence deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Presence does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/presence/batch

**Batch update presence statuses**

Updates multiple presence statuses in one request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Request Body:** `BatchPresenceRequest`

**Responses:**

- `201`: Created - Batch presence updated successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid access token
- `500`: Internal Server Error - Unexpected error while updating batch presence

---

#### `GET` /api/v1/users/{userId}/presence

**Get user presence**

Retrieves the presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User not found
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/users/{userId}/presence

**Update user presence**

Updates the presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status value
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User not found
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/presence-statuses

**Update presence status**

Update user presence status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-ACC-002

**Request Body:** `UpdatePresenceStatusRequest`

**Responses:**

- `200`: OK - Presence updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status value
- `401`: Unauthorized - Missing or invalid token

---

### Products

#### `GET` /api/v1/products

**List products**

Retrieve a paginated list of products with filtering, sorting, and full-text search.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| catalogId | query | string | False | Filter by catalog ID |
| businessId | query | string | False | Filter by business ID |
| sort | query | string | False | Sort fields, e.g. price:asc |
| q | query | string | False | Full-text search query |
| minPrice | query | number | False | Minimum price filter |
| maxPrice | query | number | False | Maximum price filter |

**Responses:**

- `200`: OK - Product list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unable to fetch products

---

#### `POST` /api/v1/products

**Create product**

Create a new product in a catalog.

*Requirement:* WA-BUS-006

**Request Body:** `CreateProductRequest`

**Responses:**

- `201`: Created - Product created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Missing required fields or invalid input
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Product already exists

---

#### `GET` /api/v1/products/{id}

**Get product**

Retrieve a product by ID.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Product ID |

**Responses:**

- `200`: OK - Product returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Product does not exist

---

#### `PUT` /api/v1/products/{id}

**Update product**

Update an existing product.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Product ID |

**Request Body:** `UpdateProductRequest`

**Responses:**

- `200`: OK - Product updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid input
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Product does not exist

---

#### `DELETE` /api/v1/products/{id}

**Delete product**

Delete a product by ID.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Product ID |

**Responses:**

- `200`: OK - Product deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Product does not exist

---

#### `POST` /api/v1/products/batch

**Batch create products**

Create multiple products in a single request for high-volume operations.

*Requirement:* WA-BUS-006

**Request Body:** `BatchCreateProductsRequest`

**Responses:**

- `201`: Created - Batch processed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/products/{id}/media

**Upload product media**

Upload product image or document. Max image size 16MB, max document size 2GB.

*Requirement:* WA-BUS-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Product ID |

**Request Body:** `UploadProductMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size
- `401`: Unauthorized - Missing or invalid token

---

### ProfileImages

#### `POST` /api/v1/users/{userId}/profile-images

**Upload profile image**

Uploads a new profile image for a user. Max image size 16MB. Returns metadata for the created profile image. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `CreateProfileImageRequest`

**Responses:**

- `201`: Created - Profile image uploaded successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid file type or size exceeds 16MB.
- `401`: Unauthorized - Missing or invalid token.
- `413`: Payload Too Large - File exceeds maximum size.
- `415`: Unsupported Media Type - Only image formats are allowed.

---

#### `GET` /api/v1/users/{userId}/profile-images

**List profile images**

Retrieves a paginated list of profile images for a user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListProfileImagesRequest`

**Responses:**

- `200`: OK - Profile image list returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/users/{userId}/profile-images/{imageId}

**Get profile image**

Retrieves metadata for a specific profile image. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| imageId | path | string | True | Profile image ID |

**Request Body:** `GetProfileImageRequest`

**Responses:**

- `200`: OK - Profile image returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile image does not exist.

---

#### `PUT` /api/v1/users/{userId}/profile-images/{imageId}

**Update profile image**

Replaces an existing profile image. Max image size 16MB. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| imageId | path | string | True | Profile image ID |

**Request Body:** `UpdateProfileImageRequest`

**Responses:**

- `200`: OK - Profile image updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid file type or size exceeds 16MB.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile image does not exist.
- `413`: Payload Too Large - File exceeds maximum size.
- `415`: Unsupported Media Type - Only image formats are allowed.

---

#### `DELETE` /api/v1/users/{userId}/profile-images/{imageId}

**Delete profile image**

Deletes a specific profile image. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| imageId | path | string | True | Profile image ID |

**Request Body:** `DeleteProfileImageRequest`

**Responses:**

- `200`: OK - Profile image deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile image does not exist.

---

#### `POST` /api/v1/users/{userId}/profile-images/batch

**Batch create profile images**

Creates multiple profile images in one request for high-volume upload. Each file max 16MB. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `BatchCreateProfileImagesRequest`

**Responses:**

- `201`: Created - Profile images uploaded successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid file type or size exceeds 16MB.
- `401`: Unauthorized - Missing or invalid token.
- `413`: Payload Too Large - One or more files exceed maximum size.
- `415`: Unsupported Media Type - Only image formats are allowed.

---

### ProfilePictureVisibility

#### `GET` /api/v1/profile-picture-visibilities

**List profile picture visibility configurations**

Returns a paginated list of profile picture visibility configurations with optional filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression, e.g., visibility=contacts |
| sort | query | string | False | Sort fields, e.g., createdAt:desc |
| q | query | string | False | Full-text search query |

**Request Body:** `ListProfilePictureVisibilitiesRequest`

**Responses:**

- `200`: OK - List returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/profile-picture-visibilities/{id}

**Get a profile picture visibility configuration**

Retrieves a specific profile picture visibility configuration by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Visibility configuration ID |

**Request Body:** `GetProfilePictureVisibilityRequest`

**Responses:**

- `200`: OK - Configuration returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Visibility configuration does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/profile-picture-visibilities

**Create profile picture visibility configuration**

Creates a new profile picture visibility configuration for a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Request Body:** `CreateProfilePictureVisibilityRequest`

**Responses:**

- `201`: Created - Configuration created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid visibility or userId
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Configuration already exists for user
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/profile-picture-visibilities/{id}

**Update profile picture visibility configuration**

Updates an existing profile picture visibility configuration. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Visibility configuration ID |

**Request Body:** `UpdateProfilePictureVisibilityRequest`

**Responses:**

- `200`: OK - Configuration updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid visibility
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Configuration not found
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/profile-picture-visibilities/{id}

**Delete profile picture visibility configuration**

Deletes a profile picture visibility configuration. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Visibility configuration ID |

**Request Body:** `DeleteProfilePictureVisibilityRequest`

**Responses:**

- `200`: OK - Configuration deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Configuration not found
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/profile-picture-visibilities/batch

**Batch create/update profile picture visibility configurations**

Processes multiple profile picture visibility configurations in one request for high-volume updates. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-003

**Request Body:** `BatchProfilePictureVisibilityRequest`

**Responses:**

- `201`: Created - Batch processed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

### Profiles

#### `GET` /api/v1/profiles

**List profiles**

Retrieve a paginated list of profiles with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., status:active) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Request Body:** `ListProfilesRequest`

**Responses:**

- `200`: OK - Profiles retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination or filter parameters.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Unexpected failure while listing profiles.

---

#### `GET` /api/v1/profiles/{profileId}

**Get profile by ID**

Retrieve a single profile including phone number display data. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| profileId | path | string | True | Profile ID |

**Request Body:** `GetProfileRequest`

**Responses:**

- `200`: OK - Profile retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile does not exist.
- `500`: Internal Server Error - Unexpected failure while fetching profile.

---

#### `POST` /api/v1/profiles

**Create profile**

Create a new profile with phone number display data. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Request Body:** `CreateProfileRequest`

**Responses:**

- `201`: Created - Profile created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing required fields or invalid phone number format.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Profile already exists for user.
- `500`: Internal Server Error - Unexpected failure while creating profile.

---

#### `PUT` /api/v1/profiles/{profileId}

**Update profile**

Update profile fields including phone number display. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| profileId | path | string | True | Profile ID |

**Request Body:** `UpdateProfileRequest`

**Responses:**

- `200`: OK - Profile updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid phone number format or fields.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile does not exist.
- `500`: Internal Server Error - Unexpected failure while updating profile.

---

#### `DELETE` /api/v1/profiles/{profileId}

**Delete profile**

Delete a profile. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| profileId | path | string | True | Profile ID |

**Request Body:** `DeleteProfileRequest`

**Responses:**

- `200`: OK - Profile deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Profile does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting profile.

---

#### `POST` /api/v1/profiles/batch

**Batch create profiles**

Create multiple profiles in a single request for high-volume operations. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Request Body:** `BatchCreateProfilesRequest`

**Responses:**

- `201`: Created - Batch profiles created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - One or more profiles already exist.
- `500`: Internal Server Error - Unexpected failure while batch creating profiles.

---

### PushTokens

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `DELETE` /api/v1/push-tokens/{tokenId}

**Delete push notification token**

Remove a push notification token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| tokenId | path | string | True | Push token ID |

**Request Body:** `DeletePushTokenRequest`

**Responses:**

- `200`: OK - Push token deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Push token does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting push token.

---

#### `GET` /api/v1/push-tokens

**List push tokens**

Returns a paginated list of registered push tokens. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |
| platform | query | string | False | Filter by platform (ios, android, web) |

**Responses:**

- `200`: OK - Push tokens retrieved successfully
- `401`: Unauthorized - Missing or invalid access token

---

#### `GET` /api/v1/push-tokens/{pushTokenId}

**Get push token by ID**

Returns a single push token by ID. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pushTokenId | path | string | True | Push token ID |

**Responses:**

- `200`: OK - Push token retrieved successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Push token ID does not exist

---

#### `PUT` /api/v1/push-tokens/{pushTokenId}

**Update a push token**

Updates a push token for a device. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pushTokenId | path | string | True | Push token ID |

**Request Body:** `UpdatePushTokenRequest`

**Responses:**

- `200`: OK - Push token updated successfully
- `400`: Bad Request - Invalid token payload
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Push token ID does not exist

---

#### `DELETE` /api/v1/push-tokens/{pushTokenId}

**Delete a push token**

Deletes a push token for a device. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| pushTokenId | path | string | True | Push token ID |

**Responses:**

- `200`: OK - Push token deleted successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Push token ID does not exist

---

#### `POST` /api/v1/pushTokens

**Register push notification token**

Registers or updates a push notification token for a device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing deviceId or pushToken
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to register push token

---

#### `GET` /api/v1/push-tokens/{id}

**Get a push token by ID**

Retrieve a specific push token by ID.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Push token ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Push token does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/push-tokens/{id}

**Update a push token**

Update a registered push token or device label.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Push token ID |

**Request Body:** `UpdatePushTokenRequest`

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid token format. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Push token does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/push-tokens/{id}

**Delete a push token**

Unregister a device push token.

*Requirement:* REQ-018

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Push token ID |

**Responses:**

- `200`: OK. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Push token does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/push-tokens/batch

**Batch register push tokens**

Register multiple push tokens in a single request for high-volume device provisioning.

*Requirement:* REQ-018

**Request Body:** `BatchCreatePushTokensRequest`

**Responses:**

- `201`: Created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - One or more tokens invalid. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### QuickReplies

#### `GET` /api/v1/businesses/{businessId}/quick-replies

**List quick replies**

Returns a paginated list of predefined quick replies for a business with optional filtering, sorting and full-text search.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression (e.g., language:eq:de) |
| sort | query | string | False | Sort expression (e.g., updatedAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Business not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/businesses/{businessId}/quick-replies/{quickReplyId}

**Get quick reply by ID**

Returns a single quick reply by ID for a business.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |
| quickReplyId | path | string | True | Quick reply ID |

**Responses:**

- `200`: OK - Quick reply returned (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Quick reply not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/businesses/{businessId}/quick-replies

**Create quick reply**

Creates a predefined quick reply for a business.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |

**Request Body:** `CreateQuickReplyRequest`

**Responses:**

- `201`: Created - Quick reply created (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid input payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `409`: Conflict - Quick reply already exists (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/businesses/{businessId}/quick-replies/{quickReplyId}

**Update quick reply**

Updates an existing quick reply.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |
| quickReplyId | path | string | True | Quick reply ID |

**Request Body:** `UpdateQuickReplyRequest`

**Responses:**

- `200`: OK - Quick reply updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid input payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Quick reply not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/businesses/{businessId}/quick-replies/{quickReplyId}

**Delete quick reply**

Deletes a quick reply.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |
| quickReplyId | path | string | True | Quick reply ID |

**Responses:**

- `200`: OK - Quick reply deleted (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Quick reply not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/businesses/{businessId}/quick-replies/batch

**Batch create/update/delete quick replies**

Performs bulk operations on quick replies for high-volume usage.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| businessId | path | string | True | Business ID |

**Request Body:** `BatchQuickRepliesRequest`

**Responses:**

- `200`: OK - Batch operation processed (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### REQ-018

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /api/v1/notifications

**List push notifications**

Returns a paginated list of push notifications for the authenticated user. Supports filtering, sorting, and full-text search. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |
| type | query | string | False | Filter by notification type |
| status | query | string | False | Filter by status (unread, read) |

**Responses:**

- `200`: OK - Notifications retrieved successfully
- `401`: Unauthorized - Missing or invalid access token
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/notifications

**Create a push notification**

Creates and queues a push notification for delivery. Supports encrypted payload metadata compatible with Signal Protocol. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Request Body:** `CreateNotificationRequest`

**Responses:**

- `201`: Created - Notification queued successfully
- `400`: Bad Request - Missing required fields or invalid payload
- `401`: Unauthorized - Missing or invalid access token
- `409`: Conflict - Duplicate notification detected

---

#### `GET` /api/v1/push-tokens

**List push tokens**

Returns a paginated list of registered push tokens. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |
| platform | query | string | False | Filter by platform (ios, android, web) |

**Responses:**

- `200`: OK - Push tokens retrieved successfully
- `401`: Unauthorized - Missing or invalid access token

---

### REQ-019

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `GET` /api/v1/media/{id}

**Get media by ID**

Retrieve media metadata by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `DELETE` /api/v1/media/{id}

**Delete media**

Delete media by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist

---

#### `POST` /api/v1/media/batch

**Batch create media metadata**

Create multiple media metadata entries in a single request for high-volume operations.

*Requirement:* WA-MSG-009

**Request Body:** `BatchCreateMediaRequest`

**Responses:**

- `201`: Created - Batch media created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{id}/read-receipts

**Create read receipt**

Submit a read receipt for a message, including view-once media consumption context if applicable.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid read receipt data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message ID does not exist

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/presence

**Update presence**

Update user presence/status for real-time communication.

*Requirement:* WA-CALL-005

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid presence status - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/media/{id}

**Update media metadata**

Updates metadata for an existing media item.

*Requirement:* WA-SRC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Media not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### REQ-020

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/chats

**List chats**

Retrieve a paginated list of chats with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |
| archived | query | boolean | False | Filter by archived chats |

**Responses:**

- `200`: OK - Chats retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve chats

---

#### `POST` /api/v1/chats

**Create chat**

Create a new chat (direct or group). Group size limited to 1024. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Request Body:** `CreateChatRequest`

**Responses:**

- `201`: Created - Chat created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid chat payload or size limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Chat already exists

---

#### `GET` /api/v1/chats/{chatId}

**Get chat**

Retrieves a chat by ID.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat retrieved (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/chats/{chatId}

**Update chat**

Updates chat metadata.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `UpdateChatRequest`

**Responses:**

- `200`: OK - Chat updated (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/chats/{chatId}

**Delete chat**

Deletes a chat.

*Requirement:* WA-BAK-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Responses:**

- `200`: OK - Chat deleted (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Chat does not exist (Rate limit: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### REQ-021

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

### REQ-027

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

### REQ-028

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### ReadReceipts

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{messageId}/read-receipts

**Create read receipt**

Submit a read receipt for a specific message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read timestamp.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.
- `500`: Internal Server Error - Unexpected failure while creating read receipt.

---

#### `POST` /api/v1/messages/read-receipts

**Send read receipts**

Marks messages as read for a conversation. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipts processed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message IDs
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to process read receipts

---

#### `POST` /api/v1/conversations/{conversationId}/read-receipts

**Submit read receipts**

Submits read receipts for messages in a conversation. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipts submitted (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message IDs
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{messageId}/read

**Read receipt**

Mark a message as read and generate a read receipt.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt created (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `GET` /api/v1/readReceipts

**List read receipts**

Retrieve paginated list of read receipts. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| scope | query | string | False | Filter by scope (user, group, broadcast) |

**Responses:**

- `200`: OK - List retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Failed to retrieve read receipts.

---

#### `GET` /api/v1/readReceipts/{id}

**Get read receipt by ID**

Retrieve a specific read receipt by ID. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to retrieve read receipt.

---

#### `POST` /api/v1/readReceipts

**Create read receipt**

Create a read receipt for a message. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Read receipt already exists.
- `500`: Internal Server Error - Failed to create read receipt.

---

#### `PUT` /api/v1/readReceipts/{id}

**Update read receipt**

Update a read receipt. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to update read receipt.

---

#### `DELETE` /api/v1/readReceipts/{id}

**Delete read receipt**

Delete a read receipt. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to delete read receipt.

---

#### `GET` /api/v1/read-receipts/{receiptId}

**Get read receipt by ID**

Retrieve a read receipt by ID.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Responses:**

- `200`: OK - Read receipt retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/read-receipts/{receiptId}

**Update read receipt**

Update an existing read receipt record.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid timestamp (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/read-receipts/{receiptId}

**Delete read receipt**

Delete a read receipt record.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/read-receipts/{id}

**Get read receipt by ID**

Returns a specific read receipt.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

#### `PUT` /api/v1/read-receipts/{id}

**Update read receipt**

Updates a read receipt record.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid readAt value
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

#### `DELETE` /api/v1/read-receipts/{id}

**Delete read receipt**

Deletes a read receipt.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

#### `GET` /api/v1/messages/{id}/read-receipts

**List read receipts**

Lists read receipts for a specific message.

*Requirement:* WA-SRC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |

**Responses:**

- `200`: OK - Read receipts retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Message not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/readReceipts/batch

**Batch create or update read receipt configurations**

Creates or updates multiple read receipt configurations in one request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Request Body:** `BatchReadReceiptRequest`

**Responses:**

- `201`: Created - Batch processed successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid access token
- `500`: Internal Server Error - Unexpected error while processing batch

---

#### `POST` /api/v1/messages/{id}/readReceipts

**Send read receipt for message**

Marks a message as read and emits read receipt event over WebSocket for real-time updates. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateMessageReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message ID or timestamp
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Message ID does not exist
- `500`: Internal Server Error - Unexpected error while recording read receipt

---

#### `GET` /api/v1/messages/{id}/readReceipts

**List read receipts for message**

Retrieves read receipts for a message with pagination. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| sort | query | string | False | Sort by field, e.g., readAt:desc |

**Responses:**

- `200`: OK - Read receipts retrieved successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - Message ID does not exist
- `500`: Internal Server Error - Unexpected error while retrieving read receipts

---

#### `POST` /api/v1/messages/readReceipts/batch

**Batch create message read receipts**

Creates read receipts for multiple messages in one request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SET-002

**Request Body:** `BatchMessageReadReceiptRequest`

**Responses:**

- `201`: Created - Batch read receipts created successfully (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid access token
- `500`: Internal Server Error - Unexpected error while creating batch read receipts

---

#### `GET` /api/v1/read-receipts/{readReceiptId}

**Get read receipt by ID**

Returns a single read receipt by ID.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| readReceiptId | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt returned (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Read receipt not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/read-receipts/{readReceiptId}

**Update read receipt**

Updates a read receipt.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| readReceiptId | path | string | True | Read receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid input payload (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Read receipt not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/read-receipts/{readReceiptId}

**Delete read receipt**

Deletes a read receipt.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| readReceiptId | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Read receipt not found (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/read-receipts/batch

**Batch create read receipts**

Creates multiple read receipts in a single request.

*Requirement:* WA-BUS-004

**Request Body:** `BatchCreateReadReceiptsRequest`

**Responses:**

- `201`: Created - Batch created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

### Receipts

#### `POST` /api/v1/receipts/read

**Send read receipt**

Submit read receipt for messages. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt accepted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid message IDs. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

### Recipients

#### `POST` /api/v1/broadcast-lists/{broadcastListId}/recipients

**Add recipients to broadcast list**

Adds one or more recipients to a broadcast list (max 256 recipients).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |

**Request Body:** `AddRecipientsRequest`

**Responses:**

- `201`: Created - Recipients added. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid recipients or limit exceeded. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists/{broadcastListId}/recipients

**List recipients of broadcast list**

Returns paginated recipients for a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Request Body:** `ListRecipientsRequest`

**Responses:**

- `200`: OK - Recipients retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/broadcast-lists/{broadcastListId}/recipients/{recipientId}

**Get broadcast list recipient**

Gets a specific recipient in a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| recipientId | path | string | True | Recipient user ID |

**Request Body:** `GetRecipientRequest`

**Responses:**

- `200`: OK - Recipient retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Recipient or broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/broadcast-lists/{broadcastListId}/recipients/{recipientId}

**Remove recipient from broadcast list**

Removes a recipient from a broadcast list.

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| broadcastListId | path | string | True | Broadcast list ID |
| recipientId | path | string | True | Recipient user ID |

**Request Body:** `RemoveRecipientRequest`

**Responses:**

- `200`: OK - Recipient removed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Recipient or broadcast list does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### RegionalFormats

#### `GET` /api/v1/users/{userId}/regional-formats

**List regional formats**

Returns a paginated list of regional format preferences for a user, honoring locale-specific formatting rules.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression, e.g., locale:de-DE |
| sort | query | string | False | Sort expression, e.g., createdAt:desc |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Regional formats retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - User does not exist. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/users/{userId}/regional-formats

**Create regional format**

Creates a regional format preference for a user to ensure locale-specific formatting is respected.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `CreateRegionalFormatRequest`

**Responses:**

- `201`: Created - Regional format created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid locale or format pattern. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `409`: Conflict - Regional format already exists. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/users/{userId}/regional-formats/{regionalFormatId}

**Get regional format**

Retrieves a specific regional format preference for a user.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| regionalFormatId | path | string | True | Regional format ID |

**Responses:**

- `200`: OK - Regional format retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Regional format not found. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/users/{userId}/regional-formats/{regionalFormatId}

**Update regional format**

Updates a user's regional format preference to enforce locale-specific formatting.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| regionalFormatId | path | string | True | Regional format ID |

**Request Body:** `UpdateRegionalFormatRequest`

**Responses:**

- `200`: OK - Regional format updated. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid locale or format pattern. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Regional format not found. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/users/{userId}/regional-formats/{regionalFormatId}

**Delete regional format**

Deletes a regional format preference for a user.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |
| regionalFormatId | path | string | True | Regional format ID |

**Responses:**

- `200`: OK - Regional format deleted. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Regional format not found. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/users/{userId}/regional-formats/batch

**Batch upsert regional formats**

Creates or updates multiple regional format preferences in a single request.

*Requirement:* WA-LOC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `BatchRegionalFormatRequest`

**Responses:**

- `201`: Created - Batch operation completed. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### Reports

#### `GET` /api/v1/reports

**List abuse reports**

Retrieve a paginated list of abuse reports with filtering, sorting, and search.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., status:open) |
| sort | query | string | False | Sort expression (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Reports retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Not permitted to view reports

---

#### `POST` /api/v1/reports

**Create an abuse report**

Report a user or content for abuse and moderation review.

*Requirement:* REQ-023

**Request Body:** `CreateReportRequest`

**Responses:**

- `201`: Created - Report created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid report payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Duplicate report detected

---

#### `GET` /api/v1/reports/{id}

**Get report by ID**

Retrieve a specific report by its ID.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Responses:**

- `200`: OK - Report retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Report not found

---

#### `PUT` /api/v1/reports/{id}

**Update a report**

Update report status or add moderator notes.

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Request Body:** `UpdateReportRequest`

**Responses:**

- `200`: OK - Report updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Report not found

---

#### `DELETE` /api/v1/reports/{id}

**Delete a report**

Remove a report (admin only).

*Requirement:* REQ-023

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Report ID |

**Responses:**

- `200`: OK - Report deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Admin role required
- `404`: Not Found - Report not found

---

#### `POST` /api/v1/reports/batch

**Batch create reports**

Create multiple abuse reports in a single request.

*Requirement:* REQ-023

**Request Body:** `BatchReportsRequest`

**Responses:**

- `201`: Created - Batch processed (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Restores

#### `GET` /api/v1/restores

**List restore jobs**

Retrieve a paginated list of restore jobs.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListRestoresRequest`

**Responses:**

- `200`: OK - Restore jobs retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/restores/{restoreId}

**Get restore job by ID**

Retrieve a specific restore job by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| restoreId | path | string | True | Restore ID |

**Request Body:** `GetRestoreRequest`

**Responses:**

- `200`: OK - Restore job retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Restore job does not exist.

---

#### `POST` /api/v1/restores

**Create restore job**

Create a restore job for a given backup.

*Requirement:* REQ-021

**Request Body:** `CreateRestoreRequest`

**Responses:**

- `201`: Created - Restore job created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid restore request.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Backup does not exist.

---

#### `PUT` /api/v1/restores/{restoreId}

**Update restore job**

Update restore job status or configuration (e.g., cancel).

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| restoreId | path | string | True | Restore ID |

**Request Body:** `UpdateRestoreRequest`

**Responses:**

- `200`: OK - Restore job updated. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid status transition.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Restore job does not exist.

---

#### `DELETE` /api/v1/restores/{restoreId}

**Delete restore job**

Delete a restore job by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| restoreId | path | string | True | Restore ID |

**Request Body:** `DeleteRestoreRequest`

**Responses:**

- `200`: OK - Restore job deleted. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Restore job does not exist.

---

#### `POST` /api/v1/restores/batch

**Batch create restore jobs**

Create multiple restore jobs in a single request.

*Requirement:* REQ-021

**Request Body:** `BatchCreateRestoresRequest`

**Responses:**

- `201`: Created - Restore jobs created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.

---

### ScreenShares

#### `GET` /api/v1/screen-shares

**List screen shares**

Retrieve a paginated list of screen share sessions with optional filtering, sorting, and full-text search.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| callId | query | string | False | Filter by call ID |
| status | query | string | False | Filter by status (active, paused, ended) |
| sort | query | string | False | Sort fields, e.g. createdAt:desc |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Screen share list returned (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions

---

#### `GET` /api/v1/screen-shares/{screenShareId}

**Get screen share by ID**

Retrieve details of a single screen share session.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| screenShareId | path | string | True | Screen share ID |

**Responses:**

- `200`: OK - Screen share returned (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Screen share does not exist

---

#### `POST` /api/v1/screen-shares

**Create screen share**

Create a new screen share session for a call. The client uses WebRTC for media; signaling metadata is created here.

*Requirement:* WA-CALL-004

**Request Body:** `CreateScreenShareRequest`

**Responses:**

- `201`: Created - Screen share created (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid SDP or missing callId
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Screen share already active for call

---

#### `PUT` /api/v1/screen-shares/{screenShareId}

**Update screen share**

Update screen share state, e.g., pause or resume, or refresh WebRTC metadata.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| screenShareId | path | string | True | Screen share ID |

**Request Body:** `UpdateScreenShareRequest`

**Responses:**

- `200`: OK - Screen share updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status transition
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Screen share does not exist

---

#### `DELETE` /api/v1/screen-shares/{screenShareId}

**Delete screen share**

End and remove a screen share session.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| screenShareId | path | string | True | Screen share ID |

**Responses:**

- `200`: OK - Screen share deleted (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Screen share does not exist

---

#### `POST` /api/v1/screen-shares/batch

**Batch create screen shares**

Create multiple screen share sessions in one request for high-volume operations.

*Requirement:* WA-CALL-004

**Request Body:** `BatchCreateScreenSharesRequest`

**Responses:**

- `201`: Created - Batch created (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Search

#### `GET` /api/v1/messages/search

**Search messages**

Full-text search across messages with filters and sorting. Response includes rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-SRC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| q | query | string | True | Full-text search query |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| hasAttachments | query | boolean | False | Filter messages with attachments |
| sort | query | string | False | Sort by relevance or time, e.g., relevance:desc |

**Responses:**

- `200`: OK - Search results returned successfully
- `400`: Bad Request - Invalid search parameters
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Unexpected error

---

#### `GET` /api/v1/search

**Full-text search**

Full-text search across chats and messages with filters for media and contacts.

*Requirement:* REQ-020

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| q | query | string | True | Full-text search query |
| scope | query | string | False | chats|messages|all |
| contactId | query | string | False | Filter by contact ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | image|video|audio|document |
| sortBy | query | string | False | relevance|timestamp |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - Search results returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid search parameters
- `401`: Unauthorized - Missing or invalid token

---

### Searches

#### `GET` /api/v1/searches

**List saved searches**

Retrieve a paginated list of saved searches.

*Requirement:* REQ-020

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |

**Responses:**

- `200`: OK - Saved searches retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/searches

**Create saved search**

Save a search query and filters for quick access.

*Requirement:* REQ-020

**Request Body:** `CreateSavedSearchRequest`

**Responses:**

- `201`: Created - Saved search created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid saved search payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/searches/{searchId}

**Get saved search**

Retrieve a saved search by ID.

*Requirement:* REQ-020

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| searchId | path | string | True | Saved search ID |

**Responses:**

- `200`: OK - Saved search retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Saved search does not exist

---

#### `PUT` /api/v1/searches/{searchId}

**Update saved search**

Update a saved search query or filters.

*Requirement:* REQ-020

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| searchId | path | string | True | Saved search ID |

**Request Body:** `UpdateSavedSearchRequest`

**Responses:**

- `200`: OK - Saved search updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Saved search does not exist

---

#### `DELETE` /api/v1/searches/{searchId}

**Delete saved search**

Delete a saved search.

*Requirement:* REQ-020

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| searchId | path | string | True | Saved search ID |

**Responses:**

- `200`: OK - Saved search deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Saved search does not exist

---

### Sessions

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `GET` /api/v1/sessions/{id}

**Get session**

Retrieve a session by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `GetSessionRequest`

**Responses:**

- `200`: OK - Session returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `PUT` /api/v1/sessions/{id}

**Update session**

Refresh or update session metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `UpdateSessionRequest`

**Responses:**

- `200`: OK - Session updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `DELETE` /api/v1/sessions/{id}

**Delete session**

Terminate a session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `POST` /api/v1/sessions/batch

**Batch create sessions**

Bulk create sessions. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `BatchCreateSessionsRequest`

**Responses:**

- `201`: Created - Batch processed with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `DELETE` /api/v1/sessions/{sessionId}

**Delete session**

Terminate an active session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Session does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting session.

---

### SharedContacts

#### `POST` /api/v1/shared-contacts

**Share contact data**

Creates a shared-contact message containing encrypted contact data to one or more recipients (max 256 for broadcast). Uses Signal Protocol payloads and supports offline queueing.

*Requirement:* WA-MSG-015

**Request Body:** `CreateSharedContactRequest`

**Responses:**

- `201`: Created - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid recipients or missing encrypted payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Duplicate clientMessageId

---

#### `GET` /api/v1/shared-contacts

**List shared contacts**

Returns a paginated list of shared contacts with filter, sort, and full-text search support.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/shared-contacts/{id}

**Get shared contact by ID**

Fetches a single shared contact record including encrypted payload reference.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Shared contact ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Shared contact does not exist

---

#### `PUT` /api/v1/shared-contacts/{id}

**Update shared contact**

Updates mutable metadata for a shared contact (e.g., local label). Encrypted content is immutable.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Shared contact ID |

**Request Body:** `UpdateSharedContactRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Shared contact does not exist

---

#### `DELETE` /api/v1/shared-contacts/{id}

**Delete shared contact**

Deletes a shared contact record for the requesting user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Shared contact ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Shared contact does not exist

---

#### `POST` /api/v1/shared-contacts/batch

**Batch share contacts**

Creates multiple shared-contact messages in a single request for high-volume operations.

*Requirement:* WA-MSG-015

**Request Body:** `BatchCreateSharedContactsRequest`

**Responses:**

- `201`: Created - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### StatusVisibility

#### `GET` /api/v1/statusVisibilityConfigs

**List status visibility configurations**

Retrieve paginated list of status visibility configurations with optional filtering, sorting, and full-text search. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression, e.g., ownerId:eq:123 |
| sort | query | string | False | Sort expression, e.g., createdAt:desc |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions.
- `500`: Internal Server Error - Failed to retrieve configurations.

---

#### `GET` /api/v1/statusVisibilityConfigs/{id}

**Get status visibility configuration by ID**

Retrieve a specific status visibility configuration by its ID. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Configuration ID |

**Responses:**

- `200`: OK - Configuration retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Configuration does not exist.
- `500`: Internal Server Error - Failed to retrieve configuration.

---

#### `POST` /api/v1/statusVisibilityConfigs

**Create status visibility configuration**

Create a new status visibility configuration for a user. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreateStatusVisibilityConfigRequest`

**Responses:**

- `201`: Created - Configuration created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid visibility configuration.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Configuration already exists for user.
- `500`: Internal Server Error - Failed to create configuration.

---

#### `PUT` /api/v1/statusVisibilityConfigs/{id}

**Update status visibility configuration**

Update an existing status visibility configuration. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Configuration ID |

**Request Body:** `UpdateStatusVisibilityConfigRequest`

**Responses:**

- `200`: OK - Configuration updated. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid visibility configuration.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Configuration does not exist.
- `500`: Internal Server Error - Failed to update configuration.

---

#### `DELETE` /api/v1/statusVisibilityConfigs/{id}

**Delete status visibility configuration**

Delete a status visibility configuration. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Configuration ID |

**Responses:**

- `200`: OK - Configuration deleted. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Configuration does not exist.
- `500`: Internal Server Error - Failed to delete configuration.

---

#### `POST` /api/v1/statusVisibilityConfigs/batch

**Batch create status visibility configurations**

Create multiple status visibility configurations in a single request. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `BatchCreateStatusVisibilityConfigsRequest`

**Responses:**

- `201`: Created - Batch created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Failed to create batch.

---

### StickerSuggestions

#### `GET` /api/v1/stickerSuggestions

**List sticker suggestions**

Returns a paginated list of context-based sticker suggestions. Supports full-text search, filtering, and sorting. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| q | query | string | False | Full-text search query |
| context | query | string | False | Context identifier (e.g., message text hash or conversation id) |
| language | query | string | False | Language code for suggestions |
| sort | query | string | False | Sort field, e.g., relevance, createdAt |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListStickerSuggestionsRequest`

**Responses:**

- `200`: OK - List returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination, filter, or sort parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve suggestions

---

#### `GET` /api/v1/stickerSuggestions/{id}

**Get sticker suggestion by ID**

Returns a single sticker suggestion. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Suggestion ID |

**Request Body:** `GetStickerSuggestionRequest`

**Responses:**

- `200`: OK - Suggestion returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Suggestion ID does not exist
- `500`: Internal Server Error - Failed to retrieve suggestion

---

#### `POST` /api/v1/stickerSuggestions

**Create sticker suggestion**

Creates a new context-based sticker suggestion. Intended for server-side suggestion generation pipelines. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Request Body:** `CreateStickerSuggestionRequest`

**Responses:**

- `201`: Created - Suggestion created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid fields
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Suggestion already exists for this context and sticker
- `500`: Internal Server Error - Failed to create suggestion

---

#### `PUT` /api/v1/stickerSuggestions/{id}

**Update sticker suggestion**

Updates an existing sticker suggestion. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Suggestion ID |

**Request Body:** `UpdateStickerSuggestionRequest`

**Responses:**

- `200`: OK - Suggestion updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Suggestion ID does not exist
- `500`: Internal Server Error - Failed to update suggestion

---

#### `DELETE` /api/v1/stickerSuggestions/{id}

**Delete sticker suggestion**

Deletes a sticker suggestion. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Suggestion ID |

**Request Body:** `DeleteStickerSuggestionRequest`

**Responses:**

- `200`: OK - Suggestion deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Suggestion ID does not exist
- `500`: Internal Server Error - Failed to delete suggestion

---

#### `POST` /api/v1/stickerSuggestions/batch

**Batch create sticker suggestions**

Creates multiple sticker suggestions in a single request for high-volume processing. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AI-003

**Request Body:** `BatchCreateStickerSuggestionsRequest`

**Responses:**

- `201`: Created - Batch processed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to process batch

---

### StoragePolicies

#### `GET` /api/v1/storage-policies

**List storage policies**

Returns a paginated list of storage policies used to enforce storage efficiency (retention, compression, deduplication). Supports filtering, sorting, and full-text search.

*Requirement:* WA-PERF-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression (e.g., type:media) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded

---

#### `POST` /api/v1/storage-policies

**Create storage policy**

Creates a new storage policy to enforce storage efficiency for messages and media.

*Requirement:* WA-PERF-005

**Request Body:** `CreateStoragePolicyRequest`

**Responses:**

- `201`: Created - Storage policy created (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid policy configuration
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Policy with same name already exists

---

#### `GET` /api/v1/storage-policies/{id}

**Get storage policy by ID**

Retrieves a storage policy by its ID.

*Requirement:* WA-PERF-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Storage policy ID |

**Responses:**

- `200`: OK - Storage policy returned (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Storage policy does not exist

---

#### `PUT` /api/v1/storage-policies/{id}

**Update storage policy**

Updates a storage policy to refine storage efficiency configuration.

*Requirement:* WA-PERF-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Storage policy ID |

**Request Body:** `UpdateStoragePolicyRequest`

**Responses:**

- `200`: OK - Storage policy updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid policy configuration
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Storage policy does not exist

---

#### `DELETE` /api/v1/storage-policies/{id}

**Delete storage policy**

Deletes a storage policy.

*Requirement:* WA-PERF-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Storage policy ID |

**Responses:**

- `200`: OK - Storage policy deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Storage policy does not exist

---

### Sync

#### `POST` /api/v1/contacts/sync

**Synchronize device contacts**

Compare device contacts with WhatsApp users and return matches. Supports offline queue reconciliation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `SyncContactsRequest`

**Responses:**

- `201`: Created - Sync completed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid contact payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `GET` /api/v1/sync-jobs

**List sync jobs**

Retrieve a paginated list of cross-device sync jobs.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListSyncJobsRequest`

**Responses:**

- `200`: OK - Sync jobs retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/sync-jobs/{syncJobId}

**Get sync job by ID**

Retrieve a specific sync job by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| syncJobId | path | string | True | Sync job ID |

**Request Body:** `GetSyncJobRequest`

**Responses:**

- `200`: OK - Sync job retrieved. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Sync job does not exist.

---

#### `POST` /api/v1/sync-jobs

**Create sync job**

Create a cross-device sync job for queued offline messages and state.

*Requirement:* REQ-021

**Request Body:** `CreateSyncJobRequest`

**Responses:**

- `201`: Created - Sync job created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid sync job request.
- `401`: Unauthorized - Missing or invalid token.

---

#### `PUT` /api/v1/sync-jobs/{syncJobId}

**Update sync job**

Update a sync job status or configuration.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| syncJobId | path | string | True | Sync job ID |

**Request Body:** `UpdateSyncJobRequest`

**Responses:**

- `200`: OK - Sync job updated. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid status transition.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Sync job does not exist.

---

#### `DELETE` /api/v1/sync-jobs/{syncJobId}

**Delete sync job**

Delete a sync job by ID.

*Requirement:* REQ-021

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| syncJobId | path | string | True | Sync job ID |

**Request Body:** `DeleteSyncJobRequest`

**Responses:**

- `200`: OK - Sync job deleted. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Sync job does not exist.

---

#### `POST` /api/v1/sync-jobs/batch

**Batch create sync jobs**

Create multiple sync jobs in a single request.

*Requirement:* REQ-021

**Request Body:** `BatchCreateSyncJobsRequest`

**Responses:**

- `201`: Created - Sync jobs created. Includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.

---

### Typing

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/conversations/{id}/typing/start

**Start typing indicator**

Signal that the user started typing in a conversation. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Request Body:** `StartTypingRequest`

**Responses:**

- `200`: OK - Typing started (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{id}/typing/stop

**Stop typing indicator**

Signal that the user stopped typing in a conversation. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Request Body:** `StopTypingRequest`

**Responses:**

- `200`: OK - Typing stopped (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{conversationId}/typing/start

**Start typing indicator**

Signals typing start in a conversation over WebSocket-backed channel. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing started (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{conversationId}/typing/stop

**Stop typing indicator**

Signals typing stop in a conversation. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing stopped (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/chats/{chatId}/typing/start

**Start typing indicator**

Signals that the user started typing in a chat.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `POST` /api/v1/chats/{chatId}/typing/stop

**Stop typing indicator**

Signals that the user stopped typing in a chat.

*Requirement:* WA-BUS-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| chatId | path | string | True | Chat ID |

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### UnknownSenders

#### `GET` /api/v1/unknown-senders

**List unknown senders**

Returns a paginated list of unknown senders for separate handling and review.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Page size for pagination |
| filter | query | string | False | Filter expression (e.g., status:pending) |
| sort | query | string | False | Sort expression (e.g., -firstSeenAt) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `403`: Forbidden - Insufficient permissions
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/unknown-senders

**Create unknown sender record**

Creates a record for an unknown sender so the system can handle them separately.

*Requirement:* WA-CON-005

**Request Body:** `CreateUnknownSenderRequest`

**Responses:**

- `201`: Created - Unknown sender record created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid unknown sender payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Unknown sender already exists

---

#### `GET` /api/v1/unknown-senders/{id}

**Get unknown sender by ID**

Returns a specific unknown sender record.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Unknown sender ID |

**Responses:**

- `200`: OK - Unknown sender returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Unknown sender not found

---

#### `PUT` /api/v1/unknown-senders/{id}

**Update unknown sender**

Updates the handling status for an unknown sender (e.g., allow or block).

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Unknown sender ID |

**Request Body:** `UpdateUnknownSenderRequest`

**Responses:**

- `200`: OK - Unknown sender updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Unknown sender not found

---

#### `DELETE` /api/v1/unknown-senders/{id}

**Delete unknown sender**

Removes an unknown sender record.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Unknown sender ID |

**Responses:**

- `200`: OK - Unknown sender deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Unknown sender not found

---

#### `POST` /api/v1/unknown-senders/batch

**Batch create or update unknown senders**

Bulk operation to create or update multiple unknown sender records.

*Requirement:* WA-CON-005

**Request Body:** `BatchUnknownSenderRequest`

**Responses:**

- `201`: Created - Batch processed. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### Users

#### `GET` /api/v1/users

**List users**

Retrieve a paginated list of users with optional filtering, sorting, and full-text search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/users/{id}

**Get user by ID**

Retrieve a single user by ID including display name. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - User retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User does not exist

---

#### `POST` /api/v1/users

**Register user**

Create a new user with a configurable display name. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateUserRequest`

**Responses:**

- `201`: Created - User registered (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid or missing fields
- `409`: Conflict - User already exists

---

#### `PUT` /api/v1/users/{id}

**Update user**

Update a user's configurable display name. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Request Body:** `UpdateUserRequest`

**Responses:**

- `200`: OK - User updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid display name
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User does not exist

---

#### `DELETE` /api/v1/users/{id}

**Delete user**

Delete a user account. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - User deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User does not exist

---

### WA-ACC-002

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

### WA-AI-001

#### `GET` /api/v1/conversations

**List conversations**

Retrieve a paginated list of conversations with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/conversations

**Create conversation**

Create a new conversation (group or direct). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateConversationRequest`

**Responses:**

- `201`: Created - Conversation created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid members or type
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Conversation already exists

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-AI-003

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/presence/{userId}

**Update presence**

Update a user's presence status.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/readReceipts

**Create read receipt**

Create a read receipt for a message. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Read receipt already exists.
- `500`: Internal Server Error - Failed to create read receipt.

---

#### `DELETE` /api/v1/presence/{userId}

**Delete presence status**

Deletes presence status for a user. Response includes rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-NOT-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Responses:**

- `200`: OK - Presence deleted successfully
- `401`: Unauthorized - Missing or invalid access token
- `404`: Not Found - User ID does not exist

---

### WA-BAK-003

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

### WA-BAK-005

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/chats

**List chats**

Retrieve a paginated list of chats with optional filtering, sorting, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort fields |
| q | query | string | False | Full-text search query |
| archived | query | boolean | False | Filter by archived chats |

**Responses:**

- `200`: OK - Chats retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve chats

---

#### `POST` /api/v1/chats

**Create chat**

Create a new chat (direct or group). Group size limited to 1024. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-BAK-003

**Request Body:** `CreateChatRequest`

**Responses:**

- `201`: Created - Chat created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid chat payload or size limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Chat already exists

---

### WA-BUS-002

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `POST` /api/v1/readReceipts

**Create read receipt**

Create a read receipt for a message. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Read receipt already exists.
- `500`: Internal Server Error - Failed to create read receipt.

---

### WA-BUS-003

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/presences

**List presences**

Retrieve a paginated list of user presence statuses.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - Presences retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/presences/{presenceId}

**Get presence**

Retrieve a presence by ID.

*Requirement:* WA-CON-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| presenceId | path | string | True | Presence ID |

**Responses:**

- `200`: OK - Presence retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Presence does not exist (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### WA-BUS-004

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/read-receipts/{id}

**Get read receipt by ID**

Returns a specific read receipt.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

#### `PUT` /api/v1/read-receipts/{id}

**Update read receipt**

Updates a read receipt record.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid readAt value
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

#### `DELETE` /api/v1/read-receipts/{id}

**Delete read receipt**

Deletes a read receipt.

*Requirement:* WA-CON-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Read receipt not found

---

### WA-BUS-006

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `DELETE` /api/v1/sessions/{id}

**Delete session**

Terminate a session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-BUS-007

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-CALL-004

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

### WA-CALL-005

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `GET` /api/v1/devices/{deviceId}

**Get device by ID**

Returns details of a registered device.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/devices/{deviceId}

**Update device**

Updates device information.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

### WA-CON-001

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `PUT` /api/v1/presence

**Update presence**

Update user presence/status for real-time communication.

*Requirement:* WA-CALL-005

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid presence status - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-CON-002

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/read-receipts/{receiptId}

**Get read receipt by ID**

Retrieve a read receipt by ID.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Responses:**

- `200`: OK - Read receipt retrieved (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `PUT` /api/v1/read-receipts/{receiptId}

**Update read receipt**

Update an existing read receipt record.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid timestamp (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `DELETE` /api/v1/read-receipts/{receiptId}

**Delete read receipt**

Delete a read receipt record.

*Requirement:* WA-SEC-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| receiptId | path | string | True | Receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Receipt ID does not exist (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

#### `GET` /api/v1/contacts

**List contacts**

Retrieve a paginated list of contacts with optional filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListContactsRequest`

**Responses:**

- `200`: OK - Contacts retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid pagination or filter parameters. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `POST` /api/v1/contacts

**Create contact**

Create a new contact entry. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `CreateContactRequest`

**Responses:**

- `201`: Created - Contact created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid contact data. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `409`: Conflict - Contact already exists. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

#### `POST` /api/v1/contacts/batch

**Batch create contacts**

Create multiple contacts in a single request. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-CON-001

**Request Body:** `BatchCreateContactsRequest`

**Responses:**

- `201`: Created - Contacts created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

---

### WA-CON-004

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

### WA-CON-005

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/presence/{id}

**Get presence by ID**

Returns the presence status for a single user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `PUT` /api/v1/presence/{id}

**Update presence**

Updates presence status for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid presence status
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `DELETE` /api/v1/presence/{id}

**Delete presence**

Deletes presence record for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

### WA-GRP-001

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

### WA-GRP-004

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

### WA-GRP-005

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/groups

**List groups**

Returns a paginated list of group chats the authenticated user is a member of.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression for groups |
| sort | query | string | False | Sort expression, e.g., createdAt:desc |
| q | query | string | False | Full-text search query across group names |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `GET` /api/v1/groups/{groupId}

**Get group by ID**

Returns details of a specific group chat.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Group does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/groups

**Create group**

Creates a new group chat with up to 1024 members and stores Signal Protocol encrypted group key data.

*Requirement:* WA-GRP-001

**Request Body:** `CreateGroupRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid input or member limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Duplicate group creation request
- `500`: Internal Server Error - Unexpected failure

---

#### `DELETE` /api/v1/groups/{groupId}

**Delete group**

Deletes a group chat for all members.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| groupId | path | string | True | Group ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Group does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/groups/batch

**Batch create groups**

Creates multiple group chats in a single request for high-volume operations.

*Requirement:* WA-GRP-001

**Request Body:** `BatchCreateGroupsRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload or member limit exceeded
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/messages/read-receipts

**Send read receipts**

Marks messages as read for a conversation. Includes rate limit headers.

*Requirement:* WA-GRP-004

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipts processed (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message IDs
- `401`: Unauthorized - Missing or invalid token
- `429`: Too Many Requests - Rate limit exceeded
- `500`: Internal Server Error - Failed to process read receipts

---

### WA-GRP-008

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-GRP-009

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `POST` /api/v1/presence/status

**Update presence status**

Update user presence status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-GRP-005

**Request Body:** `PresenceStatusRequest`

**Responses:**

- `200`: OK - Presence updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid status.
- `401`: Unauthorized - Missing or invalid token.

---

### WA-INT-003

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

### WA-INT-005

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/devices/{id}

**Get device**

Retrieve device details by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `GetDeviceRequest`

**Responses:**

- `200`: OK - Device returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `PUT` /api/v1/devices/{id}

**Update device**

Update device metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Device updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `DELETE` /api/v1/devices/{id}

**Delete device**

Remove a device registration. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

### WA-INT-006

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{id}

**Get message by ID**

Retrieve a message by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/messages/{id}

**Update message**

Update a message (metadata only). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid metadata
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `DELETE` /api/v1/messages/{id}

**Delete message**

Delete a message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `GET` /api/v1/media/{id}

**Get media by ID**

Retrieve media metadata by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `POST` /api/v1/messages/{id}/read-receipts

**Create read receipt**

Submit a read receipt for a message, including view-once media consumption context if applicable.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid read receipt data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message ID does not exist

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/presence/{id}

**Get presence by ID**

Returns the presence status for a single user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `PUT` /api/v1/presence/{id}

**Update presence**

Updates presence status for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid presence status
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `DELETE` /api/v1/presence/{id}

**Delete presence**

Deletes presence record for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `PUT` /api/v1/media/{id}

**Update media metadata**

Updates metadata for an existing media item.

*Requirement:* WA-SRC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Media not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### WA-LOC-002

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-MED-007

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `POST` /api/v1/media/batch

**Batch create media metadata**

Create multiple media metadata entries in a single request for high-volume operations.

*Requirement:* WA-MSG-009

**Request Body:** `BatchCreateMediaRequest`

**Responses:**

- `201`: Created - Batch media created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

### WA-MED-008

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

### WA-MSG-003

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{messageId}/read-receipts

**Create read receipt**

Submit a read receipt for a specific message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read timestamp.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.
- `500`: Internal Server Error - Unexpected failure while creating read receipt.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `DELETE` /api/v1/sessions/{sessionId}

**Delete session**

Terminate an active session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Session does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting session.

---

### WA-MSG-009

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/conversations/{id}/typing/start

**Start typing indicator**

Signal that the user started typing in a conversation. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Request Body:** `StartTypingRequest`

**Responses:**

- `200`: OK - Typing started (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{id}/typing/stop

**Stop typing indicator**

Signal that the user stopped typing in a conversation. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Conversation ID |

**Request Body:** `StopTypingRequest`

**Responses:**

- `200`: OK - Typing stopped (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

### WA-MSG-011

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{messageId}/read-receipts

**Create read receipt**

Submit a read receipt for a specific message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read timestamp.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.
- `500`: Internal Server Error - Unexpected failure while creating read receipt.

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-MSG-015

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/devices/{id}

**Get device**

Retrieve device details by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `GetDeviceRequest`

**Responses:**

- `200`: OK - Device returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `PUT` /api/v1/devices/{id}

**Update device**

Update device metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Device updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `DELETE` /api/v1/devices/{id}

**Delete device**

Remove a device registration. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `GET` /api/v1/sessions/{id}

**Get session**

Retrieve a session by ID. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `GetSessionRequest`

**Responses:**

- `200`: OK - Session returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `PUT` /api/v1/sessions/{id}

**Update session**

Refresh or update session metadata. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `UpdateSessionRequest`

**Responses:**

- `200`: OK - Session updated with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `DELETE` /api/v1/sessions/{id}

**Delete session**

Terminate a session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-NOT-001

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/devices/{deviceId}

**Get device by ID**

Returns details of a registered device.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/devices/{deviceId}

**Update device**

Updates device information.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `POST` /api/v1/conversations/{conversationId}/typing/start

**Start typing indicator**

Signals typing start in a conversation over WebSocket-backed channel. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing started (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{conversationId}/typing/stop

**Stop typing indicator**

Signals typing stop in a conversation. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing stopped (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/messages/{messageId}/read

**Read receipt**

Mark a message as read and generate a read receipt.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `ReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt created (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `PUT` /api/v1/presence/{userId}

**Update presence**

Update a user's presence status.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status
- `401`: Unauthorized - Missing or invalid token

---

### WA-NOT-004

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `PUT` /api/v1/presence

**Update presence**

Update user presence/status for real-time communication.

*Requirement:* WA-CALL-005

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid presence status - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-PERF-004

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

### WA-PERF-005

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{id}

**Get message by ID**

Retrieve a message by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/messages/{id}

**Update message**

Update a message (metadata only). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid metadata
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `DELETE` /api/v1/messages/{id}

**Delete message**

Delete a message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `GET` /api/v1/media/{id}

**Get media by ID**

Retrieve media metadata by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `DELETE` /api/v1/media/{id}

**Delete media**

Delete media by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist

---

#### `POST` /api/v1/media/batch

**Batch create media metadata**

Create multiple media metadata entries in a single request for high-volume operations.

*Requirement:* WA-MSG-009

**Request Body:** `BatchCreateMediaRequest`

**Responses:**

- `201`: Created - Batch media created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/media/{id}

**Update media metadata**

Updates metadata for an existing media item.

*Requirement:* WA-SRC-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Request Body:** `UpdateMediaRequest`

**Responses:**

- `200`: OK - Media updated (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid update payload (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `404`: Not Found - Media not found (Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)

---

### WA-PROF-001

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

### WA-PROF-004

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

### WA-SEC-001

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/read-receipts

**List read receipts**

Retrieve a paginated list of read receipts with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| messageId | query | string | False | Filter by message ID |
| userId | query | string | False | Filter by user ID |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

### WA-SEC-003

#### `GET` /api/v1/devices

**List devices**

List registered devices for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Request Body:** `ListDevicesRequest`

**Responses:**

- `200`: OK - Device list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/devices/batch

**Batch register devices**

Bulk register devices. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `BatchCreateDevicesRequest`

**Responses:**

- `201`: Created - Batch processed with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/read-receipts

**Create read receipt**

Creates a read receipt for a message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid message ID.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.

---

#### `GET` /api/v1/presence/{userId}

**Get user presence**

Retrieve current presence/status of a user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `GetPresenceRequest`

**Responses:**

- `200`: OK - Presence retrieved. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - User does not exist.
- `500`: Internal Server Error - Unexpected failure while retrieving presence.

---

#### `DELETE` /api/v1/devices/{deviceId}

**Delete device**

Remove a registered device. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `DeleteDeviceRequest`

**Responses:**

- `200`: OK - Device deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Device does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting device.

---

#### `GET` /api/v1/devices/{deviceId}

**Get device by ID**

Returns details of a registered device.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/devices/{deviceId}

**Update device**

Updates device information.

*Requirement:* WA-GRP-001

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| deviceId | path | string | True | Device ID |

**Request Body:** `UpdateDeviceRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Device does not exist
- `500`: Internal Server Error - Unexpected failure

---

#### `PUT` /api/v1/presence/{userId}

**Update presence**

Update a user's presence status.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status
- `401`: Unauthorized - Missing or invalid token

---

### WA-SET-002

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `GET` /api/v1/sessions

**List sessions**

List active sessions for the authenticated user. Supports filter, sort, and full-text search. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| order | query | string | False | Sort order: asc|desc |

**Request Body:** `ListSessionsRequest`

**Responses:**

- `200`: OK - Session list returned with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token

---

#### `DELETE` /api/v1/sessions/{id}

**Delete session**

Terminate a session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Session does not exist

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/presence

**Update user presence**

Set user presence status.

*Requirement:* WA-MSG-003

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid status value - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/presence/{id}

**Get presence by ID**

Returns the presence status for a single user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `PUT` /api/v1/presence/{id}

**Update presence**

Updates presence status for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `400`: Bad Request - Invalid presence status
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `DELETE` /api/v1/presence/{id}

**Delete presence**

Deletes presence record for a user.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | User ID |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - User presence does not exist

---

#### `GET` /api/v1/readReceipts

**List read receipts**

Retrieve paginated list of read receipts. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| scope | query | string | False | Filter by scope (user, group, broadcast) |

**Responses:**

- `200`: OK - List retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Failed to retrieve read receipts.

---

#### `GET` /api/v1/readReceipts/{id}

**Get read receipt by ID**

Retrieve a specific read receipt by ID. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt retrieved. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to retrieve read receipt.

---

#### `POST` /api/v1/readReceipts

**Create read receipt**

Create a read receipt for a message. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Read receipt already exists.
- `500`: Internal Server Error - Failed to create read receipt.

---

#### `PUT` /api/v1/readReceipts/{id}

**Update read receipt**

Update a read receipt. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Request Body:** `UpdateReadReceiptRequest`

**Responses:**

- `200`: OK - Read receipt updated. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read receipt payload.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to update read receipt.

---

#### `DELETE` /api/v1/readReceipts/{id}

**Delete read receipt**

Delete a read receipt. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-STS-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Read receipt ID |

**Responses:**

- `200`: OK - Read receipt deleted. Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Read receipt does not exist.
- `500`: Internal Server Error - Failed to delete read receipt.

---

### WA-SET-003

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `POST` /api/v1/messages/{messageId}/read-receipts

**Create read receipt**

Submit a read receipt for a specific message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read timestamp.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.
- `500`: Internal Server Error - Unexpected failure while creating read receipt.

---

#### `DELETE` /api/v1/sessions/{sessionId}

**Delete session**

Terminate an active session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Session does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting session.

---

#### `POST` /api/v1/conversations/{conversationId}/typing/start

**Start typing indicator**

Signals typing start in a conversation over WebSocket-backed channel. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing started (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

#### `POST` /api/v1/conversations/{conversationId}/typing/stop

**Stop typing indicator**

Signals typing stop in a conversation. Response headers include rate limit information.

*Requirement:* WA-GRP-008

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| conversationId | path | string | True | Conversation ID |

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing stopped (rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Conversation does not exist

---

### WA-SRC-001

#### `POST` /api/v1/devices

**Register device**

Register a user device for mobile-first access. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateDeviceRequest`

**Responses:**

- `201`: Created - Device registered with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid device payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Device already registered

---

#### `POST` /api/v1/sessions

**Create session**

Create a new session (used after passkey authentication). Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-AUTH-005

**Request Body:** `CreateSessionRequest`

**Responses:**

- `201`: Created - Session created with rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid session payload
- `401`: Unauthorized - Invalid tokens

---

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/push-tokens

**Register push token**

Registers a push notification token for the authenticated user. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `RegisterPushTokenRequest`

**Responses:**

- `201`: Created - Push token registered. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid token data.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Token already registered.

---

#### `GET` /internal/health

**Health check**

Returns service health status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `HealthRequest`

**Responses:**

- `200`: OK - Service healthy. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service unhealthy.

---

#### `GET` /internal/metrics

**Metrics**

Returns service metrics. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `MetricsRequest`

**Responses:**

- `200`: OK - Metrics returned. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Metrics not available.

---

#### `GET` /internal/ready

**Readiness**

Returns service readiness status. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `ReadyRequest`

**Responses:**

- `200`: OK - Service ready. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `503`: Service Unavailable - Service not ready.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{messageId}/read-receipts

**Create read receipt**

Submit a read receipt for a specific message. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt created. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid read timestamp.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Message does not exist.
- `500`: Internal Server Error - Unexpected failure while creating read receipt.

---

#### `DELETE` /api/v1/sessions/{sessionId}

**Delete session**

Terminate an active session. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sessionId | path | string | True | Session ID |

**Request Body:** `DeleteSessionRequest`

**Responses:**

- `200`: OK - Session deleted. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `404`: Not Found - Session does not exist.
- `500`: Internal Server Error - Unexpected failure while deleting session.

---

#### `GET` /api/v1/messages/{messageId}

**Get message by ID**

Retrieve a single message by ID.

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `GetMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `DELETE` /api/v1/messages/{messageId}

**Delete message**

Delete a message for all recipients (server-side delete marker).

*Requirement:* WA-MSG-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `DeleteMessageRequest`

**Responses:**

- `200`: OK - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `403`: Forbidden - Not allowed to delete message - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist - Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `PUT` /api/v1/messages/{messageId}

**Update message**

Updates message metadata (e.g., client annotations).

*Requirement:* WA-MSG-011

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| messageId | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid payload. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `404`: Not Found - Message does not exist. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/presence/{userId}

**Update presence**

Update a user's presence status.

*Requirement:* WA-CALL-004

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| userId | path | string | True | User ID |

**Request Body:** `UpdatePresenceRequest`

**Responses:**

- `200`: OK - Presence updated (Headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid status
- `401`: Unauthorized - Missing or invalid token

---

### WA-SRC-002

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `GET` /api/v1/messages

**List messages**

Retrieve a paginated list of messages with optional filtering, sorting, and search. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| conversationId | query | string | False | Filter by conversation |
| fromUserId | query | string | False | Filter by sender |
| chatId | query | string | False | Filter by chat ID |
| senderId | query | string | False | Filter by sender ID |
| hasMedia | query | boolean | False | Filter messages with media |
| mediaType | query | string | False | Filter by media type (image, video, audio, document) |
| from | query | string | False | Start timestamp (ISO-8601) |
| to | query | string | False | End timestamp (ISO-8601) |
| sortBy | query | string | False | Sort by field (timestamp, senderId) |
| sortOrder | query | string | False | asc|desc |

**Responses:**

- `200`: OK - List retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/messages/{id}

**Get message by ID**

Retrieve a message by ID. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message retrieved (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages

**Create message**

Create a new encrypted message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessageRequest`

**Responses:**

- `201`: Created - Message created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid message payload
- `401`: Unauthorized - Missing or invalid token

---

#### `PUT` /api/v1/messages/{id}

**Update message**

Update a message (metadata only). Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `UpdateMessageRequest`

**Responses:**

- `200`: OK - Message updated (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid metadata
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `DELETE` /api/v1/messages/{id}

**Delete message**

Delete a message. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Responses:**

- `200`: OK - Message deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message does not exist

---

#### `POST` /api/v1/messages/batch

**Create messages in batch**

Create multiple encrypted messages in a single request. Includes rate limiting headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-002

**Request Body:** `CreateMessagesBatchRequest`

**Responses:**

- `201`: Created - Messages created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `GET` /api/v1/media

**List media**

Retrieve a paginated list of media items with optional filtering, sorting, and full-text search.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:image, viewOnce:true) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |
| query | query | string | False | Full-text search query |
| mediaType | query | string | False | Filter by media type (e.g., image, video, audio, document) |

**Responses:**

- `200`: OK - Media list returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid pagination or filter parameters
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to retrieve media

---

#### `GET` /api/v1/media/{id}

**Get media by ID**

Retrieve media metadata by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media returned (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist
- `410`: Gone - View-once media already consumed

---

#### `POST` /api/v1/media

**Upload media**

Upload media with optional view-once flag. Supports max size constraints (2GB documents, 16MB images).

*Requirement:* WA-MSG-009

**Request Body:** `CreateMediaRequest`

**Responses:**

- `201`: Created - Media uploaded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid media type or size exceeds limits
- `401`: Unauthorized - Missing or invalid token
- `413`: Payload Too Large - File exceeds maximum size
- `415`: Unsupported Media Type - Media format not supported

---

#### `DELETE` /api/v1/media/{id}

**Delete media**

Delete media by ID.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Media ID |

**Responses:**

- `200`: OK - Media deleted (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Media ID does not exist

---

#### `POST` /api/v1/media/batch

**Batch create media metadata**

Create multiple media metadata entries in a single request for high-volume operations.

*Requirement:* WA-MSG-009

**Request Body:** `BatchCreateMediaRequest`

**Responses:**

- `201`: Created - Batch media created (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid batch payload
- `401`: Unauthorized - Missing or invalid token

---

#### `POST` /api/v1/messages/{id}/read-receipts

**Create read receipt**

Submit a read receipt for a message, including view-once media consumption context if applicable.

*Requirement:* WA-MSG-009

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Message ID |

**Request Body:** `CreateReadReceiptRequest`

**Responses:**

- `201`: Created - Read receipt recorded (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
- `400`: Bad Request - Invalid read receipt data
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Message ID does not exist

---

#### `GET` /api/v1/presence

**List presence**

Returns paginated presence status for users.

*Requirement:* WA-MSG-015

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |
| userIds | query | string | True | Comma-separated user IDs |
| status | query | string | False | Filter by status |
| order | query | string | False | Sort order: asc|desc |

**Responses:**

- `200`: OK - X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset headers included
- `401`: Unauthorized - Missing or invalid token

---

### WA-STS-004

#### `POST` /api/v1/typing/start

**Start typing indicator**

Signals that a user started typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStartRequest`

**Responses:**

- `200`: OK - Typing indicator started. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

#### `POST` /api/v1/typing/stop

**Stop typing indicator**

Signals that a user stopped typing in a conversation. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-PROF-001

**Request Body:** `TypingStopRequest`

**Responses:**

- `200`: OK - Typing indicator stopped. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.

---

### WebClients

#### `GET` /api/v1/web-clients

**List web clients**

Retrieve paginated list of web clients. Supports search, filter, and sorting. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-INT-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| q | query | string | False | Full-text search query |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |

**Responses:**

- `200`: OK - List retrieved. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `500`: Internal Server Error - Failed to fetch web clients

---

#### `GET` /api/v1/web-clients/{id}

**Get web client by ID**

Retrieve a single web client by ID. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-INT-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Web client ID |

**Responses:**

- `200`: OK - Web client retrieved. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Web client does not exist

---

#### `POST` /api/v1/web-clients

**Create web client**

Register a new web client for web version usage. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-INT-006

**Request Body:** `CreateWebClientRequest`

**Responses:**

- `201`: Created - Web client registered. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid web client payload
- `401`: Unauthorized - Missing or invalid token
- `409`: Conflict - Web client already exists

---

#### `PUT` /api/v1/web-clients/{id}

**Update web client**

Update web client attributes. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-INT-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Web client ID |

**Request Body:** `UpdateWebClientRequest`

**Responses:**

- `200`: OK - Web client updated. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Web client does not exist

---

#### `DELETE` /api/v1/web-clients/{id}

**Delete web client**

Remove a web client session. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.

*Requirement:* WA-INT-006

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Web client ID |

**Responses:**

- `200`: OK - Web client deleted. Rate limits: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Web client does not exist

---

### Webhooks

#### `GET` /api/v1/integrations/{integrationId}/webhooks

**List webhooks**

List webhooks for a specific integration.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |
| page | query | integer | True | Page number |
| pageSize | query | integer | True | Page size |
| filter | query | string | False | Filter expression |
| sort | query | string | False | Sort expression |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Integration not found

---

#### `POST` /api/v1/integrations/{integrationId}/webhooks

**Create webhook**

Create a webhook subscription for integration event delivery.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |

**Request Body:** `CreateWebhookRequest`

**Responses:**

- `201`: Created - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid webhook payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Integration not found

---

#### `GET` /api/v1/integrations/{integrationId}/webhooks/{webhookId}

**Get webhook**

Retrieve a webhook subscription by ID.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |
| webhookId | path | string | True | Webhook ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Webhook not found

---

#### `PUT` /api/v1/integrations/{integrationId}/webhooks/{webhookId}

**Update webhook**

Update webhook subscription configuration.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |
| webhookId | path | string | True | Webhook ID |

**Request Body:** `UpdateWebhookRequest`

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `400`: Bad Request - Invalid webhook update payload
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Webhook not found

---

#### `DELETE` /api/v1/integrations/{integrationId}/webhooks/{webhookId}

**Delete webhook**

Delete a webhook subscription.

*Requirement:* REQ-028

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| integrationId | path | string | True | Integration ID |
| webhookId | path | string | True | Webhook ID |

**Responses:**

- `200`: OK - Includes rate limit headers X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset
- `401`: Unauthorized - Missing or invalid token
- `404`: Not Found - Webhook not found

---

### Widgets

#### `GET` /api/v1/widgets

**List widgets**

Retrieve a paginated list of home-screen widgets. Supports filtering, sorting, and full-text search. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| page | query | integer | True | Page number for pagination |
| pageSize | query | integer | True | Number of items per page |
| filter | query | string | False | Filter expression (e.g., type:eq:status) |
| sort | query | string | False | Sort fields (e.g., createdAt:desc) |
| q | query | string | False | Full-text search query |

**Responses:**

- `200`: OK - Widgets returned successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions.
- `500`: Internal Server Error - Unexpected failure.

---

#### `GET` /api/v1/widgets/{id}

**Get widget by ID**

Retrieve details of a specific widget by ID. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Widget ID |

**Responses:**

- `200`: OK - Widget returned successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions.
- `404`: Not Found - Widget does not exist.
- `500`: Internal Server Error - Unexpected failure.

---

#### `POST` /api/v1/widgets

**Create widget**

Create a new home-screen widget. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Request Body:** `CreateWidgetRequest`

**Responses:**

- `201`: Created - Widget created successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Missing or invalid fields in request body.
- `401`: Unauthorized - Missing or invalid token.
- `409`: Conflict - Widget with same name already exists.
- `500`: Internal Server Error - Unexpected failure.

---

#### `PUT` /api/v1/widgets/{id}

**Update widget**

Update an existing widget by ID. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Widget ID |

**Request Body:** `UpdateWidgetRequest`

**Responses:**

- `200`: OK - Widget updated successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid update payload.
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions.
- `404`: Not Found - Widget does not exist.
- `500`: Internal Server Error - Unexpected failure.

---

#### `DELETE` /api/v1/widgets/{id}

**Delete widget**

Delete a widget by ID. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| id | path | string | True | Widget ID |

**Responses:**

- `200`: OK - Widget deleted successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `401`: Unauthorized - Missing or invalid token.
- `403`: Forbidden - Insufficient permissions.
- `404`: Not Found - Widget does not exist.
- `500`: Internal Server Error - Unexpected failure.

---

#### `POST` /api/v1/widgets/batch

**Batch create widgets**

Create multiple widgets in a single request for high-volume operations. Responses include rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

*Requirement:* WA-INT-003

**Request Body:** `BatchCreateWidgetsRequest`

**Responses:**

- `201`: Created - Batch widgets created successfully. Rate limit headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset.
- `400`: Bad Request - Invalid batch payload.
- `401`: Unauthorized - Missing or invalid token.
- `500`: Internal Server Error - Unexpected failure.

---

## Schemas

### AbsenceMessageListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Absence message items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### AbsenceMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Absence message ID |
| userId | string | User ID |
| enabled | boolean | Whether auto-reply is enabled |
| messageCiphertext | string | Encrypted message content |
| messageIv | string | Encryption IV |
| messageMac | string | Encryption MAC |
| startsAt | string | Start time (ISO-8601) |
| endsAt | string | End time (ISO-8601) |
| timezone | string | Timezone |
| createdAt | string | Created timestamp |
| updatedAt | string | Updated timestamp |

### AcceptGroupInvitationRequest

| Property | Type | Description |
|----------|------|-------------|
| inviteToken | string | Invitation token |
| deviceId | string | Device ID for registration context |

### AcceptGroupInvitationResponse

| Property | Type | Description |
|----------|------|-------------|
| groupId | string | Joined group ID |
| memberId | string | New member ID |
| joinedAt | string | ISO-8601 join timestamp |

### AddRecipientsRequest

| Property | Type | Description |
|----------|------|-------------|
| recipientIds | array | Recipient user IDs |

### AddRecipientsResponse

| Property | Type | Description |
|----------|------|-------------|
| broadcastListId | string | Broadcast list ID |
| addedCount | integer | Number of recipients added |

### AiAssistantListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of assistants |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### AiAssistantResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Assistant ID |
| name | string | Assistant name |
| model | string | AI model identifier |
| systemPrompt | string | System prompt |

### AiSessionListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of sessions |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### AiSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Session ID |
| assistantId | string | Assistant ID |
| conversationId | string | Conversation ID |
| status | string | Session status |

### AnalyticsReportListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of analytics reports |
| page | integer | Current page number |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### AnalyticsReportResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Report ID |
| type | string | Report type |
| status | string | Report status |
| createdAt | string | Creation timestamp (ISO 8601) |

### AppLockListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of app locks |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### AppLockResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | App lock ID |
| userId | string | User ID |
| enabled | boolean | Whether app lock is enabled |
| lockType | string | Authentication type (e.g., pin, biometrics) |
| updatedAt | string | Last update timestamp |

### ArchiveChatRequest

| Property | Type | Description |
|----------|------|-------------|
| reason | string | Optional archive reason |

### ArchiveChatResponse

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID |
| archived | boolean | Archive status |
| archivedAt | string | Archive timestamp |

### AssignLabelsToContactRequest

| Property | Type | Description |
|----------|------|-------------|
| labelIds | array | Label IDs to assign |

### AssignLabelsToContactResponse

| Property | Type | Description |
|----------|------|-------------|
| contactId | string | Contact ID |
| assignedLabelIds | array | Assigned label IDs |

### AudioMessageListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of audio messages |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### AudioMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Audio message ID |
| chatId | string | Chat ID |
| senderId | string | Sender user ID |
| durationMs | integer | Duration in milliseconds |
| sizeBytes | integer | File size in bytes |
| mimeType | string | Audio MIME type |
| ciphertext | string | Encrypted payload reference |
| createdAt | string | Creation timestamp |

### AuditLogListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of audit log entries |
| page | integer | Current page number |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### AuditLogResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Audit log ID |
| action | string | Action performed |
| actorId | string | Actor user ID |
| targetId | string | Target resource ID |
| metadata | object | Additional metadata |
| timestamp | string | Event timestamp (ISO 8601) |

### BackupResponse

| Property | Type | Description |
|----------|------|-------------|
| backupId | string | Backup ID |
| deviceId | string | Device ID |
| createdAt | string | Creation timestamp |
| sizeBytes | integer | Backup size in bytes |
| encrypted | boolean | Whether the backup is end-to-end encrypted |
| encryptionMetadata | string | Signal protocol metadata for backup decryption |

### BackupsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of backups |
| page | integer | Current page |
| pageSize | integer | Page size |
| totalCount | integer | Total number of backups |

### BatchAbsenceMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created IDs |
| failed | array | Failed items with reasons |

### BatchAssignLabelsToContactsRequest

| Property | Type | Description |
|----------|------|-------------|
| assignments | array | Assignments to process |

### BatchAssignLabelsToContactsResponse

| Property | Type | Description |
|----------|------|-------------|
| processed | integer | Number of assignments processed |
| failed | array | Failed assignments with reasons |

### BatchBatteryMetricsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created records |
| items | array | Created metrics |

### BatchBatterySettingsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created records |
| items | array | Created battery settings |

### BatchBlocksRequest

| Property | Type | Description |
|----------|------|-------------|
| action | string | create|delete |
| items | array | Block operations |

### BatchBlocksResponse

| Property | Type | Description |
|----------|------|-------------|
| processed | integer |  |
| failed | integer |  |
| results | array |  |

### BatchBusinessResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created business IDs |
| failed | array | Failed records with errors |

### BatchBusinessVerificationResponse

| Property | Type | Description |
|----------|------|-------------|
| updated | array | Updated verification IDs |
| failed | array | Failed updates with errors |

### BatchCreateAbsenceMessagesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Absence messages to create |

### BatchCreateAppLocksRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | App lock items |

### BatchCreateAppLocksResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created app locks |
| ids | array | Created app lock IDs |

### BatchCreateAuditLogsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Audit log entries to create |

### BatchCreateAuditLogsResponse

| Property | Type | Description |
|----------|------|-------------|
| createdCount | integer | Number of audit logs created |
| failedCount | integer | Number of audit logs failed |

### BatchCreateBackupsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Backup metadata items |

### BatchCreateBackupsResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created backup IDs |

### BatchCreateBatteryMetricsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Battery metrics to create |

### BatchCreateBatterySettingsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Battery settings to create |

### BatchCreateBotsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Bots to create |

### BatchCreateBotsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created bots |
| failed | array | Failed bots with reasons |

### BatchCreateBusinessesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of businesses to create |

### BatchCreateCallLinksRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Call links to create |

### BatchCreateCallLinksResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created call links |
| failed | array | Failed items with errors |

### BatchCreateChatArchivesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Archive creation items |

### BatchCreateChatArchivesResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created archive IDs |

### BatchCreateChatExportsRequest

| Property | Type | Description |
|----------|------|-------------|
| exports | array | List of export job requests |

### BatchCreateChatExportsResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Created export jobs |
| failed | array | Failed export jobs with errors |

### BatchCreateChatsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Chat creation items |

### BatchCreateChatsResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created chat IDs |

### BatchCreateContactLabelsRequest

| Property | Type | Description |
|----------|------|-------------|
| labels | array | Labels to create |

### BatchCreateContactLabelsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created labels |
| failed | array | Failed labels with reasons |

### BatchCreateContactsRequest

| Property | Type | Description |
|----------|------|-------------|
| contacts | array | Contacts to create |

### BatchCreateContactsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created contacts |

### BatchCreateDevicesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Device items |

### BatchCreateDevicesResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created devices |
| ids | array | Created device IDs |

### BatchCreateGroupEventsRequest

| Property | Type | Description |
|----------|------|-------------|
| events | array | Events to create |

### BatchCreateGroupEventsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created events |
| results | array | Per-event results |

### BatchCreateGroupInvitationsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Invitation creation requests |

### BatchCreateGroupsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Groups to create |

### BatchCreateGroupsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of groups created |
| ids | array | Created group IDs |

### BatchCreateIntegrationsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Integrations to create |

### BatchCreateIntegrationsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created integrations |
| failed | array | Failed integrations with reasons |

### BatchCreateMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Media items to create |

### BatchCreateMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Created media items |

### BatchCreateMessagesRequest

| Property | Type | Description |
|----------|------|-------------|
| messages | array | Array of message payloads |

### BatchCreateMessagesResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created message IDs |
| failed | array | Failed message entries |

### BatchCreatePasskeysRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Array of passkey creation objects |

### BatchCreatePollVotesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Votes to create |

### BatchCreatePollsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Polls to create |

### BatchCreateProductsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Products to create |

### BatchCreateProductsResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created product IDs |
| failed | array | Failed items with reasons |

### BatchCreateProfileImagesRequest

| Property | Type | Description |
|----------|------|-------------|
| files | array | Array of profile image files |

### BatchCreateProfilesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Profiles to create |

### BatchCreateProfilesResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of profiles created |
| failed | integer | Number of profiles failed |

### BatchCreatePushTokensRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Push token items |

### BatchCreatePushTokensResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number created |
| failed | integer | Number failed |

### BatchCreateReadReceiptsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Read receipts to create |

### BatchCreateRestoresRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Restore job items |

### BatchCreateRestoresResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created restore IDs |

### BatchCreateScreenSharesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Screen share creation requests |

### BatchCreateScreenSharesResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created screen shares |

### BatchCreateSessionsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Array of session creation objects |

### BatchCreateSharedContactsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Array of shared-contact create requests |

### BatchCreateSharedContactsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created items |
| failed | integer | Number of failed items |
| errors | array | Per-item errors |

### BatchCreateStatusVisibilityConfigsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Configurations to create |

### BatchCreateStatusVisibilityConfigsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of created configurations |
| items | array | Created configurations |

### BatchCreateStickerSuggestionsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of suggestions to create |

### BatchCreateStickerSuggestionsResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created suggestions |
| failed | array | Failed items with reasons |

### BatchCreateSyncJobsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Sync job items |

### BatchCreateSyncJobsResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created sync job IDs |

### BatchCreateWidgetsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Widgets to create |

### BatchDeleteMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| ids | array | List of media IDs to delete |

### BatchDeleteMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| deletedIds | array | List of successfully deleted media IDs |
| failedIds | array | List of media IDs that failed to delete |

### BatchDeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created devices |
| failed | array | Failed items with errors |

### BatchGroupInvitationResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created invitations |
| failed | array | Failed items with reasons |

### BatchMessageReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Read receipts to create |

### BatchMessageReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array | Batch operation results |

### BatchMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| messages | array | Array of message payloads |

### BatchMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| acceptedCount | integer | Number of accepted messages |
| failedCount | integer | Number of failed messages |

### BatchPasskeyResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created passkeys |
| failed | array | Failed items with errors |

### BatchPollResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of polls created |
| items | array | Created poll IDs |

### BatchPollVoteResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of votes created |
| items | array | Created vote IDs |

### BatchPresenceRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Presence updates |

### BatchPresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array | Batch operation results |

### BatchProfileImageResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created profile images |

### BatchProfilePictureVisibilityRequest

| Property | Type | Description |
|----------|------|-------------|
| operations | array | Batch operations |

### BatchProfilePictureVisibilityResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array | Per-operation result |

### BatchQuickRepliesRequest

| Property | Type | Description |
|----------|------|-------------|
| operations | array | Batch operations |

### BatchQuickRepliesResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array |  |

### BatchReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Configurations to create or update |

### BatchReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created IDs |
| failed | array | Failed items with reasons |

### BatchRegionalFormatRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Regional formats to upsert |

### BatchRegionalFormatResponse

| Property | Type | Description |
|----------|------|-------------|
| processed | integer | Number of processed items |
| created | integer | Number created |
| updated | integer | Number updated |

### BatchReportsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array |  |

### BatchReportsResponse

| Property | Type | Description |
|----------|------|-------------|
| processed | integer |  |
| failed | integer |  |
| results | array |  |

### BatchSendMessagesRequest

| Property | Type | Description |
|----------|------|-------------|
| messages | array | List of message payloads |

### BatchSendMessagesResponse

| Property | Type | Description |
|----------|------|-------------|
| accepted | array | Accepted message IDs |
| failed | array | Failed messages with errors |

### BatchSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created sessions |
| failed | array | Failed items with errors |

### BatchUnknownSenderRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Unknown sender records |

### BatchUnknownSenderResponse

| Property | Type | Description |
|----------|------|-------------|
| processedCount | integer | Number of records processed |
| items | array | Processed records |

### BatchUpdateBusinessVerificationsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of verification updates |

### BatchUpdateEventRsvpsRequest

| Property | Type | Description |
|----------|------|-------------|
| rsvps | array | RSVP updates |

### BatchUpdateEventRsvpsResponse

| Property | Type | Description |
|----------|------|-------------|
| updated | integer | Number of updated RSVPs |
| results | array | Per-user results |

### BatchUpdateNotificationSettingsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Settings updates |

### BatchUpdateNotificationSettingsResponse

| Property | Type | Description |
|----------|------|-------------|
| updated | integer | Number updated |
| failed | integer | Number failed |

### BatchUpsertCartItemsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Array of cart item payloads |

### BatchUpsertCartItemsResponse

| Property | Type | Description |
|----------|------|-------------|
| processed | integer | Number of processed items |
| failed | integer | Number of failed items |

### BatchUpsertDndSettingsRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | DND settings to upsert |

### BatchUpsertDndSettingsResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array | Batch operation results |

### BatchUpsertFontSizesRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Font size preferences to upsert |

### BatchUpsertFontSizesResponse

| Property | Type | Description |
|----------|------|-------------|
| results | array | Upsert results |

### BatchWidgetResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created widgets |
| failed | array | Failed widget creations with errors |

### BatteryMetricResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Metric ID |
| deviceId | string | Device ID |
| batteryLevel | integer | Battery level percentage |
| isCharging | boolean | Charging state |
| timestamp | string | Metric timestamp |
| networkType | string | Network type |
| wakeLockCount | integer | Wake lock count |

### BatteryMetricsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of battery metrics |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### BatterySettingsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of battery settings |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### BatterySettingsResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Battery setting ID |
| deviceId | string | Device ID |
| mode | string | Optimization mode |
| syncIntervalSeconds | integer | Background sync interval in seconds |
| lowPowerModeEnabled | boolean | Low power mode flag |
| updatedAt | string | Last update timestamp |

### BlockListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of blocks |
| page | integer |  |
| pageSize | integer |  |
| total | integer |  |

### BlockResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| blockerId | string |  |
| blockedId | string |  |
| reason | string |  |
| createdAt | string |  |

### BotListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of bots |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### BotResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Bot ID |
| name | string | Bot name |
| description | string | Bot description |
| status | string | Bot status |

### BroadcastListListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Broadcast list items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### BroadcastListResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Broadcast list ID |
| name | string | Broadcast list name |
| description | string | Description |
| recipientCount | integer | Number of recipients |
| updatedAt | string | Update timestamp |

### BusinessListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of businesses |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of businesses |

### BusinessResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Business ID |
| name | string | Legal business name |
| status | string | Business status |

### BusinessVerificationListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of verification requests |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of verification requests |

### BusinessVerificationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Verification request ID |
| businessId | string | Business ID |
| status | string | Verification status |

### CallLinkListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of call links |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### CallLinkResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Call link ID |
| joinUrl | string | Call link URL |
| webrtcRoomId | string | WebRTC room ID |
| title | string | Call title |
| callType | string | voice|video |
| scheduledStart | string | ISO-8601 start time |
| expiresAt | string | ISO-8601 expiration time |
| maxParticipants | integer | Maximum participants |

### CartItemListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of cart items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### CartItemResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Cart item ID |
| cartId | string | Cart ID |
| productId | string | Product ID |
| quantity | integer | Quantity |
| unitPrice | number | Unit price |

### CartListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of carts |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### CartResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Cart ID |
| userId | string | Owner user ID |
| currency | string | ISO currency code |
| status | string | Cart status |

### CatalogListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of catalogs |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### CatalogResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Catalog ID |
| businessId | string | Business ID |
| name | string | Catalog name |
| description | string | Catalog description |
| updatedAt | string | ISO timestamp |

### ChatArchiveListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Archived chats |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ChatArchiveResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Archive ID |
| chatId | string | Chat ID |
| archivedAt | string | Archive timestamp |

### ChatExportListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of export jobs |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of exports |

### ChatExportResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Export job ID |
| status | string | Export status |

### ChatListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of chats |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of chats |

### ChatResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Chat ID |
| title | string | Chat title |
| archived | boolean | Archive state |

### ConsumeViewOnceRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID consuming the media |

### ConsumeViewOnceResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| downloadUrl | string | Short-lived download URL |
| consumedAt | string | Consumption timestamp |

### ContactBatchResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number created |
| failed | integer | Number failed |
| results | array | Per-item results |

### ContactLabelAssignmentListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of assigned labels |
| page | integer | Current page |
| pageSize | integer | Items per page |
| totalItems | integer | Total number of items |

### ContactLabelListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of contact labels |
| page | integer | Current page |
| pageSize | integer | Items per page |
| totalItems | integer | Total number of items |

### ContactLabelResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Label ID |
| name | string | Label name |
| color | string | Optional label color |
| createdAt | string | Creation timestamp (ISO 8601) |
| updatedAt | string | Last update timestamp (ISO 8601) |

### ContactListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of contacts |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ContactResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Contact ID |
| displayName | string | Contact display name |
| phone | string | Phone number |
| username | string | Username |
| createdAt | string | Creation timestamp |

### ConversationCreatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Conversation ID |
| type | string | Conversation type |

### ConversationDeletedResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Deletion status |

### ConversationListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of conversations |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### ConversationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Conversation ID |
| type | string | Conversation type |
| participantIds | array | Participant user IDs |

### ConversationUpdatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Conversation ID |
| title | string | Updated title |

### CreateAbsenceMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| enabled | boolean | Whether auto-reply is enabled |
| messageCiphertext | string | Encrypted message content |
| messageIv | string | Encryption IV |
| messageMac | string | Encryption MAC |
| startsAt | string | Start time (ISO-8601) |
| endsAt | string | End time (ISO-8601) |
| timezone | string | Timezone |

### CreateAiAssistantRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Assistant name |
| model | string | AI model identifier |
| systemPrompt | string | System prompt for the assistant |

### CreateAiSessionRequest

| Property | Type | Description |
|----------|------|-------------|
| assistantId | string | Assistant ID |
| conversationId | string | Conversation ID |

### CreateAnalyticsReportRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | Report type (e.g., throughput, system, compliance) |
| timeRange | object | Time range for the report |
| filters | object | Optional filters for report generation |

### CreateAppLockRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| enabled | boolean | Whether app lock is enabled |
| lockType | string | Authentication type (e.g., pin, biometrics) |
| secret | string | Hashed secret for app lock |

### CreateAppLockResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Created app lock ID |
| userId | string | User ID |
| enabled | boolean | Whether app lock is enabled |
| lockType | string | Authentication type |
| createdAt | string | Creation timestamp |

### CreateAudioMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Target chat ID |
| durationMs | integer | Duration in milliseconds |
| mimeType | string | Audio MIME type |
| signalEnvelope | string | Signal protocol encrypted envelope |
| file | string | Encrypted audio file |

### CreateAudioMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Audio message ID |
| chatId | string | Chat ID |
| uploadStatus | string | Upload status |
| createdAt | string | Creation timestamp |

### CreateAudioMessagesBatchRequest

| Property | Type | Description |
|----------|------|-------------|
| items | array | Batch audio message items |

### CreateAudioMessagesBatchResponse

| Property | Type | Description |
|----------|------|-------------|
| created | array | Created audio message IDs |

### CreateAuditLogRequest

| Property | Type | Description |
|----------|------|-------------|
| action | string | Action performed |
| actorId | string | Actor user ID |
| targetId | string | Target resource ID |
| metadata | object | Additional metadata |

### CreateBackupRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| encryptionMetadata | string | Signal protocol metadata for backup encryption |
| backupFile | string | Encrypted backup payload |

### CreateBackupResponse

| Property | Type | Description |
|----------|------|-------------|
| backupId | string | Backup ID |
| createdAt | string | Creation timestamp |
| sizeBytes | integer | Backup size in bytes |
| encrypted | boolean | Whether the backup is end-to-end encrypted |

### CreateBatteryMetricRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| batteryLevel | integer | Battery level percentage |
| isCharging | boolean | Charging state |
| timestamp | string | Metric timestamp |
| networkType | string | Network type |
| wakeLockCount | integer | Wake lock count |

### CreateBatterySettingsRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| mode | string | Optimization mode (e.g., balanced, aggressive) |
| syncIntervalSeconds | integer | Background sync interval in seconds |
| lowPowerModeEnabled | boolean | Low power mode flag |

### CreateBlockRequest

| Property | Type | Description |
|----------|------|-------------|
| blockedId | string | User ID to block |
| reason | string | Optional reason |

### CreateBotRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Bot name |
| description | string | Bot description |
| publicKey | string | Signal Protocol public key |
| webhookIntegrationId | string | Linked integration ID |

### CreateBroadcastListRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Broadcast list name |
| description | string | Optional description |
| recipientIds | array | Initial recipient user IDs (max 256) |

### CreateBusinessRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Legal business name |
| country | string | ISO country code |
| registrationNumber | string | Business registration number |
| contactEmail | string | Contact email address |

### CreateBusinessVerificationRequest

| Property | Type | Description |
|----------|------|-------------|
| businessId | string | Business ID |
| verificationType | string | Verification type |
| evidenceMetadata | object | Metadata for submitted evidence |

### CreateCallLinkRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string | Call title |
| callType | string | voice|video |
| scheduledStart | string | ISO-8601 start time |
| expiresAt | string | ISO-8601 expiration time |
| maxParticipants | integer | Maximum participants (<=1024) |
| encryption | object | Signal Protocol metadata |
| offlineQueueEnabled | boolean | Enable offline message queue |

### CreateCartItemRequest

| Property | Type | Description |
|----------|------|-------------|
| cartId | string | Cart ID |
| productId | string | Product ID |
| quantity | integer | Quantity |
| unitPrice | number | Unit price |

### CreateCartRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | Owner user ID |
| currency | string | ISO currency code |

### CreateCatalogRequest

| Property | Type | Description |
|----------|------|-------------|
| businessId | string | Business ID |
| name | string | Catalog name |
| description | string | Catalog description |

### CreateChatArchiveRequest

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID |
| archivedAt | string | Archive timestamp |

### CreateChatExportRequest

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID to export |
| format | string | Export format (json, csv, pdf) |
| includeMedia | boolean | Whether to include media references |

### CreateChatRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | direct|group |
| title | string | Chat title for group chats |
| participantIds | array | List of participant user IDs |

### CreateContactLabelRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Label name |
| color | string | Optional label color |

### CreateContactRequest

| Property | Type | Description |
|----------|------|-------------|
| method | string | Addition method: phone|username|inviteLink|qr |
| phone | string | Phone number |
| username | string | Username |
| inviteLink | string | Invite link token |
| qrToken | string | QR token |
| displayName | string | Custom display name |

### CreateContactsBatchRequest

| Property | Type | Description |
|----------|------|-------------|
| contacts | array | Contacts to create |

### CreateConversationRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | Conversation type: direct or group |
| participantIds | array | Participant user IDs |
| groupId | string | Optional group ID |

### CreateDesktopAppRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Desktop app name |
| supportedPlatforms | array | Supported platforms |

### CreateDesktopAppVersionRequest

| Property | Type | Description |
|----------|------|-------------|
| desktopAppId | string | Desktop app ID |
| platform | string | Target platform |
| version | string | Semantic version |
| downloadUrl | string | Download URL |
| checksum | string | Integrity checksum |
| fileSize | integer | File size in bytes |

### CreateDeviceRequest

| Property | Type | Description |
|----------|------|-------------|
| platform | string | Device platform (ios, android, windows, mac, linux) |
| model | string | Device model |
| deviceId | string | Client-generated device ID |

### CreateDeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Device ID |
| status | string | Registration status |

### CreateDndSettingRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| enabled | boolean | Whether DND is enabled |
| schedule | object | Optional schedule |
| allowList | array | List of allowed contact IDs |

### CreateDndSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | DND setting ID |
| userId | string | User ID |
| enabled | boolean | Whether DND is enabled |
| schedule | object | Schedule object |
| allowList | array | List of allowed contact IDs |
| createdAt | string | Creation timestamp |

### CreateEventRsvpRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | RSVP status |

### CreateEventRsvpResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | RSVP status |

### CreateFontSizeRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| scale | number | Font size scale factor |
| preset | string | Preset name: small|medium|large|extraLarge |

### CreateGroupEventRequest

| Property | Type | Description |
|----------|------|-------------|
| groupId | string | Group ID |
| title | string | Event title |
| description | string | Event description |
| startsAt | string | ISO 8601 start datetime |
| endsAt | string | ISO 8601 end datetime |
| location | string | Event location |
| encryptedPayload | string | End-to-end encrypted payload (Signal Protocol) |
| clientRequestId | string | Idempotency key for offline queue |

### CreateGroupEventResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Event ID |
| status | string | Creation status |
| createdAt | string | Creation timestamp |

### CreateGroupInvitationRequest

| Property | Type | Description |
|----------|------|-------------|
| groupId | string | Target group ID |
| expiresAt | string | ISO-8601 expiration timestamp |
| maxUses | integer | Maximum number of uses |
| singleUse | boolean | Whether the link can be used only once |

### CreateGroupRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Group name |
| description | string | Group description |
| memberIds | array | Initial member IDs |

### CreateGroupResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Group ID |
| name | string | Group name |
| memberCount | integer | Number of members |

### CreateIntegrationRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Integration name |
| provider | string | Provider identifier |
| webhookUrl | string | Webhook callback URL |
| signingSecret | string | Webhook signing secret |
| scopes | array | Requested scopes |

### CreateMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | Media type: image, video, document, audio |
| fileName | string | Original file name |
| mimeType | string | MIME type |
| sizeBytes | integer | Size in bytes |
| messageId | string | Associated message ID |
| encryption | string | Signal protocol encryption metadata reference |

### CreateMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| uploadUrl | string | Pre-signed upload URL |
| expiresAt | string | Upload URL expiration |

### CreateMessageReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| readAt | string | Read timestamp |

### CreateMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID |
| clientMessageId | string | Client-generated ID for offline queueing |
| ciphertext | string | End-to-end encrypted payload |
| media | object | Media metadata if present |

### CreateMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Created message ID |
| createdAt | string | Creation timestamp |

### CreateMessagesBatchRequest

| Property | Type | Description |
|----------|------|-------------|
| messages | array | Messages to create |

### CreateModerationActionRequest

| Property | Type | Description |
|----------|------|-------------|
| caseId | string |  |
| action | string |  |
| targetUserId | string |  |
| notes | string |  |

### CreateModerationCaseRequest

| Property | Type | Description |
|----------|------|-------------|
| reportId | string |  |
| priority | string |  |
| assignedTo | string |  |

### CreateNotificationRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | Notification type |
| chatId | string | Chat ID |
| messageId | string | Message ID |
| recipientId | string | Recipient user ID |
| payload | object | Encrypted payload metadata |

### CreateNotificationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Notification ID |
| status | string | Status |
| createdAt | string | Creation timestamp |

### CreateNotificationSettingRequest

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID |
| notificationType | string | Type (message, mention, call) |
| pushEnabled | boolean | Push enabled |
| muted | boolean | Muted |
| sound | string | Sound identifier |
| showPreview | boolean | Show preview |
| quietHours | object | Quiet hours config |

### CreateNotificationSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Setting ID |
| chatId | string | Chat ID |
| notificationType | string | Type |
| pushEnabled | boolean | Push enabled |
| muted | boolean | Muted |
| createdAt | string | Creation timestamp |

### CreateNotificationsBatchRequest

| Property | Type | Description |
|----------|------|-------------|
| notifications | array | Array of notification objects |

### CreateNotificationsBatchResponse

| Property | Type | Description |
|----------|------|-------------|
| created | integer | Number of notifications queued |
| failed | integer | Number of notifications failed |
| errors | array | Per-item error details |

### CreatePasskeyRequest

| Property | Type | Description |
|----------|------|-------------|
| credentialId | string | WebAuthn credential ID |
| publicKey | string | Credential public key |
| deviceName | string | Friendly device name |
| transports | array | Supported transports |

### CreatePollRequest

| Property | Type | Description |
|----------|------|-------------|
| question | string | Poll question |
| options | array | Poll options |
| allowMultiple | boolean | Allow multiple selections |
| expiresAt | string | ISO timestamp for poll expiry |
| encryptedPayload | string | Signal Protocol encrypted poll payload |

### CreatePollVoteRequest

| Property | Type | Description |
|----------|------|-------------|
| optionIds | array | Selected option IDs |
| encryptedPayload | string | Signal Protocol encrypted vote payload |

### CreatePresenceRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | Presence status |

### CreatePresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | Presence status |
| createdAt | string | Creation timestamp |

### CreatePresenceStatusRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | Presence status: online|offline|away|busy |

### CreatePresenceStatusResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Presence ID |
| userId | string | User ID |
| status | string | Presence status: online|offline|away|busy |
| createdAt | string | Creation timestamp |

### CreateProductRequest

| Property | Type | Description |
|----------|------|-------------|
| catalogId | string | Catalog ID |
| businessId | string | Business ID |
| name | string | Product name |
| description | string | Product description |
| price | number | Product price |
| currency | string | ISO currency code |

### CreateProfileImageRequest

| Property | Type | Description |
|----------|------|-------------|
| file | string | Profile image file (max 16MB) |
| caption | string | Optional caption |

### CreateProfilePictureVisibilityRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| visibility | string | Visibility level: everyone|contacts|nobody|custom |
| allowedUserIds | array | Allowed user IDs for custom visibility |

### CreateProfilePictureVisibilityResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Visibility configuration ID |
| userId | string | User ID |
| visibility | string | Visibility level: everyone|contacts|nobody|custom |
| allowedUserIds | array | Allowed user IDs for custom visibility |
| createdAt | string | Creation timestamp |

### CreateProfileRequest

| Property | Type | Description |
|----------|------|-------------|
| displayName | string | Display name |
| phoneNumber | string | Phone number to display |
| statusMessage | string | Status message |

### CreateProfileResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Profile ID |
| displayName | string | Display name |
| phoneNumber | string | Phone number visible in profile |

### CreatePushTokenRequest

| Property | Type | Description |
|----------|------|-------------|
| platform | string | Platform (ios, android, web) |
| token | string | Push token |
| deviceId | string | Device identifier |
| deviceLabel | string | Human-readable device label |

### CreatePushTokenResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Push token ID |
| platform | string | Platform |
| token | string | Push token |
| deviceId | string | Device identifier |
| createdAt | string | Creation timestamp |

### CreateQuickReplyRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string | Short label |
| text | string | Quick reply text |
| language | string | Language code |
| tags | array |  |

### CreateReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| readAt | string | Read timestamp |

### CreateReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Read receipt ID |
| messageId | string | Message ID |
| userId | string | User ID |
| readAt | string | Read timestamp |

### CreateRegionalFormatRequest

| Property | Type | Description |
|----------|------|-------------|
| locale | string | Locale code, e.g., de-DE |
| dateFormat | string | Date format pattern |
| timeFormat | string | Time format pattern |
| numberFormat | string | Number format pattern |
| currencyFormat | string | Currency format pattern |
| timezone | string | IANA timezone |
| firstDayOfWeek | integer | First day of week (1-7) |
| measurementSystem | string | Metric or imperial |

### CreateReportRequest

| Property | Type | Description |
|----------|------|-------------|
| reportedUserId | string |  |
| messageId | string |  |
| reason | string |  |
| details | string |  |

### CreateRestoreRequest

| Property | Type | Description |
|----------|------|-------------|
| backupId | string | Backup ID |
| targetDeviceId | string | Target device ID |
| encryptionMetadata | string | Signal protocol metadata for decryption |

### CreateRestoreResponse

| Property | Type | Description |
|----------|------|-------------|
| restoreId | string | Restore ID |
| status | string | Restore status |
| createdAt | string | Creation timestamp |

### CreateSavedSearchRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Saved search name |
| query | string | Search query |
| filters | object | Search filters |

### CreateScreenShareRequest

| Property | Type | Description |
|----------|------|-------------|
| callId | string | Associated call ID |
| webrtcOffer | string | WebRTC SDP offer |
| encryptionContext | string | Signal Protocol context ID for E2E encryption |

### CreateScreenShareResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Screen share ID |
| callId | string | Associated call ID |
| status | string | Status of screen share |
| webrtcAnswer | string | WebRTC SDP answer |

### CreateSessionRequest

| Property | Type | Description |
|----------|------|-------------|
| username | string | Username |
| password | string | Password |

### CreateSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| token | string | Access token |
| expiresIn | integer | Token TTL seconds |

### CreateSharedContactRequest

| Property | Type | Description |
|----------|------|-------------|
| senderId | string | User ID of the sender |
| recipientIds | array | Recipient user IDs |
| conversationId | string | Conversation or group ID |
| contactCard | string | vCard or contact payload metadata (unencrypted metadata only) |
| encryptedPayload | string | Signal Protocol encrypted contact data |
| clientMessageId | string | Client-generated idempotency key |
| deviceId | string | Originating device ID |

### CreateStatusVisibilityConfigRequest

| Property | Type | Description |
|----------|------|-------------|
| ownerId | string | User ID owning the configuration |
| mode | string | Visibility mode: everyone|contacts|custom |
| includeUserIds | array | Explicitly included user IDs |
| excludeUserIds | array | Explicitly excluded user IDs |

### CreateStatusVisibilityConfigResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Configuration ID |
| ownerId | string | User ID owning the configuration |
| mode | string | Visibility mode: everyone|contacts|custom |
| includeUserIds | array | Explicitly included user IDs |
| excludeUserIds | array | Explicitly excluded user IDs |
| createdAt | string | Creation timestamp |

### CreateStickerSuggestionRequest

| Property | Type | Description |
|----------|------|-------------|
| stickerId | string | Sticker ID |
| context | string | Context identifier |
| score | number | Relevance score |

### CreateStickerSuggestionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Suggestion ID |
| stickerId | string | Sticker ID |
| context | string | Context identifier |
| score | number | Relevance score |
| createdAt | string | Creation timestamp |

### CreateStoragePolicyRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Policy name |
| retentionDays | integer | Retention period in days |
| compressionEnabled | boolean | Enable compression |
| deduplicationEnabled | boolean | Enable deduplication |

### CreateSyncJobRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| queueId | string | Offline message queue ID |
| encryptionMetadata | string | Signal protocol metadata for sync encryption |

### CreateSyncJobResponse

| Property | Type | Description |
|----------|------|-------------|
| syncJobId | string | Sync job ID |
| status | string | Sync status |
| createdAt | string | Creation timestamp |

### CreateUnknownSenderRequest

| Property | Type | Description |
|----------|------|-------------|
| externalSenderId | string | External sender identifier |
| status | string | Status: pending|allowed|blocked |
| firstSeenAt | string | ISO timestamp of first message |

### CreateUserRequest

| Property | Type | Description |
|----------|------|-------------|
| displayName | string | Configurable display name |
| publicKey | string | User public key for E2E encryption |

### CreateWebClientRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | Owner user ID |
| deviceInfo | string | Browser/device information |
| encryptionKeyBundleId | string | Signal protocol key bundle ID |

### CreateWebhookRequest

| Property | Type | Description |
|----------|------|-------------|
| eventTypes | array | Subscribed event types |
| callbackUrl | string | Webhook callback URL |
| signingSecret | string | Webhook signing secret |
| enabled | boolean | Enable/disable webhook |

### CreateWidgetRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Widget name |
| type | string | Widget type |
| config | object | Widget configuration |

### DeleteAbsenceMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Absence message ID |

### DeleteAiAssistantResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteAiSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteAnalyticsReportResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteAppLockRequest

### DeleteAppLockResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteAudioMessageRequest

### DeleteAudioMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted audio message ID |
| deleted | boolean | Deletion status |

### DeleteAuditLogResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteBackupRequest

### DeleteBackupResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteBatteryMetricResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Metric ID |

### DeleteBatterySettingsResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Battery settings ID |

### DeleteBlockResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| deleted | boolean |  |

### DeleteBotResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteBroadcastListRequest

### DeleteBroadcastListResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteBusinessRequest

### DeleteBusinessResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteBusinessVerificationRequest

### DeleteBusinessVerificationResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteCallLinkResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted call link ID |
| deleted | boolean | Deletion status |

### DeleteCartItemResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Cart item ID |

### DeleteCartResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Cart ID |

### DeleteCatalogResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted catalog ID |
| deleted | boolean | Deletion status |

### DeleteChatArchiveResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Archive ID |
| deleted | boolean | Deletion status |

### DeleteChatExportResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteChatResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteContactLabelResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted label ID |
| deleted | boolean | Deletion status |

### DeleteContactRequest

### DeleteContactResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteConversationResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteDesktopAppRequest

### DeleteDesktopAppResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteDesktopAppVersionRequest

### DeleteDesktopAppVersionResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteDeviceRequest

### DeleteDeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteDndSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted DND setting ID |
| deleted | boolean | Deletion status |

### DeleteEventRsvpResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| deleted | boolean | Deletion status |

### DeleteFontSizeRequest

### DeleteFontSizeResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted font size preference ID |
| deleted | boolean | Deletion status |

### DeleteGroupEventResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Event ID |
| deleted | boolean | Deletion status |

### DeleteGroupInvitationRequest

### DeleteGroupInvitationResponse

| Property | Type | Description |
|----------|------|-------------|
| success | boolean | Deletion result |

### DeleteGroupRequest

### DeleteGroupResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted group ID |
| deleted | boolean | Deletion status |

### DeleteIntegrationResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| deleted | boolean | Deletion status |

### DeleteMessageRequest

### DeleteMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteModerationCaseResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| deleted | boolean |  |

### DeleteNotificationResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Notification ID |

### DeleteNotificationSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Setting ID |

### DeletePasskeyRequest

### DeletePasskeyResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeletePollResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Poll ID |
| deleted | boolean | Deletion status |

### DeletePollVoteResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Vote ID |
| deleted | boolean | Deletion status |

### DeletePresenceRequest

### DeletePresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| deleted | boolean | Deletion status |

### DeletePresenceStatusResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Presence ID |

### DeleteProductResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted product ID |
| deleted | boolean | Deletion status |

### DeleteProfileImageRequest

### DeleteProfileImageResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteProfilePictureVisibilityRequest

### DeleteProfilePictureVisibilityResponse

| Property | Type | Description |
|----------|------|-------------|
| deletedId | string | Deleted configuration ID |
| status | string | Deletion status |

### DeleteProfileRequest

### DeleteProfileResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeletePushTokenRequest

### DeletePushTokenResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Push token ID |

### DeleteQuickReplyResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean |  |
| id | string |  |

### DeleteReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Read receipt ID |

### DeleteRegionalFormatResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteReportResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| deleted | boolean |  |

### DeleteRestoreRequest

### DeleteRestoreResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteSavedSearchResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteScreenShareResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Screen share ID |
| deleted | boolean | Deletion status |

### DeleteSessionRequest

### DeleteSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Session ID |
| revoked | boolean | Revocation status |

### DeleteSharedContactResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted shared contact ID |
| deleted | boolean | Deletion status |

### DeleteStatusVisibilityConfigResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Configuration ID |

### DeleteStickerSuggestionRequest

### DeleteStickerSuggestionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Suggestion ID |
| deleted | boolean | Deletion status |

### DeleteStoragePolicyResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteSyncJobRequest

### DeleteSyncJobResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteUnknownSenderResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |
| id | string | Unknown sender ID |

### DeleteWebClientResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion result |

### DeleteWebhookResponse

| Property | Type | Description |
|----------|------|-------------|
| deleted | boolean | Deletion status |

### DeleteWidgetResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Deleted widget ID |
| deleted | boolean | Deletion status |

### DesktopAppListRequest

### DesktopAppListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of desktop apps |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### DesktopAppResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Desktop app ID |
| name | string | Desktop app name |
| supportedPlatforms | array | Supported platforms |
| latestVersionId | string | Latest version ID |

### DesktopAppVersionDownloadResponse

| Property | Type | Description |
|----------|------|-------------|
| downloadUrl | string | Signed download URL |
| expiresAt | string | Expiration timestamp |

### DesktopAppVersionListRequest

### DesktopAppVersionListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of desktop app versions |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### DesktopAppVersionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Version ID |
| desktopAppId | string | Desktop app ID |
| platform | string | Target platform |
| version | string | Semantic version |
| downloadUrl | string | Download URL |
| checksum | string | Integrity checksum |
| fileSize | integer | File size in bytes |

### DeviceListRequest

### DeviceListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of devices |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### DeviceRegistrationRequest

| Property | Type | Description |
|----------|------|-------------|
| platform | string | iOS or Android |
| deviceId | string | Device identifier |
| deviceName | string | User-friendly device name |

### DeviceRegistrationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Device registration ID |

### DeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Device registration ID |
| deviceId | string | Device identifier |
| platform | string | Platform |

### DndSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | DND setting ID |
| userId | string | User ID |
| enabled | boolean | Whether DND is enabled |
| schedule | object | Optional schedule |
| allowList | array | List of allowed contact IDs |
| updatedAt | string | Last update timestamp |

### DndSettingsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of DND settings |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### EventRsvpListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of RSVPs |
| page | integer | Page number |
| pageSize | integer | Page size |
| total | integer | Total items |

### EventRsvpResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | RSVP status |
| updatedAt | string | Last update |

### FontSizeListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of font size preferences |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### FontSizeResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Font size preference ID |
| userId | string | User ID |
| scale | number | Font size scale factor |
| preset | string | Preset name |
| updatedAt | string | ISO timestamp |

### GetAppLockRequest

### GetAudioMessageRequest

### GetBackupRequest

### GetBroadcastListRequest

### GetBusinessRequest

### GetBusinessVerificationRequest

### GetContactRequest

### GetDesktopAppRequest

### GetDesktopAppVersionDownloadRequest

### GetDesktopAppVersionRequest

### GetDeviceRequest

### GetFontSizeRequest

### GetGroupInvitationRequest

### GetGroupRequest

### GetMessageRequest

### GetPasskeyRequest

### GetPresenceRequest

### GetPresenceStatusRequest

### GetProfileImageRequest

### GetProfilePictureVisibilityRequest

### GetProfileRequest

### GetRecipientRequest

### GetRestoreRequest

### GetSessionRequest

### GetStickerSuggestionRequest

### GetSyncJobRequest

### GroupEventListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of events |
| page | integer | Page number |
| pageSize | integer | Page size |
| total | integer | Total items |

### GroupEventResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Event ID |
| groupId | string | Group ID |
| title | string | Event title |
| description | string | Event description |
| startsAt | string | ISO 8601 start datetime |
| endsAt | string | ISO 8601 end datetime |
| location | string | Event location |
| status | string | Event status |
| createdBy | string | Creator user ID |
| updatedAt | string | Last update timestamp |

### GroupInvitationListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of group invitations |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### GroupInvitationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Invitation ID |
| groupId | string | Group ID |
| status | string | Invitation status |
| expiresAt | string | ISO-8601 expiration timestamp |

### GroupListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of groups |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### GroupResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Group ID |
| name | string | Group name |
| description | string | Group description |
| memberCount | integer | Number of members |
| createdAt | string | ISO timestamp |

### HealthCheckRequest

### HealthCheckResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | ok|degraded |
| timestamp | string | ISO timestamp |

### HealthRequest

### HealthResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Service health status |

### IntegrationListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of integrations |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### IntegrationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Integration ID |
| name | string | Integration name |
| provider | string | Provider identifier |
| webhookUrl | string | Webhook callback URL |
| status | string | Integration status |

### InternalMetricsResponse

| Property | Type | Description |
|----------|------|-------------|
| metrics | object | Key-value metrics |

### JoinCallLinkRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| clientInfo | string | Client metadata |

### JoinCallLinkResponse

| Property | Type | Description |
|----------|------|-------------|
| token | string | WebRTC join token |
| webrtcRoomId | string | WebRTC room ID |
| expiresAt | string | ISO-8601 token expiration |

### LeaveGroupRequest

| Property | Type | Description |
|----------|------|-------------|
| silent | boolean | Must be true to avoid notifications |
| clientRequestId | string | Idempotency key for offline queue |

### LeaveGroupResponse

| Property | Type | Description |
|----------|------|-------------|
| groupId | string | Group ID |
| left | boolean | Leave status |
| leftAt | string | ISO timestamp |

### ListAppLocksRequest

### ListAudioMessagesRequest

### ListBackupsRequest

### ListBroadcastListsRequest

### ListBusinessVerificationsRequest

### ListBusinessesRequest

### ListContactsRequest

### ListDevicesRequest

### ListFontSizesRequest

### ListGroupInvitationsRequest

### ListGroupsRequest

### ListMessagesRequest

### ListPasskeysRequest

### ListPresenceRequest

### ListProfileImagesRequest

### ListProfilePictureVisibilitiesRequest

### ListProfilesRequest

### ListRecipientsRequest

### ListRestoresRequest

### ListSessionsRequest

### ListStickerSuggestionsRequest

### ListSyncJobsRequest

### MediaListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of media items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### MediaPreviewResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| previewUrl | string | Preview URL |
| thumbnailWidth | integer | Thumbnail width |
| thumbnailHeight | integer | Thumbnail height |

### MediaResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| type | string | Media type |
| fileName | string | Original file name |
| sizeBytes | integer | Size in bytes |
| mimeType | string | MIME type |
| downloadUrl | string | Download URL |
| previewUrl | string | Preview URL |
| encryption | string | Signal protocol encryption metadata reference |
| createdAt | string | Creation timestamp |

### MessageAttachmentsResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of attachments |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### MessageCreatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Message ID |
| conversationId | string | Conversation ID |
| createdAt | string | Creation timestamp |

### MessageDeletedResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Deletion status |

### MessageDetailResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Message ID |
| senderId | string | Sender user ID |
| recipientId | string | Recipient user ID |
| groupId | string | Group ID if applicable |
| ciphertext | string | Encrypted message payload |
| deviceId | string | Sender device ID |
| timestamp | string | ISO-8601 timestamp |

### MessageListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of messages |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of messages |

### MessageReadReceiptListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Read receipt entries |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### MessageReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| messageId | string | Message ID |
| readAt | string | Read timestamp |
| status | string | Receipt status |

### MessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Message ID |
| edited | boolean | Edited flag |
| reactions | array | Reactions |

### MessageSearchResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Search result messages |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total matches |

### MessageUpdatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Message ID |
| updatedAt | string | Update timestamp |

### MessagesBatchResponse

| Property | Type | Description |
|----------|------|-------------|
| createdIds | array | Created message IDs |

### MetricsRequest

### MetricsResponse

| Property | Type | Description |
|----------|------|-------------|
| uptime | number | Uptime in seconds |
| requests | integer | Total requests |

### ModerationActionListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array |  |
| page | integer |  |
| pageSize | integer |  |
| total | integer |  |

### ModerationActionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| caseId | string |  |
| action | string |  |
| targetUserId | string |  |
| notes | string |  |
| createdAt | string |  |

### ModerationCaseListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array |  |
| page | integer |  |
| pageSize | integer |  |
| total | integer |  |

### ModerationCaseResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| reportId | string |  |
| status | string |  |
| priority | string |  |
| assignedTo | string |  |
| createdAt | string |  |

### NotificationListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Notifications |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### NotificationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Notification ID |
| type | string | Notification type |
| chatId | string | Chat ID |
| messageId | string | Message ID |
| status | string | Status |
| createdAt | string | Creation timestamp |

### NotificationSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Setting ID |
| userId | string | User ID |
| chatId | string | Chat ID |
| notificationType | string | Type (message, mention, call) |
| pushEnabled | boolean | Push enabled |
| muted | boolean | Muted |
| sound | string | Sound identifier |
| showPreview | boolean | Show preview |
| quietHours | object | Quiet hours config |

### NotificationSettingsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Notification settings |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### PasskeyAuthOptionsRequest

| Property | Type | Description |
|----------|------|-------------|
| userIdentifier | string | Username or user ID |
| rpId | string | Relying party ID |

### PasskeyAuthOptionsResponse

| Property | Type | Description |
|----------|------|-------------|
| challenge | string | Authentication challenge |
| allowCredentials | array | Allowed credential IDs |
| timeout | integer | Timeout in ms |

### PasskeyAuthVerifyRequest

| Property | Type | Description |
|----------|------|-------------|
| credential | object | WebAuthn credential response |

### PasskeyAuthVerifyResponse

| Property | Type | Description |
|----------|------|-------------|
| sessionId | string | Session ID |
| accessToken | string | Access token |
| refreshToken | string | Refresh token |

### PasskeyListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of passkeys |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### PasskeyRegistrationOptionsRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| deviceName | string | Device name |

### PasskeyRegistrationOptionsResponse

| Property | Type | Description |
|----------|------|-------------|
| challenge | string | Registration challenge |
| rpId | string | Relying party ID |
| user | object | User info |
| timeout | integer | Timeout in ms |

### PasskeyRegistrationVerifyRequest

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| credential | object | WebAuthn credential response |

### PasskeyRegistrationVerifyResponse

| Property | Type | Description |
|----------|------|-------------|
| passkeyId | string | Created passkey ID |
| verified | boolean | Verification result |

### PasskeyResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Passkey ID |
| credentialId | string | WebAuthn credential ID |
| deviceName | string | Friendly device name |
| updatedAt | string | Update timestamp |

### PollListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of polls |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### PollResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Poll ID |
| conversationId | string | Conversation ID |
| question | string | Poll question |
| options | array | Poll options |
| status | string | open|closed |
| createdAt | string | ISO timestamp |

### PollVoteListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of votes |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### PollVoteResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Vote ID |
| pollId | string | Poll ID |
| voterId | string | User ID |
| optionIds | array | Selected option IDs |
| createdAt | string | ISO timestamp |

### PresenceListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Presence list |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### PresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | Presence status |
| lastSeenAt | string | Last seen timestamp |

### PresenceStatusListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of presence statuses |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### PresenceStatusRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | online|away|offline |
| expiresIn | integer | Seconds until status expires |

### PresenceStatusResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | Presence status |
| lastSeenAt | string | ISO timestamp |

### PresenceUpdateRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | online, offline, away |
| lastSeenAt | string | Last seen timestamp |

### PresenceUpdateResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Updated status |

### ProductListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of products |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ProductResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Product ID |
| catalogId | string | Catalog ID |
| businessId | string | Business ID |
| name | string | Product name |
| description | string | Product description |
| price | number | Product price |
| currency | string | ISO currency code |
| updatedAt | string | ISO timestamp |

### ProfileImageListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of profile images |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### ProfileImageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Profile image ID |
| userId | string | User ID |
| url | string | CDN URL of profile image |
| updatedAt | string | Update timestamp |

### ProfileListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of profiles |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of profiles |

### ProfilePictureVisibilityListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of profile picture visibility configurations |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ProfilePictureVisibilityResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Visibility configuration ID |
| userId | string | User ID |
| visibility | string | Visibility level: everyone|contacts|nobody|custom |
| allowedUserIds | array | Allowed user IDs for custom visibility |
| updatedAt | string | Last update timestamp |

### ProfileResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Profile ID |
| displayName | string | Display name |
| phoneNumber | string | Phone number visible in profile |
| statusMessage | string | Status message |

### PushTokenListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of push tokens |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### PushTokenResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Push token ID |
| deviceId | string | Device identifier |
| token | string | Push token |

### QuickReplyListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of quick replies |
| page | integer |  |
| pageSize | integer |  |
| total | integer |  |

### QuickReplyResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| businessId | string |  |
| title | string |  |
| text | string |  |
| language | string |  |
| tags | array |  |
| createdAt | string |  |
| updatedAt | string |  |

### ReadReceiptDetailResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Receipt ID |
| messageId | string | Message ID |
| readerId | string | Reader user ID |
| readAt | string | ISO-8601 timestamp |

### ReadReceiptListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Read receipt items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| messageId | string | Message ID |
| readerId | string | Reader user ID |
| readAt | string | Read timestamp |

### ReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| accepted | boolean | Receipt accepted |

### ReadReceiptsRequest

| Property | Type | Description |
|----------|------|-------------|
| messageIds | array | Message IDs |
| readAt | string | ISO timestamp |

### ReadReceiptsResponse

| Property | Type | Description |
|----------|------|-------------|
| accepted | integer | Number of receipts accepted |

### ReadinessRequest

### ReadinessResponse

| Property | Type | Description |
|----------|------|-------------|
| ready | boolean | Readiness state |

### ReadyCheckRequest

### ReadyCheckResponse

| Property | Type | Description |
|----------|------|-------------|
| ready | boolean | Readiness status |
| timestamp | string | ISO timestamp |

### ReadyRequest

### ReadyResponse

| Property | Type | Description |
|----------|------|-------------|
| ready | boolean | Readiness status |

### RecipientListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Recipient items |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### RecipientResponse

| Property | Type | Description |
|----------|------|-------------|
| recipientId | string | Recipient user ID |
| addedAt | string | Added timestamp |

### RegionalFormatListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of regional formats |
| page | integer | Current page |
| pageSize | integer | Page size |
| totalItems | integer | Total items |

### RegionalFormatResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Regional format ID |
| locale | string | Locale code |
| dateFormat | string | Date format pattern |
| timeFormat | string | Time format pattern |
| numberFormat | string | Number format pattern |
| currencyFormat | string | Currency format pattern |
| timezone | string | IANA timezone |
| firstDayOfWeek | integer | First day of week |
| measurementSystem | string | Measurement system |

### RegisterDeviceRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device identifier |
| platform | string | iOS or Android |
| appVersion | string | App version |

### RegisterDeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Device record ID |
| userId | string | User ID |
| platform | string | Platform |
| deviceId | string | Device ID |
| createdAt | string | Creation timestamp |

### RegisterPushTokenRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device identifier |
| token | string | Push token |

### RegisterPushTokenResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Push token ID |
| deviceId | string | Device ID |
| platform | string | Platform |
| updatedAt | string | Update timestamp |

### RemoveLabelFromContactResponse

| Property | Type | Description |
|----------|------|-------------|
| contactId | string | Contact ID |
| labelId | string | Label ID |
| removed | boolean | Removal status |

### RemoveRecipientRequest

### RemoveRecipientResponse

| Property | Type | Description |
|----------|------|-------------|
| removed | boolean | Removal status |

### ReportListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of reports |
| page | integer |  |
| pageSize | integer |  |
| total | integer |  |

### ReportResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string |  |
| reporterId | string |  |
| reportedUserId | string |  |
| reason | string |  |
| status | string |  |
| createdAt | string |  |

### RestoreResponse

| Property | Type | Description |
|----------|------|-------------|
| restoreId | string | Restore ID |
| backupId | string | Backup ID |
| status | string | Restore status |
| progress | number | Progress from 0 to 1 |

### RestoresListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of restore jobs |
| page | integer | Current page |
| pageSize | integer | Page size |
| totalCount | integer | Total number of restore jobs |

### RevokeSessionResponse

| Property | Type | Description |
|----------|------|-------------|
| revoked | boolean | Revocation status |
| id | string | Session ID |

### SavedSearchListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Saved searches |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total saved searches |

### SavedSearchResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Saved search ID |
| name | string | Saved search name |
| query | string | Search query |
| filters | object | Search filters |

### ScreenShareListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of screen shares |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### ScreenShareResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Screen share ID |
| callId | string | Associated call ID |
| ownerUserId | string | Owner user ID |
| status | string | Status of screen share |
| webrtcSessionId | string | WebRTC session identifier |
| createdAt | string | Creation timestamp |

### SearchResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Search results |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total results |

### SendBroadcastMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| ciphertext | string | E2E encrypted message payload (Signal Protocol) |
| mediaId | string | Optional media ID |
| clientMessageId | string | Client-generated id for deduplication |

### SendMediaMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| mediaId | string | Uploaded media ID |
| caption | string | Optional caption |
| encryptedPayload | string | Signal Protocol encrypted payload |
| clientQueueId | string | Offline queue identifier |

### SendMediaMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| messageId | string | Message ID |
| status | string | queued or sent |

### SessionListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Session list |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### SessionResponse

| Property | Type | Description |
|----------|------|-------------|
| sessionId | string | Session ID |
| token | string | Access token |

### SetPresenceRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Presence status (online, offline, away) |

### SetPresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Updated presence status |

### SharedContactListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | Shared contacts |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total records |

### SharedContactResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Shared contact ID |
| label | string | Local label |

### StartTypingRequest

| Property | Type | Description |
|----------|------|-------------|
| conversationId | string | Conversation ID |
| deviceId | string | Device ID |

### StartTypingResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Typing status |

### StatusVisibilityConfigListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of status visibility configurations |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### StatusVisibilityConfigResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Configuration ID |
| ownerId | string | User ID owning the configuration |
| mode | string | Visibility mode: everyone|contacts|custom |
| includeUserIds | array | Explicitly included user IDs |
| excludeUserIds | array | Explicitly excluded user IDs |
| updatedAt | string | Last update timestamp |

### StickerSuggestionListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of sticker suggestions |
| page | integer | Current page |
| pageSize | integer | Items per page |
| total | integer | Total items |

### StickerSuggestionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Suggestion ID |
| stickerId | string | Sticker ID |
| score | number | Relevance score |
| context | string | Context identifier |
| createdAt | string | Creation timestamp |

### StopTypingRequest

| Property | Type | Description |
|----------|------|-------------|
| conversationId | string | Conversation ID |

### StopTypingResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Typing status |

### StoragePolicyListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of storage policies |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of items |

### StoragePolicyResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Storage policy ID |
| name | string | Policy name |
| retentionDays | integer | Retention period in days |
| compressionEnabled | boolean | Compression enabled |
| deduplicationEnabled | boolean | Deduplication enabled |

### SyncContactsRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceId | string | Device ID |
| contacts | array | Device contact list |
| lastSyncToken | string | Incremental sync token |

### SyncContactsResponse

| Property | Type | Description |
|----------|------|-------------|
| matchedUsers | array | Matched WhatsApp users |
| syncToken | string | New sync token |
| syncedAt | string | Sync timestamp (ISO 8601) |

### SyncJobResponse

| Property | Type | Description |
|----------|------|-------------|
| syncJobId | string | Sync job ID |
| deviceId | string | Device ID |
| status | string | Sync status |
| lastSyncedAt | string | Last sync timestamp |

### SyncJobsListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of sync jobs |
| page | integer | Current page |
| pageSize | integer | Page size |
| totalCount | integer | Total number of sync jobs |

### TypingIndicatorResponse

| Property | Type | Description |
|----------|------|-------------|
| conversationId | string | Conversation ID |
| status | string | stopped |

### TypingResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | stopped |

### TypingStartRequest

| Property | Type | Description |
|----------|------|-------------|
| conversationId | string | Conversation ID |
| userId | string | User ID |

### TypingStartResponse

| Property | Type | Description |
|----------|------|-------------|
| accepted | boolean | Event accepted |

### TypingStartedResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Typing status |

### TypingStopRequest

| Property | Type | Description |
|----------|------|-------------|
| conversationId | string | Conversation ID |
| userId | string | User ID |

### TypingStopResponse

| Property | Type | Description |
|----------|------|-------------|
| accepted | boolean | Event accepted |

### TypingStoppedResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Typing status |

### UnarchiveChatResponse

| Property | Type | Description |
|----------|------|-------------|
| chatId | string | Chat ID |
| archived | boolean | Archive status |

### UnknownSenderListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of unknown senders |
| page | integer | Current page number |
| pageSize | integer | Page size |
| totalCount | integer | Total items |

### UnknownSenderResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Unknown sender ID |
| externalSenderId | string | External sender identifier |
| status | string | Status |
| firstSeenAt | string | ISO timestamp of first message |

### UpdateAbsenceMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| enabled | boolean | Whether auto-reply is enabled |
| messageCiphertext | string | Encrypted message content |
| messageIv | string | Encryption IV |
| messageMac | string | Encryption MAC |
| startsAt | string | Start time (ISO-8601) |
| endsAt | string | End time (ISO-8601) |
| timezone | string | Timezone |

### UpdateAiAssistantRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Assistant name |
| model | string | AI model identifier |
| systemPrompt | string | System prompt |

### UpdateAiSessionRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Session status |

### UpdateAnalyticsReportRequest

| Property | Type | Description |
|----------|------|-------------|
| type | string | Report type |
| timeRange | object | Time range for the report |
| filters | object | Optional filters for report generation |

### UpdateAppLockRequest

| Property | Type | Description |
|----------|------|-------------|
| enabled | boolean | Whether app lock is enabled |
| lockType | string | Authentication type |
| secret | string | Hashed secret for app lock |

### UpdateAppLockResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | App lock ID |
| enabled | boolean | Whether app lock is enabled |
| lockType | string | Authentication type |
| updatedAt | string | Last update timestamp |

### UpdateAudioMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| durationMs | integer | Duration in milliseconds |
| mimeType | string | Audio MIME type |

### UpdateAudioMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Audio message ID |
| updatedAt | string | Update timestamp |

### UpdateAuditLogRequest

| Property | Type | Description |
|----------|------|-------------|
| metadata | object | Updated metadata |

### UpdateBackupRequest

| Property | Type | Description |
|----------|------|-------------|
| encryptionMetadata | string | Updated encryption metadata |
| deviceId | string | Associated device ID |

### UpdateBackupResponse

| Property | Type | Description |
|----------|------|-------------|
| backupId | string | Backup ID |
| updatedAt | string | Update timestamp |

### UpdateBatteryMetricRequest

| Property | Type | Description |
|----------|------|-------------|
| networkType | string | Network type |
| wakeLockCount | integer | Wake lock count |

### UpdateBatterySettingsRequest

| Property | Type | Description |
|----------|------|-------------|
| mode | string | Optimization mode |
| syncIntervalSeconds | integer | Background sync interval in seconds |
| lowPowerModeEnabled | boolean | Low power mode flag |

### UpdateBlockRequest

| Property | Type | Description |
|----------|------|-------------|
| reason | string | Updated reason |

### UpdateBotRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Bot name |
| description | string | Bot description |
| status | string | Bot status |

### UpdateBroadcastListRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Broadcast list name |
| description | string | Description |

### UpdateBusinessRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Legal business name |
| contactEmail | string | Contact email address |

### UpdateBusinessVerificationRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Updated verification status |
| reviewNotes | string | Reviewer notes |

### UpdateCallLinkRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string | Call title |
| scheduledStart | string | ISO-8601 start time |
| expiresAt | string | ISO-8601 expiration time |
| maxParticipants | integer | Maximum participants (<=1024) |
| offlineQueueEnabled | boolean | Enable offline message queue |

### UpdateCartItemRequest

| Property | Type | Description |
|----------|------|-------------|
| quantity | integer | Quantity |
| unitPrice | number | Unit price |

### UpdateCartRequest

| Property | Type | Description |
|----------|------|-------------|
| currency | string | ISO currency code |
| status | string | Cart status |

### UpdateCatalogRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Catalog name |
| description | string | Catalog description |

### UpdateChatArchiveRequest

| Property | Type | Description |
|----------|------|-------------|
| archivedAt | string | Archive timestamp |

### UpdateChatExportRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Export status |

### UpdateChatRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string | Chat title |
| archived | boolean | Archive state |

### UpdateContactLabelRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Label name |
| color | string | Optional label color |

### UpdateContactRequest

| Property | Type | Description |
|----------|------|-------------|
| displayName | string | Custom display name |
| blocked | boolean | Block contact |

### UpdateConversationRequest

| Property | Type | Description |
|----------|------|-------------|
| participantIds | array | Participant user IDs |

### UpdateDesktopAppRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Desktop app name |
| supportedPlatforms | array | Supported platforms |
| latestVersionId | string | Latest version ID |

### UpdateDesktopAppVersionRequest

| Property | Type | Description |
|----------|------|-------------|
| downloadUrl | string | Download URL |
| checksum | string | Integrity checksum |
| fileSize | integer | File size in bytes |
| releaseNotes | string | Release notes |

### UpdateDeviceRequest

| Property | Type | Description |
|----------|------|-------------|
| model | string | Device model |
| platform | string | Device platform |

### UpdateDeviceResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Device ID |
| status | string | Update status |

### UpdateDndSettingRequest

| Property | Type | Description |
|----------|------|-------------|
| enabled | boolean | Whether DND is enabled |
| schedule | object | Optional schedule |
| allowList | array | List of allowed contact IDs |

### UpdateDndSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | DND setting ID |
| userId | string | User ID |
| enabled | boolean | Whether DND is enabled |
| schedule | object | Schedule object |
| allowList | array | List of allowed contact IDs |
| updatedAt | string | Update timestamp |

### UpdateEventRsvpRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | RSVP status |

### UpdateEventRsvpResponse

| Property | Type | Description |
|----------|------|-------------|
| userId | string | User ID |
| status | string | RSVP status |
| updatedAt | string | Last update |

### UpdateFontSizeRequest

| Property | Type | Description |
|----------|------|-------------|
| scale | number | Font size scale factor |
| preset | string | Preset name |

### UpdateGroupEventRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string | Event title |
| description | string | Event description |
| startsAt | string | ISO 8601 start datetime |
| endsAt | string | ISO 8601 end datetime |
| location | string | Event location |
| status | string | Event status |
| encryptedPayload | string | End-to-end encrypted payload (Signal Protocol) |

### UpdateGroupEventResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Event ID |
| updatedAt | string | Update timestamp |

### UpdateGroupInvitationRequest

| Property | Type | Description |
|----------|------|-------------|
| expiresAt | string | ISO-8601 expiration timestamp |
| maxUses | integer | Maximum number of uses |
| revoked | boolean | Revoke invitation |

### UpdateGroupRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Group name |
| description | string | Group description |

### UpdateGroupResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Group ID |
| name | string | Group name |
| description | string | Group description |

### UpdateIntegrationRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Integration name |
| webhookUrl | string | Webhook callback URL |
| scopes | array | Requested scopes |
| status | string | Integration status |

### UpdateMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| fileName | string | Updated file name |
| messageId | string | Associated message ID |
| previewReady | boolean | Preview availability |

### UpdateMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| fileName | string | Updated file name |
| messageId | string | Associated message ID |
| previewReady | boolean | Preview availability |

### UpdateMessageRequest

| Property | Type | Description |
|----------|------|-------------|
| edited | boolean | Edited flag |
| reactions | array | Reactions |

### UpdateMessageResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Message ID |
| text | string | Message text |
| updatedAt | string | Update timestamp |

### UpdateModerationActionRequest

| Property | Type | Description |
|----------|------|-------------|
| notes | string |  |

### UpdateModerationCaseRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string |  |
| priority | string |  |
| assignedTo | string |  |

### UpdateNotificationRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Status (read, unread) |

### UpdateNotificationResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Notification ID |
| status | string | Status |
| updatedAt | string | Update timestamp |

### UpdateNotificationSettingRequest

| Property | Type | Description |
|----------|------|-------------|
| pushEnabled | boolean | Push enabled |
| muted | boolean | Muted |
| sound | string | Sound identifier |
| showPreview | boolean | Show preview |
| quietHours | object | Quiet hours config |

### UpdateNotificationSettingResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Setting ID |
| pushEnabled | boolean | Push enabled |
| muted | boolean | Muted |
| updatedAt | string | Update timestamp |

### UpdatePasskeyRequest

| Property | Type | Description |
|----------|------|-------------|
| deviceName | string | Friendly device name |
| transports | array | Supported transports |

### UpdatePollRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | open|closed |
| expiresAt | string | ISO timestamp for poll expiry |

### UpdatePollVoteRequest

| Property | Type | Description |
|----------|------|-------------|
| optionIds | array | Selected option IDs |
| encryptedPayload | string | Signal Protocol encrypted vote payload |

### UpdatePresenceRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Presence status |

### UpdatePresenceResponse

| Property | Type | Description |
|----------|------|-------------|
| updated | boolean | Update status |

### UpdatePresenceStatusRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | online|offline|away|busy |
| lastSeenAt | string | ISO timestamp |

### UpdatePresenceStatusResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Presence ID |
| userId | string | User ID |
| status | string | Presence status: online|offline|away|busy |
| updatedAt | string | Last update timestamp |

### UpdateProductRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Product name |
| description | string | Product description |
| price | number | Product price |
| currency | string | ISO currency code |

### UpdateProfileImageRequest

| Property | Type | Description |
|----------|------|-------------|
| file | string | Profile image file (max 16MB) |
| caption | string | Optional caption |

### UpdateProfilePictureVisibilityRequest

| Property | Type | Description |
|----------|------|-------------|
| visibility | string | Visibility level: everyone|contacts|nobody|custom |
| allowedUserIds | array | Allowed user IDs for custom visibility |

### UpdateProfilePictureVisibilityResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Visibility configuration ID |
| userId | string | User ID |
| visibility | string | Visibility level: everyone|contacts|nobody|custom |
| allowedUserIds | array | Allowed user IDs for custom visibility |
| updatedAt | string | Last update timestamp |

### UpdateProfileRequest

| Property | Type | Description |
|----------|------|-------------|
| displayName | string | Display name |
| phoneNumber | string | Phone number to display |
| statusMessage | string | Status message |

### UpdateProfileResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Profile ID |
| displayName | string | Display name |
| phoneNumber | string | Phone number visible in profile |
| statusMessage | string | Status message |

### UpdatePushTokenRequest

| Property | Type | Description |
|----------|------|-------------|
| token | string | Updated push token |
| deviceLabel | string | Updated device label |

### UpdatePushTokenResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Push token ID |
| token | string | Push token |
| deviceLabel | string | Device label |
| updatedAt | string | Update timestamp |

### UpdateQuickReplyRequest

| Property | Type | Description |
|----------|------|-------------|
| title | string |  |
| text | string |  |
| language | string |  |
| tags | array |  |

### UpdateReadReceiptRequest

| Property | Type | Description |
|----------|------|-------------|
| readAt | string | Read timestamp |

### UpdateReadReceiptResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Receipt ID |
| readAt | string | Updated read timestamp |

### UpdateRegionalFormatRequest

| Property | Type | Description |
|----------|------|-------------|
| locale | string | Locale code |
| dateFormat | string | Date format pattern |
| timeFormat | string | Time format pattern |
| numberFormat | string | Number format pattern |
| currencyFormat | string | Currency format pattern |
| timezone | string | IANA timezone |
| firstDayOfWeek | integer | First day of week |
| measurementSystem | string | Measurement system |

### UpdateReportRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string |  |
| moderatorNotes | string |  |

### UpdateRestoreRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Updated restore status |

### UpdateRestoreResponse

| Property | Type | Description |
|----------|------|-------------|
| restoreId | string | Restore ID |
| status | string | Updated status |

### UpdateSavedSearchRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Saved search name |
| query | string | Search query |
| filters | object | Search filters |

### UpdateScreenShareRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | New status (active, paused, ended) |
| webrtcIceCandidates | array | Additional ICE candidates |

### UpdateScreenShareResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Screen share ID |
| status | string | Updated status |

### UpdateSessionRequest

| Property | Type | Description |
|----------|------|-------------|
| lastActiveAt | string | Last activity timestamp (ISO-8601) |

### UpdateSharedContactRequest

| Property | Type | Description |
|----------|------|-------------|
| label | string | Local label |

### UpdateStatusVisibilityConfigRequest

| Property | Type | Description |
|----------|------|-------------|
| mode | string | Visibility mode: everyone|contacts|custom |
| includeUserIds | array | Explicitly included user IDs |
| excludeUserIds | array | Explicitly excluded user IDs |

### UpdateStatusVisibilityConfigResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Configuration ID |
| ownerId | string | User ID owning the configuration |
| mode | string | Visibility mode: everyone|contacts|custom |
| includeUserIds | array | Explicitly included user IDs |
| excludeUserIds | array | Explicitly excluded user IDs |
| updatedAt | string | Last update timestamp |

### UpdateStickerSuggestionRequest

| Property | Type | Description |
|----------|------|-------------|
| score | number | Relevance score |
| context | string | Context identifier |

### UpdateStickerSuggestionResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Suggestion ID |
| stickerId | string | Sticker ID |
| context | string | Context identifier |
| score | number | Relevance score |
| updatedAt | string | Update timestamp |

### UpdateStoragePolicyRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Policy name |
| retentionDays | integer | Retention period in days |
| compressionEnabled | boolean | Enable compression |
| deduplicationEnabled | boolean | Enable deduplication |

### UpdateSyncJobRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Updated sync status |

### UpdateSyncJobResponse

| Property | Type | Description |
|----------|------|-------------|
| syncJobId | string | Sync job ID |
| status | string | Updated status |

### UpdateUnknownSenderRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Status: pending|allowed|blocked |

### UpdateUserRequest

| Property | Type | Description |
|----------|------|-------------|
| displayName | string | Configurable display name |

### UpdateWebClientRequest

| Property | Type | Description |
|----------|------|-------------|
| status | string | Client status |
| deviceInfo | string | Browser/device information |

### UpdateWebhookRequest

| Property | Type | Description |
|----------|------|-------------|
| eventTypes | array | Subscribed event types |
| callbackUrl | string | Webhook callback URL |
| enabled | boolean | Enable/disable webhook |

### UpdateWidgetRequest

| Property | Type | Description |
|----------|------|-------------|
| name | string | Widget name |
| type | string | Widget type |
| config | object | Widget configuration |

### UploadGroupEventMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| file | string | Media file |
| mediaType | string | image|document |
| encryptedKey | string | Encrypted media key (Signal Protocol) |

### UploadGroupEventMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| mediaId | string | Media ID |
| url | string | Media URL |
| sizeBytes | integer | File size in bytes |

### UploadMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| file | string | Media file binary |

### UploadMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Media ID |
| status | string | Upload status |
| checksum | string | Checksum of uploaded file |

### UploadProductMediaRequest

| Property | Type | Description |
|----------|------|-------------|
| file | string | Media file |
| mediaType | string | image or document |

### UploadProductMediaResponse

| Property | Type | Description |
|----------|------|-------------|
| mediaUrl | string | Uploaded media URL |
| mediaType | string | image or document |

### UserCreatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | User ID |
| displayName | string | Configurable display name |

### UserDeletedResponse

| Property | Type | Description |
|----------|------|-------------|
| status | string | Deletion status |

### UserListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of users |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total count |

### UserResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | User ID |
| displayName | string | Configurable display name |
| createdAt | string | Creation timestamp |

### UserUpdatedResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | User ID |
| displayName | string | Updated display name |

### VerifyAppLockRequest

| Property | Type | Description |
|----------|------|-------------|
| secret | string | Credential to verify |

### VerifyAppLockResponse

| Property | Type | Description |
|----------|------|-------------|
| verified | boolean | Verification result |
| expiresAt | string | Unlock expiry timestamp |

### WebClientListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of web clients |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### WebClientResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Web client ID |
| status | string | Client status |

### WebhookListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of webhooks |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total items |

### WebhookResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Webhook ID |
| eventTypes | array | Subscribed event types |
| callbackUrl | string | Webhook callback URL |
| enabled | boolean | Enable/disable webhook |

### WidgetListResponse

| Property | Type | Description |
|----------|------|-------------|
| items | array | List of widgets |
| page | integer | Current page |
| pageSize | integer | Page size |
| total | integer | Total number of widgets |

### WidgetResponse

| Property | Type | Description |
|----------|------|-------------|
| id | string | Widget ID |
| name | string | Widget name |
| type | string | Widget type |
| config | object | Widget configuration |
| createdAt | string | Creation timestamp (ISO 8601) |
| updatedAt | string | Last update timestamp (ISO 8601) |


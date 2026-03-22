# Data Dictionary: whatsapp-messaging-service Data Dictionary

**Generated:** 2026-03-03T19:49:53.426058

## Summary

- Entities: 32
- Relationships: 32
- Glossary Terms: 22

---

## Entities

### AuditLog

Audit trail of changes in the system

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the audit log entry |
| entity_type | string | 100 | Yes | - | Yes | - | Type of entity changed |
| entity_id | uuid | 36 | Yes | - | Yes | - | Identifier of the entity changed |
| action | enum | - | Yes | - | Yes | create, update, delete | Action performed on the entity |
| old_value | jsonb | - | No | - | - | - | Previous state of the entity |
| new_value | jsonb | - | No | - | - | - | New state of the entity |
| actor_id | uuid | 36 | Yes | User.id | Yes | - | User who performed the action |
| timestamp | datetime | - | Yes | - | Yes | - | When the action occurred |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |

### Chat

Conversation container for messages

*Source Requirements:* WA-MSG-010

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the chat |
| user_id | uuid | 36 | Yes | User.id | Yes | - | User who created or owns the chat |
| chat_type | enum | 20 | Yes | - | Yes | direct, group | Type of chat conversation |
| title | string | 100 | No | - | - | - | Display title of the chat |
| is_locked | boolean | 5 | Yes | - | Yes | - | Indicates if the chat is locked with extra authentication |
| lock_auth_method | enum | 20 | No | - | - | pin, biometric, password | Authentication method required to unlock the chat |
| version | integer | 10 | Yes | - | - | - | Version for concurrent updates to chat settings |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the chat |
| created_at | datetime | 30 | Yes | - | Yes | - | Timestamp when the chat was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the chat was last updated |

### DeliveryReceipt

Tracks message delivery and read status

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the delivery receipt |
| message_id | uuid | 36 | Yes | - | Yes | - | Identifier of the related message |
| recipient_user_id | uuid | 36 | Yes | User.id | Yes | - | Recipient user reference |
| status | enum | - | Yes | - | Yes | sent, delivered, read, failed | Delivery status of the message |
| status_at | datetime | - | Yes | - | - | - | Timestamp when status was recorded |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### Device

User device session for multi-device access

*Source Requirements:* WA-AUTH-004

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the device |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Owner user reference |
| device_name | string | 100 | No | - | - | - | Human-readable device name |
| platform | enum | - | Yes | - | Yes | ios, android, web, desktop | Device platform type |
| device_identifier | string | 255 | Yes | - | Yes | - | Unique device identifier |
| session_token_hash | string | 255 | No | - | Yes | - | Hashed session token for device login |
| last_seen_at | datetime | - | No | - | - | - | Last activity timestamp for the device |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### DeviceSession

Authenticated device sessions for messaging access

*Source Requirements:* WA-MSG-010

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the device session |
| user_id | uuid | 36 | Yes | User.id | Yes | - | User owning the device session |
| device_id | string | 100 | Yes | - | Yes | - | Client device identifier |
| session_token | string | 255 | Yes | - | Yes | - | Token used to authenticate the session |
| last_active_at | datetime | 30 | No | - | Yes | - | Timestamp of last activity for the session |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the session |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the session was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the session was last updated |

### EncryptionKey

Public encryption keys for secure messaging

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the encryption key |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Owner user reference |
| public_key | text | 2000 | Yes | - | - | - | Public key material |
| key_version | integer | - | Yes | - | Yes | - | Version number of the key |
| algorithm | enum | - | Yes | - | Yes | ed25519, rsa, p256 | Encryption algorithm used |
| is_active | boolean | - | Yes | - | Yes | - | Indicates if the key is active |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### Group

Group chat container with settings and invite link

*Source Requirements:* WA-GRP-001, WA-GRP-002, WA-GRP-003, WA-GRP-004, WA-GRP-005

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 255 | Yes | - | Yes | - | Unique identifier for the group |
| user_id | uuid | 255 | Yes | User.id | Yes | - | Owner user who created the group |
| group_name | string | 100 | Yes | - | Yes | - | Group display name |
| settings | jsonb | 255 | No | - | - | - | Configurable group settings and policies |
| invite_link | string | 255 | No | - | Yes | - | Invite link for group entry |
| allow_silent_leave | boolean | 255 | Yes | - | - | - | Whether members can leave without notification |
| created_at | datetime | 255 | Yes | - | - | - | Timestamp when the group was created |
| updated_at | datetime | 255 | Yes | - | - | - | Timestamp when the group was last updated |
| deleted_at | datetime | 255 | No | - | - | - | Timestamp when the group was soft-deleted |
| version | integer | 255 | Yes | - | - | - | Version number for concurrency control |

### GroupMember

Membership of users in groups with roles

*Source Requirements:* WA-GRP-002, WA-GRP-005

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 255 | Yes | - | Yes | - | Unique identifier for the group membership |
| group_id | uuid | 255 | Yes | Group.id | Yes | - | Group associated with the membership |
| user_id | uuid | 255 | Yes | User.id | Yes | - | User associated with the membership |
| role | enum | 255 | Yes | - | Yes | member, admin, owner | Member role in the group |
| left_silently | boolean | 255 | Yes | - | - | - | Whether the member left without notification |
| created_at | datetime | 255 | Yes | - | - | - | Timestamp when the membership was created |
| updated_at | datetime | 255 | Yes | - | - | - | Timestamp when the membership was last updated |
| deleted_at | datetime | 255 | No | - | - | - | Timestamp when the membership was soft-deleted |
| version | integer | 255 | Yes | - | - | - | Version number for concurrency control |

### LinkPreview

Metadata for URL previews and media in messages

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the link preview |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Owner user reference |
| url | string | 2000 | Yes | - | Yes | - | Original URL for the preview |
| title | string | 255 | No | - | - | - | Preview title extracted from the URL |
| description_text | text | 2000 | No | - | - | - | Preview description extracted from the URL |
| image_url | string | 2000 | No | - | - | - | Preview image URL |
| media_type | enum | - | Yes | - | Yes | link, image, video, audio | Type of previewed media |
| fetched_at | datetime | - | Yes | - | - | - | Timestamp when preview data was fetched |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### MediaMetadata

Metadata for media and link previews attached to messages

*Source Requirements:* WA-MSG-002, WA-MSG-009

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the media metadata |
| message_id | uuid | 36 | Yes | Message.id | Yes | - | Message that the media is attached to |
| media_type | enum | 30 | Yes | - | Yes | image, video, audio, document, link_preview, voice | Type of media or preview |
| url | string | 255 | Yes | - | - | - | Location of the media or preview resource |
| mime_type | string | 100 | No | - | - | - | MIME type of the media |
| size_bytes | integer | 20 | No | - | - | - | Size of the media in bytes |
| duration_seconds | integer | 10 | No | - | - | - | Duration of audio/video media in seconds |
| preview_title | string | 255 | No | - | - | - | Title for link preview content |
| preview_description | text | 2000 | No | - | - | - | Description for link preview content |
| view_once | boolean | 5 | Yes | - | Yes | - | Indicates if the media is view-once |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the media metadata |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the media metadata was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the media metadata was last updated |

### Message

Message sent within a chat

*Source Requirements:* WA-MSG-001, WA-MSG-002, WA-MSG-003, WA-MSG-004, WA-MSG-005, WA-MSG-006, WA-MSG-008

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the message |
| chat_id | uuid | 36 | Yes | Chat.id | Yes | - | Chat that the message belongs to |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Sender user of the message |
| message_type | enum | 20 | Yes | - | Yes | text, voice, media, system | Type of message content |
| content | text | 2000 | No | - | - | - | Text content of the message if applicable |
| quoted_message_id | uuid | 36 | No | Message.id | Yes | - | Referenced message being quoted or replied to |
| forwarded_from_message_id | uuid | 36 | No | Message.id | Yes | - | Original message that was forwarded |
| is_ephemeral | boolean | 5 | Yes | - | Yes | - | Indicates if the message is self-deleting |
| expires_at | datetime | 30 | No | - | Yes | - | Scheduled deletion time for self-deleting messages |
| version | integer | 10 | Yes | - | - | - | Version for concurrent edits of the message |
| deleted_at | datetime | 30 | No | - | Yes | - | Soft delete timestamp for the message |
| created_at | datetime | 30 | Yes | - | Yes | - | Timestamp when the message was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the message was last updated |

### MessageReaction

Emoji reactions applied to messages

*Source Requirements:* WA-MSG-007

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the message reaction |
| message_id | uuid | 36 | Yes | Message.id | Yes | - | Message that is being reacted to |
| user_id | uuid | 36 | Yes | User.id | Yes | - | User who added the reaction |
| emoji | string | 50 | Yes | - | Yes | - | Emoji value used for the reaction |
| version | integer | 10 | Yes | - | - | - | Version for concurrent updates to reactions |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the reaction |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the reaction was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the reaction was last updated |

### MessageReceipt

Delivery and read status tracking for messages

*Source Requirements:* WA-MSG-011

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 255 | Yes | - | Yes | - | Unique identifier for the message receipt |
| message_id | uuid | 255 | Yes | Message.id | Yes | - | Message associated with the receipt |
| user_id | uuid | 255 | Yes | User.id | Yes | - | Recipient user of the message |
| status | enum | 255 | Yes | - | Yes | sent, delivered, read, failed | Delivery status for the message |
| status_at | datetime | 255 | Yes | - | - | - | Timestamp of the latest status |
| created_at | datetime | 255 | Yes | - | - | - | Timestamp when the receipt was created |
| updated_at | datetime | 255 | Yes | - | - | - | Timestamp when the receipt was last updated |
| deleted_at | datetime | 255 | No | - | - | - | Timestamp when the receipt was soft-deleted |
| version | integer | 255 | Yes | - | - | - | Version number for concurrency control |

### User

Registered user identified by phone number

*Source Requirements:* WA-AUTH-001, WA-AUTH-002, WA-PROF-004

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the user |
| phone_number | string | 20 | Yes | - | Yes | - | User phone number for registration and login |
| phone_verified_at | datetime | - | No | - | - | - | Timestamp when phone number was verified |
| is_2fa_enabled | boolean | - | Yes | - | Yes | - | Indicates if optional 2FA is enabled |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### UserAuthMethod

Authentication methods for a user such as PIN, biometric, or passkey

*Source Requirements:* WA-AUTH-002, WA-AUTH-003, WA-AUTH-005

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the auth method |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Owner user reference |
| method_type | enum | - | Yes | - | Yes | phone, pin_2fa, biometric, passkey | Type of authentication method |
| secret_hash | string | 255 | No | - | - | - | Hashed secret or credential reference |
| is_enabled | boolean | - | Yes | - | Yes | - | Indicates if this method is enabled |
| last_used_at | datetime | - | No | - | - | - | Timestamp when method was last used |
| metadata | jsonb | - | No | - | - | - | Additional method-specific metadata |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### UserProfile

User profile details for display and discovery

*Source Requirements:* WA-PROF-001, WA-PROF-002, WA-PROF-003, WA-PROF-004, WA-PROF-005

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the profile |
| user_id | uuid | 36 | Yes | User.id | Yes | - | Owner user reference |
| display_name | string | 50 | No | - | Yes | - | Configurable display name |
| info_text | text | 2000 | No | - | - | - | Short profile status or info text |
| profile_image_url | string | 255 | No | - | - | - | Location of the uploaded profile image |
| qr_code_value | string | 255 | No | - | Yes | - | Encoded value for profile QR code |
| show_phone | boolean | - | Yes | - | - | - | Flag to display phone number on profile |
| created_at | datetime | - | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | - | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | - | No | - | - | - | Soft delete timestamp |
| version | integer | - | Yes | - | - | - | Optimistic lock version number |

### audit_log

Audit trail of entity changes

*Source Requirements:* WA-SEC-001, WA-SEC-002, WA-SEC-003, WA-SEC-004

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the audit log entry |
| entity_type | string | 100 | Yes | - | Yes | - | Type of entity changed |
| entity_id | uuid | 36 | Yes | - | Yes | - | Identifier of the entity changed |
| action | enum | - | Yes | - | Yes | create, update, delete | Action performed on the entity |
| old_value | jsonb | - | No | - | - | - | Previous state of the entity |
| new_value | jsonb | - | No | - | - | - | New state of the entity |
| actor_id | uuid | 36 | Yes | user.id | Yes | - | User who performed the action |
| timestamp | datetime | - | Yes | - | Yes | - | Timestamp when the action occurred |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the record was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the record was last updated |

### contact

User-managed contact linked to WhatsApp users and device contacts

*Source Requirements:* WA-CON-001, WA-CON-002, WA-CON-003, WA-CON-004, WA-CON-005, WA-SRC-003

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the contact |
| user_id | uuid | 36 | Yes | user.id | Yes | - | Owner user identifier |
| display_name | string | 100 | Yes | - | - | - | Contact display name |
| phone_number | string | 20 | No | - | Yes | - | Contact phone number for matching |
| whatsapp_user_id | string | 64 | No | - | Yes | - | Linked WhatsApp user identifier |
| is_favorite | boolean | 5 | Yes | - | Yes | - | Indicates if contact is marked as favorite |
| is_unknown_sender | boolean | 5 | Yes | - | Yes | - | Flags contacts classified as unknown sender |
| tags | jsonb | 2000 | No | - | - | - | Business labels/tags for the contact |
| version | integer | 10 | Yes | - | - | - | Optimistic concurrency version |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the contact was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the contact was last updated |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the contact |

### contact_block

User-to-user block list entries

*Source Requirements:* WA-SEC-004

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the block entry |
| blocker_user_id | uuid | 36 | Yes | user.id | Yes | - | User who initiated the block |
| blocked_user_id | uuid | 36 | Yes | user.id | Yes | - | User being blocked |
| reason | string | 255 | No | - | - | - | Optional reason for blocking |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the block was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the block was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the block was soft-deleted |
| version | integer | - | Yes | - | - | - | Version for optimistic concurrency control |

### delivery_receipt

Tracks delivery and read status of messages

*Source Requirements:* WA-SRC-001, WA-SRC-002

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the delivery receipt |
| message_id | uuid | 36 | Yes | message.id | Yes | - | Message associated with this receipt |
| status | enum | 20 | Yes | - | Yes | sent, delivered, read, failed | Delivery status of the message |
| status_at | datetime | 30 | Yes | - | Yes | - | Timestamp when status was recorded |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the receipt was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the receipt was last updated |

### device_session

User device session and app lock settings

*Source Requirements:* WA-SEC-003

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the device session |
| user_id | uuid | 36 | Yes | user.id | Yes | - | Owner user of the device session |
| device_name | string | 100 | Yes | - | - | - | Human-readable device name |
| app_lock_enabled | boolean | - | Yes | - | - | - | Indicates if app lock is enabled |
| auth_method | enum | - | Yes | - | Yes | none, pin, password, biometric | Authentication method for app lock |
| last_active_at | datetime | - | Yes | - | Yes | - | Last time the device session was active |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the session was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the session was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the session was soft-deleted |
| version | integer | - | Yes | - | - | - | Version for optimistic concurrency control |

### encryption_key

End-to-end encryption keys per user

*Source Requirements:* WA-SEC-001, WA-SEC-002

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the encryption key |
| user_id | uuid | 36 | Yes | user.id | Yes | - | Owner user of the encryption key |
| public_key | text | 2000 | Yes | - | - | - | Public key material |
| key_version | integer | - | Yes | - | Yes | - | Version number of the key |
| algorithm | string | 50 | Yes | - | Yes | - | Encryption algorithm identifier |
| verification_status | enum | - | Yes | - | Yes | unverified, verified | Manual verification status for the security code |
| verification_fingerprint | string | 255 | No | - | - | - | Security code or fingerprint used for verification |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the key was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the key was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the key was soft-deleted |
| version | integer | - | Yes | - | - | - | Version for optimistic concurrency control |

### link_preview

Metadata for links and media previews in messages

*Source Requirements:* WA-SRC-002

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the link preview |
| message_id | uuid | 36 | Yes | message.id | Yes | - | Message associated with this preview |
| url | string | 2000 | Yes | - | Yes | - | URL being previewed |
| title | string | 255 | No | - | - | - | Preview title |
| description | string | 500 | No | - | - | - | Preview description text |
| image_url | string | 2000 | No | - | - | - | Preview image URL |
| media_type | enum | 20 | Yes | - | Yes | image, video, audio, document, link | Type of media for filtering |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the preview was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the preview was last updated |

### media

Media attached to messages

*Source Requirements:* NFR-030, NFR-032

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 255 | Yes | - | Yes | - | Primary key for media |
| message_id | uuid | 255 | Yes | message.id | Yes | - | Associated message identifier |
| user_id | uuid | 255 | Yes | user.id | Yes | - | Owner user identifier |
| media_type | enum | 255 | Yes | - | Yes | image, video, audio, file | Type of media content |
| size_bytes | integer | 255 | Yes | - | - | - | Size of media file in bytes |
| storage_url | string | 2000 | Yes | - | - | - | Location of media in storage |
| created_at | datetime | 255 | Yes | - | - | - | Timestamp when media was created |
| updated_at | datetime | 255 | Yes | - | - | - | Timestamp when media was last updated |
| deleted_at | datetime | 255 | No | - | - | - | Timestamp when media was soft-deleted |
| version | integer | 255 | Yes | - | - | - | Version for optimistic concurrency control |

### media_asset

Media metadata for stickers, GIFs, audio, and HD media with link previews

*Source Requirements:* WA-MED-005, WA-MED-006, WA-MED-007, WA-MED-008, WA-MED-009, WA-MED-010

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the media asset |
| user_id | uuid | 36 | Yes | user.id | Yes | - | Owner user of the media asset |
| message_id | uuid | 36 | No | message.id | Yes | - | Message associated with the media asset |
| media_type | enum | - | Yes | - | Yes | sticker, gif, audio, image, video, link_preview | Type of media |
| source | enum | - | Yes | - | Yes | camera, gallery, upload, search, link | Source of the media asset |
| is_hd | boolean | - | Yes | - | - | - | Indicates if media is HD quality |
| file_url | string | 255 | Yes | - | - | - | Storage URL for the media file |
| mime_type | string | 100 | Yes | - | - | - | Media MIME type |
| duration_seconds | integer | - | No | - | - | - | Duration for audio or video media |
| preview_title | string | 255 | No | - | - | - | Link preview title |
| preview_description | string | 2000 | No | - | - | - | Link preview description |
| preview_image_url | string | 255 | No | - | - | - | Link preview image URL |
| target_url | string | 255 | No | - | - | - | Target URL for link preview media |
| metadata | jsonb | - | No | - | - | - | Additional media metadata |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the media asset was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the media asset was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the media asset was soft-deleted |
| version | integer | - | Yes | - | - | - | Version for optimistic concurrency control |

### media_attachment

Media and file attachments for messages

*Source Requirements:* REQ-019

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 255 | Yes | - | Yes | - | Unique identifier for the media attachment |
| message_id | uuid | 255 | Yes | message.id | Yes | - | Message associated with the attachment |
| user_id | uuid | 255 | Yes | user.id | Yes | - | Owner user of the attachment |
| media_type | enum | 255 | Yes | - | Yes | image, video, document, audio, other | Type of media file |
| file_name | string | 255 | No | - | - | - | Original file name |
| file_size_bytes | integer | 255 | Yes | - | - | - | File size in bytes |
| mime_type | string | 100 | Yes | - | Yes | - | MIME type of the file |
| storage_url | string | 500 | Yes | - | - | - | Storage location URL for the file |
| preview_url | string | 500 | No | - | - | - | Preview URL for the attachment |
| checksum | string | 128 | No | - | Yes | - | Integrity checksum of the file |
| created_at | datetime | 255 | Yes | - | - | - | Record creation timestamp |
| updated_at | datetime | 255 | Yes | - | - | - | Record last update timestamp |
| deleted_at | datetime | 255 | No | - | - | - | Soft delete timestamp |
| version | integer | 255 | Yes | - | - | - | Optimistic locking version |

### message_receipt

Delivery and read status tracking for messages

*Source Requirements:* WA-SEC-001

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Unique identifier for the receipt |
| message_id | uuid | 36 | Yes | message.id | Yes | - | Message being tracked |
| recipient_user_id | uuid | 36 | Yes | user.id | Yes | - | Recipient user for the receipt |
| status | enum | - | Yes | - | Yes | sent, delivered, read, failed | Delivery status of the message |
| status_at | datetime | - | Yes | - | Yes | - | Timestamp when the status was recorded |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the receipt was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the receipt was last updated |

### privacy_setting

User privacy settings including online status visibility

*Source Requirements:* WA-SET-001

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the privacy setting |
| user_id | uuid | 36 | Yes | user.id | Yes | - | Owner user identifier |
| online_status_visibility | enum | 20 | Yes | - | Yes | everyone, contacts, nobody | Who can see the user's online status |
| version | integer | 10 | Yes | - | - | - | Optimistic concurrency version |
| created_at | datetime | 30 | Yes | - | - | - | Timestamp when the setting was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the setting was last updated |
| deleted_at | datetime | 30 | No | - | - | - | Soft delete timestamp for the setting |

### reliability_policy

System-wide non-functional policies for reliability and standards.

*Source Requirements:* NFR-040, NFR-041, NFR-042, NFR-043, NFR-044, NFR-045, NFR-046, NFR-047

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | - | Yes | - | Yes | - | Unique identifier for the policy |
| error_budget_percent | decimal | - | Yes | - | - | - | Allowed error budget percentage for reliability |
| window_days | integer | - | Yes | - | - | - | Measurement window in days for error budget |
| deployment_frequency_target | enum | - | Yes | - | - | daily, weekly, on_demand | Target deployment cadence |
| logging_standard | enum | - | Yes | - | - | structured_json | Required logging format standard |
| metrics_thresholds | jsonb | - | Yes | - | - | - | Configuration for key metrics and alert thresholds |
| accessibility_standard | enum | - | Yes | - | - | wcag_2_1_aa | Accessibility compliance standard |
| api_standard_version | string | 50 | Yes | - | - | - | API standard version required for integrations |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the policy was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the policy was last updated |
| version | integer | - | Yes | - | - | - | Row version for optimistic locking |

### resilience_policy

Backup and recovery objectives for system resiliency

*Source Requirements:* NFR-050, NFR-051, NFR-052

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | 36 | Yes | - | Yes | - | Primary key for the resilience policy |
| scope | enum | 20 | Yes | - | Yes | system, region | Policy scope level |
| backup_frequency_minutes | integer | 10 | Yes | - | - | - | Backup frequency in minutes |
| retention_days | integer | 10 | Yes | - | - | - | Retention period for backups in days |
| replication_regions | string | 255 | Yes | - | - | - | Comma-separated regions for backup replication |
| rpo_minutes | integer | 10 | Yes | - | - | - | Recovery point objective in minutes |
| rto_minutes | integer | 10 | Yes | - | - | - | Recovery time objective in minutes |
| max_message_size_bytes | integer | 10 | Yes | - | - | - | Maximum allowed message size in bytes |
| max_media_size_bytes | integer | 10 | Yes | - | - | - | Maximum allowed media size in bytes |
| version | integer | 10 | Yes | - | - | - | Version for optimistic concurrency control |
| created_at | datetime | 30 | Yes | - | Yes | - | Timestamp when the policy was created |
| updated_at | datetime | 30 | Yes | - | - | - | Timestamp when the policy was last updated |

### session

User sessions tied to devices for messaging access.

*Source Requirements:* NFR-048

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | - | Yes | - | Yes | - | Unique identifier for the session |
| user_id | uuid | - | Yes | user.id | Yes | - | User who owns the session |
| device_id | uuid | - | Yes | device.id | Yes | - | Device associated with the session |
| session_token | string | 255 | Yes | - | Yes | - | Token used to authenticate the session |
| started_at | datetime | - | Yes | - | - | - | Session start timestamp |
| ended_at | datetime | - | No | - | - | - | Session end timestamp if terminated |
| ip_address | string | 45 | No | - | Yes | - | Client IP address for the session |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the session was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the session was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the session was soft-deleted |
| version | integer | - | Yes | - | - | - | Row version for optimistic locking |

### user_storage_limit

Storage quotas and usage per user.

*Source Requirements:* NFR-049

| Attribute | Type | MaxLen | Required | FK Target | Indexed | Enum Values | Description |
|-----------|------|--------|----------|-----------|---------|-------------|-------------|
| id | uuid | - | Yes | - | Yes | - | Unique identifier for the storage limit record |
| user_id | uuid | - | Yes | user.id | Yes | - | User to which the storage limit applies |
| storage_quota_mb | integer | - | Yes | - | - | - | Allocated storage quota in megabytes |
| storage_used_mb | integer | - | Yes | - | - | - | Current storage used in megabytes |
| enforcement_status | enum | - | Yes | - | Yes | within_limit, near_limit, over_limit | Current enforcement status for quota limits |
| last_calculated_at | datetime | - | No | - | - | - | Timestamp when usage was last calculated |
| created_at | datetime | - | Yes | - | - | - | Timestamp when the storage limit record was created |
| updated_at | datetime | - | Yes | - | - | - | Timestamp when the storage limit record was last updated |
| deleted_at | datetime | - | No | - | - | - | Timestamp when the storage limit record was soft-deleted |
| version | integer | - | Yes | - | - | - | Row version for optimistic locking |

---

## Relationships

| Relationship | Source | Target | Cardinality | Description |
|--------------|--------|--------|-------------|-------------|
| has_profile | User | UserProfile | 1:1 |  |
| has_auth_method | User | UserAuthMethod | 1:N |  |
| uses_device | User | Device | 1:N |  |
| owns_key | User | EncryptionKey | 1:N |  |
| receives_receipt | User | DeliveryReceipt | 1:N |  |
| creates_link_preview | User | LinkPreview | 1:N |  |
| acts_in_audit | User | AuditLog | 1:N |  |
| has_messages | Chat | Message | 1:N |  |
| has_reactions | Message | MessageReaction | 1:N |  |
| has_receipts | Message | DeliveryReceipt | 1:N |  |
| has_media | Message | MediaMetadata | 1:N |  |
| has_sessions | User | DeviceSession | 1:N |  |
| owns | User | Group | 1:N |  |
| has_members | Group | GroupMember | 1:N |  |
| is_member | User | GroupMember | 1:N |  |
| receives | Group | Message | 1:N |  |
| sends | User | Message | 1:N |  |
| has_receipts | Message | MessageReceipt | 1:N |  |
| has_sessions | user | device_session | 1:N |  |
| has_keys | user | encryption_key | 1:N |  |
| sends | user | message | 1:N |  |
| has_receipts | message | message_receipt | 1:N |  |
| has_media | message | media_asset | 1:N |  |
| blocks | user | user | N:M |  |
| sends | contact | message | 1:N |  |
| has_receipt | message | delivery_receipt | 1:N |  |
| has_preview | message | link_preview | 1:N |  |
| has_attachments | message | media_attachment | 1:N |  |
| receives | user | delivery_receipt | 1:N |  |
| acts_in | user | audit_log | 1:N |  |
| has_media | message | media | 1:N |  |
| has_sessions | device | session | 1:N |  |

---

## Glossary

### 2FA

Two-factor authentication using a secondary factor such as a PIN

### E2E encryption

End-to-end encryption where only sender and recipient can read message content

### Link Preview

Extracted metadata used to render a preview of a URL

### Passkey

Passwordless authentication credential based on public key cryptography

### Smart Reply

AI-generated suggested replies based on conversation context

### broadcast_listen

Sending a single message to multiple recipients

### delivery_receipt

Record of message delivery status per recipient

### device

Client device registered for messaging access.

### end-to-end encryption

Encryption where only sender and recipient can decrypt messages

### error_budget

Maximum allowable error rate within a time window.

### failover

Automatic switch to standby components during failures

### formatted_text

Text containing basic formatting like bold or italics

### invite_link

Shareable link that allows users to join a group

### link_preview

Metadata representation of a URL shared in a message.

### media asset

Metadata for attached media such as stickers, GIFs, audio, or link previews

### mention

Explicit reference to a user in a group message using @ syntax

### message receipt

Record of delivery or read status for a message

### online_status_visibility

Privacy setting that controls who can see the user's last online status.

### rpo

Maximum acceptable data loss measured in time

### rto

Maximum acceptable downtime measured in time

### throughput

Rate at which media or messages are processed or transferred

### unknown_sender

A contact not recognized from the user’s address book, handled separately.


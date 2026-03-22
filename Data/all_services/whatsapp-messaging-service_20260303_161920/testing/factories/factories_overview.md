# Test Data Factories

**Generated:** 2026-03-03T21:50:51.667636

**Language:** TypeScript (@faker-js/faker)

**Database:** postgresql

**Total Factories:** 32

## Factory Summary

| Entity | Table | Fields | Dependencies |
|--------|-------|--------|-------------|
| User | `user` | 8 | - |
| UserProfile | `user_profile` | 11 | User |
| UserAuthMethod | `user_auth_method` | 11 | User |
| Device | `device` | 11 | User |
| EncryptionKey | `encryption_key` | 10 | User |
| DeliveryReceipt | `delivery_receipt` | 9 | User |
| LinkPreview | `link_preview` | 12 | User |
| AuditLog | `audit_log` | 10 | User |
| DeviceSession | `device_session` | 8 | User |
| Chat | `chat` | 10 | User |
| Message | `message` | 13 | Chat, User |
| MessageReaction | `message_reaction` | 8 | Message, User |
| MediaMetadata | `media_metadata` | 13 | Message |
| Group | `group` | 10 | User |
| GroupMember | `group_member` | 9 | User, Group |
| MessageReceipt | `message_receipt` | 9 | Message, User |
| device_session | `device_session` | 10 | user |
| encryption_key | `encryption_key` | 11 | user |
| message_receipt | `message_receipt` | 7 | message, user |
| media_asset | `media_asset` | 18 | user, message |
| contact_block | `contact_block` | 8 | user |
| audit_log | `audit_log` | 10 | user |
| contact | `contact` | 12 | user |
| delivery_receipt | `delivery_receipt` | 6 | message |
| link_preview | `link_preview` | 9 | message |
| privacy_setting | `privacy_setting` | 7 | user |
| media_attachment | `media_attachment` | 14 | message, user |
| media | `media` | 10 | message, user |
| session | `session` | 11 | user, device |
| user_storage_limit | `user_storage_limit` | 10 | user |
| reliability_policy | `reliability_policy` | 11 | - |
| resilience_policy | `resilience_policy` | 12 | - |

## Usage

```typescript
import { createUser, createBatch } from './factories';

// Create a single user
const user = createUser();

// Create with overrides
const admin = createUser({ email: 'admin@example.com' });

// Create batch
const users = createBatch(createUser, 10);
```


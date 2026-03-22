-- Seed data for development database (postgresql)
-- Generated: 2026-03-03T21:50:51.666634
-- Insert 3 sample rows per entity

-- User
INSERT INTO user (id, phone_number, phone_verified_at, is_2fa_enabled, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_phone_number_1', '2026-01-01 12:00:00+00', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO user (id, phone_number, phone_verified_at, is_2fa_enabled, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_phone_number_2', '2026-01-02 12:00:00+00', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO user (id, phone_number, phone_verified_at, is_2fa_enabled, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_phone_number_3', '2026-01-03 12:00:00+00', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- UserProfile
INSERT INTO user_profile (id, display_name, info_text, profile_image_url, qr_code_value, show_phone, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_display_name_1', 'sample_info_text_1', 'sample_profile_image_url_1', 'sample_qr_code_value_1', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO user_profile (id, display_name, info_text, profile_image_url, qr_code_value, show_phone, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_display_name_2', 'sample_info_text_2', 'sample_profile_image_url_2', 'sample_qr_code_value_2', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO user_profile (id, display_name, info_text, profile_image_url, qr_code_value, show_phone, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_display_name_3', 'sample_info_text_3', 'sample_profile_image_url_3', 'sample_qr_code_value_3', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- UserAuthMethod
INSERT INTO user_auth_method (id, method_type, secret_hash, is_enabled, last_used_at, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'sample_secret_hash_1', FALSE, '2026-01-01 12:00:00+00', '{}', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO user_auth_method (id, method_type, secret_hash, is_enabled, last_used_at, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'sample_secret_hash_2', TRUE, '2026-01-02 12:00:00+00', '{}', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO user_auth_method (id, method_type, secret_hash, is_enabled, last_used_at, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'sample_secret_hash_3', FALSE, '2026-01-03 12:00:00+00', '{}', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- Device
INSERT INTO device (id, device_name, platform, device_identifier, session_token_hash, last_seen_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_device_name_1', 'value_1', 'sample_device_identifier_1', 'sample_session_token_hash_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO device (id, device_name, platform, device_identifier, session_token_hash, last_seen_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_device_name_2', 'value_2', 'sample_device_identifier_2', 'sample_session_token_hash_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO device (id, device_name, platform, device_identifier, session_token_hash, last_seen_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_device_name_3', 'value_3', 'sample_device_identifier_3', 'sample_session_token_hash_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- EncryptionKey
INSERT INTO encryption_key (id, public_key, key_version, algorithm, is_active, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_public_key_1', 100, 'value_1', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO encryption_key (id, public_key, key_version, algorithm, is_active, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_public_key_2', 200, 'value_2', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO encryption_key (id, public_key, key_version, algorithm, is_active, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_public_key_3', 300, 'value_3', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- DeliveryReceipt
INSERT INTO delivery_receipt (id, message_id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO delivery_receipt (id, message_id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO delivery_receipt (id, message_id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000003', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- LinkPreview
INSERT INTO link_preview (id, url, title, description_text, image_url, media_type, fetched_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_url_1', 'sample_title_1', 'sample_description_text_1', 'sample_image_url_1', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO link_preview (id, url, title, description_text, image_url, media_type, fetched_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_url_2', 'sample_title_2', 'sample_description_text_2', 'sample_image_url_2', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO link_preview (id, url, title, description_text, image_url, media_type, fetched_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_url_3', 'sample_title_3', 'sample_description_text_3', 'sample_image_url_3', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- AuditLog
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_entity_type_1', '00000000-0000-0000-0000-000000000001', 'value_1', '{}', '{}', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_entity_type_2', '00000000-0000-0000-0000-000000000002', 'value_2', '{}', '{}', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_entity_type_3', '00000000-0000-0000-0000-000000000003', 'value_3', '{}', '{}', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- DeviceSession
INSERT INTO device_session (id, device_id, session_token, last_active_at, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_device_id_1', 'sample_session_token_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO device_session (id, device_id, session_token, last_active_at, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_device_id_2', 'sample_session_token_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO device_session (id, device_id, session_token, last_active_at, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_device_id_3', 'sample_session_token_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- Chat
INSERT INTO chat (id, chat_type, title, is_locked, lock_auth_method, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'sample_title_1', FALSE, 'value_1', 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO chat (id, chat_type, title, is_locked, lock_auth_method, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'sample_title_2', TRUE, 'value_2', 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO chat (id, chat_type, title, is_locked, lock_auth_method, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'sample_title_3', FALSE, 'value_3', 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- Message
INSERT INTO message (id, message_type, content, is_ephemeral, expires_at, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'sample_content_1', FALSE, '2026-01-01 12:00:00+00', 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO message (id, message_type, content, is_ephemeral, expires_at, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'sample_content_2', TRUE, '2026-01-02 12:00:00+00', 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO message (id, message_type, content, is_ephemeral, expires_at, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'sample_content_3', FALSE, '2026-01-03 12:00:00+00', 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- MessageReaction
INSERT INTO message_reaction (id, emoji, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_emoji_1', 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO message_reaction (id, emoji, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_emoji_2', 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO message_reaction (id, emoji, version, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_emoji_3', 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- MediaMetadata
INSERT INTO media_metadata (id, media_type, url, mime_type, size_bytes, duration_seconds, preview_title, preview_description, view_once, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'sample_url_1', 'sample_mime_type_1', 100, 100, 'sample_preview_title_1', 'sample_preview_description_1', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO media_metadata (id, media_type, url, mime_type, size_bytes, duration_seconds, preview_title, preview_description, view_once, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'sample_url_2', 'sample_mime_type_2', 200, 200, 'sample_preview_title_2', 'sample_preview_description_2', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO media_metadata (id, media_type, url, mime_type, size_bytes, duration_seconds, preview_title, preview_description, view_once, deleted_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'sample_url_3', 'sample_mime_type_3', 300, 300, 'sample_preview_title_3', 'sample_preview_description_3', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- Group
INSERT INTO group (id, group_name, settings, invite_link, allow_silent_leave, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_group_name_1', '{}', 'sample_invite_link_1', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO group (id, group_name, settings, invite_link, allow_silent_leave, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_group_name_2', '{}', 'sample_invite_link_2', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO group (id, group_name, settings, invite_link, allow_silent_leave, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_group_name_3', '{}', 'sample_invite_link_3', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- GroupMember
INSERT INTO group_member (id, role, left_silently, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', FALSE, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO group_member (id, role, left_silently, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', TRUE, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO group_member (id, role, left_silently, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', FALSE, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- MessageReceipt
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- device_session
INSERT INTO device_session (id, device_name, app_lock_enabled, auth_method, last_active_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_device_name_1', FALSE, 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO device_session (id, device_name, app_lock_enabled, auth_method, last_active_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_device_name_2', TRUE, 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO device_session (id, device_name, app_lock_enabled, auth_method, last_active_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_device_name_3', FALSE, 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- encryption_key
INSERT INTO encryption_key (id, public_key, key_version, algorithm, verification_status, verification_fingerprint, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_public_key_1', 100, 'sample_algorithm_1', 'value_1', 'sample_verification_fingerprint_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO encryption_key (id, public_key, key_version, algorithm, verification_status, verification_fingerprint, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_public_key_2', 200, 'sample_algorithm_2', 'value_2', 'sample_verification_fingerprint_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO encryption_key (id, public_key, key_version, algorithm, verification_status, verification_fingerprint, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_public_key_3', 300, 'sample_algorithm_3', 'value_3', 'sample_verification_fingerprint_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- message_receipt
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO message_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- media_asset
INSERT INTO media_asset (id, media_type, source, is_hd, file_url, mime_type, duration_seconds, preview_title, preview_description, preview_image_url, target_url, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'value_1', FALSE, 'sample_file_url_1', 'sample_mime_type_1', 100, 'sample_preview_title_1', 'sample_preview_description_1', 'sample_preview_image_url_1', 'sample_target_url_1', '{}', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO media_asset (id, media_type, source, is_hd, file_url, mime_type, duration_seconds, preview_title, preview_description, preview_image_url, target_url, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'value_2', TRUE, 'sample_file_url_2', 'sample_mime_type_2', 200, 'sample_preview_title_2', 'sample_preview_description_2', 'sample_preview_image_url_2', 'sample_target_url_2', '{}', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO media_asset (id, media_type, source, is_hd, file_url, mime_type, duration_seconds, preview_title, preview_description, preview_image_url, target_url, metadata, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'value_3', FALSE, 'sample_file_url_3', 'sample_mime_type_3', 300, 'sample_preview_title_3', 'sample_preview_description_3', 'sample_preview_image_url_3', 'sample_target_url_3', '{}', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- contact_block
INSERT INTO contact_block (id, reason, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_reason_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO contact_block (id, reason, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_reason_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO contact_block (id, reason, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_reason_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- audit_log
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_entity_type_1', '00000000-0000-0000-0000-000000000001', 'value_1', '{}', '{}', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_entity_type_2', '00000000-0000-0000-0000-000000000002', 'value_2', '{}', '{}', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO audit_log (id, entity_type, entity_id, action, old_value, new_value, timestamp, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_entity_type_3', '00000000-0000-0000-0000-000000000003', 'value_3', '{}', '{}', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- contact
INSERT INTO contact (id, display_name, phone_number, whatsapp_user_id, is_favorite, is_unknown_sender, tags, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_display_name_1', 'sample_phone_number_1', 'sample_whatsapp_user_id_1', FALSE, FALSE, '{}', 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO contact (id, display_name, phone_number, whatsapp_user_id, is_favorite, is_unknown_sender, tags, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_display_name_2', 'sample_phone_number_2', 'sample_whatsapp_user_id_2', TRUE, TRUE, '{}', 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO contact (id, display_name, phone_number, whatsapp_user_id, is_favorite, is_unknown_sender, tags, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_display_name_3', 'sample_phone_number_3', 'sample_whatsapp_user_id_3', FALSE, FALSE, '{}', 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- delivery_receipt
INSERT INTO delivery_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO delivery_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO delivery_receipt (id, status, status_at, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- link_preview
INSERT INTO link_preview (id, url, title, description, image_url, media_type, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_url_1', 'sample_title_1', 'sample_description_1', 'sample_image_url_1', 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO link_preview (id, url, title, description, image_url, media_type, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_url_2', 'sample_title_2', 'sample_description_2', 'sample_image_url_2', 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO link_preview (id, url, title, description, image_url, media_type, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_url_3', 'sample_title_3', 'sample_description_3', 'sample_image_url_3', 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- privacy_setting
INSERT INTO privacy_setting (id, online_status_visibility, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO privacy_setting (id, online_status_visibility, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO privacy_setting (id, online_status_visibility, version, created_at, updated_at, deleted_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

-- media_attachment
INSERT INTO media_attachment (id, media_type, file_name, file_size_bytes, mime_type, storage_url, preview_url, checksum, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 'sample_file_name_1', 100, 'sample_mime_type_1', 'sample_storage_url_1', 'sample_preview_url_1', 'sample_checksum_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO media_attachment (id, media_type, file_name, file_size_bytes, mime_type, storage_url, preview_url, checksum, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 'sample_file_name_2', 200, 'sample_mime_type_2', 'sample_storage_url_2', 'sample_preview_url_2', 'sample_checksum_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO media_attachment (id, media_type, file_name, file_size_bytes, mime_type, storage_url, preview_url, checksum, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 'sample_file_name_3', 300, 'sample_mime_type_3', 'sample_storage_url_3', 'sample_preview_url_3', 'sample_checksum_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- media
INSERT INTO media (id, media_type, size_bytes, storage_url, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 100, 'sample_storage_url_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO media (id, media_type, size_bytes, storage_url, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 200, 'sample_storage_url_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO media (id, media_type, size_bytes, storage_url, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 300, 'sample_storage_url_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- session
INSERT INTO session (id, session_token, started_at, ended_at, ip_address, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 'sample_session_token_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 'sample_ip_address_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO session (id, session_token, started_at, ended_at, ip_address, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 'sample_session_token_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 'sample_ip_address_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO session (id, session_token, started_at, ended_at, ip_address, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 'sample_session_token_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 'sample_ip_address_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- user_storage_limit
INSERT INTO user_storage_limit (id, storage_quota_mb, storage_used_mb, enforcement_status, last_calculated_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 100, 100, 'value_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO user_storage_limit (id, storage_quota_mb, storage_used_mb, enforcement_status, last_calculated_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 200, 200, 'value_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO user_storage_limit (id, storage_quota_mb, storage_used_mb, enforcement_status, last_calculated_at, created_at, updated_at, deleted_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 300, 300, 'value_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- reliability_policy
INSERT INTO reliability_policy (id, error_budget_percent, window_days, deployment_frequency_target, logging_standard, metrics_thresholds, accessibility_standard, api_standard_version, created_at, updated_at, version) VALUES ('00000000-0000-0000-0000-000000000001', 10.5, 100, 'value_1', 'value_1', '{}', 'value_1', 'sample_api_standard_version_1', '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00', 100);
INSERT INTO reliability_policy (id, error_budget_percent, window_days, deployment_frequency_target, logging_standard, metrics_thresholds, accessibility_standard, api_standard_version, created_at, updated_at, version) VALUES ('00000000-0000-0000-0000-000000000002', 21.0, 200, 'value_2', 'value_2', '{}', 'value_2', 'sample_api_standard_version_2', '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00', 200);
INSERT INTO reliability_policy (id, error_budget_percent, window_days, deployment_frequency_target, logging_standard, metrics_thresholds, accessibility_standard, api_standard_version, created_at, updated_at, version) VALUES ('00000000-0000-0000-0000-000000000003', 31.5, 300, 'value_3', 'value_3', '{}', 'value_3', 'sample_api_standard_version_3', '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00', 300);

-- resilience_policy
INSERT INTO resilience_policy (id, scope, backup_frequency_minutes, retention_days, replication_regions, rpo_minutes, rto_minutes, max_message_size_bytes, max_media_size_bytes, version, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000001', 'value_1', 100, 100, 'sample_replication_regions_1', 100, 100, 100, 100, 100, '2026-01-01 12:00:00+00', '2026-01-01 12:00:00+00');
INSERT INTO resilience_policy (id, scope, backup_frequency_minutes, retention_days, replication_regions, rpo_minutes, rto_minutes, max_message_size_bytes, max_media_size_bytes, version, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000002', 'value_2', 200, 200, 'sample_replication_regions_2', 200, 200, 200, 200, 200, '2026-01-02 12:00:00+00', '2026-01-02 12:00:00+00');
INSERT INTO resilience_policy (id, scope, backup_frequency_minutes, retention_days, replication_regions, rpo_minutes, rto_minutes, max_message_size_bytes, max_media_size_bytes, version, created_at, updated_at) VALUES ('00000000-0000-0000-0000-000000000003', 'value_3', 300, 300, 'sample_replication_regions_3', 300, 300, 300, 300, 300, '2026-01-03 12:00:00+00', '2026-01-03 12:00:00+00');

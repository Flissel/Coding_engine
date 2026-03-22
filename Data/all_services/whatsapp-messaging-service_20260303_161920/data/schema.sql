-- PostgreSQL Schema: whatsapp-messaging-service Data Dictionary
-- Generated: 2026-03-03T20:08:55.349962
-- Entities: 32, Relationships: 32

-- ============================================
-- ENUM TYPES
-- ============================================

CREATE TYPE accessibility_standard_type AS ENUM ('wcag_2_1_aa');
CREATE TYPE action_type AS ENUM ('create', 'update', 'delete');
CREATE TYPE algorithm_type AS ENUM ('ed25519', 'rsa', 'p256');
CREATE TYPE auth_method_type AS ENUM ('none', 'pin', 'password', 'biometric');
CREATE TYPE chat_type_type AS ENUM ('direct', 'group');
CREATE TYPE deployment_frequency_target_type AS ENUM ('daily', 'weekly', 'on_demand');
CREATE TYPE enforcement_status_type AS ENUM ('within_limit', 'near_limit', 'over_limit');
CREATE TYPE lock_auth_method_type AS ENUM ('pin', 'biometric', 'password');
CREATE TYPE logging_standard_type AS ENUM ('structured_json');
CREATE TYPE media_type_type AS ENUM ('link', 'image', 'video', 'audio');
CREATE TYPE message_type_type AS ENUM ('text', 'voice', 'media', 'system');
CREATE TYPE method_type_type AS ENUM ('phone', 'pin_2fa', 'biometric', 'passkey');
CREATE TYPE online_status_visibility_type AS ENUM ('everyone', 'contacts', 'nobody');
CREATE TYPE platform_type AS ENUM ('ios', 'android', 'web', 'desktop');
CREATE TYPE role_type AS ENUM ('member', 'admin', 'owner');
CREATE TYPE scope_type AS ENUM ('system', 'region');
CREATE TYPE source_type AS ENUM ('camera', 'gallery', 'upload', 'search', 'link');
CREATE TYPE status_type AS ENUM ('sent', 'delivered', 'read', 'failed');
CREATE TYPE verification_status_type AS ENUM ('unverified', 'verified');

-- ============================================
-- TABLES
-- ============================================

-- Registered user identified by phone number
CREATE TABLE user (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    phone_number VARCHAR(20) NOT NULL,
    phone_verified_at TIMESTAMP WITH TIME ZONE,
    is_2fa_enabled BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- User device session and app lock settings
CREATE TABLE device_session (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    device_name VARCHAR(100) NOT NULL,
    app_lock_enabled BOOLEAN NOT NULL,
    auth_method auth_method_type NOT NULL,
    last_active_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- End-to-end encryption keys per user
CREATE TABLE encryption_key (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    public_key TEXT NOT NULL,
    key_version INTEGER NOT NULL,
    algorithm VARCHAR(50) NOT NULL,
    verification_status verification_status_type NOT NULL,
    verification_fingerprint VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Delivery and read status tracking for messages
CREATE TABLE message_receipt (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    recipient_user_id UUID NOT NULL,
    status status_type NOT NULL,
    status_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Media metadata for stickers, GIFs, audio, and HD media with link previews
CREATE TABLE media_asset (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    message_id UUID,
    media_type media_type_type NOT NULL,
    source source_type NOT NULL,
    is_hd BOOLEAN NOT NULL,
    file_url VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    duration_seconds INTEGER,
    preview_title VARCHAR(255),
    preview_description VARCHAR(2000),
    preview_image_url VARCHAR(255),
    target_url VARCHAR(255),
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- User-to-user block list entries
CREATE TABLE contact_block (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    blocker_user_id UUID NOT NULL,
    blocked_user_id UUID NOT NULL,
    reason VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Audit trail of entity changes
CREATE TABLE audit_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_type VARCHAR(100) NOT NULL,
    entity_id UUID NOT NULL,
    action action_type NOT NULL,
    old_value JSONB,
    new_value JSONB,
    actor_id UUID NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- User-managed contact linked to WhatsApp users and device contacts
CREATE TABLE contact (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    whatsapp_user_id VARCHAR(64),
    is_favorite BOOLEAN NOT NULL,
    is_unknown_sender BOOLEAN NOT NULL,
    tags JSONB,
    version INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- Tracks delivery and read status of messages
CREATE TABLE delivery_receipt (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    status status_type NOT NULL,
    status_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Metadata for links and media previews in messages
CREATE TABLE link_preview (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    url VARCHAR(2000) NOT NULL,
    title VARCHAR(255),
    description VARCHAR(500),
    image_url VARCHAR(2000),
    media_type media_type_type NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- User privacy settings including online status visibility
CREATE TABLE privacy_setting (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    online_status_visibility online_status_visibility_type NOT NULL,
    version INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- Media and file attachments for messages
CREATE TABLE media_attachment (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    user_id UUID NOT NULL,
    media_type media_type_type NOT NULL,
    file_name VARCHAR(255),
    file_size_bytes INTEGER NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    storage_url VARCHAR(500) NOT NULL,
    preview_url VARCHAR(500),
    checksum VARCHAR(128),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Media attached to messages
CREATE TABLE media (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    user_id UUID NOT NULL,
    media_type media_type_type NOT NULL,
    size_bytes INTEGER NOT NULL,
    storage_url VARCHAR(2000) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- User sessions tied to devices for messaging access.
CREATE TABLE session (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    device_id UUID NOT NULL,
    session_token VARCHAR(255) NOT NULL,
    started_at TIMESTAMP WITH TIME ZONE NOT NULL,
    ended_at TIMESTAMP WITH TIME ZONE,
    ip_address VARCHAR(45),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Storage quotas and usage per user.
CREATE TABLE user_storage_limit (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    storage_quota_mb INTEGER NOT NULL,
    storage_used_mb INTEGER NOT NULL,
    enforcement_status enforcement_status_type NOT NULL,
    last_calculated_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- System-wide non-functional policies for reliability and standards.
CREATE TABLE reliability_policy (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    error_budget_percent DECIMAL(10, 2) NOT NULL,
    window_days INTEGER NOT NULL,
    deployment_frequency_target deployment_frequency_target_type NOT NULL,
    logging_standard logging_standard_type NOT NULL,
    metrics_thresholds JSONB NOT NULL,
    accessibility_standard accessibility_standard_type NOT NULL,
    api_standard_version VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    version INTEGER NOT NULL
);

-- Backup and recovery objectives for system resiliency
CREATE TABLE resilience_policy (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    scope scope_type NOT NULL,
    backup_frequency_minutes INTEGER NOT NULL,
    retention_days INTEGER NOT NULL,
    replication_regions VARCHAR(255) NOT NULL,
    rpo_minutes INTEGER NOT NULL,
    rto_minutes INTEGER NOT NULL,
    max_message_size_bytes INTEGER NOT NULL,
    max_media_size_bytes INTEGER NOT NULL,
    version INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- User profile details for display and discovery
CREATE TABLE user_profile (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    display_name VARCHAR(50),
    info_text TEXT,
    profile_image_url VARCHAR(255),
    qr_code_value VARCHAR(255),
    show_phone BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Authentication methods for a user such as PIN, biometric, or passkey
CREATE TABLE user_auth_method (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    method_type method_type_type NOT NULL,
    secret_hash VARCHAR(255),
    is_enabled BOOLEAN NOT NULL,
    last_used_at TIMESTAMP WITH TIME ZONE,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- User device session for multi-device access
CREATE TABLE device (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    device_name VARCHAR(100),
    platform platform_type NOT NULL,
    device_identifier VARCHAR(255) NOT NULL,
    session_token_hash VARCHAR(255),
    last_seen_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Public encryption keys for secure messaging
CREATE TABLE encryption_key (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    public_key TEXT NOT NULL,
    key_version INTEGER NOT NULL,
    algorithm algorithm_type NOT NULL,
    is_active BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Tracks message delivery and read status
CREATE TABLE delivery_receipt (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    recipient_user_id UUID NOT NULL,
    status status_type NOT NULL,
    status_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Metadata for URL previews and media in messages
CREATE TABLE link_preview (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    url VARCHAR(2000) NOT NULL,
    title VARCHAR(255),
    description_text TEXT,
    image_url VARCHAR(2000),
    media_type media_type_type NOT NULL,
    fetched_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Audit trail of changes in the system
CREATE TABLE audit_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_type VARCHAR(100) NOT NULL,
    entity_id UUID NOT NULL,
    action action_type NOT NULL,
    old_value JSONB,
    new_value JSONB,
    actor_id UUID NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Authenticated device sessions for messaging access
CREATE TABLE device_session (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    device_id VARCHAR(100) NOT NULL,
    session_token VARCHAR(255) NOT NULL,
    last_active_at TIMESTAMP WITH TIME ZONE,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Conversation container for messages
CREATE TABLE chat (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    chat_type chat_type_type NOT NULL,
    title VARCHAR(100),
    is_locked BOOLEAN NOT NULL,
    lock_auth_method lock_auth_method_type,
    version INTEGER NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Group chat container with settings and invite link
CREATE TABLE group (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    group_name VARCHAR(100) NOT NULL,
    settings JSONB,
    invite_link VARCHAR(255),
    allow_silent_leave BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Message sent within a chat
CREATE TABLE message (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    chat_id UUID NOT NULL,
    user_id UUID NOT NULL,
    message_type message_type_type NOT NULL,
    content TEXT,
    quoted_message_id UUID,
    forwarded_from_message_id UUID,
    is_ephemeral BOOLEAN NOT NULL,
    expires_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Membership of users in groups with roles
CREATE TABLE group_member (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    group_id UUID NOT NULL,
    user_id UUID NOT NULL,
    role role_type NOT NULL,
    left_silently BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- Emoji reactions applied to messages
CREATE TABLE message_reaction (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    user_id UUID NOT NULL,
    emoji VARCHAR(50) NOT NULL,
    version INTEGER NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Metadata for media and link previews attached to messages
CREATE TABLE media_metadata (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    media_type media_type_type NOT NULL,
    url VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100),
    size_bytes INTEGER,
    duration_seconds INTEGER,
    preview_title VARCHAR(255),
    preview_description TEXT,
    view_once BOOLEAN NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Delivery and read status tracking for messages
CREATE TABLE message_receipt (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id UUID NOT NULL,
    user_id UUID NOT NULL,
    status status_type NOT NULL,
    status_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE,
    version INTEGER NOT NULL
);

-- ============================================
-- JUNCTION TABLES
-- ============================================

-- Junction table: user <-> user
CREATE TABLE contact_block (
    contact_block.blocker_user_id UUID NOT NULL REFERENCES user(id) ON DELETE CASCADE,
    contact_block.blocked_user_id UUID NOT NULL REFERENCES user(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    PRIMARY KEY (contact_block.blocker_user_id, contact_block.blocked_user_id)
);

-- ============================================
-- FOREIGN KEY CONSTRAINTS
-- ============================================

ALTER TABLE device_session ADD CONSTRAINT fk_device_session_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE encryption_key ADD CONSTRAINT fk_encryption_key_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE message_receipt ADD CONSTRAINT fk_message_receipt_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE message_receipt ADD CONSTRAINT fk_message_receipt_recipient_user_id FOREIGN KEY (recipient_user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE media_asset ADD CONSTRAINT fk_media_asset_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE media_asset ADD CONSTRAINT fk_media_asset_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE SET NULL;
ALTER TABLE contact_block ADD CONSTRAINT fk_contact_block_blocker_user_id FOREIGN KEY (blocker_user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE contact_block ADD CONSTRAINT fk_contact_block_blocked_user_id FOREIGN KEY (blocked_user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_actor_id FOREIGN KEY (actor_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE contact ADD CONSTRAINT fk_contact_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE delivery_receipt ADD CONSTRAINT fk_delivery_receipt_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE link_preview ADD CONSTRAINT fk_link_preview_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE privacy_setting ADD CONSTRAINT fk_privacy_setting_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE media_attachment ADD CONSTRAINT fk_media_attachment_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE media_attachment ADD CONSTRAINT fk_media_attachment_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE media ADD CONSTRAINT fk_media_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE media ADD CONSTRAINT fk_media_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE session ADD CONSTRAINT fk_session_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE session ADD CONSTRAINT fk_session_device_id FOREIGN KEY (device_id) REFERENCES device(id) ON DELETE CASCADE;
ALTER TABLE user_storage_limit ADD CONSTRAINT fk_user_storage_limit_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE user_profile ADD CONSTRAINT fk_user_profile_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE user_auth_method ADD CONSTRAINT fk_user_auth_method_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE device ADD CONSTRAINT fk_device_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE encryption_key ADD CONSTRAINT fk_encryption_key_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE delivery_receipt ADD CONSTRAINT fk_delivery_receipt_recipient_user_id FOREIGN KEY (recipient_user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE link_preview ADD CONSTRAINT fk_link_preview_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_actor_id FOREIGN KEY (actor_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE device_session ADD CONSTRAINT fk_device_session_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE chat ADD CONSTRAINT fk_chat_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE group ADD CONSTRAINT fk_group_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE message ADD CONSTRAINT fk_message_chat_id FOREIGN KEY (chat_id) REFERENCES chat(id) ON DELETE CASCADE;
ALTER TABLE message ADD CONSTRAINT fk_message_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE message ADD CONSTRAINT fk_message_quoted_message_id FOREIGN KEY (quoted_message_id) REFERENCES message(id) ON DELETE SET NULL;
ALTER TABLE message ADD CONSTRAINT fk_message_forwarded_from_message_id FOREIGN KEY (forwarded_from_message_id) REFERENCES message(id) ON DELETE SET NULL;
ALTER TABLE group_member ADD CONSTRAINT fk_group_member_group_id FOREIGN KEY (group_id) REFERENCES group(id) ON DELETE CASCADE;
ALTER TABLE group_member ADD CONSTRAINT fk_group_member_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE message_reaction ADD CONSTRAINT fk_message_reaction_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE message_reaction ADD CONSTRAINT fk_message_reaction_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE media_metadata ADD CONSTRAINT fk_media_metadata_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE message_receipt ADD CONSTRAINT fk_message_receipt_message_id FOREIGN KEY (message_id) REFERENCES message(id) ON DELETE CASCADE;
ALTER TABLE message_receipt ADD CONSTRAINT fk_message_receipt_user_id FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;

-- ============================================
-- INDEXES
-- ============================================

CREATE INDEX idx_user_phone_number ON user(phone_number);
CREATE INDEX idx_user_is_2fa_enabled ON user(is_2fa_enabled);
CREATE INDEX idx_device_session_user_id ON device_session(user_id);
CREATE INDEX idx_device_session_auth_method ON device_session(auth_method);
CREATE INDEX idx_device_session_last_active_at ON device_session(last_active_at);
CREATE INDEX idx_encryption_key_user_id ON encryption_key(user_id);
CREATE INDEX idx_encryption_key_key_version ON encryption_key(key_version);
CREATE INDEX idx_encryption_key_algorithm ON encryption_key(algorithm);
CREATE INDEX idx_encryption_key_verification_status ON encryption_key(verification_status);
CREATE INDEX idx_message_receipt_message_id ON message_receipt(message_id);
CREATE INDEX idx_message_receipt_recipient_user_id ON message_receipt(recipient_user_id);
CREATE INDEX idx_message_receipt_status ON message_receipt(status);
CREATE INDEX idx_message_receipt_status_at ON message_receipt(status_at);
CREATE INDEX idx_media_asset_user_id ON media_asset(user_id);
CREATE INDEX idx_media_asset_message_id ON media_asset(message_id);
CREATE INDEX idx_media_asset_media_type ON media_asset(media_type);
CREATE INDEX idx_media_asset_source ON media_asset(source);
CREATE INDEX idx_contact_block_blocker_user_id ON contact_block(blocker_user_id);
CREATE INDEX idx_contact_block_blocked_user_id ON contact_block(blocked_user_id);
CREATE INDEX idx_audit_log_entity_type ON audit_log(entity_type);
CREATE INDEX idx_audit_log_entity_id ON audit_log(entity_id);
CREATE INDEX idx_audit_log_action ON audit_log(action);
CREATE INDEX idx_audit_log_actor_id ON audit_log(actor_id);
CREATE INDEX idx_audit_log_timestamp ON audit_log(timestamp);
CREATE INDEX idx_contact_user_id ON contact(user_id);
CREATE INDEX idx_contact_phone_number ON contact(phone_number);
CREATE INDEX idx_contact_whatsapp_user_id ON contact(whatsapp_user_id);
CREATE INDEX idx_contact_is_favorite ON contact(is_favorite);
CREATE INDEX idx_contact_is_unknown_sender ON contact(is_unknown_sender);
CREATE INDEX idx_delivery_receipt_message_id ON delivery_receipt(message_id);
CREATE INDEX idx_delivery_receipt_status ON delivery_receipt(status);
CREATE INDEX idx_delivery_receipt_status_at ON delivery_receipt(status_at);
CREATE INDEX idx_link_preview_message_id ON link_preview(message_id);
CREATE INDEX idx_link_preview_url ON link_preview(url);
CREATE INDEX idx_link_preview_media_type ON link_preview(media_type);
CREATE INDEX idx_privacy_setting_user_id ON privacy_setting(user_id);
CREATE INDEX idx_privacy_setting_online_status_visibility ON privacy_setting(online_status_visibility);
CREATE INDEX idx_media_attachment_message_id ON media_attachment(message_id);
CREATE INDEX idx_media_attachment_user_id ON media_attachment(user_id);
CREATE INDEX idx_media_attachment_media_type ON media_attachment(media_type);
CREATE INDEX idx_media_attachment_mime_type ON media_attachment(mime_type);
CREATE INDEX idx_media_attachment_checksum ON media_attachment(checksum);
CREATE INDEX idx_media_message_id ON media(message_id);
CREATE INDEX idx_media_user_id ON media(user_id);
CREATE INDEX idx_media_media_type ON media(media_type);
CREATE INDEX idx_session_user_id ON session(user_id);
CREATE INDEX idx_session_device_id ON session(device_id);
CREATE INDEX idx_session_session_token ON session(session_token);
CREATE INDEX idx_session_ip_address ON session(ip_address);
CREATE INDEX idx_user_storage_limit_user_id ON user_storage_limit(user_id);
CREATE INDEX idx_user_storage_limit_enforcement_status ON user_storage_limit(enforcement_status);
CREATE INDEX idx_resilience_policy_scope ON resilience_policy(scope);
CREATE INDEX idx_resilience_policy_created_at ON resilience_policy(created_at);
CREATE INDEX idx_user_profile_user_id ON user_profile(user_id);
CREATE INDEX idx_user_profile_display_name ON user_profile(display_name);
CREATE INDEX idx_user_profile_qr_code_value ON user_profile(qr_code_value);
CREATE INDEX idx_user_auth_method_user_id ON user_auth_method(user_id);
CREATE INDEX idx_user_auth_method_method_type ON user_auth_method(method_type);
CREATE INDEX idx_user_auth_method_is_enabled ON user_auth_method(is_enabled);
CREATE INDEX idx_device_user_id ON device(user_id);
CREATE INDEX idx_device_platform ON device(platform);
CREATE INDEX idx_device_device_identifier ON device(device_identifier);
CREATE INDEX idx_device_session_token_hash ON device(session_token_hash);
CREATE INDEX idx_encryption_key_user_id ON encryption_key(user_id);
CREATE INDEX idx_encryption_key_key_version ON encryption_key(key_version);
CREATE INDEX idx_encryption_key_algorithm ON encryption_key(algorithm);
CREATE INDEX idx_encryption_key_is_active ON encryption_key(is_active);
CREATE INDEX idx_delivery_receipt_message_id ON delivery_receipt(message_id);
CREATE INDEX idx_delivery_receipt_recipient_user_id ON delivery_receipt(recipient_user_id);
CREATE INDEX idx_delivery_receipt_status ON delivery_receipt(status);
CREATE INDEX idx_link_preview_user_id ON link_preview(user_id);
CREATE INDEX idx_link_preview_url ON link_preview(url);
CREATE INDEX idx_link_preview_media_type ON link_preview(media_type);
CREATE INDEX idx_audit_log_entity_type ON audit_log(entity_type);
CREATE INDEX idx_audit_log_entity_id ON audit_log(entity_id);
CREATE INDEX idx_audit_log_action ON audit_log(action);
CREATE INDEX idx_audit_log_actor_id ON audit_log(actor_id);
CREATE INDEX idx_audit_log_timestamp ON audit_log(timestamp);
CREATE INDEX idx_device_session_user_id ON device_session(user_id);
CREATE INDEX idx_device_session_device_id ON device_session(device_id);
CREATE INDEX idx_device_session_session_token ON device_session(session_token);
CREATE INDEX idx_device_session_last_active_at ON device_session(last_active_at);
CREATE INDEX idx_chat_user_id ON chat(user_id);
CREATE INDEX idx_chat_chat_type ON chat(chat_type);
CREATE INDEX idx_chat_is_locked ON chat(is_locked);
CREATE INDEX idx_chat_created_at ON chat(created_at);
CREATE INDEX idx_group_user_id ON group(user_id);
CREATE INDEX idx_group_group_name ON group(group_name);
CREATE INDEX idx_group_invite_link ON group(invite_link);
CREATE INDEX idx_message_chat_id ON message(chat_id);
CREATE INDEX idx_message_user_id ON message(user_id);
CREATE INDEX idx_message_message_type ON message(message_type);
CREATE INDEX idx_message_quoted_message_id ON message(quoted_message_id);
CREATE INDEX idx_message_forwarded_from_message_id ON message(forwarded_from_message_id);
CREATE INDEX idx_message_is_ephemeral ON message(is_ephemeral);
CREATE INDEX idx_message_expires_at ON message(expires_at);
CREATE INDEX idx_message_deleted_at ON message(deleted_at);
CREATE INDEX idx_message_created_at ON message(created_at);
CREATE INDEX idx_group_member_group_id ON group_member(group_id);
CREATE INDEX idx_group_member_user_id ON group_member(user_id);
CREATE INDEX idx_group_member_role ON group_member(role);
CREATE INDEX idx_message_reaction_message_id ON message_reaction(message_id);
CREATE INDEX idx_message_reaction_user_id ON message_reaction(user_id);
CREATE INDEX idx_message_reaction_emoji ON message_reaction(emoji);
CREATE INDEX idx_media_metadata_message_id ON media_metadata(message_id);
CREATE INDEX idx_media_metadata_media_type ON media_metadata(media_type);
CREATE INDEX idx_media_metadata_view_once ON media_metadata(view_once);
CREATE INDEX idx_message_receipt_message_id ON message_receipt(message_id);
CREATE INDEX idx_message_receipt_user_id ON message_receipt(user_id);
CREATE INDEX idx_message_receipt_status ON message_receipt(status);

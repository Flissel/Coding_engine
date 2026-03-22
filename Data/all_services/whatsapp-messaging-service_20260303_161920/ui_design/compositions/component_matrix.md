# Component Compositions - whatsapp-messaging-service

## Overview

| Property | Value |
|----------|-------|
| Screens | 29 |
| Missing Components | 77 |
| Unique Components Used | 26 |

## Component Usage Frequency

| Component ID | Usage Count |
|-------------|-------------|
| `COMP-001` | 52 |
| `COMP-022` | 40 |
| `COMP-026` | 26 |
| `COMP-023` | 14 |
| `COMP-024` | 11 |
| `COMP-021` | 9 |
| `COMP-025` | 8 |
| `COMP-020` | 7 |
| `COMP-002` | 5 |
| `COMP-013` | 5 |
| `COMP-003` | 3 |
| `COMP-010` | 3 |
| `COMP-018` | 3 |
| `COMP-004` | 3 |
| `COMP-019` | 2 |
| `COMP-014` | 1 |
| `COMP-012` | 1 |
| `COMP-011` | 1 |
| `COMP-015` | 1 |
| `COMP-005` | 1 |
| `COMP-006` | 1 |
| `COMP-008` | 1 |
| `COMP-016` | 1 |
| `COMP-017` | 1 |
| `COMP-007` | 1 |
| `COMP-009` | 1 |

## Missing Components

Die folgenden Komponenten werden benoetigt, sind aber nicht im Design System definiert:

- Logo
- LoadingSpinner
- WelcomeText
- ChatList
- Avatar
- Timestamp
- LastMessage
- CallHistoryAPI
- SettingsSection
- ToggleSwitch
- Slider
- ChatHeader
- MessageList
- ChatMenuDropdown
- SearchInChat
- ChatBackground
- QRCodeModal
- AvatarUpload
- ProfileForm
- SectionHeader
- DeviceRegistrationDialog
- DeviceDetailsModal
- ConfirmDeleteDialog
- HelpCategoryFilter
- ContactSupportDialog
- ChatSettingsSection
- MediaGallery
- SharedFiles
- SectionDivider
- DevicePermissionCheck
- AudioLevelIndicator
- CallHeader
- NetworkDiagnostics
- ConnectionQualityIndicator
- TroubleshootingSteps
- ConnectionStatusIndicator
- NetworkQualityMeter
- EdgeCaseDialog
- ReconnectionSpinner
- AvatarPreview
- ImageCropper
- VisibilitySelector
- FileUpload
- TextInput
- StatusEditor
- StatusList
- PrivacySettings
- PhoneNumberInput
- VerificationCodeInput
- PhoneNumberFormatter
- QRCodeDisplay
- QRCodeScanner
- FormHeader
- FormDescription
- CountryCodeSelector
- BackupCodesModal
- TOTPSetupWizard
- BiometricSetupDialog
- BiometricTestDialog
- PasskeyRegistrationModal
- EmptyState
- DeviceStatusCard
- SyncProgressIndicator
- DeviceTypeIcon
- ManualCodeInput
- ConnectionProgress
- DeviceTypeSelector
- PageHeader
- SupportForm
- ContactInfo
- OperatingHours
- PhoneNumberDisplay
- CountdownTimer
- VerificationMethodSelector
- PinInput
- SecurityHeader
- VerificationStatus

---

## Start

**Route:** `/`

**User Stories:** `US-111`

**Layout:** flex column, centered, max-width 400px, gap-4, padding-6

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-001` Button | main | variant=primary, text=Mit Passkey anmelden | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=secondary, text=Neuen Passkey erstellen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Anmeldung fehlgeschlagen | mobile: visible, desktop: visible |

### Data Sources

- `POST /api/v1/auth/passkeys/authentication/options`
- `POST /api/v1/auth/passkeys/authentication/verify`
- `POST /api/v1/auth/passkeys/registration/options`
- `POST /api/v1/auth/passkeys/registration/verify`

### State Shape

```json
{
  "isLoading": "boolean",
  "authenticationOptions": "object",
  "registrationOptions": "object",
  "error": "string",
  "isAuthenticated": "boolean"
}
```

---

## Chats

**Route:** `/chats`

**Layout:** flex column, full-height, header fixed, main scrollable

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-002` SearchBar | header | variant=default, placeholder=Chats durchsuchen | mobile: visible, desktop: visible |
| `COMP-001` Button | header | variant=primary, text=Neuer Chat | mobile: visible, desktop: visible |
| `COMP-003` ChatListItem | main | variant=default | mobile: visible, desktop: visible |
| `COMP-003` ChatListItem | main | variant=unread | mobile: visible, desktop: visible |
| `COMP-003` ChatListItem | main | variant=muted | mobile: visible, desktop: visible |
| `COMP-010` StatusIndicator | main | variant=online | mobile: visible, desktop: visible |
| `COMP-014` GroupAvatar | main | variant=3-users | mobile: visible, desktop: visible |

### State Shape

```json
{
  "chats": "array",
  "searchQuery": "string",
  "selectedChat": "object|null",
  "loading": "boolean"
}
```

---

## Anrufe

**Route:** `/calls`

**Layout:** flex column, full height, header fixed, main scrollable, footer fixed

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-002` SearchBar | header | variant=default, placeholder=Anrufe durchsuchen | mobile: visible, desktop: visible |
| `COMP-018` CallListItem | main | variant=incoming | mobile: visible, desktop: visible |
| `COMP-018` CallListItem | main | variant=outgoing | mobile: visible, desktop: visible |
| `COMP-018` CallListItem | main | variant=missed | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=primary, text=Neuer Anruf | mobile: visible, desktop: visible |

### State Shape

```json
{
  "calls": "array",
  "searchQuery": "string",
  "filteredCalls": "array",
  "isLoading": "boolean"
}
```

---

## Einstellungen

**Route:** `/settings`

**Layout:** flex column, full-width, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=editable | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Account, icon=user | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Privacy & Security, icon=shield | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Notifications, icon=bell | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Devices, icon=device | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Passkeys, icon=key | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Help & Support, icon=help | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=danger, title=Sign Out, icon=logout | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Add Passkey | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `GET /api/v1/devices`

### State Shape

```json
{
  "userProfile": "object",
  "passkeys": "array",
  "devices": "array",
  "isLoading": "boolean",
  "error": "string"
}
```

---

## Chat-Detail

**Route:** `/chats/:chatId`

**User Stories:** `US-020`, `US-078`, `US-087`, `US-092`, `US-094`, `US-095`, `US-121`, `US-131`

**Layout:** flex column, full height, header fixed top, main scrollable, footer fixed bottom

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, showBackButton=True, showMenuButton=True | mobile: visible, desktop: visible |
| `COMP-010` StatusIndicator | header | variant=online, size=small | mobile: visible, desktop: visible |
| `COMP-013` CallControls | header | variant=compact, showAudio=True, showVideo=True | mobile: visible, desktop: visible |
| `COMP-004` ChatBubble | main | variant=sent | mobile: visible, desktop: visible |
| `COMP-004` ChatBubble | main | variant=received | mobile: visible, desktop: visible |
| `COMP-004` ChatBubble | main | variant=system | mobile: visible, desktop: visible |
| `COMP-012` ReadReceipts | main | variant=read | mobile: visible, desktop: visible |
| `COMP-011` TypingIndicator | main | variant=default | mobile: visible, desktop: visible |
| `COMP-015` LinkPreview | main | variant=default | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure | mobile: visible, desktop: visible |
| `COMP-005` MessageInput | footer | variant=default, placeholder=Type a message... | mobile: visible, desktop: visible |
| `COMP-006` VoiceRecorder | footer | variant=idle | mobile: visible, desktop: visible |
| `COMP-008` EmojiPicker | footer | variant=compact | mobile: visible, desktop: visible |
| `COMP-016` ReactionPicker | modal | variant=default | mobile: visible, desktop: visible |
| `COMP-017` ForwardDialog | modal | variant=default | mobile: visible, desktop: visible |
| `COMP-007` MediaViewer | modal | variant=image | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=info | mobile: visible, desktop: visible |

### State Shape

```json
{
  "chatId": "string",
  "messages": "array",
  "chatInfo": "object",
  "isTyping": "boolean",
  "selectedMessage": "object",
  "showEmojiPicker": "boolean",
  "showReactionPicker": "boolean",
  "isRecording": "boolean",
  "mediaToView": "object",
  "forwardDialogOpen": "boolean"
}
```

---

## Verschlüsselter Videoanruf

**Route:** `/calls/video/:callId`

**User Stories:** `US-036`, `US-137`

**Layout:** flex column, full-height, video tiles stacked/grid, controls fixed bottom

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-019` CallScreen | main | variant=video | mobile: visible, desktop: visible |
| `COMP-020` VideoTile | main | variant=remote | mobile: visible, desktop: visible |
| `COMP-020` VideoTile | main | variant=self | mobile: visible, desktop: visible |
| `COMP-013` CallControls | footer | variant=video | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | header | variant=secure | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=info | mobile: visible, desktop: visible |

### State Shape

```json
{
  "callId": "string",
  "localStream": "MediaStream",
  "remoteStream": "MediaStream",
  "isVideoEnabled": "boolean",
  "isAudioEnabled": "boolean",
  "isScreenSharing": "boolean",
  "callDuration": "number",
  "encryptionStatus": "string",
  "connectionStatus": "string",
  "participants": "array"
}
```

---

## Profil

**Route:** `/settings/profile`

**User Stories:** `US-010`, `US-096`

**Layout:** flex column, gap-16, max-width 600px, padding 24px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=editable | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Name, type=input | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Status, type=input | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=QR-Code anzeigen, type=action | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Business-Profil, type=toggle | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Passkeys verwalten, type=action | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Geräte verwalten, type=action | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=primary, text=Speichern | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Profil gespeichert | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `GET /api/v1/devices`

### State Shape

```json
{
  "profile": "object",
  "name": "string",
  "status": "string",
  "businessProfile": "boolean",
  "passkeys": "array",
  "devices": "array",
  "isLoading": "boolean",
  "showQRCode": "boolean"
}
```

---

## Konto & Sicherheit

**Route:** `/settings/security`

**Layout:** flex column, full-width, padding 16px, gap 8px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, title=Konto & Sicherheit, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Passwort ändern, icon=key, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Zwei-Faktor-Authentifizierung, subtitle=Zusätzliche Sicherheit, icon=shield, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Passkeys verwalten, subtitle=Biometrische Anmeldung, icon=fingerprint, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active, deviceName=iPhone 15 Pro, lastSeen=Jetzt aktiv, location=München, Deutschland | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=inactive, deviceName=MacBook Pro, lastSeen=vor 2 Stunden, location=München, Deutschland | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Anmeldeaktivitäten, subtitle=Letzte Anmeldungen anzeigen, icon=history, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure, text=Ende-zu-Ende verschlüsselt | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=danger, title=Konto löschen, icon=trash, hasChevron=True | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `GET /api/v1/devices`

### State Shape

```json
{
  "passkeys": "array",
  "devices": "array",
  "userProfile": "object",
  "securitySettings": "object",
  "loading": "boolean"
}
```

---

## Geraete

**Route:** `/settings/devices`

**Layout:** flex column, padding 16px, max-width 800px, centered

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | title=Geräte, variant=default, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-002` SearchBar | main | variant=default, placeholder=Geräte durchsuchen... | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active, showActions=True | mobile: stacked, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Neues Gerät hinzufügen | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=danger, text=Gerät entfernen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Gerät erfolgreich hinzugefügt | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/devices`
- `POST /api/v1/devices`
- `PUT /api/v1/devices/{id}`
- `DELETE /api/v1/devices/{id}`

### State Shape

```json
{
  "devices": "array",
  "selectedDevice": "object|null",
  "searchQuery": "string",
  "isLoading": "boolean",
  "error": "string|null",
  "showDeleteConfirm": "boolean"
}
```

---

## Hilfe

**Route:** `/settings/help`

**Layout:** flex column, gap-4, max-width 600px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-002` SearchBar | header | variant=default, placeholder=Hilfe durchsuchen... | mobile: visible, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=Erste Schritte, description=Grundlagen der App kennenlernen | mobile: stacked, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=Sicherheit & Verschlüsselung, description=Ihre Privatsphäre schützen | mobile: stacked, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=Passkeys verwalten, description=Sichere Anmeldung einrichten | mobile: stacked, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=Geräte verwalten, description=Verbundene Geräte überwachen | mobile: stacked, desktop: visible |
| `COMP-001` Button | footer | variant=outline, text=Support kontaktieren | mobile: visible, desktop: visible |

### State Shape

```json
{
  "searchQuery": "string",
  "filteredArticles": "array",
  "selectedCategory": "string"
}
```

---

## Chat-Info

**Route:** `/chats/:chatId/info`

**User Stories:** `US-008`, `US-020`, `US-078`, `US-083`, `US-087`, `US-092`, `US-094`, `US-095`, `US-121`, `US-131`

**Layout:** flex column, full-height, max-width 600px, centered

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, showBackButton=True, title=Chat Info | mobile: visible, desktop: visible |
| `COMP-009` ContactCard | main | variant=default, showStatus=True, showLastSeen=True | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat-Hintergrund, icon=background | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat-Suche, icon=search | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat anpinnen, icon=pin, toggle=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat archivieren, icon=archive | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat exportieren, icon=export | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=danger, title=Chat sperren, icon=block | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/chats/{chatId}`
- `GET /api/v1/chats/{chatId}/settings`
- `PUT /api/v1/chats/{chatId}/settings`

### State Shape

```json
{
  "chatInfo": "object",
  "isPinned": "boolean",
  "isArchived": "boolean",
  "isBlocked": "boolean",
  "encryptionStatus": "string",
  "loading": "boolean",
  "error": "string"
}
```

---

## Chat-Einstellungen

**Route:** `/chats/:chatId/settings`

**User Stories:** `US-020`, `US-078`, `US-087`, `US-092`, `US-094`, `US-095`, `US-121`, `US-131`

**Layout:** flex column, full-height, max-width 400px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, showBackButton=True, title=Chat-Einstellungen | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat durchsuchen, icon=search, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat anpinnen, icon=pin, hasToggle=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat-Hintergrund, icon=background, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat archivieren, icon=archive, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Chat exportieren, icon=export, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=danger, title=Chat sperren, icon=lock, hasChevron=True | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure, text=Ende-zu-Ende verschlüsselt | mobile: visible, desktop: visible |

### State Shape

```json
{
  "chatId": "string",
  "chatSettings": "object",
  "isPinned": "boolean",
  "isArchived": "boolean",
  "isBlocked": "boolean"
}
```

---

## Anruf-Onboarding

**Route:** `/calls/video/:callId/onboarding`

**User Stories:** `US-040`, `US-137`

**Layout:** flex column, centered, max-width 600px, padding 24px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-020` VideoTile | main | variant=self, muted=True, preview=True | mobile: visible, desktop: visible |
| `COMP-013` CallControls | main | variant=video, micEnabled=True, cameraEnabled=True, showSettings=True | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=primary, text=Anruf beitreten, size=large | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=outline, text=Ablehnen, size=medium | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=info, message=Überprüfe deine Kamera und Mikrofon Einstellungen | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/devices`

### State Shape

```json
{
  "callId": "string",
  "micEnabled": "boolean",
  "cameraEnabled": "boolean",
  "devicePermissions": "object",
  "isJoining": "boolean",
  "previewStream": "MediaStream"
}
```

---

## Anruf-Fehlerbehebung

**Route:** `/calls/video/:callId/recovery`

**User Stories:** `US-040`, `US-133`, `US-137`

**Layout:** flex column, video tiles in grid, controls centered, max-width 800px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-026` ToastNotification | header | variant=error, message=Verbindungsprobleme erkannt | mobile: visible, desktop: visible |
| `COMP-020` VideoTile | main | variant=remote, status=reconnecting | mobile: stacked, desktop: visible |
| `COMP-020` VideoTile | main | variant=self, muted=True | mobile: stacked, desktop: visible |
| `COMP-013` CallControls | footer | variant=video, reconnecting=True | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=primary, text=Verbindung wiederherstellen | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=outline, text=Netzwerk wechseln | mobile: visible, desktop: visible |
| `COMP-001` Button | footer | variant=danger, text=Anruf beenden | mobile: visible, desktop: visible |
| `COMP-025` HelpArticleCard | sidebar | variant=compact, title=Verbindungsprobleme lösen | mobile: hidden, desktop: visible |

### Data Sources

- `GET /api/v1/calls/:callId`
- `POST /api/v1/calls/:callId/reconnect`
- `GET /api/v1/devices`

### State Shape

```json
{
  "callId": "string",
  "connectionStatus": "string",
  "reconnectAttempts": "number",
  "networkQuality": "object",
  "participants": "array",
  "troubleshootingSteps": "array"
}
```

---

## Edge-Case Handling

**Route:** `/calls/video/:callId/edge-cases`

**User Stories:** `US-137`

**Layout:** flex column, full-height, video overlay layout

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-019` CallScreen | main | variant=video, callId=:callId | mobile: visible, desktop: visible |
| `COMP-020` VideoTile | main | variant=remote | mobile: stacked, desktop: visible |
| `COMP-020` VideoTile | main | variant=self | mobile: visible, desktop: visible |
| `COMP-013` CallControls | footer | variant=video | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Connection lost | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=warning, message=Poor network quality | mobile: visible, desktop: visible |
| `COMP-001` Button | modal | variant=primary, text=Retry Connection | mobile: visible, desktop: visible |
| `COMP-001` Button | modal | variant=secondary, text=Switch to Audio | mobile: visible, desktop: visible |
| `COMP-001` Button | modal | variant=danger, text=End Call | mobile: visible, desktop: visible |

### State Shape

```json
{
  "callId": "string",
  "connectionStatus": "string",
  "networkQuality": "string",
  "errorState": "object",
  "retryAttempts": "number",
  "fallbackOptions": "array"
}
```

---

## Profilbild

**Route:** `/settings/profile/avatar`

**User Stories:** `US-006`, `US-082`

**Layout:** flex column, centered, max-width 400px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=editable, title=Profilbild, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Foto aufnehmen, icon=camera | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=secondary, text=Aus Galerie wählen, icon=gallery | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=Aktuelles Bild löschen, icon=trash | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Wer kann mein Profilbild sehen, subtitle=Alle Kontakte, showChevron=True | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Profilbild erfolgreich aktualisiert | mobile: visible, desktop: visible |

### State Shape

```json
{
  "currentAvatar": "string|null",
  "isUploading": "boolean",
  "visibilitySettings": "string",
  "showToast": "boolean",
  "toastMessage": "string"
}
```

---

## Anzeigename

**Route:** `/settings/profile/display-name`

**User Stories:** `US-007`

**Layout:** flex column, centered, max-width 400px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=editable, title=Anzeigename, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Speichern, disabled=False | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=secondary, text=Abbrechen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Anzeigename erfolgreich gespeichert, visible=False | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Fehler beim Speichern, visible=False | mobile: visible, desktop: visible |

### State Shape

```json
{
  "displayName": "string",
  "originalDisplayName": "string",
  "isLoading": "boolean",
  "error": "string|null",
  "isDirty": "boolean"
}
```

---

## Info/Status

**Route:** `/settings/profile/status`

**User Stories:** `US-008`, `US-042`, `US-043`, `US-044`, `US-045`, `US-046`, `US-083`

**Layout:** flex column, gap-16, padding-24, max-width 600px, centered

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=editable, showStatus=True | mobile: visible, desktop: visible |
| `COMP-010` StatusIndicator | main | variant=online, size=large, editable=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Status erstellen | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Status-Datenschutz, icon=privacy | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Status stumm schalten, icon=mute, toggle=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Info-Sichtbarkeit, icon=visibility | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Status aktualisiert | mobile: visible, desktop: visible |

### State Shape

```json
{
  "currentStatus": "string",
  "statusPrivacy": "string",
  "statusMuted": "boolean",
  "infoVisibility": "string",
  "isEditing": "boolean",
  "showToast": "boolean"
}
```

---

## Telefonnummer

**Route:** `/settings/profile/phone`

**User Stories:** `US-001`, `US-009`

**Layout:** flex column, gap-16, max-width 600px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, title=Telefonnummer, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, label=Aktuelle Telefonnummer, value=+49 123 456789, editable=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Telefonnummer ändern | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=danger, text=Telefonnummer entfernen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Telefonnummer erfolgreich aktualisiert | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/profile/phone`
- `PUT /api/v1/profile/phone`
- `DELETE /api/v1/profile/phone`

### State Shape

```json
{
  "phoneNumber": "string",
  "isEditing": "boolean",
  "isLoading": "boolean",
  "error": "string|null",
  "showToast": "boolean"
}
```

---

## QR-Code Profil

**Route:** `/settings/profile/qr`

**User Stories:** `US-010`, `US-096`, `US-152`

**Layout:** flex column, centered, max-width 400px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, showQRCode=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=QR-Code teilen | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=QR-Code speichern | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=secondary, text=QR-Code scannen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=QR-Code erfolgreich geteilt | mobile: visible, desktop: visible |

### State Shape

```json
{
  "qrCodeData": "string",
  "isSharing": "boolean",
  "showToast": "boolean",
  "toastMessage": "string"
}
```

---

## Telefonnummer-Registrierung

**Route:** `/auth/phone`

**User Stories:** `US-001`, `US-009`

**Layout:** flex column, centered, max-width 400px, padding 24px, gap 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-001` Button | main | variant=primary, text=Telefonnummer bestätigen, disabled=False | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=Code erneut senden, disabled=False | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Ungültiger Bestätigungscode, visible=False | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Telefonnummer erfolgreich bestätigt, visible=False | mobile: visible, desktop: visible |

### Data Sources

- `POST /api/v1/devices`

### State Shape

```json
{
  "phoneNumber": "string",
  "verificationCode": "string",
  "isLoading": "boolean",
  "error": "string | null",
  "isCodeSent": "boolean",
  "resendTimer": "number"
}
```

---

## Zwei-Faktor-Authentifizierung

**Route:** `/settings/security/2fa`

**User Stories:** `US-002`, `US-062`

**Layout:** flex column, gap-16, max-width 600px, padding 24px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-022` SettingsListItem | main | title=Zwei-Faktor-Authentifizierung, description=Zusätzliche Sicherheit für Ihr Konto, variant=default, hasToggle=True, isEnabled=False | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | title=Authenticator-App, description=Google Authenticator, Authy oder ähnliche Apps, variant=default, hasAction=True, actionText=Einrichten | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | title=Passkeys, description=Biometrische Authentifizierung oder Hardware-Schlüssel, variant=default, hasAction=True, actionText=Verwalten | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | deviceName=iPhone 15 Pro, deviceType=mobile, lastSeen=Jetzt aktiv, variant=active, hasRemoveAction=True | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | deviceName=MacBook Pro, deviceType=desktop, lastSeen=Vor 2 Stunden, variant=inactive, hasRemoveAction=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | text=Backup-Codes generieren, variant=outline, fullWidth=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | text=2FA deaktivieren, variant=danger, fullWidth=True | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | message=2FA erfolgreich aktiviert, variant=success, autoHide=True | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `POST /api/v1/passkeys`
- `DELETE /api/v1/passkeys/{id}`
- `GET /api/v1/devices`
- `DELETE /api/v1/devices/{id}`
- `POST /api/v1/auth/passkeys/registration/options`
- `POST /api/v1/auth/passkeys/registration/verify`

### State Shape

```json
{
  "is2FAEnabled": "boolean",
  "passkeys": "array",
  "devices": "array",
  "isLoading": "boolean",
  "showBackupCodes": "boolean",
  "backupCodes": "array",
  "qrCode": "string",
  "totpSecret": "string"
}
```

---

## Biometrische Entsperrung

**Route:** `/settings/security/biometrics`

**User Stories:** `US-003`

**Layout:** flex column, gap-16, padding-24, max-width 600px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-022` SettingsListItem | main | variant=default, title=Fingerabdruck hinzufügen, subtitle=Entsperren mit Fingerabdruck, icon=fingerprint, hasAction=True | mobile: visible, desktop: visible |
| `COMP-022` SettingsListItem | main | variant=default, title=Gesichtserkennung, subtitle=Entsperren mit Face ID, icon=face, hasAction=True | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active, deviceName=iPhone 15, lastUsed=Heute, biometricType=Face ID | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=inactive, deviceName=MacBook Pro, lastUsed=Vor 2 Tagen, biometricType=Touch ID | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Neues Gerät hinzufügen, fullWidth=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=danger, text=Alle biometrischen Daten löschen, fullWidth=True | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Biometrische Entsperrung aktiviert | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `POST /api/v1/passkeys`
- `DELETE /api/v1/passkeys/{id}`
- `POST /api/v1/passkeys/registration/options`
- `POST /api/v1/passkeys/registration/verify`
- `GET /api/v1/devices`

### State Shape

```json
{
  "passkeys": "array",
  "devices": "array",
  "isLoading": "boolean",
  "showToast": "boolean",
  "toastMessage": "string",
  "biometricSupport": "object"
}
```

---

## Passkeys

**Route:** `/settings/security/passkeys`

**Layout:** flex column, max-width 600px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | variant=default, title=Passkeys, showBackButton=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Add Passkey, icon=plus | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active, showActions=True, allowDelete=True | mobile: stacked, desktop: visible |
| `COMP-001` Button | main | variant=danger, text=Delete, size=small | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Passkey added successfully | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/passkeys`
- `POST /api/v1/passkeys`
- `DELETE /api/v1/passkeys/{id}`
- `POST /api/v1/auth/passkeys/registration/options`
- `POST /api/v1/auth/passkeys/registration/verify`
- `GET /api/v1/devices`

### State Shape

```json
{
  "passkeys": "array",
  "isLoading": "boolean",
  "error": "string|null",
  "showAddPasskeyModal": "boolean",
  "registrationOptions": "object|null",
  "selectedPasskey": "object|null"
}
```

---

## Multi-Device Uebersicht

**Route:** `/settings/devices/overview`

**User Stories:** `US-004`, `US-132`, `US-159`

**Layout:** flex column, gap-4, max-width 800px, padding 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-023` ProfileHeader | header | title=Geräte-Übersicht, variant=default | mobile: visible, desktop: visible |
| `COMP-002` SearchBar | main | placeholder=Geräte durchsuchen..., variant=default | mobile: visible, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=active, showStatus=True, showLastSeen=True | mobile: stacked, desktop: visible |
| `COMP-024` DeviceListItem | main | variant=inactive, showStatus=True, showLastSeen=True | mobile: stacked, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Neues Gerät hinzufügen | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=Alle Geräte synchronisieren | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=danger, text=Gerät entfernen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=Gerät erfolgreich hinzugefügt | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/devices`
- `POST /api/v1/devices`
- `PUT /api/v1/devices/{id}`
- `DELETE /api/v1/devices/{id}`

### State Shape

```json
{
  "devices": "Device[]",
  "searchQuery": "string",
  "selectedDevice": "Device | null",
  "isLoading": "boolean",
  "error": "string | null",
  "showAddDeviceDialog": "boolean"
}
```

---

## Neues Geraet verbinden

**Route:** `/settings/devices/link`

**Layout:** flex column, centered, max-width 400px, padding 24px, gap 16px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-001` Button | header | variant=ghost, text=Zurück, icon=arrow-left | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=QR-Code scannen, icon=qr-code | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=Manuell verbinden, icon=link | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=secondary, text=Passkey verwenden, icon=key | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=secure, text=Ende-zu-Ende verschlüsselt | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Verbindung fehlgeschlagen | mobile: visible, desktop: visible |

### Data Sources

- `GET /api/v1/devices`
- `POST /api/v1/devices`
- `POST /api/v1/auth/passkeys/registration/options`
- `POST /api/v1/auth/passkeys/registration/verify`

### State Shape

```json
{
  "connectionMethod": "string",
  "isConnecting": "boolean",
  "qrCodeData": "string",
  "manualCode": "string",
  "error": "string",
  "devices": "array"
}
```

---

## Support kontaktieren

**Route:** `/settings/help/support`

**User Stories:** `US-004`, `US-157`

**Layout:** flex column, centered, max-width 600px, gap-4, padding-4

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-025` HelpArticleCard | main | variant=default, title=Häufige Probleme, description=Schnelle Lösungen für bekannte Probleme | mobile: visible, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=Chat mit Support, description=Direkte Hilfe von unserem Support-Team | mobile: visible, desktop: visible |
| `COMP-025` HelpArticleCard | main | variant=default, title=E-Mail Support, description=Senden Sie uns eine detaillierte Anfrage | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Live Chat starten | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=E-Mail senden | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=info, message=Support-Anfrage wurde gesendet | mobile: visible, desktop: visible |

### State Shape

```json
{
  "supportOptions": "array",
  "selectedOption": "string",
  "isLoading": "boolean",
  "showToast": "boolean",
  "toastMessage": "string"
}
```

---

## SMS/Anruf-Verifizierung

**Route:** `/auth/phone/verify`

**User Stories:** `US-040`, `US-058`, `US-062`, `US-140`, `US-141`, `US-142`, `US-143`, `US-144`, `US-145`, `US-146`

**Layout:** flex column, centered, max-width 400px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-001` Button | main | variant=outline, text=SMS erneut senden | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=outline, text=Anrufen | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=Verifizieren | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=ghost, text=Telefonnummer ändern | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, message=Ungültiger Verifizierungscode | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=success, message=SMS wurde gesendet | mobile: visible, desktop: visible |

### Data Sources

- `POST /api/v1/devices`
- `PUT /api/v1/devices/{id}`

### State Shape

```json
{
  "phoneNumber": "string",
  "verificationCode": "string",
  "isVerifying": "boolean",
  "resendCooldown": "number",
  "verificationMethod": "string",
  "errorMessage": "string"
}
```

---

## PIN-Verifizierung

**Route:** `/settings/security/2fa/verify`

**User Stories:** `US-058`, `US-062`, `US-140`, `US-141`, `US-142`, `US-143`, `US-144`, `US-145`, `US-146`, `US-147`

**Layout:** flex column, centered, max-width 400px, padding 24px, gap 24px

### Components

| Component | Position | Props | Responsive |
|-----------|----------|-------|------------|
| `COMP-001` Button | header | variant=ghost, text=Zurück, icon=arrow-left | mobile: visible, desktop: visible |
| `COMP-021` EncryptionBadge | main | variant=verifying, text=PIN-Verifizierung erforderlich | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=primary, text=PIN bestätigen, disabled=True | mobile: visible, desktop: visible |
| `COMP-001` Button | main | variant=ghost, text=Abbrechen | mobile: visible, desktop: visible |
| `COMP-026` ToastNotification | modal | variant=error, text=Ungültige PIN, visible=False | mobile: visible, desktop: visible |

### Data Sources

- `POST /api/v1/auth/passkeys/authentication/verify`

### State Shape

```json
{
  "pinValue": "string",
  "isVerifying": "boolean",
  "verificationError": "string|null",
  "attempts": "number"
}
```

---


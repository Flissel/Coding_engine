# Information Architecture - whatsapp-messaging-service

## Site Map

- **Start** (`/`)
  - Content: dashboard, quick-actions, recent-chats
  - **Chats** (`/chats`)
    - Content: list, search, filters
  - **Anrufe** (`/calls`)
    - Content: list, history, quick-actions
  - **Einstellungen** (`/settings`)
    - Content: list, toggles, navigation
  - **Chat-Detail** (`/chats/:chatId`)
    - Content: messages, composer, attachments
  - **Verschlüsselter Videoanruf** (`/calls/video/:callId`)
    - Content: call-ui, permissions, status
  - **Profil** (`/settings/profile`)
    - Content: form, avatar, qr-code
  - **Konto & Sicherheit** (`/settings/security`)
    - Content: toggles, verification, auth
  - **Geraete** (`/settings/devices`)
    - Content: list, device-management
  - **Hilfe** (`/settings/help`)
    - Content: faq, support
  - **Chat-Info** (`/chats/:chatId/info`)
    - Content: details, media, actions
  - **Chat-Einstellungen** (`/chats/:chatId/settings`)
    - Content: toggles, privacy
  - **Anruf-Onboarding** (`/calls/video/:callId/onboarding`)
    - Content: permissions, education, checklist
  - **Anruf-Fehlerbehebung** (`/calls/video/:callId/recovery`)
    - Content: error-states, retry, troubleshooting
  - **Edge-Case Handling** (`/calls/video/:callId/edge-cases`)
    - Content: fallbacks, network, device-change
  - **Profilbild** (`/settings/profile/avatar`)
    - Content: upload, crop, preview
  - **Anzeigename** (`/settings/profile/display-name`)
    - Content: form, validation
  - **Info/Status** (`/settings/profile/status`)
    - Content: form, char-limit
  - **Telefonnummer** (`/settings/profile/phone`)
    - Content: readonly, verification-status
  - **QR-Code Profil** (`/settings/profile/qr`)
    - Content: qr-code, share, scan
  - **Telefonnummer-Registrierung** (`/auth/phone`)
    - Content: form, verification
  - **Zwei-Faktor-Authentifizierung** (`/settings/security/2fa`)
    - Content: toggle, pin-setup
  - **Biometrische Entsperrung** (`/settings/security/biometrics`)
    - Content: toggle, permissions
  - **Passkeys** (`/settings/security/passkeys`)
    - Content: list, create, delete
  - **Multi-Device Uebersicht** (`/settings/devices/overview`)
    - Content: list, status, last-active
  - **Neues Geraet verbinden** (`/settings/devices/link`)
    - Content: qr-scan, pairing
  - **Support kontaktieren** (`/settings/help/support`)
    - Content: form, attachments
  - **SMS/Anruf-Verifizierung** (`/auth/phone/verify`)
    - Content: otp-input, timer, resend
  - **PIN-Verifizierung** (`/settings/security/2fa/verify`)
    - Content: pin-input, recovery

---

## Interaction Patterns

- Infinite Scroll fuer Listen
- Modal Dialoge fuer Formulare
- Toast Notifications fuer Feedback
- Drag & Drop fuer Datei-Upload
- QR-Code Scanner Overlay
- Bottom Sheets fuer Quick-Actions

---

## Design Principles

1. Mobile First
1. Progressive Disclosure
1. Consistency ueber alle Screens
1. Fehlertoleranz
1. Security & Privacy by Design

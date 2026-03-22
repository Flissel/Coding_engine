# Component Library

## Button

**ID:** `COMP-001`
**Type:** button

Primary and secondary action button component

### Variants

- `primary`
- `secondary`
- `outline`
- `ghost`
- `danger`

### Props

| Prop | Type |
|------|------|
| `size` | `sm | md | lg` |
| `disabled` | `boolean` |
| `loading` | `boolean` |
| `icon` | `ReactNode (optional)` |
| `onClick` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** button
- **aria-label:** Required for icon-only buttons
- **keyboard_navigation:** Enter/Space to activate

### Example

```tsx
<Button variant='primary' size='md'>Send</Button>
```

---

## SearchBar

**ID:** `COMP-002`
**Type:** input

Search input with filters and clear action

### Variants

- `default`
- `with-filters`
- `compact`

### Props

| Prop | Type |
|------|------|
| `value` | `string` |
| `placeholder` | `string` |
| `filters` | `FilterOption[]` |
| `onSearch` | `(query) => void` |
| `onFilterChange` | `(filters) => void` |
| `onClear` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** searchbox
- **aria-label:** Search chats and messages
- **keyboard_navigation:** Enter to search, Esc to clear

### Example

```tsx
<SearchBar placeholder='Search' filters={filters} />
```

---

## ChatListItem

**ID:** `COMP-003`
**Type:** list-item

Row item for chat list with avatar, name, preview, and unread count

### Variants

- `default`
- `unread`
- `muted`

### Props

| Prop | Type |
|------|------|
| `avatar` | `string | ReactNode` |
| `title` | `string` |
| `preview` | `string` |
| `timestamp` | `string` |
| `unreadCount` | `number` |
| `onClick` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** listitem
- **aria-label:** Chat list item
- **keyboard_navigation:** Enter to open chat

### Example

```tsx
<ChatListItem title='Anna' preview='See you' />
```

---

## ChatBubble

**ID:** `COMP-004`
**Type:** message

Message bubble for sent/received messages with metadata

### Variants

- `sent`
- `received`
- `system`

### Props

| Prop | Type |
|------|------|
| `text` | `string` |
| `timestamp` | `string` |
| `status` | `sent | delivered | read` |
| `attachments` | `Attachment[]` |
| `reactions` | `Reaction[]` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** article
- **aria-label:** Chat message bubble
- **keyboard_navigation:** Arrow keys to navigate messages

### Example

```tsx
<ChatBubble variant='sent' text='Hello!' />
```

---

## MessageInput

**ID:** `COMP-005`
**Type:** input

Composer with text, attachments, emoji and voice actions

### Variants

- `default`
- `expanded`

### Props

| Prop | Type |
|------|------|
| `value` | `string` |
| `placeholder` | `string` |
| `onSend` | `(message) => void` |
| `onAttach` | `(files) => void` |
| `onEmoji` | `() => void` |
| `onVoice` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** textbox
- **aria-label:** Message input
- **keyboard_navigation:** Enter to send, Shift+Enter for newline

### Example

```tsx
<MessageInput placeholder='Type a message' />
```

---

## VoiceRecorder

**ID:** `COMP-006`
**Type:** control

Voice recording control with waveform and timer

### Variants

- `idle`
- `recording`
- `paused`

### Props

| Prop | Type |
|------|------|
| `duration` | `number` |
| `onStart` | `() => void` |
| `onPause` | `() => void` |
| `onStop` | `() => void` |
| `onCancel` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** button
- **aria-label:** Voice recorder control
- **keyboard_navigation:** Space to start/stop

### Example

```tsx
<VoiceRecorder onStart={start} />
```

---

## MediaViewer

**ID:** `COMP-007`
**Type:** viewer

Fullscreen viewer for images, videos, and documents

### Variants

- `image`
- `video`
- `document`

### Props

| Prop | Type |
|------|------|
| `media` | `MediaItem` |
| `onClose` | `() => void` |
| `onDownload` | `() => void` |
| `onShare` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** dialog
- **aria-label:** Media viewer
- **keyboard_navigation:** Esc to close, Arrow keys to navigate

### Example

```tsx
<MediaViewer media={item} />
```

---

## EmojiPicker

**ID:** `COMP-008`
**Type:** picker

Emoji selection panel with categories and search

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `onSelect` | `(emoji) => void` |
| `onSearch` | `(query) => void` |
| `recent` | `Emoji[]` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** grid
- **aria-label:** Emoji picker
- **keyboard_navigation:** Arrow keys to navigate, Enter to select

### Example

```tsx
<EmojiPicker onSelect={addEmoji} />
```

---

## ContactCard

**ID:** `COMP-009`
**Type:** card

Contact information card with actions

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `name` | `string` |
| `avatar` | `string | ReactNode` |
| `status` | `string` |
| `onMessage` | `() => void` |
| `onCall` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** group
- **aria-label:** Contact card
- **keyboard_navigation:** Tab through actions

### Example

```tsx
<ContactCard name='Max' status='online' />
```

---

## StatusIndicator

**ID:** `COMP-010`
**Type:** status

Presence indicator for online/away/offline

### Variants

- `online`
- `away`
- `offline`
- `do-not-disturb`

### Props

| Prop | Type |
|------|------|
| `status` | `string` |
| `size` | `sm | md | lg` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** status
- **aria-label:** User presence status
- **keyboard_navigation:** Not focusable

### Example

```tsx
<StatusIndicator status='online' />
```

---

## TypingIndicator

**ID:** `COMP-011`
**Type:** status

Animated typing indicator for chat

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `users` | `string[]` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** status
- **aria-label:** Typing indicator
- **keyboard_navigation:** Not focusable

### Example

```tsx
<TypingIndicator users={['Anna']} />
```

---

## ReadReceipts

**ID:** `COMP-012`
**Type:** status

Read/delivered indicators for messages

### Variants

- `sent`
- `delivered`
- `read`

### Props

| Prop | Type |
|------|------|
| `status` | `sent | delivered | read` |
| `timestamp` | `string` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** status
- **aria-label:** Message read status
- **keyboard_navigation:** Not focusable

### Example

```tsx
<ReadReceipts status='read' />
```

---

## CallControls

**ID:** `COMP-013`
**Type:** controls

Controls for voice/video call including mute, video, end

### Variants

- `audio`
- `video`
- `compact`

### Props

| Prop | Type |
|------|------|
| `muted` | `boolean` |
| `videoEnabled` | `boolean` |
| `onToggleMute` | `() => void` |
| `onToggleVideo` | `() => void` |
| `onEnd` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** toolbar
- **aria-label:** Call controls
- **keyboard_navigation:** Tab between buttons, Enter to activate

### Example

```tsx
<CallControls onEnd={hangup} />
```

---

## GroupAvatar

**ID:** `COMP-014`
**Type:** avatar

Composite avatar for group chats

### Variants

- `2-users`
- `3-users`
- `4-users`

### Props

| Prop | Type |
|------|------|
| `avatars` | `string[]` |
| `size` | `sm | md | lg` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** img
- **aria-label:** Group avatar
- **keyboard_navigation:** Not focusable

### Example

```tsx
<GroupAvatar avatars={['a.jpg','b.jpg']} />
```

---

## LinkPreview

**ID:** `COMP-015`
**Type:** card

Preview card for shared links

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `title` | `string` |
| `description` | `string` |
| `image` | `string` |
| `url` | `string` |
| `onOpen` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** link
- **aria-label:** Link preview
- **keyboard_navigation:** Enter to open link

### Example

```tsx
<LinkPreview title='Example' url='https://...' />
```

---

## ReactionPicker

**ID:** `COMP-016`
**Type:** picker

Picker for quick emoji reactions on messages

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `reactions` | `Emoji[]` |
| `onSelect` | `(emoji) => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** menu
- **aria-label:** Reaction picker
- **keyboard_navigation:** Arrow keys to navigate, Enter to select

### Example

```tsx
<ReactionPicker onSelect={react} />
```

---

## ForwardDialog

**ID:** `COMP-017`
**Type:** dialog

Dialog to select chats/contacts to forward messages

### Variants

- `default`
- `multi-select`

### Props

| Prop | Type |
|------|------|
| `open` | `boolean` |
| `items` | `Contact[]` |
| `onConfirm` | `(selected) => void` |
| `onClose` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** dialog
- **aria-label:** Forward message dialog
- **keyboard_navigation:** Tab within dialog, Esc to close

### Example

```tsx
<ForwardDialog open={true} items={contacts} />
```

---

## CallListItem

**ID:** `COMP-018`
**Type:** list-item

Row item for call history list

### Variants

- `incoming`
- `outgoing`
- `missed`

### Props

| Prop | Type |
|------|------|
| `name` | `string` |
| `timestamp` | `string` |
| `type` | `audio | video` |
| `onCallBack` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** listitem
- **aria-label:** Call history item
- **keyboard_navigation:** Enter to open details

### Example

```tsx
<CallListItem name='Lena' type='video' />
```

---

## CallScreen

**ID:** `COMP-019`
**Type:** screen

Full-screen in-call UI with video tiles and controls

### Variants

- `audio`
- `video`
- `group`

### Props

| Prop | Type |
|------|------|
| `participants` | `Participant[]` |
| `encryptionStatus` | `string` |
| `onEnd` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** main
- **aria-label:** Call screen
- **keyboard_navigation:** Tab to controls, Esc to minimize

### Example

```tsx
<CallScreen participants={users} />
```

---

## VideoTile

**ID:** `COMP-020`
**Type:** media

Video tile for participant with mute and name

### Variants

- `self`
- `remote`
- `screen-share`

### Props

| Prop | Type |
|------|------|
| `name` | `string` |
| `muted` | `boolean` |
| `videoStream` | `MediaStream` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** img
- **aria-label:** Participant video tile
- **keyboard_navigation:** Not focusable

### Example

```tsx
<VideoTile name='You' />
```

---

## EncryptionBadge

**ID:** `COMP-021`
**Type:** status

Badge indicating E2E encryption status

### Variants

- `secure`
- `verifying`
- `error`

### Props

| Prop | Type |
|------|------|
| `status` | `secure | verifying | error` |
| `tooltip` | `string` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** status
- **aria-label:** Encryption status
- **keyboard_navigation:** Tab to view tooltip

### Example

```tsx
<EncryptionBadge status='secure' />
```

---

## SettingsListItem

**ID:** `COMP-022`
**Type:** list-item

List item for settings navigation

### Variants

- `default`
- `danger`

### Props

| Prop | Type |
|------|------|
| `title` | `string` |
| `description` | `string` |
| `icon` | `ReactNode` |
| `onClick` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** button
- **aria-label:** Settings item
- **keyboard_navigation:** Enter to open

### Example

```tsx
<SettingsListItem title='Profile' />
```

---

## ProfileHeader

**ID:** `COMP-023`
**Type:** header

Profile header with avatar, name, and status

### Variants

- `default`
- `editable`

### Props

| Prop | Type |
|------|------|
| `name` | `string` |
| `avatar` | `string` |
| `status` | `string` |
| `onEdit` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** banner
- **aria-label:** Profile header
- **keyboard_navigation:** Tab to edit button

### Example

```tsx
<ProfileHeader name='Sara' />
```

---

## DeviceListItem

**ID:** `COMP-024`
**Type:** list-item

List item showing linked device details and actions

### Variants

- `active`
- `inactive`

### Props

| Prop | Type |
|------|------|
| `deviceName` | `string` |
| `lastActive` | `string` |
| `onRemove` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** listitem
- **aria-label:** Linked device item
- **keyboard_navigation:** Tab to remove

### Example

```tsx
<DeviceListItem deviceName='iPhone 14' />
```

---

## HelpArticleCard

**ID:** `COMP-025`
**Type:** card

Card for help articles and FAQs

### Variants

- `default`
- `compact`

### Props

| Prop | Type |
|------|------|
| `title` | `string` |
| `excerpt` | `string` |
| `onOpen` | `() => void` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** link
- **aria-label:** Help article card
- **keyboard_navigation:** Enter to open

### Example

```tsx
<HelpArticleCard title='Security' />
```

---

## ToastNotification

**ID:** `COMP-026`
**Type:** notification

Transient toast for errors and confirmations

### Variants

- `success`
- `info`
- `warning`
- `error`

### Props

| Prop | Type |
|------|------|
| `message` | `string` |
| `onClose` | `() => void` |
| `duration` | `number` |

### States

- default
- hover
- active
- disabled
- loading
- error

### Accessibility

- **role:** alert
- **aria-label:** Notification
- **keyboard_navigation:** Esc to dismiss

### Example

```tsx
<ToastNotification variant='error' message='Failed' />
```

---


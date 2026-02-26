# /push

Implement push notification registration, handling, channels, rich content, and server-side sending.

## Trigger

`/push [action] [options]`

## Actions

- `configure` - Register for push, capture device token, setup channels
- `send` - FCM HTTP v1 or APNs payload structure for server-side sending
- `receive` - Handle push in foreground, background, and terminated states
- `rich` - Rich notifications with images using service extension

## Options

- `--ios` - APNs + UNUserNotificationCenter + FCM SDK
- `--android` - FCM + FirebaseMessagingService + NotificationChannel
- `--flutter` - firebase_messaging package
- `--silent` - Silent push / data-only push for background fetch
- `--channel <name>` - Android notification channel name and importance level

## Process

### configure
1. iOS: `UNUserNotificationCenter.requestAuthorization` → `registerForRemoteNotifications`
2. Android: `FirebaseMessagingService.onNewToken` sends token to server
3. Create all `NotificationChannel` objects in `Application.onCreate` (Android 8+)
4. Store token server-side with user ID; replace on `onNewToken` / token refresh
5. Flutter: `FirebaseMessaging.instance.getToken()` + `onTokenRefresh` stream

### send
1. FCM HTTP v1: `POST /v1/projects/{projectId}/messages:send` with OAuth 2.0 service account token
2. APNs JWT: sign with `.p8` key using ES256; `iss` = Team ID, `kid` = Key ID
3. Set `apns.channel_id` for Android and `apns.payload.aps` for iOS in same FCM payload
4. Use `data` map (not `notification`) for silent push — always delivered, never shown by OS

### receive
1. iOS foreground: implement `willPresent` returning `.banner` to show notification
2. iOS tap: implement `didReceive`, extract `userInfo`, route to deep link
3. Android foreground: `onMessageReceived` → build `NotificationCompat` and call `notify()`
4. Android tap from killed state: check `intent.extras` in `MainActivity.onCreate`

### rich
1. Enable `mutable-content: 1` in APNs payload
2. Create `UNNotificationServiceExtension` target in Xcode
3. Download image in extension within 30s; attach via `UNNotificationAttachment`
4. Call `contentHandler(bestAttemptContent)` — must be called before time expires
5. Android: download image in `onMessageReceived`, set as `BigPictureStyle`

## Output

```
## Push Notification Implementation

### Permission + Registration
[Token capture and server registration code]

### Channel Setup
[Android NotificationChannel definitions]

### Message Handling
[Foreground + background + tap handlers]

### Server Payload
[FCM HTTP v1 JSON structure]
```

## Examples

```bash
# iOS full push setup with FCM
/push configure --ios

# Android channels + message handling
/push configure --android

# FCM HTTP v1 payload for order notification
/push send --android

# iOS rich push with image attachment
/push rich --ios

# Silent background push for data refresh
/push configure --ios --silent

# Flutter firebase_messaging setup
/push configure --flutter
```

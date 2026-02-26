# Push Notifications

APNs JWT auth, FCM HTTP v1, Android notification channels (API 26+), rich notifications with UNNotificationServiceExtension, silent push, all-state handling (foreground/background/terminated).

## What's Included

### Agents
- **push-engineer** - Expert in APNs JWT authentication, FCM HTTP v1, notification channels, rich notification extensions, and multi-state push handling

### Commands
- `/push` - Implement push end-to-end: `configure`, `send`, `receive`, `rich`

### Skills
- **push-notification-patterns** - iOS AppDelegate FCM+APNs setup, UNNotificationServiceExtension for image download, Android Application channel creation, FirebaseMessagingService with NotificationCompat, FCM HTTP v1 payload JSON, state handling summary

## Quick Start

```bash
# iOS push setup
/push configure --ios

# Android channels + handler
/push configure --android

# Rich push with image
/push rich --ios

# FCM server payload structure
/push send
```

## APNs vs FCM

| Concern | APNs Direct | FCM |
|---------|-------------|-----|
| iOS delivery | Direct | Via FCM → APNs |
| Android delivery | N/A | Direct |
| Cross-platform | No | Yes |
| Auth | JWT (p8) or Certificate | OAuth 2.0 service account |
| Topic messaging | No | Yes |

Use FCM for cross-platform apps; APNs direct only for iOS-only apps.

## Android Notification Channel Importance

| Level | Sound | Heads-up | Use Case |
|-------|-------|----------|----------|
| `IMPORTANCE_HIGH` | Yes | Yes | Order updates, alerts |
| `IMPORTANCE_DEFAULT` | Yes | No | General notifications |
| `IMPORTANCE_LOW` | No | No | Promotions, tips |
| `IMPORTANCE_MIN` | No | No | Silent status |

## Critical Rules

- Create notification channels in `Application.onCreate`, not in Activity — channels must exist before first notification
- Always include `channel_id` in FCM Android payload — default channel may not exist on all devices
- APNs JWT tokens expire in 1 hour — refresh automatically using service account key rotation
- Never call `onNewToken` registration synchronously — it may fire multiple times; debounce or check for change
- `mutable-content: 1` only works if a `UNNotificationServiceExtension` target is present in the app
- Use `content-available: 1` (silent push) for background data refresh; never for visible notifications

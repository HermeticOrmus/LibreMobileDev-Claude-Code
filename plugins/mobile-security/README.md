# Mobile Security

iOS Keychain, Android Keystore, certificate pinning, biometric authentication, network security config, R8/ProGuard obfuscation.

## What's Included

### Agents
- **mobile-security-engineer** - Expert in Keychain Services, EncryptedSharedPreferences, TrustKit, BiometricPrompt, OWASP Mobile Top 10

### Commands
- `/mobile-sec` - Implement security controls: `keychain`, `pin`, `biometric`, `obfuscate`, `audit`

### Skills
- **mobile-security-patterns** - iOS Keychain CRUD with accessibility options, biometric-gated Keychain items, URL session certificate pinning, Android EncryptedSharedPreferences, Keystore-backed BiometricPrompt, Network Security Config XML

## Quick Start

```bash
# iOS secure token storage
/mobile-sec keychain --ios

# Android cert pinning
/mobile-sec pin --android

# Biometric auth with hardware-backed key
/mobile-sec biometric --android --strict

# Scan code for anti-patterns
/mobile-sec audit --ios
```

## Keychain Accessibility Options

| Option | Accessible when locked | iCloud sync | Device transfer |
|--------|----------------------|-------------|-----------------|
| `WhenUnlockedThisDeviceOnly` | No | No | No |
| `WhenUnlocked` | No | Yes | Yes |
| `AfterFirstUnlockThisDeviceOnly` | Yes (after unlock) | No | No |
| `AfterFirstUnlock` | Yes (after unlock) | Yes | Yes |

Use `WhenUnlockedThisDeviceOnly` for auth tokens and credentials — most restrictive.

## Critical Rules

- Never store credentials in UserDefaults (iOS) or SharedPreferences (Android) — not encrypted
- Always pin public keys (SPKI hash), not leaf certificates — survives cert rotation
- Set `android:allowBackup="false"` to prevent `adb backup` data extraction
- Use `setInvalidatedByBiometricEnrollment(true)` — prevents new enrolled fingerprint from accessing existing keys
- Remove all `NSLog` / `Log.d` containing tokens, passwords, or PII before release
- Never set `NSAllowsArbitraryLoads: true` in production builds

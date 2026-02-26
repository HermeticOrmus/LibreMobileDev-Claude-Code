# /mobile-sec

Implement secure storage, certificate pinning, biometric authentication, and code obfuscation.

## Trigger

`/mobile-sec [action] [options]`

## Actions

- `keychain` - Implement Keychain Services (iOS) or EncryptedSharedPreferences (Android)
- `pin` - Certificate pinning with public key hash pinning
- `biometric` - Biometric authentication with Keystore/Keychain-backed keys
- `obfuscate` - R8/ProGuard rules for Android release builds
- `audit` - Scan for security anti-patterns in provided code

## Options

- `--ios` - iOS implementation (Keychain, LAContext, TrustKit, ATS)
- `--android` - Android implementation (Keystore, BiometricPrompt, Network Security Config)
- `--strict` - Most restrictive settings (`.biometryCurrentSet`, `WhenUnlockedThisDeviceOnly`)

## Process

### keychain
1. iOS: `SecItemAdd` with `kSecAttrAccessibleWhenUnlockedThisDeviceOnly`
2. Android: `EncryptedSharedPreferences` with `MasterKey.KeyScheme.AES256_GCM`
3. Add biometric gate: `SecAccessControl` (iOS) or `setUserAuthenticationRequired(true)` (Android)
4. Never store in UserDefaults / SharedPreferences / NSUserDefaults

### pin
1. Generate SHA-256 of SubjectPublicKeyInfo DER (not leaf cert)
2. iOS: `URLSessionDelegate.urlSession(_:didReceive:completionHandler:)` — verify hash in challenge
3. Android: `network_security_config.xml` with `<pin-set>` or OkHttp `CertificatePinner`
4. Always include minimum 2 hashes (primary + backup)
5. Set expiration date on Android pin-set; schedule rotation reminder

### biometric
1. iOS: `LAContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics)` for UI-only
2. iOS key-backed: `SecAccessControl` with `.biometryCurrentSet` on Keychain item
3. Android: `BiometricPrompt` with `CryptoObject` backed by AndroidKeyStore key
4. Use `setInvalidatedByBiometricEnrollment(true)` — prevents new finger attacks
5. Handle all error codes: `LAError.biometryNotAvailable`, `BIOMETRIC_ERROR_NO_HARDWARE`

### obfuscate
1. `buildTypes.release.minifyEnabled = true`
2. `shrinkResources = true` in release build type
3. Keep rules for: JNI classes, serialization, reflection-accessed classes, Retrofit interfaces
4. Test obfuscated build with all features before shipping
5. Retain mapping file for crash deobfuscation

### audit
1. Check for secrets in source (API keys, tokens, private keys)
2. Check storage: UserDefaults / SharedPreferences for sensitive data
3. Check NSLog / Log.d for token or PII leakage
4. Check ATS config: `NSAllowsArbitraryLoads`, `NSExceptionDomains`
5. Check `android:allowBackup`, `android:usesCleartextTraffic`, `debuggable` in release

## Output

```
## Security Implementation

### Storage
[Keychain / EncryptedSharedPreferences setup code]

### Network
[Pinning configuration]

### Biometrics
[Authentication flow code]

### Audit Findings
[Anti-patterns found with severity and fix]
```

## Examples

```bash
# iOS Keychain with biometric gate
/mobile-sec keychain --ios --strict

# Android certificate pinning
/mobile-sec pin --android

# Biometric prompt with Keystore key
/mobile-sec biometric --android

# Audit Swift file for security issues
/mobile-sec audit --ios

# ProGuard/R8 rules for release build
/mobile-sec obfuscate --android
```

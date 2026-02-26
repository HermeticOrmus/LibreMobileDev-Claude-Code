# /cross-platform

Design shared code architecture, implement platform channels, evaluate KMM vs Flutter vs RN.

## Trigger

`/cross-platform [action] [options]`

## Actions

- `design` - Architect shared vs platform-specific code split
- `channel` - Implement Flutter MethodChannel or EventChannel
- `kmp` - Set up Kotlin Multiplatform expect/actual declaration
- `decide` - Evaluate which cross-platform approach to use for given requirements

## Options

- `--flutter` - Flutter-specific output
- `--kmp` - Kotlin Multiplatform output
- `--rn` - React Native New Architecture output
- `--feature <name>` - Name of feature being implemented

## Process

### design
1. List all platform-specific APIs required (camera, biometrics, push, etc.)
2. Identify what is pure business logic (can be shared)
3. Draw layer boundary: shared data/domain layers vs platform presentation layer
4. Output directory structure recommendation

### channel
For Flutter MethodChannel:
1. Define channel name (reverse domain: `com.company/feature`)
2. Write Dart caller with error handling for `PlatformException`
3. Write Swift handler with `FlutterMethodChannel.setMethodCallHandler`
4. Write Kotlin handler with `MethodChannel.setMethodCallHandler`
5. For streams: use EventChannel with `FlutterStreamHandler`

### kmp
1. Define `expect` class or function in `commonMain`
2. Write `androidMain` actual implementation
3. Write `iosMain` actual implementation (with cinterop if needed)
4. Show Gradle multiplatform configuration

### decide
Collect requirements, output decision matrix:
```
## Framework Recommendation

### Requirements Analysis
- Platform-specific APIs needed: [list]
- Team background: [iOS+Android / JS / Kotlin / Dart]
- Custom native UI required: [Yes/No]
- Timeline: [constraint]

### Recommendation: [Flutter / KMM / React Native / Native x2]

### Rationale
[3-5 bullet points]

### Shared Code Estimate
- Can be shared: ~[N]% of codebase
- Must be native: ~[N]% of codebase
```

## Examples

```bash
# Design shared architecture for a banking app
/cross-platform design --feature payments

# Implement biometric auth channel in Flutter
/cross-platform channel --flutter --feature biometrics

# KMM shared repository pattern
/cross-platform kmp --feature user-data

# Help decide between Flutter and KMM
/cross-platform decide
```

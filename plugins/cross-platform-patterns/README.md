# Cross Platform Patterns

Flutter platform channels, Kotlin Multiplatform Mobile, React Native New Architecture, shared code architecture.

## What's Included

### Agents
- **cross-platform-architect** - Expert in Flutter MethodChannel/EventChannel, KMM expect/actual, RN TurboModules/JSI, shared repository patterns, native vs cross-platform decision making

### Commands
- `/cross-platform` - Design architecture, implement channels, set up KMM, evaluate frameworks

### Skills
- **cross-platform-patterns** - Flutter MethodChannel (Dart+Swift+Kotlin), EventChannel streams, KMM expect/actual, Ktor+SQLDelight shared repo, RN TurboModule spec, platform detection

## Quick Start

```bash
# Evaluate framework for new project
/cross-platform decide

# Implement native biometric auth in Flutter
/cross-platform channel --flutter --feature biometrics

# Set up shared network layer with KMM
/cross-platform kmp --feature network
```

## Framework Comparison

| | Flutter | KMM | React Native |
|---|---------|-----|--------------|
| UI | Shared (custom widgets) | Native per platform | Shared (JS components) |
| Business logic | Dart | Kotlin (shared) | JS/TS |
| Native access | MethodChannel | expect/actual | TurboModules (JSI) |
| Team fit | Any | Kotlin/Android devs | JS/Web devs |
| Performance | Good (Skia) | Native UI = best | Good (Hermes + JSI) |

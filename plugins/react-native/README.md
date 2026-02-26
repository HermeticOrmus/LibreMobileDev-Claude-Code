# React Native

New Architecture (JSI/TurboModules/Fabric), Expo EAS, React Navigation, Reanimated 3, Zustand, TanStack Query, MMKV storage.

## What's Included

### Agents
- **rn-developer** - Expert in New Architecture, Expo managed/bare workflows, React Navigation typed params, Reanimated 3 UI-thread animations, TurboModule specs, Metro bundler

### Commands
- `/react-native` - Build RN apps: `init`, `navigate`, `animate`, `build`

### Skills
- **react-native-patterns** - Typed `RootStackParamList` navigation, Zustand store with MMKV persistence, Reanimated 3 swipe card with Gesture.Pan, TanStack Query infinite list, TurboModule TypeScript spec, FlatList performance props

## Quick Start

```bash
# Typed navigation stack
/react-native navigate --typescript

# Swipe animation with Reanimated 3
/react-native animate

# Expo EAS build config
/react-native build --expo

# New Architecture setup
/react-native init --new-arch
```

## Architecture Decision Guide

| Need | Choose |
|------|--------|
| No custom native code | Expo managed |
| Custom native code or SDK | Bare workflow |
| Simple global state | Zustand |
| Atom-based reactive state | Jotai |
| Server data fetching/caching | TanStack Query |
| Synchronous storage | MMKV |
| Offline-first database | WatermelonDB |
| 60/120fps animations | Reanimated 3 |
| Platform-specific nav behavior | @react-navigation/native-stack |

## New Architecture Components

```
JS Thread (Hermes)
  ↕ JSI (direct C++ binding, no JSON)
UI Thread (Fabric renderer)
  ↕
Native Views

TurboModules: lazily loaded native modules
  TypeScript spec → code-gen → native interface
```

## Critical Rules

- Use `@react-navigation/native-stack` not JS stack — uses native UINavigationController/Fragment
- Always define `ParamList` types before writing screen components — type errors catch missing params
- Reanimated worklets (`useAnimatedStyle` callbacks) run on UI thread — never call JS functions directly
- Use `runOnJS(callback)()` to call back to JS from a worklet when an animation completes
- MMKV is synchronous; never use in render — call in event handlers or effects only
- EAS keystore must be in EAS secrets, never committed to git

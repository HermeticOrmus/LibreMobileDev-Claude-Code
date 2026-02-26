# /react-native

Build React Native screens, navigation, animations, native modules, and Expo config.

## Trigger

`/react-native [action] [options]`

## Actions

- `init` - Project setup, New Architecture config, Expo or bare workflow
- `navigate` - Type-safe navigation with React Navigation + deep links
- `animate` - Reanimated 3 gesture-driven animations
- `build` - EAS Build config, OTA updates, app signing

## Options

- `--expo` - Expo managed workflow (no native code)
- `--bare` - Bare workflow with full native projects
- `--new-arch` - Enable New Architecture (JSI, TurboModules, Fabric)
- `--platform <ios|android|both>` - Target platform
- `--typescript` - TypeScript setup (default: on)

## Process

### init
1. `npx create-expo-app --template` or `npx react-native@latest init` for bare
2. Enable New Architecture: `REACT_NATIVE_ENABLE_NEW_ARCHITECTURE=1` in `.env` + Podfile flag
3. Add Hermes engine (already default in RN 0.70+, required for New Arch)
4. Setup `metro.config.js` for monorepo or custom resolver
5. Configure EAS: `eas build:configure` → generates `eas.json`

### navigate
1. Define `RootStackParamList` type with all routes and their param types
2. Create `createNativeStackNavigator` (not JS stack) for performance
3. Wrap in `NavigationContainer` with `linking` config for deep links
4. Add `navigationRef` for programmatic navigation outside components
5. `useNavigation<NativeStackNavigationProp<RootStackParamList>>()` for typed hook

### animate
1. `useSharedValue` for animated values — runs on UI thread
2. `useAnimatedStyle` to map shared values to style properties
3. `Gesture.Pan()` / `Gesture.Tap()` from `react-native-gesture-handler`
4. `runOnJS(callback)()` to call JS from worklet (UI thread) when animation completes
5. `withSpring`, `withTiming`, `withSequence`, `withRepeat` for animation timing

### build
1. `eas.json` with `development` (dev client), `preview` (TestFlight/internal), `production` profiles
2. iOS: distribution certificate + provisioning profile auto-managed by EAS
3. Android: keystore stored in EAS secrets — never commit to git
4. OTA: `eas update --branch production --message "fix: checkout crash"` for JS-only changes
5. `expo-updates` config: `updates.url`, `updates.channel` in `app.config.js`

## Output

```
## React Native Implementation

### Dependencies
[npm/yarn install commands]

### Configuration
[metro.config.js / app.config.js / eas.json changes]

### Component Code
[TypeScript React Native component]

### Navigation Integration
[Route params + navigator setup]
```

## Examples

```bash
# Expo project with New Architecture
/react-native init --expo --new-arch

# Typed navigation stack with deep links
/react-native navigate --typescript

# Swipe-to-dismiss with Reanimated 3
/react-native animate

# EAS Build + OTA update config
/react-native build --expo

# TurboModule for native biometrics
/react-native init --bare --new-arch
```

# /gestures

Implement gesture recognizers, haptic feedback, velocity tracking, and custom gesture recognizers.

## Trigger

`/gestures [action] [options]`

## Actions

- `detect` - Implement a standard gesture (tap, swipe, pinch, rotate, long-press)
- `custom` - Build a custom gesture recognizer for a non-standard interaction
- `haptic` - Add haptic feedback at correct timing points
- `test` - Generate gesture testing checklist

## Options

- `--ios` - UIGestureRecognizer / SwiftUI gestures
- `--android` - GestureDetector / Compose pointerInput
- `--flutter` - GestureDetector / Listener
- `--gesture <type>` - swipe, pinch, rotate, long-press, tap, pan
- `--velocity` - Include velocity tracking and fling physics

## Process

### detect
1. Identify gesture type and required data (translation, velocity, scale, angle)
2. Select appropriate recognizer class
3. Output recognizer setup + handler with state machine (began/changed/ended/cancelled)
4. Add conflict resolution if multiple recognizers on same view

### custom
1. Describe the gesture pattern (shape, touch count, sequence)
2. Subclass UIGestureRecognizer (iOS) or implement GestureRecognizer (Flutter)
3. Override touchesBegan/Moved/Ended methods with recognition logic
4. Output the state transitions that trigger `.ended` vs `.failed`

### haptic
Output haptic feedback added to gesture handler at correct timing:
- iOS: `UIImpactFeedbackGenerator.prepare()` before interaction, `.impactOccurred()` at trigger point
- Android: `view.performHapticFeedback(HapticFeedbackConstants.CONFIRM)`
- Flutter: `HapticFeedback.mediumImpact()` at trigger point

### test
Output checklist:
- [ ] Gesture recognized on target element
- [ ] Gesture does not trigger on scroll/other elements (conflict check)
- [ ] Haptic fires at correct moment (not too early, not delayed)
- [ ] Velocity-based fling works at both slow and fast swipe speeds
- [ ] Cancelled gesture (incoming call, notification) handled gracefully
- [ ] Accessibility alternative exists for every gesture

## Examples

```bash
# Swipe-to-dismiss card (iOS)
/gestures detect --ios --gesture swipe --velocity

# Pinch-to-zoom image (Android Compose)
/gestures detect --android --gesture pinch

# Custom circular swipe recognizer (iOS)
/gestures custom --ios

# Add haptics to Flutter drag interaction
/gestures haptic --flutter

# Gesture testing checklist for all platforms
/gestures test
```

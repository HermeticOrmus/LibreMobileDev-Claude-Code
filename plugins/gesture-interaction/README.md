# Gesture Interaction

UIGestureRecognizer, SwiftUI gestures, Android GestureDetector/MotionEvent, Flutter GestureDetector, haptic feedback, custom recognizers, velocity-based physics.

## What's Included

### Agents
- **gesture-engineer** - Expert in gesture recognizer state machines, velocity tracking, simultaneous recognition, custom gesture recognizers, haptic feedback timing

### Commands
- `/gestures` - Detect, build custom recognizers, add haptics, generate test checklist

### Skills
- **gesture-patterns** - UIPanGestureRecognizer with velocity, custom UIGestureRecognizer subclass, Compose pointerInput/detectDragGestures, Flutter GestureDetector with fling, haptic timing table

## Quick Start

```bash
# Swipe-to-dismiss card with fling physics
/gestures detect --ios --gesture swipe --velocity

# Pinch-to-zoom in Jetpack Compose
/gestures detect --android --gesture pinch

# Add haptics to Flutter drag
/gestures haptic --flutter
```

## Haptic Reference

| Moment | iOS | Android | Flutter |
|--------|-----|---------|---------|
| Tap | `.light` | `KEYBOARD_TAP` | `lightImpact()` |
| Long press | `.medium` | `LONG_PRESS` | `mediumImpact()` |
| Confirm | `.heavy` | `CONFIRM` | `heavyImpact()` |
| Selection | `UISelectionFeedbackGenerator` | `CLOCK_TICK` | `selectionClick()` |
| Error | `.error` notification | `REJECT` | `vibrate()` |

## Key Rules

- Call `prepare()` on iOS haptic generators 200-500ms before expected use
- Never require swipe-only for destructive actions — provide button fallback
- Velocity > 600 px/s typically means user wants a fling, not a snap-back
- `shouldRecognizeSimultaneouslyWith:` resolves iOS gesture conflicts

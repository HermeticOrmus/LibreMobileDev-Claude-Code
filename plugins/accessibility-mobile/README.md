# Accessibility Mobile

iOS VoiceOver, Android TalkBack, Flutter Semantics, WCAG 2.1 compliance for production mobile apps.

## What's Included

### Agents
- **mobile-a11y-engineer** - Specialist in UIAccessibility, Android semantics, Flutter Semantics widget, WCAG 2.1 mobile criteria, contrast ratios, touch target sizing

### Commands
- `/mobile-a11y` - Audit, fix, test, and report on accessibility violations

### Skills
- **mobile-a11y-patterns** - Platform-specific patterns with Swift, Kotlin, and Dart code examples

## Quick Start

```bash
# Audit current screen for violations
/mobile-a11y audit --ios

# Fix all violations in a Flutter component
/mobile-a11y fix --flutter

# Generate VoiceOver/TalkBack testing checklist
/mobile-a11y test --all

# Full WCAG 2.1 compliance report
/mobile-a11y report
```

## Platform Coverage

| Feature | iOS (SwiftUI/UIKit) | Android (Compose/XML) | Flutter |
|---------|--------------------|-----------------------|---------|
| Screen reader | VoiceOver + UIAccessibility | TalkBack + semantics{} | Semantics widget |
| Labels | .accessibilityLabel() | contentDescription | Semantics(label:) |
| Roles | accessibilityTraits | Role.Button etc. | button: true |
| Live regions | UIAccessibility.post(.announcement) | accessibilityLiveRegion | SemanticsService.announce() |
| Touch targets | 44x44pt minimum | 48x48dp minimum | 48x48dp (Material) |

## WCAG 2.1 Criteria Covered

- 1.1.1 Non-text Content (alt text for images and icons)
- 1.3.1 Info and Relationships (semantic structure)
- 1.4.3 Contrast Minimum (4.5:1 normal, 3:1 large text)
- 1.4.11 Non-text Contrast (3:1 for UI components)
- 2.5.5 Target Size (44pt iOS, 48dp Android)
- 4.1.2 Name, Role, Value (interactive element labeling)

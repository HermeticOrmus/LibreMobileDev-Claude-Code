# /mobile-a11y

Accessibility audit, fix, and testing for iOS, Android, and Flutter apps.

## Trigger

`/mobile-a11y [action] [platform]`

## Actions

- `audit` - Scan current file/component for accessibility violations
- `fix` - Apply accessibility fixes to selected code
- `test` - Generate VoiceOver/TalkBack test checklist
- `report` - Full WCAG 2.1 compliance report with severity ratings
- `contrast` - Check and fix color contrast ratios

## Platform Flags

- `--ios` - iOS UIKit/SwiftUI focus
- `--android` - Android View/Compose focus
- `--flutter` - Flutter Semantics focus
- `--all` - Cross-platform analysis (default)

## Process

### audit
1. Parse the provided component/screen code
2. Check each interactive element for: label, hint, trait/role, touch target size
3. Check images for decorative vs meaningful classification
4. Check color values against WCAG 1.4.3 and 1.4.11
5. Output violations by severity: Critical / Major / Minor

### fix
1. Read the component code
2. Apply minimum required annotations (labels, roles, hints)
3. Add `accessibilityHidden(true)` to decorative elements
4. Combine child elements where appropriate
5. Output patched code with inline comments explaining each change

### test
Generate platform-specific testing checklist:

**VoiceOver (iOS) Checklist**
- [ ] Enable VoiceOver: Settings > Accessibility > VoiceOver (or triple-click side button)
- [ ] Swipe right through all elements — every interactive element is reachable
- [ ] Each button announces: "[label], button"
- [ ] Each image announces its meaningful description or is skipped if decorative
- [ ] Form fields announce: "[label], text field"
- [ ] Custom controls announce correct value and trait
- [ ] After screen transition, focus lands on first meaningful element
- [ ] No focus traps; escape/back always reachable

**TalkBack (Android) Checklist**
- [ ] Enable TalkBack: Settings > Accessibility > TalkBack
- [ ] Linear navigation (swipe right) covers all interactive elements
- [ ] Content descriptions are complete sentences, not just noun labels
- [ ] Grouped elements (cards) read as one unit
- [ ] Live regions announce dynamic content changes
- [ ] Touch target minimum 48dp verified with Layout Inspector
- [ ] Focus order follows visual reading order

**Flutter Checklist**
- [ ] `debugDumpSemanticsTree()` shows correct tree structure
- [ ] No orphaned Semantics nodes
- [ ] `MergeSemantics` applied to compound elements
- [ ] Decorative elements wrapped in `ExcludeSemantics`

### report
Output format:
```
## WCAG 2.1 Mobile Compliance Report
Platform: [iOS/Android/Flutter]
Component: [FileName]

### Summary
- Critical violations: N
- Major violations: N
- Minor violations: N
- Contrast failures: N

### Violations
| Criterion | Element | Issue | Severity | Fix |
|-----------|---------|-------|----------|-----|
| 1.1.1 | <Icon> | Missing alt text | Critical | Add contentDescription |
| 2.5.5 | <SmallBtn> | 32dp height | Major | Increase to 48dp |
| 1.4.3 | <BodyText> | 3.2:1 contrast | Critical | Change to #595959 on white |
```

## Examples

```bash
# Audit a SwiftUI component
/mobile-a11y audit --ios

# Fix Android Compose screen
/mobile-a11y fix --android

# Full accessibility report with contrast check
/mobile-a11y report --all

# Generate TalkBack test checklist
/mobile-a11y test --android

# Check specific color contrast
/mobile-a11y contrast --ios
```

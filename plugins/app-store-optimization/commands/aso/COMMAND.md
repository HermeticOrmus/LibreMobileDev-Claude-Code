# /aso

App Store and Google Play listing optimization: metadata, keywords, screenshots, monitoring.

## Trigger

`/aso [action] [options]`

## Actions

- `audit` - Score existing metadata against ASO best practices
- `keywords` - Research and optimize keyword strategy
- `screenshots` - Brief and spec screenshot sequence
- `monitor` - Define rank tracking and monitoring setup

## Options

- `--ios` - iOS App Store focus
- `--android` - Google Play focus
- `--both` - Both stores (default)
- `--locale <code>` - Target locale (en-US, es-ES, ja-JP, etc.)

## Process

### audit
1. Parse provided title, subtitle/short description, keyword field, description
2. Check character count vs limits per field
3. Check for keyword repetition between fields (wasted characters)
4. Score screenshot sequence: does first screenshot communicate value in 3 seconds?
5. Output scoring table with specific fixes

### keywords
1. Analyze current keyword coverage
2. Identify highest-impact gaps by volume and competition
3. Produce updated keyword field (100 chars for iOS, density plan for Android)
4. Show before/after character usage

### screenshots
Output creative brief for each screenshot:
```
Screenshot 1 (Hero):
  Goal: Communicate core value proposition in 3 seconds
  Visual: [screen/mockup description]
  Caption: "[benefit-oriented text, max 30 chars for legibility]"
  Device frame: [iOS 6.9" or Android pixel mockup]

Screenshot 2:
  Goal: Demonstrate primary use case
  Visual: [screen description]
  Caption: "[text]"
```

### monitor
Define tracking setup:
- Primary keywords to monitor (10-15 max)
- Competitor apps to benchmark against
- Alert thresholds (rank drops > 5 positions)
- Review velocity tracking (target: N reviews/week)
- Recommended tools: AppFollow, Sensor Tower, AppTweak

## Output

### audit output
```
## ASO Audit — [App Name]

### Field Scores
| Field | Used | Limit | Score | Issues |
|-------|------|-------|-------|--------|
| Title | 18 | 30 | 7/10 | Missing primary keyword |
| Subtitle | 30 | 30 | 9/10 | Good |
| Keywords | 87 | 100 | 6/10 | 13 chars wasted, 4 repeated words |

### Quick Wins
1. Add "[keyword]" to title — est. +15% search impression share
2. Remove "[repeated word]" from keyword field — free 8 chars for "[better keyword]"
3. Replace screenshot 1 caption: "[current]" → "[benefit-focused alternative]"
```

## Examples

```bash
# Full listing audit for iOS
/aso audit --ios

# Android keyword optimization for Spanish market
/aso keywords --android --locale es-ES

# Screenshot brief for both stores
/aso screenshots --both

# Set up monitoring after a metadata update
/aso monitor --both
```

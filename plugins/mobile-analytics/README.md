# Mobile Analytics

Firebase Analytics, Amplitude, Mixpanel, AppsFlyer attribution, Crashlytics, Sentry — event taxonomy, funnels, crash reporting.

## What's Included

### Agents
- **mobile-analytics-engineer** - Expert in Firebase event constraints, funnel design, AppsFlyer attribution, Crashlytics non-fatal errors, A/B test instrumentation, crash-free rate monitoring

### Commands
- `/mobile-analytics` - Implement tracking, design funnels, configure attribution, set up crash reporting

### Skills
- **analytics-patterns** - AnalyticsService abstraction (Swift + Kotlin), Firebase event constraints, DebugView commands, Crashlytics error recording, AppsFlyer attribution, funnel event schema

## Quick Start

```bash
# Design and implement checkout funnel
/mobile-analytics funnel --ios --feature checkout

# Set up crash reporting
/mobile-analytics crash --android --sdk firebase

# Attribution tracking
/mobile-analytics attribute --android --sdk appsflyer
```

## Firebase Event Constraints

| Field | Limit |
|-------|-------|
| Event name | 40 chars, snake_case |
| Parameters per event | 25 |
| Parameter name | 40 chars |
| String parameter value | 100 chars |
| Custom user properties | 25 |

## Key Rules

- Always abstract SDK calls behind an `AnalyticsService` class — never call Firebase directly from UI
- Never log PII (email, phone, name) as event properties
- Use `screen_name` parameter to segment events by origin screen
- Validate with Firebase DebugView before releasing
- Target > 99.5% crash-free users; alert below 99%

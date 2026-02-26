# /mobile-analytics

Event tracking, funnel design, attribution setup, crash reporting configuration.

## Trigger

`/mobile-analytics [action] [options]`

## Actions

- `track` - Implement event tracking for a feature or flow
- `funnel` - Design and implement a conversion funnel
- `attribute` - Configure AppsFlyer or Firebase attribution
- `crash` - Set up Crashlytics or Sentry crash reporting

## Options

- `--ios` - Swift implementation
- `--android` - Kotlin implementation
- `--flutter` - Dart implementation
- `--sdk <name>` - firebase, amplitude, mixpanel, appsflyer
- `--feature <name>` - Feature or flow to instrument

## Process

### track
1. Define event name (snake_case, max 40 chars)
2. Define parameters (max 25, no PII)
3. Implement in `AnalyticsService` abstraction
4. Output platform SDK call
5. Include DebugView validation command

### funnel
1. Map user journey as sequence of events
2. Define consistent parameter schema across events
3. Output event taxonomy table
4. Output implementation for each step
5. Define success metric (e.g., purchase event)

### attribute
1. Configure AppsFlyer/Firebase SDK initialization
2. Map in-app events to attribution schema
3. Handle deferred deep link from install
4. Test install attribution in sandbox mode

### crash
1. Initialize Crashlytics/Sentry with crash-free rate target
2. Set up user ID binding without PII
3. Add custom keys for context (screen, API endpoint)
4. Implement non-fatal error recording
5. Output crash-free rate monitoring query

## Output Format

```
## Event Taxonomy

| Event Name | Parameters | Trigger |
|------------|-----------|---------|

## Implementation

### AnalyticsService
[Service class code]

### Usage
[Call sites in feature code]

## Validation
[DebugView command or Amplitude Live stream steps]
```

## Examples

```bash
# Instrument checkout funnel for iOS
/mobile-analytics funnel --ios --sdk firebase --feature checkout

# Set up AppsFlyer for Android
/mobile-analytics attribute --android --sdk appsflyer

# Crashlytics + non-fatal error logging
/mobile-analytics crash --ios --sdk firebase

# Track product catalog events (all platforms)
/mobile-analytics track --flutter --feature product-catalog
```

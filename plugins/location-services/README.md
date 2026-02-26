# Location Services

iOS CoreLocation, Android FusedLocationProvider, Flutter geolocator, geofencing, geocoding, MapKit/Google Maps/flutter_map.

## What's Included

### Agents
- **location-engineer** - Expert in CLLocationManager authorization levels, FusedLocationProvider priorities, geofencing limits, reverse geocoding, MapKit clustering, battery-efficient strategies

### Commands
- `/location` - Configure tracking, geofencing, geocoding, and map integration

### Skills
- **location-patterns** - CoreLocation Swift, FusedLocation Kotlin, Flutter geolocator, iOS geofencing, Android geofencing, flutter_map, battery impact table

## Quick Start

```bash
# Basic location setup
/location configure --ios --accuracy hundred-meters

# Background geofencing
/location geofence --ios --background

# Cross-platform map
/location map --flutter
```

## Permission Requirements

| Feature | iOS | Android |
|---------|-----|---------|
| Foreground location | `whenInUse` | `ACCESS_FINE_LOCATION` |
| Background location | `always` | `ACCESS_BACKGROUND_LOCATION` (separate request) |
| Geofencing | `always` | `ACCESS_BACKGROUND_LOCATION` |

## Battery Tiers

| Tier | Accuracy | Use Case |
|------|----------|----------|
| Significant change | ~500m | "Notify when near home" |
| Balanced | ~100m | Store locator, check-in |
| High accuracy | ~5m | Run tracking, navigation |
| Best for navigation | ~3m | Turn-by-turn navigation |

## Maps Library Comparison

- MapKit — iOS only, free, best native integration
- Google Maps SDK — iOS + Android, requires API key and billing
- flutter_map + OpenStreetMap — cross-platform, no API key, open data

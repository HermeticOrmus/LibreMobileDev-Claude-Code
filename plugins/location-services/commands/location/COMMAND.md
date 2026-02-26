# /location

Configure location tracking, geofencing, geocoding, and maps integration.

## Trigger

`/location [action] [options]`

## Actions

- `configure` - Set up CLLocationManager / FusedLocationProvider / geolocator
- `track` - Implement real-time location tracking with appropriate accuracy
- `geofence` - Add geofence with entry/exit triggers
- `map` - Integrate MapKit / Google Maps / flutter_map

## Options

- `--ios` - CoreLocation / MapKit focus
- `--android` - FusedLocationProvider / Google Maps focus
- `--flutter` - geolocator / flutter_map focus
- `--accuracy <tier>` - `best`, `hundred-meters`, `kilometer`, `significant`
- `--background` - Include background location (always authorization)

## Process

### configure
1. Select authorization level based on use case
2. Output Info.plist keys (iOS) or AndroidManifest permissions (Android)
3. Output `CLLocationManager` / `FusedLocationProviderClient` setup
4. Include permission request flow with denial handling

### track
1. Determine accuracy tier appropriate for use case
2. Set `distanceFilter` / `setMinUpdateDistanceMeters` to avoid unnecessary updates
3. Output start/stop tracking code tied to lifecycle
4. Include location age/accuracy validation (filter stale/inaccurate fixes)

### geofence
1. Output geofence setup with center, radius, and transition types
2. Include max count caveat (20 iOS, 100 Android)
3. Output geofence event handler
4. Note: requires `always` authorization on iOS

### map
1. Select map library (MapKit for iOS-only, Google Maps SDK for both, flutter_map for cross-platform without API key)
2. Output map setup with annotation/marker
3. Include camera positioning to user location
4. Include clustering recommendation for many markers

## Output

```
## Location Configuration

### Use Case: [description]
### Authorization: [whenInUse/always + reason]
### Accuracy: [tier + battery impact]

## Setup Code
[Platform-specific location manager setup]

## Permission Flow
[Request code + denial handling]

## Update Handler
[Location received callback]
```

## Examples

```bash
# Configure basic location tracking for iOS
/location configure --ios --accuracy hundred-meters

# Real-time navigation tracking
/location track --android --accuracy best

# Geofence for store arrival detection (iOS)
/location geofence --ios --background

# MapKit integration with annotations
/location map --ios

# Cross-platform map with flutter_map (no Google API key)
/location map --flutter
```

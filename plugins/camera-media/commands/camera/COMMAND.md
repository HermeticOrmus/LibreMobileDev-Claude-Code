# /camera

Camera and media capture setup, configuration, processing, and AR integration.

## Trigger

`/camera [action] [platform]`

## Actions

- `configure` - Set up AVCaptureSession / CameraX / CameraController for target use case
- `capture` - Implement photo or video capture with output handling
- `process` - Image/video processing pipeline (filters, compression, ML analysis)
- `ar` - ARKit (iOS) or ARCore (Android) integration setup

## Platform Flags

- `--ios` - AVFoundation / ARKit
- `--android` - CameraX / ARCore
- `--flutter` - camera package

## Process

### configure
1. Ask for use case: still photo, video recording, live ML analysis, AR overlay, or combined
2. Select appropriate API and quality preset:
   - Still photo: `.photo` preset (iOS), `CAPTURE_MODE_MINIMIZE_LATENCY` (Android)
   - Video: `.high` preset (iOS), `VideoCapture<Recorder>` use case (Android)
   - ML analysis: Add `AVCaptureVideoDataOutput` / `ImageAnalysis` use case
3. Output permission setup + session initialization code
4. Include lifecycle cleanup code (session stop, controller dispose)

### capture
Output complete capture implementation:
- iOS: `AVCapturePhotoSettings` with format selection + `AVCapturePhotoCaptureDelegate`
- Android: `ImageCapture.OutputFileOptions` + `OnImageSavedCallback`
- Flutter: `CameraController.takePicture()` returning `XFile`
- Includes error handling for each platform

### process
Options:
- Filter: Apply CoreImage / RenderScript / Flutter image package filter
- Compress: Output HEIC/JPEG compression code with quality parameter
- Resize: Downsample for upload without loading full image into memory
- Analyze: ML Kit / Vision framework integration for face/text/barcode detection

### ar
- iOS ARKit: `ARSession` + `ARWorldTrackingConfiguration` + `ARSCNView`/`ARView` setup
- Android ARCore: `ArFragment` + `Session` + `Anchor` placement
- Flutter: `ar_flutter_plugin` integration

## Output Format

```
## Camera Configuration

### Platform: [iOS/Android/Flutter]
### Use Case: [description]

### Permissions
[Manifest/Info.plist entries]
[Runtime request code]

### Session Setup
[Complete initialization code]

### Capture Method
[Capture implementation]

### Cleanup
[Lifecycle teardown]
```

## Examples

```bash
# Configure iOS camera for photo capture
/camera configure --ios

# Implement Android video recording
/camera capture --android

# Set up real-time face detection
/camera process --android

# ARKit scene anchoring
/camera ar --ios
```

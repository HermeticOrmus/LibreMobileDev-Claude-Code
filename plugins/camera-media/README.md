# Camera Media

iOS AVFoundation, Android CameraX/Camera2, Flutter camera, ARKit/ARCore, image/video processing.

## What's Included

### Agents
- **camera-engineer** - Expert in AVCaptureSession, CameraX use cases, photo/video capture, CoreImage, ML Kit Vision, ARKit, ARCore

### Commands
- `/camera` - Configure, capture, process, and AR setup across platforms

### Skills
- **camera-media-patterns** - AVCaptureSession Swift, CameraX Kotlin, Flutter camera Dart, HEIC/JPEG tradeoffs, ML Kit analysis, permission flow

## Quick Start

```bash
# iOS camera setup
/camera configure --ios

# Android still photo with CameraX
/camera capture --android

# Real-time ML analysis pipeline
/camera process --android

# ARKit world tracking
/camera ar --ios
```

## Platform API Reference

| Feature | iOS | Android | Flutter |
|---------|-----|---------|---------|
| Session | AVCaptureSession | ProcessCameraProvider | CameraController |
| Photo | AVCapturePhotoOutput | ImageCapture | takePicture() |
| Video | AVCaptureMovieFileOutput | VideoCapture<Recorder> | startVideoRecording() |
| ML Analysis | AVCaptureVideoDataOutput | ImageAnalysis | imageStream |
| AR | ARKit / ARSession | ARCore / ArFragment | ar_flutter_plugin |

## Key Decisions

- CameraX preferred over Camera2 for all new Android code
- HEIC for storage-sensitive intra-app use cases; JPEG for sharing
- Always release camera resources in lifecycle callbacks to avoid black screen bugs
- Never initialize `AVCaptureSession` on the main thread

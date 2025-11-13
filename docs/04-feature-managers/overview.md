# Feature Managers Overview

## Purpose

Feature Managers provide user-facing capabilities: audio, camera, sensors, location, etc. These are what make apps interactive and engaging.

## The 10 Feature Managers

### Tier 1: Common Features (Implement First)

#### 1. NotificationManager
**Priority**: HIGH
**Purpose**: Show local notifications

**APIs**:
- `notify(title, message): NotificationId`
- `notify(notification: Notification): NotificationId`
- `cancel(id: NotificationId)`
- `createChannel(channel: NotificationChannel)` (API 26+)

**Implementation**: ~400 LOC
**Features**: Basic notifications, channels, actions, custom layouts
**Doc**: [NotificationManager.md](NotificationManager.md)

---

#### 2. VibrationManager
**Priority**: MEDIUM
**Purpose**: Haptic feedback and vibration patterns

**APIs**:
- `vibrate(duration: Duration)`
- `vibrate(pattern: seq[(Duration, Intensity)])`
- `cancel()`
- `hasVibrator(): bool`

**Implementation**: ~200 LOC
**Features**: Simple vibration, patterns, amplitudes, hardware detection
**Doc**: [VibrationManager.md](VibrationManager.md)

---

#### 3. ClipboardManager
**Priority**: MEDIUM
**Purpose**: Copy/paste text and data

**APIs**:
- `setText(text: string)`
- `getText(): Option[string]`
- `hasText(): bool`
- `onClipboardChanged(callback: proc())`

**Implementation**: ~150 LOC
**Features**: Text clipboard, primary clip, change notifications
**Doc**: [ClipboardManager.md](ClipboardManager.md)

---

#### 4. StorageManager
**Priority**: HIGH
**Purpose**: File system access and storage info

**APIs**:
- `getInternalStoragePath(): string`
- `getExternalStoragePath(): Option[string]`
- `getAvailableSpace(): int64`
- `isExternalStorageAvailable(): bool`

**Implementation**: ~300 LOC
**Features**: Internal/external storage, scoped storage (API 29+), permissions
**Doc**: [StorageManager.md](StorageManager.md)

---

### Tier 2: Media Features

#### 5. AudioManager
**Priority**: HIGH
**Purpose**: Audio playback, recording, volume control

**APIs**:
- `play(path: string): AudioPlayer`
- `record(path: string): AudioRecorder`
- `setVolume(stream: AudioStream, volume: float)`
- `getVolume(stream: AudioStream): float`
- `setRingerMode(mode: RingerMode)`

**Implementation**: ~600 LOC
**Features**:
- Multiple playback methods (MediaPlayer, AudioTrack, SoundPool)
- Recording (MediaRecorder, AudioRecord)
- Volume control per stream
- Ringer mode (silent, vibrate, normal)
- Audio focus management

**Doc**: [AudioManager.md](AudioManager.md)

---

#### 6. MediaManager
**Priority**: MEDIUM
**Purpose**: Video playback

**APIs**:
- `playVideo(path: string, surface: Surface): VideoPlayer`
- `pause()`, `resume()`, `stop()`
- `seekTo(position: Duration)`
- `getDuration(): Duration`

**Implementation**: ~400 LOC
**Features**: MediaPlayer-based video, playback controls, surface rendering
**Doc**: [MediaManager.md](MediaManager.md)

---

#### 7. CameraManager
**Priority**: HIGH
**Purpose**: Photo/video capture

**APIs**:
- `takePhoto(callback: proc(path: string))`
- `recordVideo(callback: proc(path: string))`
- `getCameras(): seq[CameraInfo]`
- `selectCamera(cameraId: string)`

**Implementation**: ~700 LOC
**Features**:
- Camera2 API support (API 21+)
- Preview surface
- Photo capture with JPEG compression
- Video recording
- Flash control
- Focus control

**Doc**: [CameraManager.md](CameraManager.md)

---

### Tier 3: Sensors & Location

#### 8. SensorManager
**Priority**: MEDIUM
**Purpose**: Access device sensors (accelerometer, gyro, etc.)

**APIs**:
- `getSensorList(): seq[SensorInfo]`
- `registerListener(sensorType: SensorType, callback: proc(values: seq[float]))`
- `unregisterListener(sensorType: SensorType)`
- `getSensorByType(sensorType: SensorType): Option[SensorInfo]`

**Implementation**: ~400 LOC
**Features**:
- Accelerometer, Gyroscope, Magnetometer
- Light, Proximity, Pressure
- Step counter, Heart rate
- Sampling rate control

**Doc**: [SensorManager.md](SensorManager.md)

---

#### 9. LocationManager
**Priority**: HIGH
**Purpose**: GPS and location services

**APIs**:
- `getLastKnownLocation(): Option[Location]`
- `requestLocationUpdates(callback: proc(loc: Location))`
- `stopLocationUpdates()`
- `isLocationEnabled(): bool`

**Implementation**: ~500 LOC
**Features**:
- FusedLocationProviderClient (Google Play Services)
- Fallback to LocationManager
- GPS, Network, Passive providers
- Geofencing

**Doc**: [LocationManager.md](LocationManager.md)

---

#### 10. NetworkManager
**Priority**: HIGH
**Purpose**: HTTP requests, WebSocket, downloads

**APIs**:
- `get(url: string): Future[Response]`
- `post(url: string, body: string): Future[Response]`
- `download(url: string, dest: string): Future[void]`
- `websocket(url: string): WebSocket`

**Implementation**: ~600 LOC
**Features**:
- HttpURLConnection-based HTTP client
- Async requests with Futures
- File downloads with progress
- WebSocket support

**Doc**: [NetworkManager.md](NetworkManager.md)

---

## Implementation Complexity

### Simple (< 300 LOC)
- ClipboardManager
- VibrationManager

### Moderate (300-500 LOC)
- NotificationManager
- StorageManager
- SensorManager
- MediaManager

### Complex (500+ LOC)
- AudioManager
- LocationManager
- NetworkManager
- CameraManager

---

## Dependencies

```
All Feature Managers depend on:
  ├─> Core Infrastructure (Phase 1)
  ├─> PermissionManager (Phase 2)
  └─> LifecycleManager (Phase 3)

Specific dependencies:
  AudioManager → StorageManager (for file paths)
  CameraManager → StorageManager (for saving photos)
  LocationManager → ConnectivityManager (optional, for network location)
  NetworkManager → ConnectivityManager (for connection check)
```

---

## Hardware Capability Detection

All feature managers must detect hardware availability:

```nim
type
  AudioManager = object
    hasAudioOutput: bool
    hasAudioInput: bool
    supportedCodecs: seq[AudioCodec]

proc init(_: type AudioManager): AudioManager =
  result.hasAudioOutput = detectAudioOutput()
  result.hasAudioInput = detectMicrophone()
  result.supportedCodecs = detectSupportedCodecs()

proc play*(audio: AudioManager, path: string): DruidResult[void] =
  if not audio.hasAudioOutput:
    return err(newException(UnsupportedFeatureError,
      "No audio output device available"))

  # ... proceed with playback
```

---

## Graceful Degradation

Example: Camera unavailable

```nim
proc takePhoto*(): DruidResult[string] =
  let cam = camera()

  if not cam.hasCamera():
    return err(newException(UnsupportedFeatureError,
      "No camera available"))

  if not permissions().hasPermission(CAMERA):
    let granted = await permissions().requestPermission(CAMERA)
    if not granted:
      return err(newException(PermissionError,
        "Camera permission denied"))

  # Proceed with capture
  try:
    let path = cam.takePictureInternal()
    return ok(path)
  except JavaException as e:
    return err(newException(DruidError, "Failed to take photo: " & e.msg))
```

---

## Testing Matrix

### Hardware Testing

| Manager | Requires Real Device | Emulator OK | Hardware Variations |
|---------|---------------------|-------------|---------------------|
| Notification | No | Yes | None |
| Vibration | Yes (for haptics) | Partial | Motor types |
| Clipboard | No | Yes | None |
| Storage | No | Yes | Internal/External |
| Audio | Yes (for output) | Partial | Codecs, channels |
| Media | Yes | Partial | Video formats |
| Camera | Yes | No | Camera2 vs old API |
| Sensor | Yes | Partial | Sensor types vary |
| Location | Yes | Partial (mock) | GPS, Network |
| Network | No | Yes | None |

### API Level Testing

Test on:
- API 21 (Lollipop) - Minimum
- API 26 (Oreo) - Notification channels
- API 29 (Q) - Scoped storage
- API 30 (R) - New permissions
- API 33+ (Tiramisu) - Latest

---

## Example: Complete Feature App

```nim
import druid
import asyncdispatch

proc buildMediaApp() {.async.} =
  # Request permissions
  let perms = @[CAMERA, RECORD_AUDIO, ACCESS_FINE_LOCATION]
  let granted = await permissions().requestPermissions(perms)

  # Setup notifications
  let channel = NotificationChannel(
    id: "media",
    name: "Media Events",
    importance: High
  )
  notifications().createChannel(channel)

  # Take photo
  if granted[0]:  # Camera
    let photoPath = camera().takePhoto().get
    notifications().notify("Photo Taken", "Saved to " & photoPath)

  # Record audio
  if granted[1]:  # Microphone
    let recorder = audio().record("/sdcard/recording.mp3")
    await sleepAsync(5000)
    recorder.stop()
    vibrate(200.milliseconds)  # Haptic feedback

  # Get location
  if granted[2]:  # Location
    let loc = await location().getCurrentLocation()
    echo "You are at: ", loc.latitude, ", ", loc.longitude

  # Download something
  let response = await network().get("https://example.com/api/data")
  if response.status == 200:
    clipboard().setText(response.body)
    notifications().notify("Downloaded", "Data copied to clipboard")

  # Check storage
  let storage = storage()
  let available = storage.getAvailableSpace() div (1024 * 1024)
  echo "Available storage: ", available, " MB"

  # Monitor sensors
  sensors().registerListener(Accelerometer) do (values: seq[float]):
    echo "Accel: ", values

  # Play sound when done
  audio().play("done.mp3")
```

---

## Success Criteria

- [ ] All 10 feature managers implemented
- [ ] Hardware detection working on all devices
- [ ] Permissions integrated properly
- [ ] Graceful degradation when features unavailable
- [ ] Tested on real devices (not just emulator)
- [ ] Example apps for each manager
- [ ] Performance acceptable (< 16ms for UI operations)

---

## Next Steps

1. Start with simple managers (Clipboard, Vibration)
2. Implement Notification (commonly needed)
3. Build Storage (needed by Audio/Camera)
4. Implement Audio (complex but essential)
5. Camera, Sensors, Location
6. Network last (most self-contained)

---

**See individual manager docs for detailed implementation specs**.

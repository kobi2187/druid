# Druid Status - Current vs Full Vision

## Current Implementation (v0.2 - Alpha)

### ✅ What's Working Now

**Core Infrastructure**:
- AndroidRuntime singleton with jnim integration
- Lazy manager initialization
- API level detection and adaptation
- Explicit SDK naming convention (`SdkManagerName`)
- Activity lifecycle integration (`setCurrentActivity`, `clearCurrentActivity`)

**Implemented Managers** (11 total):

**Essential Services** (5):

1. **SdkPackageManager** ✅
   - App package name, version code, version name
   - System feature detection
   - Caching for performance

2. **SdkPermissionManager** ✅ **Desktop-like!**
   - Async permission requests (`await requestCameraAccess()`)
   - High-level APIs (camera, location, microphone, storage)
   - Batch requests with PermissionResult
   - Automatic API 23+ adaptation

3. **SdkConnectivityManager** ✅
   - Network connectivity status
   - Network type detection (WiFi, Cellular, Ethernet, etc.)
   - Metered connection detection
   - Roaming status

4. **SdkPowerManager** ✅
   - Battery level and status monitoring
   - Wake lock management
   - Battery optimization detection
   - Doze mode detection (API 23+)
   - Thermal status (API 29+)

5. **SdkStorageManager** ✅
   - Internal/external storage paths
   - Storage space queries
   - External storage state checking
   - Cache management

**Feature Services** (6):

6. **SdkNotificationManager** ✅
   - Local notifications
   - Notification channels (API 26+)
   - Auto-channel creation
   - Simple and custom notification builders

7. **SdkVibrationManager** ✅
   - Simple vibration (duration-based)
   - Pattern vibration (on/off sequences)
   - Amplitude control (API 26+)
   - Hardware availability checking

8. **SdkClipboardManager** ✅
   - Copy text to clipboard
   - Get text from clipboard
   - Check if has text
   - Clear clipboard

9. **SdkLocationManager** ✅ (Basic)
   - Location provider checking
   - Last known location
   - Async current location (basic)
   - Distance and bearing calculations
   - Provider availability
   - Note: Advanced features need callback bridge (see BINDING_TODOS.md)

10. **SdkAudioManager** ✅ (Basic)
    - System audio queries (ringer mode, volume, music active)
    - Ringer mode control
    - Stream volume control (music, alarm, notification, etc.)
    - Simple audio playback (MediaPlayer)
    - Basic player controls (play, pause, stop, seek)
    - Note: Full AudioStream object-based API is TODO (see niceapi.txt)

11. **SdkDisplayManager** ✅
    - Screen dimensions (pixels and dp)
    - Screen density (DPI, density multiplier)
    - Screen rotation and orientation
    - Display refresh rate
    - Unit conversions (dp↔px, sp↔px)
    - Device type detection (tablet vs phone)

### API Style (Current)

```nim
# Simple, functional style
let pkg = packageManager()
echo pkg.getPackageName()

# Feature managers
notifications().notify("Title", "Message")
vibration().vibrate(300)
clipboard().setText("Copied!")

# Essential services
if connectivity().isConnected():
  downloadData()

let battery = power().getBatteryInfo()
echo "Battery: ", battery.level, "%"

let space = storage().getAvailableSpace(slInternal)
echo "Free space: ", space div (1024*1024), " MB"

# Location services
if location().isLocationEnabled():
  let loc = location().getBestLastKnownLocation()
  if loc.isSome:
    echo "Position: ", loc.get().latitude, ", ", loc.get().longitude

# Audio (basic)
let player = audio().playSound("/sdcard/Music/song.mp3")
player.pause()
player.resume()

# Display info
let screen = display().getScreenInfo()
echo "Screen: ", screen.widthPixels, "x", screen.heightPixels
let buttonSize = display().dpToPx(48.0)  # 48dp button

# Async permissions (desktop-like!)
let granted = await permissions().requestCameraAccess()
if granted:
  camera().takePhoto()
```

---

## Full Vision (from design docs)

### From `niceapi.txt` and `whole discussion.md`

The original design describes a more sophisticated system:

### 1. Instance-Based Object Control

Instead of simple fire-and-forget calls, return controllable objects:

```nim
# Original vision: AudioStream object with full control
let stream = audio.play("music.mp3", AudioFilePrefs(
  volume: 80,
  looping: true,
  fadeInDuration: 2.seconds
))

stream.pause()
await sleepAsync(1000)
stream.resume()
stream.seekTo(30.seconds)
stream.setVolume(50)
stream.stop()

# Current: Simple call (basic implementation)
let player = audio().playSound("music.mp3")
```

### 2. Dual Preference System

System-level vs instance-level preferences:

```nim
# Original vision: System preferences
audio.systemPrefs.ringerMode = rmVibrate
audio.systemPrefs.systemVolume = 70

# Instance preferences per stream
let prefs = AudioFilePrefs(
  volume: 100,  # This stream only
  fadeInDuration: 1.second,
  looping: true
)
let stream = audio.play("song.mp3", prefs)

# Current: No preference system yet (direct calls)
audio().setRingerMode(rmVibrate)
```

### 3. Strategy Pattern (Internal)

Managers detect capabilities and select best API:

```nim
# Original vision (internal):
type AudioManager = ref object
  systemPrefs: AudioSystemPrefs
  strategy: AudioStrategy  # Selects:
    # - OpenSL ES (low-latency, NDK)
    # - AudioTrack (low-level, SDK)
    # - MediaPlayer (high-level, SDK)

# At init:
if device.hasLowLatencyAudio:
  manager.strategy = OpenSLESStrategy()
else:
  manager.strategy = AudioTrackStrategy()

# User sees same API regardless
let stream = audio.play("music.mp3")  # Uses best available

# Current: Single SDK implementation per manager
```

### 4. ResurrectionManager (Key Innovation!)

**The Big Idea**: Make Android feel like desktop development by hiding process death.

```nim
# Original vision: Transparent state persistence
var gameScore = 0
var playerName = ""

proc playGame() =
  keepAlive("score", gameScore)  # Survives process death!
  keepAlive("player", playerName)

  gameScore += 10
  # State automatically saved

# Later, after Android kills and revives the process:
proc onResume() =
  # Variables are magically restored!
  echo "Welcome back ", playerName
  echo "Your score: ", gameScore
  # Feels like the process never died

# Current: Not implemented yet
# User must manually handle onSaveInstanceState, etc.
```

### 5. Hardware-Aware Initialization

Detect device capabilities and adapt:

```nim
# Original vision:
type VibrationManager = ref object
  systemPrefs: VibrationSystemPrefs
  strategy: VibrationStrategy
  hasAmplitudeControl: bool  # Detected at init

# At init:
if Build.VERSION.SDK_INT >= 26 and vibrator.hasAmplitudeControl():
  manager.hasAmplitudeControl = true
  manager.strategy = VibrationEffectStrategy()
else:
  manager.strategy = LegacyVibratorStrategy()

# User's call adapts automatically:
vibrate(300.ms, viHard)
# With amplitude: Uses VibrationEffect.createOneShot(300, 255)
# Without amplitude: Uses Vibrator.vibrate(300) and ignores intensity

# Current: Partially implemented
# VibrationManager checks capabilities but simpler strategy
```

### 6. Rich Vibration Patterns

```nim
# Original vision: Expressive vibration sequences
vibrate(@[
  (300.ms, viHard),
  (700.ms, viSoft),
  (4000.ms, viSleep)
])

# Or predefined patterns:
vibrateClick()        # Short click feedback
vibrateDoubleClick()  # Double click pattern
vibrateTick()         # Light tick feedback
vibrateHeavyClick()   # Strong feedback

# Current: Pattern support exists but simpler
vibration().vibratePattern(@[0, 100, 100, 100])  # on/off only
```

### 7. Compile-Time Feature Tracking

```nim
# Original vision: Automatic manifest generation
import druid

proc myApp() =
  let audio = audio()      # Tracks: afAudio
  let camera = camera()    # Tracks: afCamera
  let loc = location()     # Tracks: afLocation

# Druid automatically:
# 1. Generates AndroidManifest.xml with:
#    <uses-permission android:name="android.permission.CAMERA" />
#    <uses-permission android:name="android.permission.RECORD_AUDIO" />
#    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
# 2. Only compiles needed managers (smaller binary)
# 3. Knows which permissions to request at runtime

# Current: Feature enum exists but tracking not implemented
```

---

## Gap Analysis

### Current Status: Foundation + Basic Managers (Phase 2 Complete, Phase 3 Started)

We have:
- ✅ Clean Nim APIs (simple functional style)
- ✅ jnim integration working
- ✅ Lazy manager initialization
- ✅ API level adaptation (basic)
- ✅ 11 working managers (5 essential, 6 feature)
- ✅ Desktop-like permission API
- ✅ Essential services complete (Connectivity, Power, Storage)
- ✅ Started on media/sensors (Location, Audio, Display)

### Missing from Full Vision

**High Value** (should implement next):

1. **ResurrectionManager** ⭐⭐⭐
   - Process death handling
   - Automatic state persistence
   - `keepAlive()`, `keepSession()`, `keepTemporary()`
   - This is THE key differentiator!

2. **Instance-Based Objects**
   - AudioStream with pause/resume/seekTo
   - CameraSession with preview control
   - Not just fire-and-forget

3. **Dual Preference System**
   - System-level preferences
   - Instance-level preferences
   - Clean separation of concerns

**Medium Value**:

4. **Strategy Pattern** (internal)
   - Automatic NDK vs SDK selection
   - Based on device capabilities
   - User sees same API

5. **NDK Variants**
   - NdkAudioManager (OpenSL ES)
   - NdkCameraManager (Camera2 NDK)
   - Hybrid managers that auto-select

6. **More Managers**
   - SdkCameraManager (basic implementation started)
   - SdkSensorManager (needs callback bridge)
   - SdkDownloadManager
   - SdkAlarmManager
   - SdkTelephonyManager

**Lower Priority** (nice to have):

7. **Compile-Time Feature Tracking**
   - Auto-generate manifest
   - Tree-shaking for managers
   - Automatic permission requests

8. **Predefined Patterns**
   - `vibrateClick()`, `vibrateDoubleClick()`
   - Common notification styles
   - Standard camera settings

9. **Callback Bridge System**
   - Generic Java→Nim callback mechanism
   - Required for: Location updates, Sensor data, Camera previews, Audio events
   - See BINDING_TODOS.md for details

---

## Implementation Priority

### Phase 1 (Complete) ✅
- Core infrastructure
- 5 basic SDK managers
- Desktop-like permissions

### Phase 2 (Complete) ✅
1. **SdkConnectivityManager** ✅ - Network monitoring
2. **SdkPowerManager** ✅ - Battery and power management
3. **SdkStorageManager** ✅ - File system and storage

### Phase 3 (In Progress - Media & Sensors) 🔄
1. **SdkLocationManager** ✅ (basic) - GPS/location
2. **SdkAudioManager** ✅ (basic) - Audio playback
3. **SdkDisplayManager** ✅ - Screen information
4. **SdkCameraManager** ⏳ - Photo/video capture (next)
5. **SdkSensorManager** ⏳ - Device sensors (needs callback bridge)

### Phase 4 (High Value - State Management)
1. **ResurrectionManager** ⭐ - THE key innovation
2. StateManager - Bundle serialization
3. LifecycleManager - Activity lifecycle abstraction
4. MemoryManager - Memory pressure handling

### Phase 5 (Rich Features)
1. Enhance managers with instance-based objects
2. Add dual preference systems
3. Implement callback bridges for continuous data
4. Add completion/error callbacks

### Phase 6 (Performance)
1. **NdkAudioManager** - OpenSL ES for low-latency
2. **NdkCameraManager** - Camera2 NDK
3. Hybrid managers that auto-select best

### Phase 7 (Polish)
1. Compile-time feature tracking
2. Auto-manifest generation
3. Predefined patterns and styles
4. Comprehensive documentation

---

## What Makes Druid Special

From the design docs, Druid's unique value propositions:

### 1. Desktop-Like Development
- ResurrectionManager makes state persistence automatic
- No more `onSaveInstanceState` boilerplate
- Process death becomes invisible to developer

### 2. Hardware-Aware but Simple
- Automatically uses best API for device
- User sees consistent, simple API
- No need to know API levels or capabilities

### 3. Nim-Idiomatic
- Clean, readable code
- Not Java-style wrapped in Nim syntax
- Feels native to Nim

### 4. Four-Layer Architecture
1. Raw NDK/SDK bindings (futhark/jnim)
2. Safe wrappers (pointer conversions)
3. Managers (idiomatic Nim API) ← **We are here**
4. Simplified API (auto-select, high-level)

### 5. Both Simple and Powerful
- High-level: `audio.play("song.mp3")`
- Low-level: Full control over AudioStream
- User chooses complexity level

---

## Conclusion

**Current v0.2**: Solid foundation with 11 working managers covering essential and basic media services

**Full Vision**: Sophisticated system that makes Android feel like desktop development

**Gap**: Mainly missing instance-based objects, dual preferences, ResurrectionManager, and callback bridges

**Completed**:
- ✅ Phase 1: Core infrastructure with 5 feature managers
- ✅ Phase 2: Essential services (Connectivity, Power, Storage)
- 🔄 Phase 3: Media & Sensors (Location, Audio, Display implemented; Camera, Sensors next)

**Next Steps**:
1. Continue Phase 3: Add Camera and Sensor managers (basic implementations)
2. Implement callback bridge infrastructure (unblocks location updates, sensors, camera)
3. Implement ResurrectionManager (Phase 4 - the game-changer!)
4. Enhance existing managers with object-based control and preferences (Phase 5)
5. Add NDK variants for performance-critical services (Phase 6)

**Documentation**:
- BINDING_TODOS.md: Comprehensive list of missing bindings and infrastructure needs
- CLARIFYING_QUESTIONS.md: Design questions requiring user input
- All managers have extensive inline documentation with examples

The architecture is sound and aligns with the original vision. We're building incrementally towards the full feature set. The foundation supports everything planned - we just need to build out the pieces.

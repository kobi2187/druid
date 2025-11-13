# Druid 🐉

Android wrapper library for Nim - Idiomatic service APIs without the GUI.

## Status: Alpha (v0.1.0)

Currently implemented:
- ✅ Core AndroidRuntime with jnim integration
- ✅ SdkPackageManager - App info and package queries
- ✅ SdkNotificationManager - Local notifications with channel support
- ✅ SdkVibrationManager - Haptic feedback with pattern support
- ✅ SdkClipboardManager - Copy/paste operations

**Note**: All managers have explicit `Sdk` prefix (SDK/Java implementations). Future `Ndk` variants will be added for performance-critical services.

## Features

- **Service-Focused**: All Android services except GUI (use your own GUI library)
- **Idiomatic Nim**: Clean APIs that feel natural in Nim
- **JNI via jnim**: Uses proven jnim library for Java interop
- **Hybrid SDK/Native**: Uses best available API for each Android version
- **No Boilerplate**: Minimal setup, maximum functionality

## Installation

```nim
# In your .nimble file:
requires "druid >= 0.1.0"
```

Or install directly:
```bash
nimble install druid
```

## Quick Start

### 1. Android Setup (Kotlin/Java)

```kotlin
// MyApplication.kt
package com.example.myapp

import android.app.Application

class MyApplication : Application() {
    companion object {
        init {
            System.loadLibrary("myapp")
        }
    }

    override fun onCreate() {
        super.onCreate()
        initDruid(this)
    }

    private external fun initDruid(context: android.content.Context)
}
```

```xml
<!-- AndroidManifest.xml -->
<manifest>
    <application
        android:name=".MyApplication"
        ...>
    </application>
</manifest>
```

### 2. Nim Code

```nim
# main.nim
import druid
import jnim

# Export init function for Android to call
proc initDruid*(env: JNIEnv, obj: JObject, ctx: JObject) {.exportc, dynlib.} =
  # Initialize Druid runtime with Application context
  discard init(ctx)

# Your app logic (exported for Android to call)
proc myAppLogic*() {.exportc, dynlib.} =
  # Get package info
  let pkg = packageManager()
  echo "App: ", pkg.getPackageName()
  echo "Version: ", pkg.getVersionName(), " (", pkg.getVersionCode(), ")"

  # Check for camera
  if pkg.hasSystemFeature("android.hardware.camera"):
    echo "Device has camera"

  # Show notification
  let notifId = notifications().notify("Hello from Nim!", "Druid is working!")
  echo "Notification shown with ID: ", notifId
```

### 3. Build

```bash
# Build for Android ARM64
nim c -c --app:lib --os:android --cpu:arm64 -o:libmyapp.so main.nim

# Copy to Android project
cp libmyapp.so android/app/src/main/jniLibs/arm64-v8a/
```

## API Examples

### Package Manager

```nim
import druid

let pkg = packageManager()  # Returns SdkPackageManager

# Get app info
echo pkg.getPackageName()     # "com.example.myapp"
echo pkg.getVersionName()     # "1.0.5"
echo pkg.getVersionCode()     # 42

# Check system features
if pkg.hasSystemFeature("android.hardware.bluetooth"):
  echo "Bluetooth available"
```

### Notification Manager

```nim
import druid

let notif = notifications()  # Returns SdkNotificationManager

# Simple notification
let id = notif.notify("Title", "Message")

# Custom notification
let builder = NotificationBuilder(
  title: "Important Alert",
  message: "Something happened",
  channelId: "alerts",
  autoCancel: true,
  priority: niHigh
)
notif.notify(123, builder)

# Cancel notification
notif.cancel(123)
```

### Vibration Manager

```nim
import druid

let vib = vibration()  # Returns SdkVibrationManager

# Simple vibration (300ms)
vib.vibrate(300)

# Vibration with intensity (API 26+)
vib.vibrate(300, viHard)

# Pattern: double buzz
vib.vibratePattern(@[0, 100, 100, 100])

# Stop vibration
vib.cancel()

# Check if device has vibrator
if vib.checkHasVibrator():
  echo "Vibrator available"
```

### Clipboard Manager

```nim
import druid

let cb = clipboard()  # Returns SdkClipboardManager

# Copy to clipboard
cb.setText("Hello, clipboard!")

# Paste from clipboard
let text = cb.getText()
if text.isSome:
  echo "Clipboard: ", text.get()

# Check if has text
if cb.hasText():
  echo "Clipboard has content"

# Clear clipboard
cb.clear()
```

### Notification Channels (API 26+)

```nim
import druid

# Create custom channel
let channel = NotificationChannel(
  id: "important",
  name: "Important Notifications",
  description: "Critical app alerts",
  importance: niHigh
)
notifications().createChannel(channel)

# Use channel in notification
notifications().notify(1, NotificationBuilder(
  title: "Alert",
  message: "Important message",
  channelId: "important",
  autoCancel: true
))
```

## Architecture

```
Druid Application
    ↓
AndroidRuntime (core.nim)
    ↓
jnim (JNI bridge)
    ↓
Android Framework (Java/Kotlin)
```

- **AndroidRuntime**: Singleton managing all services
- **Managers**: Individual service wrappers (PackageManager, NotificationManager, etc.)
- **jnim**: Handles all JNI/Java interop
- **Lazy Loading**: Managers only created when first accessed

## Roadmap

### Phase 1: Core ✅ (Current)
- [x] AndroidRuntime with jnim
- [x] SdkPackageManager - App info and package queries
- [x] SdkNotificationManager - Local notifications (API 26+ channels)
- [x] SdkVibrationManager - Haptic feedback with patterns
- [x] SdkClipboardManager - Copy/paste operations

### Phase 2: Essential Services (Next)
- [ ] SdkPermissionManager - Runtime permissions (needs Activity integration)
- [ ] SdkConnectivityManager - Network status monitoring
- [ ] SdkPowerManager - Battery and power management
- [ ] SdkStorageManager - File system access

### Phase 3: Media & Sensors
- [ ] AudioManager - Audio playback/recording
- [ ] CameraManager - Photo/video capture
- [ ] SensorManager - Device sensors
- [ ] LocationManager - GPS/location
- [ ] StorageManager - File system access

### Phase 4: Advanced Services
- [ ] BluetoothManager - BLE and classic Bluetooth
- [ ] NFCManager - NFC tags
- [ ] BiometricManager - Fingerprint/face auth
- [ ] CryptographyManager - Encryption and keystore
- [ ] TelephonyManager - Phone and SMS

See [ROADMAP.md](ROADMAP.md) for complete plan.

## Design Philosophy

1. **No GUI** - Druid handles services only. Use your own GUI library.
2. **Clean APIs** - Nim-idiomatic, not Java-style
3. **Explicit Naming** - `Sdk` prefix for Java APIs, future `Ndk` for native, hybrid names auto-select
4. **Version-Aware** - Automatically uses best API for device (e.g., VibrationEffect vs legacy Vibrator)
5. **Lazy Loading** - Services only initialized when used
6. **Compile-Time Features** - Track used features at compile time (future: auto-generate manifest)
7. **No Magic** - Explicit initialization, clear ownership

## Requirements

- Nim 2.0+
- jnim 0.5.2+
- Android NDK r21+
- Android SDK API 21+ (runtime)

## Contributing

See [GETTING_STARTED.md](docs/GETTING_STARTED.md) for development setup.

Contributions welcome! Focus areas:
- Implement remaining managers (see roadmap)
- Add tests
- Improve documentation
- Add examples

## License

MIT License - see LICENSE file

## Credits

- Built with [jnim](https://github.com/yglukhov/jnim) by Yuriy Glukhov
- Inspired by Android's service architecture

---

**Status**: Alpha - Core foundation ready, actively adding services

**Questions?** Open an issue on GitHub

# Druid Binding TODOs

This document tracks missing Java SDK bindings, NDK bindings, and infrastructure needed for full functionality.

## Missing Java SDK Bindings

### LocationManager

**Status**: Basic SDK implementation complete, advanced features need additional bindings

**Needed for full functionality:**

1. **LocationListener callback bridge**
   - Need: Proper Java → Nim callback mechanism for location updates
   - Current: `startLocationUpdates()` and `stopLocationUpdates()` are stubbed out
   - Implementation: Requires creating Java LocationListener class and bridging to Nim callbacks
   - Priority: HIGH (common use case)

2. **FusedLocationProvider (Google Play Services)**
   - Need: Google Play Services location API bindings
   - Current: Only standard Android LocationManager
   - Benefit: Better battery efficiency, more accurate location
   - Implementation: Requires `com.google.android.gms.location` Java package
   - Priority: MEDIUM (optional, but better user experience)

3. **Geofencing API**
   - Need: Geofence and GeofencingClient bindings
   - Current: Not implemented
   - Implementation: Requires additional Java classes from LocationManager API
   - Priority: LOW (specialized feature)

4. **Geocoding API**
   - Need: Geocoder class bindings (address ↔ coordinates)
   - Current: Not implemented
   - Implementation: Requires `android.location.Geocoder` Java class
   - Priority: MEDIUM (useful feature)

### SensorManager

**Status**: Not yet implemented

**Needed bindings:**
- `android.hardware.SensorManager`
- `android.hardware.Sensor`
- `android.hardware.SensorEventListener`
- `android.hardware.SensorEvent`

**Callback challenges:**
- SensorEventListener requires high-frequency callbacks
- May need special handling for performance

**Priority**: MEDIUM (common for games, fitness apps)

### CameraManager

**Status**: Not yet implemented

**Needed for Camera (legacy API):**
- `android.hardware.Camera` (deprecated but simple)
- `android.hardware.Camera.PictureCallback`
- `android.view.SurfaceHolder` (for preview)

**Needed for Camera2 (modern API):**
- `android.hardware.camera2.CameraManager`
- `android.hardware.camera2.CameraDevice`
- `android.hardware.camera2.CaptureRequest`
- `android.hardware.camera2.CameraCharacteristics`
- Complex callback system

**Needed for CameraX (recommended):**
- AndroidX library bindings
- `androidx.camera.core.*`
- `androidx.camera.lifecycle.*`

**Priority**: HIGH (very common feature)

**Complexity**: HIGH (camera APIs are complex, especially Camera2)

### AudioManager

**Status**: Not yet implemented

**Needed for basic playback (MediaPlayer):**
- `android.media.MediaPlayer`
- `android.media.MediaPlayer.OnCompletionListener`
- `android.media.MediaPlayer.OnErrorListener`

**Needed for advanced audio (AudioTrack):**
- `android.media.AudioTrack`
- `android.media.AudioFormat`
- `android.media.AudioAttributes`

**Instance-based API design:**
- Should return AudioStream object with pause/resume/seekTo
- Needs dual preference system (system vs instance)
- See niceapi.txt for full design

**Priority**: HIGH (very common feature)

### TelephonyManager

**Status**: Not yet implemented

**Needed bindings:**
- `android.telephony.TelephonyManager`
- `android.telephony.PhoneStateListener`
- `android.telephony.SmsManager`

**Priority**: LOW (less common, privacy concerns)

### BiometricManager

**Status**: Not yet implemented

**Needed bindings:**
- `android.hardware.biometrics.BiometricPrompt` (API 28+)
- `androidx.biometric.BiometricPrompt` (AndroidX, better compatibility)

**Priority**: MEDIUM (authentication feature)

### BluetoothManager

**Status**: Not yet implemented

**Needed for classic Bluetooth:**
- `android.bluetooth.BluetoothAdapter`
- `android.bluetooth.BluetoothDevice`
- `android.bluetooth.BluetoothSocket`

**Needed for BLE:**
- `android.bluetooth.le.BluetoothLeScanner`
- `android.bluetooth.BluetoothGatt`
- `android.bluetooth.BluetoothGattCallback`
- Complex callback and state machine

**Priority**: MEDIUM (IoT, fitness devices)

**Complexity**: HIGH (BLE is complex)

### NFCManager

**Status**: Not yet implemented

**Needed bindings:**
- `android.nfc.NfcAdapter`
- `android.nfc.Tag`
- `android.nfc.tech.*` (various NFC technologies)

**Priority**: LOW (specialized feature)

## Missing NDK Bindings

### OpenSL ES (Audio)

**Status**: Not implemented

**Purpose**: Low-latency audio for games and music apps

**Needed:**
- NDK OpenSL ES API bindings via futhark
- C header: `SLES/OpenSLES.h`
- C header: `SLES/OpenSLES_Android.h`

**Integration:**
- Create NdkAudioManager as alternative to SdkAudioManager
- Hybrid AudioManager auto-selects based on device capabilities

**Priority**: MEDIUM (performance-critical apps)

### Camera2 NDK

**Status**: Not implemented

**Purpose**: High-performance camera access

**Needed:**
- NDK Camera2 API bindings
- C header: `camera/NdkCameraManager.h`
- C header: `camera/NdkCameraDevice.h`

**Priority**: LOW (Camera2 Java API is sufficient for most)

### Native Activity

**Status**: Not implemented

**Purpose**: Pure native apps without Java code

**Needed:**
- `android/native_activity.h`
- `android/looper.h`
- `android/input.h`

**Note**: Druid currently assumes Java/Kotlin app with Nim library. Native Activity would be alternative architecture.

**Priority**: LOW (different architecture, not essential)

## Infrastructure TODOs

### Callback Bridge System

**Status**: Partially implemented (permissions use async/await)

**Needed:**
- Generic Java → Nim callback bridge
- Support for high-frequency callbacks (sensors, audio)
- Thread-safe callback handling
- Callback lifecycle management

**Current approach:**
- Permissions: Use Future/Promise pattern with async/await ✅
- Location updates: Need callback bridge ❌
- Sensors: Need high-frequency callback bridge ❌
- Camera: Need complex callback system ❌

**Priority**: HIGH (blocks many features)

### JNI Object Lifecycle

**Status**: Handled by jnim

**Considerations:**
- jnim manages JNI local/global references
- Need to verify proper cleanup on manager shutdown
- Wake locks must be released (done in PowerManager)
- Location listeners must be unregistered (TODO)

**Priority**: MEDIUM (prevent memory leaks)

### AndroidX Library Support

**Status**: Not implemented

**Needed for modern features:**
- Camera: `androidx.camera.*`
- Biometrics: `androidx.biometric.*`
- Work: `androidx.work.*`
- Room: `androidx.room.*` (if we add database support)

**Challenge**: AndroidX is distributed as separate AAR libraries, not in Android SDK

**Priority**: MEDIUM (some features need it)

### ResurrectionManager Implementation

**Status**: Designed but not implemented

**This is THE key innovation from niceapi.txt**

**Needed:**
- Bundle serialization for state
- Integration with Activity lifecycle (onSaveInstanceState)
- Automatic state restoration on process death
- Type-safe state persistence

**Bindings needed:**
- `android.os.Bundle` (basic support exists via jnim)
- `android.os.Parcelable` (for custom types)
- Activity lifecycle callbacks

**Priority**: HIGHEST (this is what makes Druid special!)

### Preference System

**Status**: Designed but not implemented

**From niceapi.txt design:**
- System-level preferences (e.g., AudioSystemPrefs)
- Instance-level preferences (e.g., AudioFilePrefs)
- Persistence of preferences

**Needed:**
- SharedPreferences bindings (basic)
- Preference serialization
- Type-safe preference access

**Priority**: MEDIUM (nice architectural pattern)

### Strategy Pattern Infrastructure

**Status**: Partially done (API level detection exists)

**From niceapi.txt design:**
- Managers should auto-select best API
- E.g., AudioManager picks OpenSL ES vs MediaPlayer vs AudioTrack
- Transparent to user

**Current:**
- API level detection works
- Individual managers adapt (e.g., VibrationManager uses VibrationEffect on API 26+)
- Not formalized as strategy pattern yet

**Priority**: LOW (current approach works, formalization can wait)

## Priority Summary

### Critical (Blocks Major Features)
1. ✅ Basic Java SDK bindings via jnim (DONE - working well)
2. ❌ Generic callback bridge system (HIGH - blocks sensors, location updates, camera)
3. ❌ ResurrectionManager (HIGHEST - the key innovation)

### High Priority (Common Features)
4. ❌ CameraManager (Camera/Camera2/CameraX bindings)
5. ❌ AudioManager (MediaPlayer/AudioTrack bindings)
6. ❌ LocationListener callbacks (complete location features)
7. ❌ SensorManager (accelerometer, gyroscope, etc.)

### Medium Priority (Nice to Have)
8. ❌ FusedLocationProvider (better battery, accuracy)
9. ❌ BiometricManager (modern auth)
10. ❌ BluetoothManager (BLE support)
11. ❌ OpenSL ES NDK (low-latency audio)
12. ❌ Preference system (architectural pattern)
13. ❌ AndroidX library support

### Low Priority (Specialized)
14. ❌ Geofencing
15. ❌ Geocoding
16. ❌ TelephonyManager
17. ❌ NFCManager
18. ❌ Camera2 NDK
19. ❌ Native Activity

## Notes

- **jnim is working well** for basic SDK bindings - we can call Java methods successfully
- **Main challenge**: Callback bridges (Java → Nim) for asynchronous operations
- **NDK bindings** would use futhark to parse C headers
- **AndroidX** libraries may need special Gradle setup to include in build
- **Testing**: All new bindings should be tested on real device (emulator may have limitations)

## Implementation Approach

For each missing binding:

1. **Identify Java/NDK APIs needed**
2. **Create jnimport block** (for Java) or futhark import (for NDK)
3. **Build minimal test** to verify bindings work
4. **Implement Nim wrapper** with clean API
5. **Add documentation** and examples
6. **Mark as complete** in this file

## Updates

- 2024-XX-XX: Created this file to track binding TODOs
- Documented missing bindings for Location, Sensor, Camera, Audio, etc.
- Identified callback bridge as critical infrastructure need
- Prioritized ResurrectionManager as key innovation

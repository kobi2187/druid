# Clarifying Questions for Druid Design

This document collects design questions that need user clarification. These are organized by topic and priority.

## High Priority Questions

### 1. Callback Bridge Architecture

**Context**: Many Android APIs require callbacks (sensors, location updates, camera previews, audio events). Currently we use async/await for permissions successfully, but that won't work for continuous callbacks.

**Question**: What's the preferred approach for Java → Nim callbacks?

**Options**:
a) Create Java wrapper classes that call JNI native methods, implement native methods in Nim
b) Use jnim's existing callback support (if it has any?)
c) Implement a generic event queue that polls from Nim side
d) Hybrid: async/await for single-shot, event queue for continuous streams

**Current blockers**: Location updates, sensor data, camera previews, audio callbacks

**My current thinking**: Option (a) seems most robust but requires Java/Kotlin helper classes. Option (c) might be simpler but less efficient.

---

### 2. ResurrectionManager Design Details

**Context**: The docs describe ResurrectionManager as THE key innovation - transparent process death handling. The API is clear (`keepAlive()`, `keepSession()`, `keepTemporary()`), but implementation details are unclear.

**Questions**:
a) Should we use Bundle for serialization, or a custom format?
b) How should we handle non-serializable types (closures, file handles, etc.)?
c) Should state be persisted to disk, or just in Bundle (memory)?
d) How to integrate with user's Activity lifecycle without requiring boilerplate?
e) Should we auto-detect saveable state, or require explicit `keepAlive()` calls?

**My current thinking**:
- Use Bundle for Android compatibility
- Persist to SharedPreferences for disk backup
- Require explicit `keepAlive()` (safer than magic)
- Need user to call `druid.onSaveInstanceState()` and `druid.onRestoreInstanceState()` from Activity

**But**: Can we make it more automatic? The goal is "desktop-like" which means less boilerplate.

---

### 3. Instance-Based Objects vs Fire-and-Forget

**Context**: niceapi.txt shows rich APIs with controllable objects (AudioStream with pause/resume/seekTo), but implementing these requires significant additional bindings and lifecycle management.

**Questions**:
a) Should we implement instance-based APIs now, or add them later as v2 of each manager?
b) For managers like Audio/Camera, should we provide both simple and advanced APIs, or just advanced?
c) How should object lifecycle work? (RAII-style with destructors, or explicit .close()?)

**Example from niceapi.txt**:
```nim
let stream = audio.play("music.mp3", AudioFilePrefs(...))
stream.pause()
stream.resume()
stream.seekTo(30.seconds)
stream.stop()
```

**Current approach**: Simple fire-and-forget APIs (like notifications, vibration)

**My current thinking**: Implement simple APIs first for breadth, then add instance-based wrappers. This gives users something usable quickly while we build out the richer APIs.

---

### 4. Preference System Implementation

**Context**: niceapi.txt describes dual preference system (system-level vs instance-level). E.g., `audio.systemPrefs.ringerMode = rmVibrate` affects whole system, while `AudioFilePrefs` affects single stream.

**Questions**:
a) Should system preferences persist across app restarts?
b) Should we use SharedPreferences for persistence, or Bundle?
c) How to handle preferences that need system permissions (e.g., changing ringer mode)?
d) Should preferences be mutable fields or setter methods?

**Example from niceapi.txt**:
```nim
audio.systemPrefs.ringerMode = rmVibrate  # System-wide
let stream = audio.play("song.mp3", AudioFilePrefs(volume: 50))  # Instance
```

**My current thinking**:
- System prefs → SharedPreferences for persistence
- Instance prefs → passed as arguments (not persisted)
- Use mutable fields for simplicity
- Handle permission errors gracefully

---

## Medium Priority Questions

### 5. NDK Integration Timeline

**Context**: We have SDK (Java) implementations. niceapi.txt describes NDK variants (OpenSL ES for audio, Camera2 NDK, etc.) and hybrid managers that auto-select.

**Questions**:
a) When should we start implementing NDK variants?
b) Should NDK be separate managers (NdkAudioManager), or internal strategies?
c) Is futhark the right tool for NDK bindings, or should we use something else?

**My current thinking**:
- Finish all SDK managers first (breadth)
- Then add NDK variants for performance-critical ones (Audio, Camera)
- Use futhark for C header parsing
- Internal strategy pattern (user sees `AudioManager`, not `SdkAudioManager`)

---

### 6. AndroidX Library Integration

**Context**: Modern Android development uses AndroidX libraries. Some features require them (CameraX, BiometricPrompt, WorkManager).

**Questions**:
a) Should Druid depend on AndroidX, or make it optional?
b) How to handle build complexity (AAR libraries, Gradle dependencies)?
c) Should we provide both Android SDK and AndroidX versions of managers?

**Example needs**:
- Camera: androidx.camera.core for CameraX (easier than Camera2)
- Biometrics: androidx.biometric for consistent API across versions
- Work: androidx.work for background jobs

**My current thinking**:
- Make AndroidX optional for now
- Document which features need it
- Provide SDK-only implementations first
- Add AndroidX support as enhancement

---

### 7. Error Handling Strategy

**Context**: Android APIs can fail in many ways (permissions denied, hardware unavailable, out of memory, etc.). Current managers return Option[T] or raise exceptions.

**Questions**:
a) Should we use exceptions, or Result[T, E] type?
b) Should all errors be explicit, or some silent (e.g., notification fails → just log)?
c) How to handle async errors in callbacks?
d) Should we provide error recovery suggestions?

**Current approach**: Mix of exceptions and Option[T]

**My current thinking**:
- Use Option[T] for "not available" (last known location)
- Use exceptions for "programmer error" (not initialized)
- Use Result[T, E] for operations that commonly fail (permissions)
- Async: Pass errors to callback or Future rejection

---

### 8. Testing Strategy

**Context**: Android apps typically run on device/emulator. Testing Druid would ideally work on desktop for quick iteration.

**Questions**:
a) Should we provide mock implementations for desktop testing?
b) Should we test on real device only, or support emulator?
c) Should we have unit tests, integration tests, or both?
d) How to test permissions, sensors, GPS without real hardware?

**My current thinking**:
- Real device testing is essential (Android is complex)
- Mocks for desktop would be nice but low priority
- Integration tests > unit tests (testing JNI integration is key)

---

## Low Priority Questions

### 9. Compile-Time Feature Tracking

**Context**: niceapi.txt describes automatic manifest generation based on which managers are used.

**Questions**:
a) Is this still a goal, or deferred?
b) Should we use Nim macros to track feature usage?
c) Should manifest generation be build-time or runtime?

**My current thinking**: Defer this. Manual manifest is fine for v1.

---

### 10. Multi-Activity Support

**Context**: Current design has `setCurrentActivity()` to track current Activity. Some apps have multiple activities.

**Questions**:
a) How to handle multiple activities gracefully?
b) Should each manager know about current activity, or get it on-demand?
c) What if activity changes during long operation (e.g., camera capture)?

**My current thinking**: Current simple approach is fine. Most managers use Application context anyway (long-lived).

---

### 11. Thread Safety

**Context**: Android has main thread (UI) and background threads. Some operations must be on main thread, some must NOT be.

**Questions**:
a) Should Druid enforce thread requirements?
b) Should we provide `runOnMainThread()` helper?
c) Should async operations automatically switch threads?

**My current thinking**:
- Document thread requirements
- Let user handle thread switching (they know their app)
- Don't add automatic thread switching (surprising behavior)

---

## Questions Added During Implementation

### 12. Sensor Manager Design

**Question**: Should we provide raw sensor data, or processed/filtered data?

**Context**: Android sensors are noisy. Apps often need filtering (low-pass, Kalman, etc.).

**Options**:
a) Raw data only, user does filtering
b) Provide both raw and filtered
c) Provide filtering utilities

**My current thinking**: Start with raw, add utilities later if needed.

---

### 13. Audio Manager Complexity

**Question**: Audio is complex (MediaPlayer for files, AudioTrack for streams, SoundPool for effects, OpenSL ES for low-latency). Should we have one manager or multiple?

**Options**:
a) Single AudioManager with different APIs for different use cases
b) Separate managers: MediaPlayerManager, AudioTrackManager, SoundPoolManager
c) Simple AudioManager that auto-selects best API

**My current thinking**: Option (c) aligns with niceapi.txt vision. Auto-select based on use case.

---

### 14. Camera Preview Display

**Question**: Camera preview needs a Surface/SurfaceView for display. How to integrate with user's GUI library?

**Options**:
a) User provides Surface, we just do capture
b) Provide helper to create SurfaceView
c) Don't handle preview, only capture
d) Require user to use specific GUI library

**My current thinking**: Option (a) - user provides Surface. Druid handles capture, not UI.

---

## Summary of Recommended Priorities

**Implement immediately** (clear path forward):
- More SDK managers (Sensor, Audio with simple API, Camera with simple API)
- Basic implementations without full callback support

**Implement soon** (after answering Q1):
- Callback bridge system
- Enhanced Location/Sensor/Audio with real-time updates

**Implement after core features** (after answering Q2):
- ResurrectionManager (THE key innovation)
- Preference system
- Instance-based object APIs

**Defer to later versions**:
- NDK variants
- AndroidX integration
- Compile-time feature tracking
- Desktop mocking for tests

---

## How to Use This Document

User: Please review questions and provide guidance. Priority order is already suggested based on impact.

Developer: Add new questions as you encounter design decisions. Mark questions as ANSWERED when resolved, with the answer.

---

## Updates

- 2024-XX-XX: Created document with 14 questions across 4 priority levels
- Next: Wait for user guidance on high-priority questions (1-4)

# Druid Documentation

## Overview

This directory contains comprehensive implementation documentation for the Druid Android wrapper library.

## Quick Links

- **[Project Roadmap](../ROADMAP.md)** - Overall plan, phases, and milestones
- **[Getting Started](GETTING_STARTED.md)** - Setup and first contribution guide
- **[Core Infrastructure](#phase-1-core-infrastructure)** - JNI, runtime, error handling
- **[Essential Managers](#phase-2-essential-managers)** - Permissions, packages, connectivity
- **[System Managers](#phase-3-system-managers)** - Lifecycle, resurrection, threading
- **[Feature Managers](#phase-4-feature-managers)** - Audio, camera, sensors, location
- **[Extra Managers](#phase-5-extra-managers)** - Biometrics, Bluetooth, NFC, crypto
- **[Build System](#build-system--testing)** - Compilation, testing, CI/CD

---

## Documentation Structure

### Phase 1: Core Infrastructure

**Location**: `01-core-infrastructure/`
**Status**: ⚠️ Planned
**Priority**: CRITICAL

Core systems that all managers depend on:

- **[Overview](01-core-infrastructure/overview.md)** - Architecture and goals
- **[JNI Bridge](01-core-infrastructure/jni-bridge.md)** - Java ↔ Nim interop (600 LOC)
- **[Runtime Initialization](01-core-infrastructure/runtime-initialization.md)** - AndroidRuntime singleton (400 LOC)
- **[Error Handling](01-core-infrastructure/error-handling.md)** - Exceptions, Results, logging (300 LOC)
- **[Resource Management](01-core-infrastructure/resource-management.md)** - Lifecycle and cleanup (400 LOC)

**Total Estimated**: ~1700 LOC
**Timeline**: Weeks 2-3

---

### Phase 2: Essential Managers

**Location**: `02-essential-managers/`
**Status**: ⚠️ Planned
**Priority**: HIGH

Foundation services most apps need:

- **[Overview](02-essential-managers/overview.md)** - All 5 managers overview
- **[PermissionManager](02-essential-managers/PermissionManager.md)** - Runtime permissions ⭐ (300 LOC)
- **PackageManager** - App info and package queries (200 LOC)
- **ActivityManager** - Process and memory info (200 LOC)
- **ConnectivityManager** - Network status (250 LOC)
- **PowerManager** - Battery and power management (300 LOC)

**Total Estimated**: ~1250 LOC
**Timeline**: Weeks 4-6

**Key Features**:
- Async permission requests with Futures
- Battery-aware operations
- Network state monitoring

---

### Phase 3: System Managers

**Location**: `03-system-managers/`
**Status**: ⚠️ Planned
**Priority**: CRITICAL (Contains key innovation)

Android lifecycle abstraction and state management:

- **[Overview](03-system-managers/overview.md)** - All 8 managers overview
- **LifecycleManager** - Activity/Fragment lifecycle (400 LOC)
- **ResurrectionManager** - Process death handling ⭐⭐⭐ (600 LOC)
- **StateManager** - Saved instance state (300 LOC)
- **MemoryManager** - Memory pressure response (250 LOC)
- **ThreadManager** - Thread pools and dispatch (400 LOC)
- **SchedulerManager** - Periodic tasks (400 LOC)
- **BackgroundTaskManager** - Long-running work (500 LOC)
- **EventBusManager** - Inter-manager events (200 LOC)

**Total Estimated**: ~3050 LOC
**Timeline**: Weeks 7-10

**Key Innovation**: **ResurrectionManager** makes Android feel stateful like desktop apps by transparently handling process death and state restoration.

---

### Phase 4: Feature Managers

**Location**: `04-feature-managers/`
**Status**: ⚠️ Planned
**Priority**: MEDIUM-HIGH

User-facing features:

- **[Overview](04-feature-managers/overview.md)** - All 10 managers overview

**Tier 1 (Common)**:
- **NotificationManager** - Local notifications (400 LOC)
- **VibrationManager** - Haptic feedback (200 LOC)
- **ClipboardManager** - Copy/paste (150 LOC)
- **StorageManager** - File system access (300 LOC)

**Tier 2 (Media)**:
- **AudioManager** - Audio playback/recording (600 LOC)
- **MediaManager** - Video playback (400 LOC)
- **CameraManager** - Photo/video capture (700 LOC)

**Tier 3 (Sensors)**:
- **SensorManager** - Device sensors (400 LOC)
- **LocationManager** - GPS and location (500 LOC)
- **NetworkManager** - HTTP/WebSocket (600 LOC)

**Total Estimated**: ~4250 LOC
**Timeline**: Weeks 11-16

---

### Phase 5: Extra Managers

**Location**: `05-extra-managers/`
**Status**: ⚠️ Planned
**Priority**: MEDIUM

Advanced features for specific use cases:

- **[Overview](05-extra-managers/overview.md)** - All 8 managers overview
- **BiometricManager** - Fingerprint/face auth (400 LOC)
- **BluetoothManager** - BLE and classic BT (800 LOC)
- **NFCManager** - NFC tag reading/writing (400 LOC)
- **TelephonyManager** - Phone calls and SMS (500 LOC)
- **CryptographyManager** - Encryption and keystore (600 LOC)
- **FileManager** - Advanced file operations (400 LOC)
- **DownloadManager** - Background downloads (300 LOC)
- **AnalyticsManager** - Event tracking (300 LOC)

**Total Estimated**: ~3700 LOC
**Timeline**: Weeks 17-22

---

### Phase 6: Backlog Managers

**Location**: `06-backlog-managers/`
**Status**: ⚠️ Future
**Priority**: LOW

Future additions:

- **DatabaseManager** - SQLite wrapper
- **SocialManager** - Share intents
- **InAppPurchaseManager** (planned)
- **AdsManager** (planned)
- **FirebaseManager** (planned)

---

### Build System & Testing

**Location**: `08-build-system/`
**Status**: ⚠️ Planned
**Priority**: HIGH

Build and test infrastructure:

- **[Overview](08-build-system/overview.md)** - Complete build system guide
- Nimble package configuration
- Android NDK integration
- Gradle build setup
- Unit testing (Nim)
- Integration testing (Android)
- CI/CD pipeline
- Performance profiling

---

## Development Phases Timeline

```
Phase 0: Foundation (Week 1) ✓
Phase 1: Core Infrastructure (Weeks 2-3)
Phase 2: Essential Managers (Weeks 4-6)
Phase 3: System Managers (Weeks 7-10) ⭐ Key Innovation
Phase 4: Feature Managers (Weeks 11-16)
Phase 5: Extra Managers (Weeks 17-22)
Phase 7: Production Polish (Weeks 23-26)
```

**Total Estimated Code**: ~14,000 LOC (excluding tests)

---

## Key Innovations

### 1. ResurrectionManager 🌟

**The Problem**: Android can kill your app process at any time (low memory, background too long, config changes). User returns, but state is gone.

**The Solution**: Automatic state persistence and restoration that makes Android feel like a desktop app.

```nim
# Just use variables like desktop development
var gameScore = 0
var playerName = "Alice"

# Mark as "keep alive" - survives process death
keepAlive("score", gameScore)
keepAlive("player", playerName)

# Even after process death, variables are restored!
```

### 2. Hardware-Aware API Selection

Managers automatically detect device capabilities and use the best available API:

```nim
# Audio uses AudioTrack (modern) or MediaPlayer (compatible) or SoundPool (simple)
# Camera uses Camera2 (API 21+) with proper capability detection
# Location uses FusedLocationProvider (Play Services) or LocationManager (fallback)
```

### 3. Unified Error Handling

Consistent error handling across all managers:

```nim
# Result types for expected failures
let result: DruidResult[Location] = location.getCurrentLocation()
if result.isOk:
  let loc = result.get()
else:
  echo "Error: ", result.error.msg

# Exceptions for programming errors
try:
  let audio = audio()  # Throws if runtime not initialized
except RuntimeError:
  echo "Must initialize AndroidRuntime first"
```

---

## Code Metrics

### Current Status (Phase 0)
- **Core definitions**: ~220 LOC
- **Documentation**: ~150KB (design docs)
- **Implementation**: 1% complete

### Target (Phase 7)
- **Total code**: ~14,000 LOC
- **Tests**: ~7,000 LOC (50% ratio)
- **Documentation**: Complete API reference
- **Examples**: 5+ example apps

---

## Documentation Conventions

### Document Structure

Each manager doc includes:

1. **Purpose** - What it does and why
2. **API Design** - Type definitions and function signatures
3. **Implementation** - Detailed implementation guide
4. **Java Integration** - Required Java/Kotlin helper code
5. **Usage Examples** - Real-world code samples
6. **Testing** - Unit and integration test strategies
7. **Performance** - Benchmarks and optimization notes
8. **Common Issues** - Pitfalls and solutions
9. **Next Steps** - Implementation checklist

### Code Snippets

All code snippets are complete and runnable:

```nim
# ✓ Good - Complete example
import druid

proc main() {.exportc, dynlib.} =
  let audio = audio()
  audio.play("sound.mp3")

# ✗ Bad - Incomplete pseudo-code
audio.play(...)  # How is audio obtained?
```

### API Documentation

Functions are documented with:
- Purpose
- Parameters
- Return value
- Example usage
- Edge cases
- Performance characteristics

---

## Reading Guide

### For New Contributors

1. Start with **[GETTING_STARTED.md](GETTING_STARTED.md)**
2. Read **[ROADMAP.md](../ROADMAP.md)** for overview
3. Read **[01-core-infrastructure/overview.md](01-core-infrastructure/overview.md)**
4. Pick a manager from Phase 2 (Essential Managers)
5. Read that manager's doc
6. Implement and test
7. Submit PR!

### For Understanding Architecture

1. **[01-core-infrastructure/overview.md](01-core-infrastructure/overview.md)** - System architecture
2. **[01-core-infrastructure/jni-bridge.md](01-core-infrastructure/jni-bridge.md)** - How Nim talks to Java
3. **[01-core-infrastructure/runtime-initialization.md](01-core-infrastructure/runtime-initialization.md)** - How everything starts
4. **[03-system-managers/overview.md](03-system-managers/overview.md)** - Key innovation (ResurrectionManager)

### For Implementing a Manager

1. Read the phase overview (e.g., `02-essential-managers/overview.md`)
2. Read the specific manager doc (e.g., `02-essential-managers/PermissionManager.md`)
3. Study existing similar code (if available)
4. Implement following the documented pattern
5. Write tests
6. Update docs with implementation notes

---

## Contributing to Documentation

### Adding New Documentation

1. Follow existing structure
2. Include code examples
3. Add to this README index
4. Cross-reference related docs
5. Submit PR with "docs:" prefix

### Improving Existing Docs

1. Fix typos and clarity issues
2. Add missing examples
3. Update outdated information
4. Add implementation notes after coding
5. Submit PR

---

## Status Legend

- ✅ **Complete** - Implemented and tested
- 🚧 **In Progress** - Currently being worked on
- ⚠️ **Planned** - Documented but not implemented
- 📝 **Draft** - Documentation in progress
- ⭐ **Critical** - High priority / key feature
- 💡 **Innovative** - Unique selling point

---

## Support

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and ideas
- **Documentation Issues**: Report unclear/incorrect docs
- **Discord**: [Nim Discord](https://discord.gg/nim) #android channel

---

**Last Updated**: 2025-11-13
**Version**: 0.1.0 (Pre-release)
**Status**: Phase 0 (Foundation) - Documentation Complete

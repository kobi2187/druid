# Build System & Testing Infrastructure

## Overview

This document describes how to build, test, and deploy Druid-based Android applications.

## Build System Components

### 1. Nimble Package (druid.nimble)

```nimble
# Package
version       = "0.1.0"
author        = "Kobi"
description   = "Android wrapper library for Nim"
license       = "MIT"
srcDir        = "src"

# Dependencies
requires "nim >= 2.0.0"

# Tasks
task build, "Build Druid library":
  exec "nim c -c --app:lib --os:android --cpu:arm64 src/druid.nim"

task buildArmv7, "Build for ARMv7":
  exec "nim c -c --app:lib --os:android --cpu:arm src/druid.nim"

task buildx86, "Build for x86 (emulator)":
  exec "nim c -c --app:lib --os:android --cpu:i386 src/druid.nim"

task buildx86_64, "Build for x86_64 (emulator)":
  exec "nim c -c --app:lib --os:android --cpu:amd64 src/druid.nim"

task buildAll, "Build for all architectures":
  exec "nimble buildArmv7"
  exec "nimble build"
  exec "nimble buildx86"
  exec "nimble buildx86_64"

task test, "Run tests":
  exec "nim c -r tests/test_all.nim"

task docs, "Generate documentation":
  exec "nim doc --project --index:on --git.url:https://github.com/user/druid src/druid.nim"
```

### 2. Android NDK Integration

#### NDK Toolchain Setup

```bash
# Environment variables
export ANDROID_NDK=/path/to/android-ndk
export ANDROID_SDK=/path/to/android-sdk

# Nim compiler config for Android
# save as android-arm64.cfg
--os:android
--cpu:arm64
--passC:"-I${ANDROID_NDK}/sysroot/usr/include"
--passL:"-L${ANDROID_NDK}/platforms/android-21/arch-arm64/usr/lib"
--gcc.exe:"${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang"
--gcc.linkerexe:"${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang"
```

#### Build Script (build.sh)

```bash
#!/bin/bash

set -e

# Configuration
PROJECT_NAME="myapp"
DRUID_SRC="src/druid.nim"
OUTPUT_DIR="build/android"
ANDROID_PROJECT="android"

# Architectures
ARCHS=("arm64-v8a" "armeabi-v7a" "x86" "x86_64")

echo "Building Druid for Android..."

for arch in "${ARCHS[@]}"; do
    echo "Building for $arch..."

    case $arch in
        arm64-v8a)
            nim c --config:android-arm64.cfg --app:lib -o:"$OUTPUT_DIR/arm64-v8a/libdruid.so" "$DRUID_SRC"
            ;;
        armeabi-v7a)
            nim c --config:android-arm.cfg --app:lib -o:"$OUTPUT_DIR/armeabi-v7a/libdruid.so" "$DRUID_SRC"
            ;;
        x86)
            nim c --config:android-x86.cfg --app:lib -o:"$OUTPUT_DIR/x86/libdruid.so" "$DRUID_SRC"
            ;;
        x86_64)
            nim c --config:android-x86_64.cfg --app:lib -o:"$OUTPUT_DIR/x86_64/libdruid.so" "$DRUID_SRC"
            ;;
    esac
done

echo "Copying libraries to Android project..."
cp -r "$OUTPUT_DIR"/* "$ANDROID_PROJECT/app/src/main/jniLibs/"

echo "Build complete!"
```

### 3. Gradle Integration

#### Android build.gradle

```gradle
// app/build.gradle
android {
    compileSdk 34
    ndkVersion "25.2.9519653"

    defaultConfig {
        applicationId "com.example.myapp"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"

        ndk {
            abiFilters 'arm64-v8a', 'armeabi-v7a', 'x86', 'x86_64'
        }
    }

    sourceSets {
        main {
            jniLibs.srcDirs = ['src/main/jniLibs']
        }
    }

    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation 'androidx.core:core-ktx:1.12.0'
    implementation 'androidx.appcompat:appcompat:1.6.1'
}
```

#### Gradle Task for Nim Build

```gradle
// Add to build.gradle
task buildNimLibrary(type: Exec) {
    workingDir '../'
    commandLine './build.sh'
}

// Make Android build depend on Nim build
preBuild.dependsOn buildNimLibrary
```

---

## Testing Infrastructure

### 1. Unit Tests (Nim)

```nim
# tests/test_all.nim
import unittest
import ../src/druid

suite "Core Infrastructure":
  test "AndroidRuntime initialization":
    # Mock context
    let ctx = createMockContext()
    let runtime = AndroidRuntime.init(ctx)
    check runtime.isInitialized()

  test "JNI type conversions":
    let original = "Hello, Android!"
    let jstr = toJString(original)
    let converted = fromJString(jstr)
    check converted == original

suite "Essential Managers":
  test "PermissionManager":
    let pm = PermissionManager.init()
    # Test permission checking logic

  test "PackageManager":
    let pkg = PackageManager.init()
    # Test package queries

# Run with: nim c -r tests/test_all.nim
```

### 2. Android Unit Tests (JUnit)

```kotlin
// android/app/src/test/java/com/example/DruidTest.kt
import org.junit.Test
import org.junit.Assert.*

class DruidTest {
    companion object {
        init {
            System.loadLibrary("druid")
        }
    }

    @Test
    fun testNativeFunction() {
        val result = nativeTestFunction()
        assertTrue(result)
    }

    private external fun nativeTestFunction(): Boolean
}
```

### 3. Android Instrumentation Tests

```kotlin
// android/app/src/androidTest/java/com/example/DruidInstrumentedTest.kt
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.Assert.*

@RunWith(AndroidJUnit4::class)
class DruidInstrumentedTest {
    @Test
    fun testRuntimeInitialization() {
        val context = InstrumentationRegistry.getInstrumentation().targetContext
        assertTrue(initDruid(context))
    }

    @Test
    fun testPermissionManager() {
        // Test permission request flow
        val granted = requestCameraPermission()
        // Assert based on test configuration
    }

    private external fun initDruid(context: android.content.Context): Boolean
    private external fun requestCameraPermission(): Boolean
}
```

### 4. Integration Tests

```nim
# tests/integration/test_lifecycle.nim
import unittest
import druid

suite "Lifecycle Integration":
  test "Activity creation and destruction":
    # Create mock activity
    let activity = createTestActivity()

    # Initialize runtime
    let runtime = AndroidRuntime.init(activity)

    # Trigger lifecycle events
    onActivityCreated(activity)
    onActivityResumed()
    onActivityPaused()
    onActivityDestroyed()

    # Verify cleanup
    check not isActivityAvailable()

  test "Process death and resurrection":
    # Setup state
    keepAlive("score", 100)
    keepAlive("player", "TestUser")

    # Simulate process death
    simulateProcessDeath()

    # Recreate runtime
    let runtime = AndroidRuntime.init(createTestActivity())

    # Verify state restored
    check getRestoredState[int]("score") == some(100)
    check getRestoredState[string]("player") == some("TestUser")
```

---

## CI/CD Pipeline

### GitHub Actions

```yaml
# .github/workflows/build.yml
name: Build and Test

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Setup Nim
      uses: jiro4989/setup-nim-action@v1
      with:
        nim-version: '2.0.0'

    - name: Setup Android SDK
      uses: android-actions/setup-android@v2

    - name: Setup Android NDK
      run: |
        sdkmanager --install "ndk;25.2.9519653"

    - name: Install dependencies
      run: nimble install -y

    - name: Run tests
      run: nimble test

    - name: Build library
      run: nimble buildAll

    - name: Build Android APK
      run: |
        cd android
        ./gradlew assembleDebug

    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-debug.apk
        path: android/app/build/outputs/apk/debug/app-debug.apk

  test-android:
    runs-on: macos-latest  # For hardware acceleration

    steps:
    - uses: actions/checkout@v3

    # ... setup steps ...

    - name: Run Android Tests
      uses: reactivecircus/android-emulator-runner@v2
      with:
        api-level: 30
        arch: x86_64
        script: |
          cd android
          ./gradlew connectedAndroidTest
```

---

## Development Workflow

### 1. Local Development

```bash
# 1. Write Nim code
vim src/managers/essential/PermissionManager.nim

# 2. Build library
nimble build

# 3. Copy to Android project
cp build/android/arm64-v8a/libdruid.so android/app/src/main/jniLibs/arm64-v8a/

# 4. Build and run Android app
cd android
./gradlew installDebug
adb shell am start -n com.example.myapp/.MainActivity

# 5. View logs
adb logcat | grep Druid
```

### 2. Testing Workflow

```bash
# Run Nim unit tests
nimble test

# Run Android unit tests
cd android
./gradlew test

# Run instrumentation tests (requires device/emulator)
./gradlew connectedAndroidTest

# Run specific test
./gradlew connectedAndroidTest --tests "DruidInstrumentedTest.testPermissionManager"
```

### 3. Debug Workflow

```bash
# Enable Nim debug symbols
nim c -d:debug --debugger:native src/druid.nim

# Use Android Studio debugger
# 1. Open android/ in Android Studio
# 2. Set breakpoints in Kotlin code
# 3. Run debug build
# 4. Step through JNI calls

# Use GDB for native debugging
adb shell gdbserver :5039 --attach $(pidof com.example.myapp)
aarch64-linux-android-gdb
(gdb) target remote :5039
(gdb) break PermissionManager_init
(gdb) continue
```

---

## Performance Profiling

### 1. Nim Profiling

```nim
# Compile with profiler
nim c -d:release --profiler:on --stacktrace:on src/druid.nim

# Run and generate profile
# Profile data in profile_results.txt
```

### 2. Android Profiling

```bash
# CPU profiling
adb shell am profile start com.example.myapp /data/local/tmp/profile.trace
# ... use app ...
adb shell am profile stop com.example.myapp
adb pull /data/local/tmp/profile.trace
# Analyze in Android Studio

# Memory profiling
adb shell dumpsys meminfo com.example.myapp

# GPU profiling
adb shell setprop debug.hwui.profile true
```

---

## Release Build

### 1. Prepare Release

```bash
# 1. Update version
vim druid.nimble  # Update version
vim android/app/build.gradle  # Update versionCode, versionName

# 2. Build optimized library
nim c -d:release --opt:speed --app:lib src/druid.nim

# 3. Build Android APK
cd android
./gradlew assembleRelease

# 4. Sign APK
jarsigner -keystore release.keystore \
  app/build/outputs/apk/release/app-release-unsigned.apk \
  release_key

# 5. Align APK
zipalign -v 4 \
  app/build/outputs/apk/release/app-release-unsigned.apk \
  app/build/outputs/apk/release/app-release.apk
```

### 2. Publish to Nimble

```bash
# Tag release
git tag v0.1.0
git push origin v0.1.0

# Publish
nimble publish
```

---

## Troubleshooting

### Common Build Issues

**Issue**: "Undefined reference to JNI functions"
**Solution**: Ensure Android NDK paths are correct in nim.cfg

**Issue**: "Library not loaded"
**Solution**: Check ABI matches (arm64-v8a vs armeabi-v7a)

**Issue**: "JNI version mismatch"
**Solution**: Ensure JNI_VERSION_1_6 in JNI_OnLoad

**Issue**: "Symbol not found"
**Solution**: Check that function is exported with `{.exportc, dynlib.}`

### Debug Tips

1. Enable verbose logging: `-d:debug -d:verbose`
2. Check symbol exports: `nm libdruid.so | grep Java`
3. Verify JNI signatures: `javap -s -p MyClass`
4. Test on emulator first (x86_64 easier to debug)

---

## Next Steps

1. Create druid.nimble file
2. Write build scripts for all architectures
3. Set up CI/CD pipeline
4. Create Android project template
5. Write comprehensive tests
6. Add performance benchmarks

---

## References

- [Android NDK Guide](https://developer.android.com/ndk/guides)
- [Gradle Build Configuration](https://developer.android.com/studio/build)
- [Android Testing](https://developer.android.com/training/testing)
- [Nim Cross-Compilation](https://nim-lang.org/docs/nimc.html#cross-compilation)

# Getting Started with Druid Development

## Overview

This guide will help you set up your development environment and start contributing to Druid.

## Prerequisites

### Required Software

1. **Nim 2.0+**
   ```bash
   curl https://nim-lang.org/choosenim/init.sh -sSf | sh
   choosenim stable
   ```

2. **Android Studio**
   - Download from [developer.android.com](https://developer.android.com/studio)
   - Install Android SDK (API 21-34)
   - Install Android NDK (25.2.9519653+)

3. **Git**
   ```bash
   # Linux
   sudo apt install git

   # macOS
   brew install git
   ```

### Optional but Recommended

- **adb** (Android Debug Bridge) - Included with Android SDK
- **Gradle** - Included with Android Studio
- **VS Code** with Nim extension

---

## Setup Development Environment

### 1. Clone Repository

```bash
git clone https://github.com/kobi2187/druid.git
cd druid
```

### 2. Install Nim Dependencies

```bash
nimble install -d
```

### 3. Configure Android NDK

```bash
# Set environment variables
export ANDROID_NDK=$HOME/Android/Sdk/ndk/25.2.9519653
export ANDROID_SDK=$HOME/Android/Sdk

# Add to ~/.bashrc or ~/.zshrc to persist
echo 'export ANDROID_NDK=$HOME/Android/Sdk/ndk/25.2.9519653' >> ~/.bashrc
echo 'export ANDROID_SDK=$HOME/Android/Sdk' >> ~/.bashrc
```

### 4. Verify Setup

```bash
# Check Nim version
nim --version  # Should be 2.0.0+

# Check Android SDK
$ANDROID_SDK/tools/bin/sdkmanager --list | grep "build-tools\|platforms"

# Check Android NDK
ls $ANDROID_NDK/toolchains/llvm/prebuilt/*/bin/clang  # Should exist
```

---

## Project Structure

```
druid/
├── src/                    # Nim source code
│   ├── druid.nim          # Main module
│   ├── core.nim           # AndroidRuntime
│   ├── art.nim            # Device detection
│   ├── common.nim         # Permissions
│   └── jni/               # JNI bridge
│       ├── bridge.nim
│       ├── types.nim
│       └── conversions.nim
├── managers/              # Manager implementations
│   ├── essential/         # Phase 2
│   ├── features/          # Phase 4
│   ├── system/            # Phase 3
│   └── extra/             # Phase 5
├── tests/                 # Tests
│   ├── test_all.nim       # Unit tests
│   └── integration/       # Integration tests
├── docs/                  # Documentation
│   ├── 01-core-infrastructure/
│   ├── 02-essential-managers/
│   ├── 03-system-managers/
│   ├── 04-feature-managers/
│   ├── 05-extra-managers/
│   └── 08-build-system/
├── examples/              # Example apps
│   └── hello_druid/
├── android/               # Android project template
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── java/
│   │   │   ├── kotlin/
│   │   │   └── jniLibs/   # Compiled .so files go here
│   │   └── build.gradle
│   └── build.gradle
├── druid.nimble          # Nimble package file
├── ROADMAP.md            # Project roadmap
└── README.md             # Main readme
```

---

## Your First Contribution

### Step 1: Pick a Task

Start with something simple to learn the codebase:

**Good First Tasks**:
1. Implement `PackageManager.getPackageName()` (simple JNI call)
2. Add unit tests for type conversions in `jni/conversions.nim`
3. Write documentation for an existing function
4. Add examples to README.md

**See**: [ROADMAP.md](../ROADMAP.md) for full task list

### Step 2: Understand the Component

Before implementing, read:
1. The overview doc: `docs/02-essential-managers/overview.md`
2. The specific doc: `docs/02-essential-managers/PackageManager.md`
3. The existing code: `core.nim`, `common.nim`

### Step 3: Implement

Let's implement `getPackageName()` as an example:

#### 1. Add to Manager Type

```nim
# managers/essential/PackageManager.nim
import ../../jni/bridge
import options

type
  PackageManager* = object
    context: jobject
    packageName: Option[string]  # Cache

proc init*(_: type PackageManager): PackageManager =
  result.context = getApplicationContext()
  result.packageName = none(string)
```

#### 2. Implement Function

```nim
proc getPackageName*(pm: var PackageManager): string =
  ## Get the app's package name
  ## Example: "com.example.myapp"

  # Return cached if available
  if pm.packageName.isSome:
    return pm.packageName.get

  # Get package name from Context
  let contextClass = findClass("android/content/Context")
  let getPackageNameMethod = getMethodID(contextClass, "getPackageName",
    "()Ljava/lang/String;")

  let nameJS = cast[jstring](callObjectMethod(pm.context, getPackageNameMethod))
  let name = fromJString(nameJS)

  env.DeleteLocalRef(nameJS)

  # Cache it
  pm.packageName = some(name)

  return name
```

#### 3. Add Tests

```nim
# tests/test_package_manager.nim
import unittest
import ../managers/essential/PackageManager

suite "PackageManager":
  test "getPackageName returns non-empty string":
    var pm = PackageManager.init()
    let name = pm.getPackageName()

    check name.len > 0
    check name.contains(".")  # Package names have dots

  test "getPackageName caches result":
    var pm = PackageManager.init()
    let name1 = pm.getPackageName()
    let name2 = pm.getPackageName()

    check name1 == name2
    # Second call should be instant (cached)
```

### Step 4: Build and Test

```bash
# 1. Build Nim code
nim c -c --app:lib --os:android --cpu:arm64 managers/essential/PackageManager.nim

# 2. Run tests
nim c -r tests/test_package_manager.nim

# 3. Build full library
nimble build

# 4. Test on Android device
cd android
./gradlew installDebug
adb logcat | grep Druid
```

### Step 5: Submit PR

```bash
# 1. Create branch
git checkout -b feature/package-manager

# 2. Commit changes
git add managers/essential/PackageManager.nim tests/test_package_manager.nim
git commit -m "Implement PackageManager.getPackageName()

- Add getPackageName() function with caching
- Add unit tests
- Update documentation"

# 3. Push to GitHub
git push origin feature/package-manager

# 4. Create Pull Request on GitHub
```

---

## Development Tips

### Tip 1: Use Mock Context for Testing

```nim
# tests/mocks.nim
proc createMockContext*(): jobject =
  ## Create a fake context for testing
  ## In real implementation, would mock JNI calls
  cast[jobject](0x12345678)
```

### Tip 2: Test JNI Calls Interactively

```bash
# Build and load in REPL
nim secret --eval:'
import druid
let ctx = getApplicationContext()
echo "Context: ", cast[int](ctx)
'
```

### Tip 3: Use Android Logcat

```nim
# Add debug logging
debug("Druid", "getPackageName called")
debug("Druid", "Result: " & name)
```

```bash
# View logs
adb logcat -s Druid:V
```

### Tip 4: Profile Performance

```nim
import times

proc getPackageName*(pm: var PackageManager): string =
  let start = cpuTime()
  defer:
    let elapsed = (cpuTime() - start) * 1000
    debug("Druid", "getPackageName took " & $elapsed & "ms")

  # ... implementation
```

---

## Common Workflows

### Workflow 1: Add a New Manager

1. **Read docs**: `docs/02-essential-managers/ManagerName.md`
2. **Create file**: `managers/essential/ManagerName.nim`
3. **Implement init**: Manager initialization
4. **Implement APIs**: Public functions
5. **Add to runtime**: Update `core.nim` to include manager
6. **Write tests**: Unit and integration tests
7. **Update docs**: Add implementation notes
8. **Create example**: Simple usage example

### Workflow 2: Fix a Bug

1. **Reproduce**: Write a failing test
2. **Debug**: Add logging, use debugger
3. **Fix**: Modify code
4. **Verify**: Test passes
5. **Regression test**: Ensure fix doesn't break other tests
6. **Document**: Add comment explaining fix
7. **PR**: Submit with test and explanation

### Workflow 3: Add Documentation

1. **Read existing**: Understand the pattern
2. **Write draft**: Use same structure
3. **Add examples**: Code snippets
4. **Review**: Check for clarity
5. **PR**: Submit docs-only PR

---

## Testing Guidelines

### Unit Tests

**What to test**:
- Each public function
- Edge cases (null, empty, invalid input)
- Error conditions
- Caching behavior

**Example**:
```nim
suite "PermissionManager":
  test "hasPermission returns false for denied":
    let pm = PermissionManager.init()
    mockDenyPermission(CAMERA)
    check not pm.hasPermission(CAMERA)

  test "hasPermission returns true for granted":
    let pm = PermissionManager.init()
    mockGrantPermission(CAMERA)
    check pm.hasPermission(CAMERA)
```

### Integration Tests

**What to test**:
- Manager interactions
- Lifecycle handling
- Real Android framework calls

**Example**:
```nim
suite "Audio + Permissions Integration":
  test "audio requires permission":
    let audio = audio()
    let result = audio.record("test.mp3")

    check result.isErr  # Should fail without permission

    await permissions().requestPermission(RECORD_AUDIO)

    let result2 = audio.record("test.mp3")
    check result2.isOk  # Should succeed with permission
```

---

## Style Guide

### Nim Code Style

```nim
# Use camelCase for functions and variables
proc getPackageName(): string

# Use PascalCase for types
type PackageManager = object

# Use UPPER_CASE for constants
const DEFAULT_TIMEOUT = 5000

# Document public APIs
proc hasPermission*(permission: AndroidPermission): bool =
  ## Check if permission is granted
  ##
  ## Args:
  ##   permission: The permission to check
  ##
  ## Returns:
  ##   true if granted, false otherwise

# Use meaningful names
let granted = pm.hasPermission(CAMERA)  # Good
let x = pm.hp(CAM)  # Bad

# Keep functions short (< 50 lines)
# Extract helpers if needed

# Use Result types for errors
proc riskyOperation(): DruidResult[int] =
  if error:
    return err(newException(DruidError, "Failed"))
  return ok(42)
```

### Documentation Style

- Start with purpose
- List APIs with signatures
- Provide usage examples
- Document edge cases
- Include performance notes

---

## Getting Help

### Resources

- **Documentation**: `docs/` directory
- **ROADMAP**: [ROADMAP.md](../ROADMAP.md)
- **Examples**: `examples/` directory
- **Nim Manual**: https://nim-lang.org/docs/manual.html
- **Android Docs**: https://developer.android.com/docs

### Questions

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and ideas
- **Discord**: [Nim Discord](https://discord.gg/nim) #android channel

---

## Next Steps

1. **Read ROADMAP**: Understand project phases
2. **Pick a task**: Start with Essential Managers
3. **Read docs**: Understand the component
4. **Implement**: Write code and tests
5. **Submit PR**: Contribute back!

**Welcome to Druid development! 🚀**

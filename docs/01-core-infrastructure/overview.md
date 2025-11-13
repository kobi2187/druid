# Phase 1: Core Infrastructure

## Overview

The Core Infrastructure phase establishes the foundational layer that all other managers depend on. This includes JNI bridging, runtime initialization, error handling, and resource management.

## Goals

1. **Enable Nim-Java Interoperability**: Create a robust JNI bridge that allows Nim code to call Java methods and vice versa
2. **Manage Android Lifecycle**: Handle Activity/Application context and lifecycle callbacks
3. **Error Handling**: Provide consistent error handling across the entire library
4. **Resource Safety**: Ensure proper cleanup of JNI references and Android resources
5. **Thread Safety**: Establish thread-safe patterns for accessing Android APIs

## Components

### 1. JNI Bridge Layer
**File**: `jni/bridge.nim`
**Priority**: CRITICAL
**Dependencies**: None

Provides low-level Java Native Interface (JNI) operations:
- Loading Java classes and methods
- Converting between Nim and Java types
- Managing local and global references
- Exception handling and error propagation

**See**: `jni-bridge.md`

### 2. AndroidRuntime Initialization
**File**: `core.nim` (expand existing)
**Priority**: CRITICAL
**Dependencies**: JNI Bridge

Implements the singleton AndroidRuntime:
- Initialization from Android Activity/Application
- Context management
- Manager lifecycle coordination
- Feature flag detection

**See**: `runtime-initialization.md`

### 3. Error Handling System
**File**: `errors.nim` (new)
**Priority**: HIGH
**Dependencies**: JNI Bridge

Standardized error handling:
- Java exception to Nim exception conversion
- Result types for fallible operations
- Logging infrastructure
- Debug vs release behavior

**See**: `error-handling.md`

### 4. Resource Management
**File**: `resources.nim` (new)
**Priority**: HIGH
**Dependencies**: JNI Bridge, Runtime

Android resource management:
- Context and Activity reference tracking
- Service binding and unbinding
- Broadcast receiver registration
- Lifecycle-aware resource cleanup

**See**: `resource-management.md`

### 5. Thread Safety Primitives
**File**: `threading.nim` (new)
**Priority**: MEDIUM
**Dependencies**: JNI Bridge

Thread-safe patterns:
- Main thread dispatch
- JNI AttachCurrentThread handling
- Locks and mutexes
- Thread-local storage for JNIEnv

**See**: `threading.md`

## Architecture

```
┌─────────────────────────────────────────────┐
│           Nim Application Code              │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│         AndroidRuntime (Singleton)          │
│  ┌────────────────────────────────────────┐ │
│  │  Manager Registry                      │ │
│  │  - PermissionManager                   │ │
│  │  - AudioManager                        │ │
│  │  - ... (all managers)                  │ │
│  └────────────────────────────────────────┘ │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│        Core Infrastructure Layer            │
│  ┌──────────────┐  ┌──────────────────────┐ │
│  │ Error Handler│  │  Resource Manager    │ │
│  └──────────────┘  └──────────────────────┘ │
│  ┌──────────────┐  ┌──────────────────────┐ │
│  │  Threading   │  │   Context Manager    │ │
│  └──────────────┘  └──────────────────────┘ │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│           JNI Bridge Layer                  │
│  - Class/Method Loading                     │
│  - Type Conversion                          │
│  - Reference Management                     │
│  - Exception Bridging                       │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│         Android Framework (Java)            │
│  - android.app.Activity                     │
│  - android.content.Context                  │
│  - android.os.*                             │
│  - ... (all Android APIs)                   │
└─────────────────────────────────────────────┘
```

## Implementation Order

### Week 1: JNI Foundation
1. Set up Nim JNI bindings (import jnim or write custom)
2. Implement basic class loading (e.g., load `android.util.Log`)
3. Test simple method calls (e.g., `Log.d()`)
4. Create type conversion utilities (Nim string ↔ jstring)

**Milestone**: Can call `Log.d()` from Nim code

### Week 2: Runtime & Context
1. Implement AndroidRuntime.init()
2. Store Application/Activity context
3. Create context accessor functions
4. Implement basic lifecycle callbacks

**Milestone**: AndroidRuntime initializes from Activity.onCreate()

### Week 3: Error Handling & Resources
1. Implement exception bridging
2. Create Result[T, E] types for APIs
3. Build resource tracking system
4. Add cleanup on lifecycle events

**Milestone**: Errors propagate correctly, no resource leaks

## Testing Strategy

### Unit Tests
- JNI type conversions (all primitive and reference types)
- Class/method loading edge cases
- Error handling (simulated Java exceptions)
- Resource cleanup (reference counting)

### Integration Tests
- Full AndroidRuntime initialization
- Context availability across lifecycle
- Multiple manager initialization
- Process death and recreation

### Manual Testing
- Run on real Android device
- Test on API levels: 21, 26, 30, 34
- Test on different manufacturers (Samsung, Pixel, OnePlus)
- Memory profiling (no leaks over time)

## Success Criteria

- [ ] Can initialize AndroidRuntime from Android app
- [ ] Can obtain and use Application context
- [ ] Can call arbitrary Java methods via JNI
- [ ] Java exceptions propagate to Nim as exceptions/Results
- [ ] Zero JNI reference leaks (verified with valgrind/LeakCanary)
- [ ] Thread-safe access from multiple Nim threads
- [ ] Works on Android API 21+
- [ ] Full test coverage (>90% for core infrastructure)

## Key Design Decisions

### Decision 1: JNI Library Choice
**Options**:
1. Use existing `jnim` library
2. Write custom JNI bindings
3. Use Nim's built-in FFI with manual JNI

**Choice**: Start with manual JNI via FFI, consider jnim later
**Rationale**:
- Maximum control over performance
- No dependency on external library maintenance
- Better understanding of underlying mechanics
- Can optimize for Druid's specific needs

### Decision 2: Context Storage
**Options**:
1. Store as global variable
2. Store in AndroidRuntime singleton
3. Pass explicitly to all managers

**Choice**: Store in AndroidRuntime singleton
**Rationale**:
- Singleton pattern already established
- Avoids global mutable state
- Allows context switching (if needed)
- Easy to mock for testing

### Decision 3: Error Handling Style
**Options**:
1. Exceptions everywhere
2. Result types everywhere
3. Hybrid (exceptions for programming errors, Results for expected failures)

**Choice**: Hybrid approach
**Rationale**:
- Exceptions for "should never happen" (missing context, invalid state)
- Result types for "can fail normally" (permission denied, network unavailable)
- Matches Nim idioms
- Clear contract for API users

## Performance Targets

| Operation | Target | Notes |
|-----------|--------|-------|
| AndroidRuntime.init() | < 50ms | One-time cost at app startup |
| JNI class load (cached) | < 0.1ms | After first load |
| JNI method call | < 0.5ms | Simple method with primitive args |
| Context access | < 0.01ms | Just a pointer dereference |
| Exception conversion | < 1ms | Includes stack trace capture |

## Dependencies

### External Libraries (Nim)
- None (pure Nim + FFI)
- Optional: `results` package for Result type
- Optional: `chronicles` for logging

### System Requirements
- Android NDK r21+ (for compilation)
- Android SDK API 21+ (runtime)
- Nim 2.0+ (for compilation)

## Files Created/Modified

### New Files
```
jni/
├── bridge.nim          # JNI bridge layer
├── types.nim           # JNI type definitions
└── conversions.nim     # Nim ↔ Java type conversions

src/
├── errors.nim          # Error handling
├── resources.nim       # Resource management
└── threading.nim       # Thread safety
```

### Modified Files
```
core.nim               # Expand AndroidRuntime implementation
art.nim                # Add runtime device detection
```

## Common Pitfalls

### JNI Reference Leaks
**Problem**: Creating local references without deleting them
**Solution**: Use RAII-style wrappers, delete in defer blocks

### Thread Safety Issues
**Problem**: JNIEnv* is thread-specific
**Solution**: AttachCurrentThread for each Nim thread, use thread-local storage

### Class Loading Performance
**Problem**: FindClass is slow
**Solution**: Cache ClassRefs globally, load once at init

### Exception Handling
**Problem**: Java exceptions don't automatically propagate to Nim
**Solution**: Check for pending exceptions after every JNI call

### Context Lifecycle
**Problem**: Activity context may become invalid
**Solution**: Use Application context when possible, null-check before use

## Next Steps

After Phase 1 completion:
1. Implement first Essential Manager (PermissionManager) to validate infrastructure
2. Create example app demonstrating runtime initialization
3. Write integration tests for core functionality
4. Performance profiling and optimization

---

**See detailed implementation guides**:
- [JNI Bridge Implementation](jni-bridge.md)
- [Runtime Initialization](runtime-initialization.md)
- [Error Handling](error-handling.md)
- [Resource Management](resource-management.md)
- [Threading Patterns](threading.md)

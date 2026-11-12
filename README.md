# Druid

Android's services for Nim programs, without Android's GUI. Druid works with
[RUI](https://github.com/kobi2187/rui2) apps, games, and anything else built
with the NDK.

```nim
import druid

echo device().model, " on Android ", device().release
clipboard().setText("Copied!")
vibration().effect(heClick)
notifications().notify("Done", "Upload finished")
let req = permissions().request(pgLocation)

# once per frame:
for ev in pollEvents():
  if ev.kind == ekPermission and permissions().status(req) == psGranted:
    location().start(providerGps)
```

The same program also builds for the desktop. There, every call gives a
neutral answer: no vibrator, all permissions granted, toasts and notifications
go to stderr, and prefs are saved to a JSON file.

## What it covers

| Module | Accessor | What |
|---|---|---|
| device | `device()` | API level, release, maker, model, ABIs, locale, time zone, night mode |
| app | `appInfo()` | package name, version, install times, system features, installed apps |
| permissions | `permissions()` | check, request (works from a NativeActivity), status, rationale, groups |
| clipboard | `clipboard()` | text copy / paste / clear |
| vibration | `vibration()` | one-shot, amplitude, patterns, predefined effects |
| notifications | `notifications()` | channels, show/replace, progress, ongoing, cancel, active ids |
| connectivity | `connectivity()` | connected, network type, metered, change monitoring |
| power | `power()` | battery level/charging/temperature, power save, doze, thermal, wake locks |
| storage | `storage()` | files/cache/no-backup/external dirs, free and total space |
| display | `display()` | pixels, density, dpi, font scale, refresh rate, rotation; dp/sp helpers |
| audio | `audio()` | stream volumes, ringer mode, mic mute, headphones, low-latency hints |
| location | `location()` | providers, last known, updates as events, distances |
| sensors | `sensors()` | availability, info, readings as events, latest per type |
| keyboard | `keyboard()` | show/hide the soft keyboard (for apps that draw their own text fields) |
| intents | `intents()` | open URL, share, dial, email, SMS, maps, settings, toasts |
| prefs | `prefs()` | persistent key-value settings (SharedPreferences) |
| crypto | `crypto()` | SHA-*, HMAC, secure random, UUID, Base64 |
| hardware | `telephony()`, `bluetooth()`, `nfc()`, `camera()` | presence/state, camera facts, torch |
| media | `player()`, `biometric()`, `downloads()`, `memory()` | audio playback, BiometricPrompt, DownloadManager, memory info |
| log, ndk | `logInfo` ..., `systemProperty`, `ndkApiLevel` | logcat; NDK-only facts |

## How it works

```
 Nim (src/druid/*)                      Java (android/druid, package dev.druid)
 ─────────────────                      ───────────────────────────────────────
 clipboard().setText(s) ── JNI ──────►  Clipboard.setText(label, text)
 pollEvents()          ◄── JNI ───────  Druid.pollEvents(): queued events
                                        ▲ permission answers, location fixes,
                                        │ sensor readings, network changes,
                                        │ lifecycle, onTrimMemory ...
```

- **One small Java class per service**, static methods with simple types.
  This is the code that touches Android, and Robolectric tests it directly.
- **`bridge.nim`** makes every call with `callStatic(T, "Class", "method", args...)`.
  The JNI signature is derived from the Nim types, so the two can't disagree.
  Each call runs in its own JNI local frame, because RUI's thread never
  returns to Java to free local references. Strings cross as UTF-16:
  `NewStringUTF` with an emoji aborts the app under CheckJNI. A Java exception
  becomes a `DruidError`, and a `SecurityException` becomes a
  `DruidPermissionError`.
- **Callbacks become events.** Android's callbacks never call into Nim. They
  queue an event, and Nim drains the queue once per frame. `pollEvents` also
  keeps the latest of each kind, so you can read `location().latest`,
  `sensors().latest(t)` or `permissions().status(req)` and ignore the events
  altogether. Java can also wake a sleeping loop through a native method that
  Druid registers with `RegisterNatives`.
- **Permissions from anywhere.** `DruidPermissionActivity` (invisible) asks on
  behalf of any Activity. This matters because a NativeActivity, such as
  RUI's, has no `onRequestPermissionsResult`.
- **Threads.** Druid attaches a calling thread to the JVM when it needs to, and
  detaches it when the thread exits, through a pthread-key destructor. ART
  aborts the app if a thread exits while still attached.

## Using it with RUI

```nim
import rui, druid, druid/ruiapp

ruiAndroidMain:
  state:
    status: string = ""
  let app = newApp("Demo", 360, 800)
  app.attachDruid(proc(ev: DruidEvent) =
    if ev.kind == ekPermission: status.value = $ev.results)
  app.setRootWidget(buildScreen(status))
  app.run()
```

`attachDruid` does three things:

- it starts Druid with RUI's `RuiActivity`, getting the JavaVM and Activity
  from raylib's `GetAndroidApp`;
- it polls Druid's events in `onFrame`, keeping any `onFrame` hook you already
  set;
- it lets Android wake RUI's idle loop (`wakeMainLoop`) when an event arrives.

To build an RUI app with Druid for Android:

1. Add both Android libraries to the app's Gradle project: RUI's
   `mobile/android/rui` and this repository's `android/druid`. See
   `android/rui-demo`.
2. Build `libmain.so` with `tools/build_rui_android.sh`, which uses RUI's own
   flags plus Druid's path:

```bash
RUI_DIR=/path/to/rui2 DRUID_RUI_MAIN=myapp.nim tools/build_rui_android.sh
```

`examples/rui/druid_demo.nim` is a complete example (screenshot-free, but
tested: see below).

## Using it from any Android app (Kotlin/Java)

1. Add the `android/druid` library module to your project.
2. Start Druid from your own JNI entry point. See `examples/sample/sample.nim`
   and `android/sample`:

```nim
proc Java_com_example_MainActivity_nativeStart(env: JNIEnvPtr, thiz: jobject, activity: jobject) {.exportc, dynlib, cdecl.} =
  startDruid(env, activity)
```

3. Build the Nim side with the NDK:

```bash
DRUID_NDK_MAIN=mylib.nim DRUID_NDK_LIB=libmylib.so DRUID_NDK_OUT=app/src/main/jniLibs tools/build_ndk.sh
```

Dangerous permissions (camera, location, ...) still have to be declared in
your app's manifest. Druid's library declares only the normal ones it uses
(network state, vibrate, wake lock).

## Testing

`tools/test_all.sh` runs every stage. CI (`.github/workflows/ci.yml`) runs the
same stages, one job each.

| Stage | What runs | Count |
|---|---|---|
| `host` | `tests/test_host.nim`: event decoding, UTF-8/16 edge cases, signature derivation, every service's desktop answer | 18 tests |
| `android` | **Robolectric**: the Nim harness (`tests/robolectric/harness.nim`) is built for the host and loaded into Robolectric's JVM. Each test arranges Android with shadows, runs Nim code that calls the Nim API through real JNI, and checks Nim's answer and the effect on Android. Java-only bridge tests run alongside. **SDK**: built against platform 36 with AGP 9.1. **NDK**: `examples/sample` is cross-compiled for arm64-v8a, armeabi-v7a, x86_64 and x86, with checks that it links only system libraries and has 16 KB-aligned segments. The sample APK is packaged, and its Robolectric tests run the same Nim. | 36 Nim-through-JNI + 13 bridge + 3 sample |
| `rui` | `tests/test_rui.nim`: the demo screen driven through RUI's own UI harness, with permission answers reaching the screen via `attachDruid`. The demo is laid out headless, then built with the NDK into `libmain.so` together with RUI and raylib, and packaged with RUI's `rui` library into `android/rui-demo`, whose Robolectric tests check the RuiActivity / Druid seam. | 4 + 3 |

Requirements:

- all stages: Nim 2.x and `jnim`;
- `android`: a JDK and `ANDROID_HOME` with platform 36 and an NDK;
- `rui`: an RUI checkout (`RUI_DIR`, default `../rui2`) with `naylib` 25.x and
  `yaml`.

### On a device or emulator

`tools/device_check.sh` runs on whatever `adb` sees. It does three things:

- runs the **instrumented tests** (`android/druid/src/androidTest`): the same
  Nim harness, built with the NDK, against real ART, real system services and
  CheckJNI;
- launches the **sample**, presses its button, answers the **real system
  permission dialog**, and checks that Nim saw the grant;
- launches the **RUI demo** in RUI's `RuiActivity`, taps "Ask for the camera",
  allows it, and checks that the answer reached RUI through `attachDruid`.

Screenshots and logs go to `build/device/`. It works with an emulator without
KVM too (`emulator -accel off`, an `aosp_atd` image), just slowly.

Out of scope: camera capture, Bluetooth scanning, Play Services location.

## Notes

- **Desktop JVMs and signals:** build JNI libraries for a desktop JVM (as the
  Robolectric harness is) with `-d:noSignalHandler`. HotSpot uses SIGSEGV
  internally, and Nim's handler would kill it. On Android, ART chains signals,
  so you don't need the flag there.
- **Memory management:** use ORC, Nim 2's default. Under `refc`, threads that
  Java creates need `setupForeignThreadGc`.
- `attic/` holds the 0.x design notes and the previous attempt. The 0.x
  managers never compiled, and 1.0 replaces them.

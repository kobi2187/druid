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

The same program also runs on the desktop, against a **simulated phone**
that keeps Android's rules, so what works on the desktop works on the device.
See [Developing on the desktop](#developing-on-the-desktop).

## What it covers

| Module | Accessor | What |
|---|---|---|
| device | `device()` | API level, release, maker, model, ABIs, locale, time zone, night mode |
| app | `appInfo()` | package name, version, install times, system features, installed apps |
| permissions | `permissions()` | check, request (works from a NativeActivity), status, rationale, groups |
| clipboard | `clipboard()` | text copy / paste / clear |
| vibration | `vibration()` | one-shot, amplitude, patterns, predefined effects |
| notifications | `notifications()` | channels, show/replace, progress, ongoing, buttons, inline reply, cancel, active ids; taps, presses, replies and dismissals as events |
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
| capture | `camera()` | take a photo to a JPEG file; stream frames (I420, newest only) and convert to RGBA; no camera UI |
| background | `alarms()`, `jobs()` | alarms at a time (with a notification, kept across reboots); JobScheduler jobs on network/charging conditions |
| incoming | `incoming()` | text, files and links other apps share with or open in the app, as events (files copied to the cache) |
| ble | `bluetooth()` | Bluetooth LE scanning with service filters, throttled per device |
| media | `player()`, `biometric()`, `downloads()`, `memory()` | audio playback, BiometricPrompt, DownloadManager, memory info |
| log, ndk | `logInfo` ..., `systemProperty`, `ndkApiLevel` | logcat; NDK-only facts |

## Developing on the desktop

Without a JVM (a desktop build), every Druid call goes to a simulated
Android device (`src/druid/simulator.nim`), not to stand-ins.

**It follows Android's rules:**
- Dangerous permissions start un-granted. A request returns at once and is
  answered at the next `pollEvents`, after the "dialog". After one denial
  `shouldShowRationale` is true; after two the request is refused without
  asking. A permission newer than the device's API level is denied. Normal
  permissions are always granted.
- Location without a location permission raises `DruidPermissionError`, as
  Android's `SecurityException` does.
- On API 33+, notifications are dropped without `POST_NOTIFICATIONS`.
- Network, sensor, location and lifecycle changes are events only while the
  app monitors them.
- The camera needs `CAMERA` (it takes a test card and streams a moving test
  pattern); BLE scans need `BLUETOOTH_SCAN` on API 31+ (fine location before)
  and Bluetooth on; exact alarms need the user's grant on API 31+.
- Alarms fire and jobs run at the poll after they come due on the simulator's
  clock, and jobs only while their network and charging conditions hold.

**You choose the device:** `DRUID_DEVICE` is `phone` (Pixel 7, API 34,
1080×2400 at 420 dpi; the default), `small` (API 28, 720×1280) or `tablet`.
The profile sets the API level, the screen, the features, sensors and cameras,
the vibrator and biometrics.

**You drive the world,** from debug code or tests:

```nim
simulator().setNetwork("cellular", metered = true)
simulator().setLocation(48.8584, 2.2945)
simulator().setSensor(ord(stLight), [320'f32])
simulator().setBattery(15, charging = true, plugged = "usb")
simulator().lifecycle("paused")
simulator().setPermissionPolicy(ppDeny)
simulator().tapNotification(7)              # also pressAction, reply, dismissNotification
simulator().share(text = "hi", files = ["photo.jpg"])   # another app shares; openLink(url)
simulator().advanceClock(3_600_000)         # an hour passes: alarms and jobs come due
simulator().addBleDevice("AA:BB:CC:00:00:01", "Band", rssi = -50)
```

and see what the app did with `simulator().notificationsShown`, `.vibrations`,
`.toasts` and `.opened` (links, shares, dial).

**With RUI:**
- `newDruidApp(title)` opens a window the phone's size in dp.
- `RUI_SCALE=2.625` shows it at the phone's sharpness.
- A permission request pops up a dialog in the app, for you to answer like the
  phone's. `DRUID_PERMISSIONS=grant` or `deny` answers without asking.

**Real work, same results:** digests and HMACs give the same bytes as
Android's providers, downloads really download, and prefs persist.

**It is checked against Android:** `tests/conformance.nim` holds 21 scenarios:
permission allow/deny/already granted, notifications and their taps, buttons,
replies and dismissals, clipboard, prefs, crypto, connectivity, sensors,
location, battery, wake locks, argument rules, storage, the camera's
permission and frames, alarms, jobs, shares and links, and BLE scans. The suite runs on the simulator and, through JNI, on
Robolectric's Android, and both must pass.

## When the app is not in front

Some things happen while the app's Nim code is not running: an alarm goes off,
a job runs, the user presses a notification's button. Druid's receivers and
job service store each as an event, and the app gets it at its next
`pollEvents` -- the same events as when it is running:

```nim
notifications().show(7, "New message", "Hi!", actions = [("read", "Mark read")], reply = "Reply")
alarms().set(1, nowMs() + 3_600_000, "Stretch", "Time to get up")
jobs().schedule(2, periodMinutes = 60, network = jnUnmetered)

for ev in pollEvents():
  case ev.kind
  of ekNotification: echo ev.notification.id, " ", ev.notification.kind, " ", ev.notification.detail
  of ekAlarm: echo "alarm ", ev.alarm.id
  of ekJob: sync()
  of ekIncoming: echo ev.incoming.action, " ", ev.incoming.text, " ", ev.incoming.files
  else: discard
```

What launched the Activity (a notification tap, a share, a link) is read when
Druid starts. For Intents that reach an Activity already running, the
Activity calls `Druid.newIntent(this, intent)` from `onNewIntent`; the
template's `MainActivity` does, and is `singleTask`. Which shares and links
the app receives is up to its manifest: the template has the intent filters,
commented out.

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

## Starting a new app (RUI + Druid)

```bash
RUI_DIR=~/rui2 tools/new_app.sh ~/hello com.example.hello "Hello"
```

This creates a ready project:

- `app.nim`: the UI (RUI) and Druid's services;
- a Kotlin `MainActivity` that extends RUI's `RuiActivity`;
- the Gradle project, which brings in RUI's `rui` and Druid's `druid` Android
  libraries;
- `build_android.sh`, which builds `libmain.so` with the NDK;
- `run_desktop.sh`;
- Robolectric tests.

See `templates/rui-app/README.md`. `tools/test_all.sh rui` generates one and
builds and tests it.

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

`examples/rui/druid_demo.nim` is a complete example.
`examples/rui/rui_screens.nim` runs RUI's own mockup screens, unchanged, the
same way.

**RUI needs a patch to run on Android.** `patches/rui/` has it, with an
explanation: RUI's SQLite import ends every RUI app at start-up on Android.
Druid's `tools/build_rui_android.sh` already applies the fix to the builds it
makes.

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

| Stage | What runs |
|---|---|
| `host` | The Nim API without a JVM: `test_host.nim` (event decoding, UTF-8/16, JNI signatures), `test_simulation.nim` (the simulated device follows Android's rules), `test_conformance.nim` (the 21 shared scenarios on the simulator), and `tools/check_api_coverage.py`, which fails if any exported API proc is not called by a test. |
| `android` | **Robolectric**, with three kinds of test. First, a test class per Java service, each run on Android 7.0, 9, 11, 13 and 16 (API 24/28/30/33/36: 706 runs, 92% line coverage, report under `android/druid/build/reports/coverage/`). Second, the Nim harness built for the host and run through JNI against Robolectric's Android, including the 21 conformance scenarios (arranged with shadows by `Arranger.java`). Third, the sample app's tests. **SDK** 36, AGP 9.1. **NDK** r28c: the sample is built for arm64-v8a, armeabi-v7a, x86_64 and x86, with checks that it links only system libraries and is 16 KB-aligned. |
| `rui` | `test_rui.nim` drives the demo through RUI's UI harness: buttons, the permission flow, and the desktop permission dialog. The demo is laid out headless, built into `libmain.so` with RUI, and packaged in `android/rui-demo` (Robolectric tests of the RuiActivity/Druid seam). A new app is generated from the template and built and tested. |

### On a device or emulator

`tools/device_check.sh` runs on whatever `adb` sees. It does three things:

- runs the **instrumented tests** (`android/druid/src/androidTest`): the same
  Nim harness, built with the NDK, against real ART, real system services and
  CheckJNI;
- launches the **sample**, presses its button, answers the **real system
  permission dialog**, and checks that Nim saw the grant;
- launches the **RUI demo** in RUI's `RuiActivity`, taps "Ask for the camera",
  allows it, and checks that the answer reached RUI through `attachDruid`.

Screenshots and logs go to `build/device/`.

It also works with an emulator without KVM, just slowly: about 20–30 minutes
for the first boot, 5 for later ones, and seconds per frame for GL apps. Use
these settings:

```bash
emulator -avd <avd> -accel off -gpu guest -no-window -no-audio -no-snapshot -memory 4096 -cores 4
```

- **Image:** use an `aosp_atd` (Automated Test Device) image.
- **GPU:** use `-gpu guest`. With `-gpu swiftshader_indirect` nothing reaches
  the framebuffer and GL apps crash in the system EGL library.
- **Settings:** set `hide_error_dialogs` to 1 and `verifier_verify_adb_installs`
  to 0, or system ANR dialogs and install verification time out under
  software emulation.
- **Toasts:** ATD images have no SystemUI, so text toasts are not drawn there.

With KVM (your machine), the same image boots in under a minute; Waydroid is
faster still.

Out of scope: camera capture, Bluetooth scanning, Play Services location.

## Notes

- **stdout/stderr go to logcat.** On Android, Druid sends stdout and stderr
  to logcat (tags `stdout` and `stderr`) from the moment the library loads,
  and Nim's fatal errors go there too (tag `nim`). Otherwise Android discards
  them, so a Nim program that fails during start-up (an exception in a module
  initializer, a missing `{.dynlib.}` library) dies with "exited cleanly (1)"
  and no message. The redirect is flushed at exit so the last lines aren't
  lost. Opt out with `-d:druidKeepStdio`. (`echo` itself already goes to
  logcat under tag `nim`.)
- **SQLite in RUI apps on Android.** RUI's data sources import
  `db_connector/db_sqlite`, which `dlopen`s `libsqlite3.so` at start-up.
  Android has no such public library, so every RUI app exits before its
  first line. `tools/build_rui_android.sh` compiles the SQLite amalgamation
  with the NDK and links it in (`--dynlibOverride:sqlite3`), so the SQLite
  reader works too. Use the same flags if you build RUI apps another way.
- **RUI's library and `libmain.so`.** An app that ships its own RUI program
  must not also take the `libmain.so` that RUI's `build_rui.sh` leaves in RUI's
  `rui` library. `android/build.gradle.kts` empties that library's jniLibs.

- **Desktop JVMs and signals:** build JNI libraries for a desktop JVM (as the
  Robolectric harness is) with `-d:noSignalHandler`. HotSpot uses SIGSEGV
  internally, and Nim's handler would kill it. On Android, ART chains signals,
  so you don't need the flag there.
- **Memory management:** use ORC, Nim 2's default. Under `refc`, threads that
  Java creates need `setupForeignThreadGc`.
- `attic/` holds the 0.x design notes and the previous attempt. The 0.x
  managers never compiled, and 1.0 replaces them.

# Changelog

## 1.1.0

### Added

- **Camera capture.** `camera().takePhoto` takes a JPEG without any camera UI.
  `startFrames`, `latestFrame` and `toRgba` give live frames; only the newest
  frame is kept.
- **Notification interactions.** `notifications().show` can add buttons
  (`actions`) and an inline reply (`reply`). Taps, button presses, replies and
  dismissals arrive as `ekNotification` events.
- **Alarms and jobs.** `alarms()` sets alarms that can show a notification
  when they fire and are set again after a reboot. `jobs()` schedules
  JobScheduler work with network and charging conditions.
- **Foreground service.** `foreground()` keeps the process running with an
  ongoing notification, for music, tracking or uploads.
- **Shares and links.** `incoming()` reports text, files and links that other
  apps share with or open in the app (`ekIncoming`). Shared files are copied
  into the cache.
- **Bluetooth LE.** `bluetooth().startScan` scans with service filters and
  reports each device at most once per interval. `connect`, `read`, `write`,
  `setNotify` and `requestMtu` talk to a device over GATT.
- **NFC.** `nfc().startReading` reads tags in reader mode and decodes their
  NDEF records.
- **Voice.** `recorder()` records the microphone to `.m4a`. `tts()` does text
  to speech, and `recognizer()` does speech to text without a dialog.
- **Secure storage.** `secureStore()` keeps values encrypted with AES-256-GCM,
  using a key held in the Android Keystore.
- **Push messages.** `push()` works with the optional `android/druid-fcm`
  module (Firebase Cloud Messaging): tokens, messages, topics, and taps on the
  notifications Firebase shows.
- **Events while the app is closed.** Events from receivers, jobs and push
  messages are stored when no Nim code is running and delivered at the next
  `pollEvents`.
- **Desktop simulator.** It supports all of the above with Android's rules, and
  has new controls: `tapNotification`, `pressAction`, `reply`,
  `dismissNotification`, `share`, `openLink`, `advanceClock`, `fireAlarm`,
  `runJob`, `addBleDevice`, `addGattCharacteristic`, `notifyGatt`, `tapNfcTag`,
  `setHeard`, `setMicLevel`, `pushMessage` and `openPushNotification`.
- **Conformance.** There are 13 more scenarios, 27 in all, checked on the
  simulator and on Robolectric.
- **App template.** `MainActivity` is `singleTask` and passes `onNewIntent` to
  Druid. The manifest has the intent filters for shares and links and the
  extra permissions, commented out.
- **Maven publishing.** The Android libraries can be published as
  `dev.druid:druid` and `dev.druid:druid-fcm` (`tools/publish_maven.sh`).

### Changed

- The event kinds added in 1.1 carry small objects instead of many prefixed
  fields: `ev.photo`, `ev.frames`, `ev.notification`, `ev.alarm`, `ev.job`,
  `ev.incoming`, `ev.ble`, `ev.foreground`, `ev.recording`, `ev.tts`,
  `ev.speech`, `ev.gatt`, `ev.nfc` and `ev.push`. Kinds that are a fixed set
  are enums, such as `ev.notification.kind == ikTap`. The 1.0 event kinds are
  unchanged.
- The Android library declares `RECEIVE_BOOT_COMPLETED` and
  `FOREGROUND_SERVICE` (both normal permissions), the receivers for
  notifications and alarms, the job service and the foreground service.

## 1.0.0

This version is a rewrite. The Java side is one small class per service; the
Nim side is a JNI core with typed calls and an event queue, and has a desktop
simulator.

- **Services:** permissions, notifications, clipboard, vibration,
  connectivity, power, storage, display, audio, location, sensors, keyboard,
  intents, prefs, crypto, telephony, Bluetooth, NFC, camera facts and torch,
  media playback, biometrics, downloads and memory.
- **RUI integration:** `druid/ruiapp`, an app template, and `tools/new_app.sh`.
- **Tests:** Robolectric tests on Android 7 to 16, a Nim harness run through
  JNI, NDK builds for four ABIs, and on-device checks.

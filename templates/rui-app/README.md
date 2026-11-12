# __APP_NAME__

An Android app written in Nim, using [RUI](https://github.com/kobi2187/rui2)
for the UI and [Druid](https://github.com/kobi2187/druid) for Android's
services.

| | |
|---|---|
| `app.nim` | the app: UI and logic, the same source for the desktop and Android |
| `android/app` | the Android app: `MainActivity` (Kotlin, extends RUI's `RuiActivity`) and the manifest |
| `android/settings.gradle.kts` | brings in RUI's `rui` and Druid's `druid` Android libraries |

```bash
./run_desktop.sh
```

```bash
./build_android.sh
```

```bash
cd android && ./gradlew :app:testDebugUnitTest :app:assembleDebug
```

```bash
cd android && ./gradlew :app:installDebug
```

The first command runs the app on the desktop. The second builds
`libmain.so` with the NDK. The third runs the Robolectric tests and builds the
APK. The last installs it on a device or emulator.

Requirements:
- Nim 2.x with `jnim`, `naylib` (25.x) and `yaml`;
- a JDK;
- the Android SDK (platform 36) and NDK, through `ANDROID_HOME`;
- checkouts of RUI and Druid, set in `android/gradle.properties`.

Add a runtime permission in two places: in `AndroidManifest.xml`, and in the
`permissions().request(...)` call in `app.nim`.

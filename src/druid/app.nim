## This app's package: name, version, install facts; and what the device has.
##
## ```nim
## echo appInfo().label, " ", appInfo().versionName
## if appInfo().hasSystemFeature(featureCamera): ...
## ```

import std/[os]
import bridge

type AppInfo* = object
proc appInfo*(): AppInfo = discard

const
  featureCamera* = "android.hardware.camera.any"
  featureBluetooth* = "android.hardware.bluetooth"
  featureBluetoothLe* = "android.hardware.bluetooth_le"
  featureNfc* = "android.hardware.nfc"
  featureLocationGps* = "android.hardware.location.gps"
  featureTelephony* = "android.hardware.telephony"
  featureTouchscreen* = "android.hardware.touchscreen"
  featureFingerprint* = "android.hardware.fingerprint"
  featureMicrophone* = "android.hardware.microphone"
  featureWifi* = "android.hardware.wifi"
  featureAccelerometer* = "android.hardware.sensor.accelerometer"
  featureGyroscope* = "android.hardware.sensor.gyroscope"

proc packageName*(_: AppInfo): string =
  bridged(getAppFilename().extractFilename): callStatic(string, "AppInfo", "packageName")
proc versionName*(_: AppInfo): string = bridged(""): callStatic(string, "AppInfo", "versionName")
proc versionCode*(_: AppInfo): int64 = bridged(0'i64): callStatic(int64, "AppInfo", "versionCode")
proc label*(_: AppInfo): string =
  ## The app's name as the launcher shows it.
  bridged(getAppFilename().extractFilename): callStatic(string, "AppInfo", "label")
proc targetSdk*(_: AppInfo): int = bridged(0): callStatic(int, "AppInfo", "targetSdk")
proc firstInstallTime*(_: AppInfo): int64 =
  ## Unix ms.
  bridged(0'i64): callStatic(int64, "AppInfo", "firstInstallTime")
proc lastUpdateTime*(_: AppInfo): int64 = bridged(0'i64): callStatic(int64, "AppInfo", "lastUpdateTime")
proc isDebuggable*(_: AppInfo): bool = bridged(not defined(release)): callStatic(bool, "AppInfo", "isDebuggable")
proc hasSystemFeature*(_: AppInfo, feature: string): bool =
  ## PackageManager.hasSystemFeature: "android.hardware.camera.any", ... (the `feature*` constants).
  bridged(false): callStatic(bool, "AppInfo", "hasSystemFeature", feature)
proc isInstalled*(_: AppInfo, packageName: string): bool =
  ## Whether another app is installed (Android 11+ needs it in the manifest's <queries>).
  bridged(false): callStatic(bool, "AppInfo", "isInstalled", packageName)
proc requestedPermissions*(_: AppInfo): seq[string] =
  ## Permissions the manifest declares.
  bridged(newSeq[string]()): callStatic(seq[string], "AppInfo", "requestedPermissions")

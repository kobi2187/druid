## SDK Package Manager - Query app information and installed packages
##
## Uses Android SDK PackageManager API (Java)
##
## Provides access to:
## - App package name, version code, version name
## - Installed packages
## - System features
## - Package capabilities

import ../../../core
import jnim
import options
import strutils

jnimport:
  import android.content.Context
  import android.content.pm.PackageManager as JPM
  import android.content.pm.PackageInfo
  import android.content.pm.ApplicationInfo

type
  SdkPackageManager* = ref object
    context: JObject
    packageManager: JObject
    # Cached values
    packageName: Option[string]
    versionCode: Option[int]
    versionName: Option[string]

proc init*(_: typedesc[SdkPackageManager]): SdkPackageManager =
  ## Initialize SdkPackageManager with Application context
  result = SdkPackageManager()
  result.context = getContext()

  # Get PackageManager from Context
  result.packageManager = result.context.getPackageManager()

proc getPackageName*(pm: SdkPackageManager): string =
  ## Get the app's package name
  ## Example: "com.example.myapp"
  ##
  ## This is cached after first call for performance

  if pm.packageName.isSome:
    return pm.packageName.get()

  let name = pm.context.getPackageName().toStringRaw()
  pm.packageName = some(name)
  return name

proc getVersionCode*(pm: SdkPackageManager): int =
  ## Get the app's version code (integer)
  ## Example: 42
  ##
  ## This is cached after first call

  if pm.versionCode.isSome:
    return pm.versionCode.get()

  let packageName = pm.getPackageName()
  let packageInfo = pm.packageManager.getPackageInfo(packageName.toJString, 0)

  # Use versionCode (deprecated in API 28, but works for all versions)
  let code = packageInfo.versionCode.int
  pm.versionCode = some(code)
  return code

proc getVersionName*(pm: SdkPackageManager): string =
  ## Get the app's version name (string)
  ## Example: "1.0.5"
  ##
  ## This is cached after first call

  if pm.versionName.isSome:
    return pm.versionName.get()

  let packageName = pm.getPackageName()
  let packageInfo = pm.packageManager.getPackageInfo(packageName.toJString, 0)

  let name = packageInfo.versionName.toStringRaw()
  pm.versionName = some(name)
  return name

proc hasSystemFeature*(pm: SdkPackageManager, feature: string): bool =
  ## Check if device has a system feature
  ##
  ## Common features:
  ## - "android.hardware.camera" - Has camera
  ## - "android.hardware.camera.front" - Has front camera
  ## - "android.hardware.location.gps" - Has GPS
  ## - "android.hardware.bluetooth" - Has Bluetooth
  ## - "android.hardware.nfc" - Has NFC
  ## - "android.hardware.sensor.accelerometer" - Has accelerometer
  ##
  ## Returns:
  ##   true if feature is available, false otherwise

  return pm.packageManager.hasSystemFeature(feature.toJString).bool

# Lazy accessor for AndroidRuntime
proc sdkPackageManager*(runtime: AndroidRuntime): SdkPackageManager =
  ## Get or create SdkPackageManager instance
  if runtime.sdkPackageManager.isNone:
    runtime.sdkPackageManager = some(SdkPackageManager.init())
  return runtime.sdkPackageManager.get()

# Convenience global accessor
proc packageManager*(): SdkPackageManager =
  ## Global accessor for SdkPackageManager
  ## Requires AndroidRuntime to be initialized
  return runtime().sdkPackageManager()

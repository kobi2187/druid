## Package Manager - Query app information and installed packages
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
  PackageManager* = ref object
    context: JObject
    packageManager: JObject
    # Cached values
    packageName: Option[string]
    versionCode: Option[int]
    versionName: Option[string]

proc init*(_: typedesc[PackageManager]): PackageManager =
  ## Initialize PackageManager with Application context
  result = PackageManager()
  result.context = getContext()

  # Get PackageManager from Context
  result.packageManager = result.context.getPackageManager()

proc getPackageName*(pm: PackageManager): string =
  ## Get the app's package name
  ## Example: "com.example.myapp"
  ##
  ## This is cached after first call for performance

  if pm.packageName.isSome:
    return pm.packageName.get()

  let name = pm.context.getPackageName().toStringRaw()
  pm.packageName = some(name)
  return name

proc getVersionCode*(pm: PackageManager): int =
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

proc getVersionName*(pm: PackageManager): string =
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

proc hasSystemFeature*(pm: PackageManager, feature: string): bool =
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
proc packageManager*(runtime: AndroidRuntime): PackageManager =
  ## Get or create PackageManager instance
  if runtime.packageManager.isNone:
    runtime.packageManager = some(PackageManager.init())
  return runtime.packageManager.get()

# Convenience global accessor
proc packageManager*(): PackageManager =
  ## Global accessor for PackageManager
  ## Requires AndroidRuntime to be initialized
  return runtime().packageManager()

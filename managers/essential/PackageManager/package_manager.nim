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

# Define Android JNI classes using jclass
jclass android.content.Context of JVMObject:
  proc getPackageName*(): JVMObject
  proc getPackageManager*(): JVMObject

jclass android.content.pm.PackageManager of JVMObject:
  proc getPackageInfo*(packageName: JVMObject, flags: jint): JVMObject
  proc hasSystemFeature*(feature: JVMObject): jboolean

jclass android.content.pm.PackageInfo of JVMObject:
  proc versionCode*: jint {.prop, final.}
  proc versionName*: JVMObject {.prop, final.}

# Type is defined in core.nim as SdkPackageManager
# We just add methods here

proc init*(_: typedesc[SdkPackageManager]): SdkPackageManager =
  ## Initialize SdkPackageManager with Application context
  result = SdkPackageManager()
  let ctx = cast[Context](getContext())
  result.context = cast[pointer](ctx)

  # Get PackageManager from Context
  result.packageManager = cast[pointer](ctx.getPackageManager())

proc getPackageName*(pm: SdkPackageManager): string =
  ## Get the app's package name
  ## Example: "com.example.myapp"
  ##
  ## This is cached after first call for performance

  if pm.packageName.isSome:
    return pm.packageName.get()

  let ctx = cast[Context](pm.context)
  let name = ctx.getPackageName().toStringRaw()
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
  let pkgMgr = cast[PackageManager](pm.packageManager)
  let packageInfo = cast[PackageInfo](pkgMgr.getPackageInfo(newJVMObject(packageName), 0))

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
  let pkgMgr = cast[PackageManager](pm.packageManager)
  let packageInfo = cast[PackageInfo](pkgMgr.getPackageInfo(newJVMObject(packageName), 0))

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

  let pkgMgr = cast[PackageManager](pm.packageManager)
  return pkgMgr.hasSystemFeature(newJVMObject(feature)).bool

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

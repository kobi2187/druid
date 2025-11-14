## Druid - Android wrapper library for Nim
##
## Provides idiomatic Nim APIs for Android services and features.
## Uses jnim for JNI bridging.
##
## Naming Convention:
## - SdkManagerName: SDK (Java) implementations
## - NdkManagerName: NDK (native) implementations (future)
## - ManagerName: Hybrid that auto-selects best (future)
##
## Usage:
##   import druid
##
##   # In your Android Application onCreate():
##   proc initDruid*(ctx: JObject) {.exportc, dynlib.} =
##     discard init(ctx)
##
##   # Then use services:
##   let pkg = packageManager()
##   echo pkg.getPackageName()
##
##   notifications().notify("Hello", "World!")
##   vibration().vibrate(300)
##   clipboard().setText("Copied!")

# Re-export main modules
export core
export common
export art

# Re-export SDK managers

# Essential managers
import managers/essential/PackageManager/package_manager
export package_manager

import managers/essential/PermissionManager/permission_manager
export permission_manager

import managers/essential/PowerManager/power_manager
export power_manager

import managers/essential/StorageManager/storage_manager
export storage_manager

# Feature managers
import managers/features/NotificationManager/notification_manager
export notification_manager

import managers/features/VibrationManager/vibration_manager
export vibration_manager

import managers/features/ClipboardManager/clipboard_manager
export clipboard_manager

import managers/essential/ConnectivityManager/connectivity_manager
export connectivity_manager

import managers/features/LocationManager/location_manager
export location_manager

import managers/features/AudioManager/audio_manager
export audio_manager

import managers/features/DisplayManager/display_manager
export display_manager

import managers/features/DownloadManager/download_manager
export download_manager

import managers/features/InputMethodManager/input_method_manager
export input_method_manager

# Version info
const
  DruidVersionMajor* = 0
  DruidVersionMinor* = 2
  DruidVersionPatch* = 0
  DruidVersion* = $DruidVersionMajor & "." & $DruidVersionMinor & "." & $DruidVersionPatch

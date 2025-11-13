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
import managers/essential/PackageManager/package_manager
export package_manager

import managers/features/NotificationManager/notification_manager
export notification_manager

import managers/features/VibrationManager/vibration_manager
export vibration_manager

import managers/features/ClipboardManager/clipboard_manager
export clipboard_manager

# Version info
const
  DruidVersionMajor* = 0
  DruidVersionMinor* = 1
  DruidVersionPatch* = 0
  DruidVersion* = $DruidVersionMajor & "." & $DruidVersionMinor & "." & $DruidVersionPatch

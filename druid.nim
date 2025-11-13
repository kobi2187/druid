## Druid - Android wrapper library for Nim
##
## Provides idiomatic Nim APIs for Android services and features.
## Uses jnim for JNI bridging.
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

# Re-export main modules
export core
export common
export art

# Re-export managers
import managers/essential/PackageManager/package_manager
export package_manager

import managers/features/NotificationManager/notification_manager
export notification_manager

# Version info
const
  DruidVersionMajor* = 0
  DruidVersionMinor* = 1
  DruidVersionPatch* = 0
  DruidVersion* = $DruidVersionMajor & "." & $DruidVersionMinor & "." & $DruidVersionPatch

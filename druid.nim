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

# System managers
import managers/system/LifecycleManager/lifecycle_manager
export lifecycle_manager

import managers/system/StateManager/state_manager
export state_manager

import managers/system/ResurrectionManager/resurrection_manager
export resurrection_manager

import managers/system/MemoryManager/memory_manager
export memory_manager

import managers/system/ThreadManager/thread_manager
export thread_manager

import managers/system/SchedulerManager/scheduler_manager
export scheduler_manager

import managers/system/BackgroundTaskManager/background_task_manager
export background_task_manager

import managers/system/EventBusManager/event_bus_manager
export event_bus_manager

# Feature managers (Phase 4)
import managers/features/NetworkManager/network_manager
export network_manager

import managers/features/SensorManager/sensor_manager
export sensor_manager

import managers/features/CameraManager/camera_manager
export camera_manager

import managers/features/MediaManager/media_manager
export media_manager

# Version info
const
  DruidVersionMajor* = 0
  DruidVersionMinor* = 2
  DruidVersionPatch* = 0
  DruidVersion* = $DruidVersionMajor & "." & $DruidVersionMinor & "." & $DruidVersionPatch

# Core AndroidRuntime and manager infrastructure
# Uses jnim for JNI bridge

import jnim
import common
import options
import tables

# Forward declarations for SDK-based managers
# Naming convention: SdkManagerName for SDK implementations
# Future: NdkManagerName for NDK implementations (e.g., NdkAudioManager)
type
  SdkPackageManager* = ref object
    context*: pointer  # Will be Context from jclass
    packageManager*: pointer  # Will be PackageManager from jclass
    packageName*: Option[string]
    versionCode*: Option[int]
    versionName*: Option[string]
  SdkNotificationManager* = ref object
  SdkVibrationManager* = ref object
  SdkClipboardManager* = ref object
  SdkConnectivityManager* = ref object
  SdkPowerManager* = ref object
  SdkStorageManager* = ref object
  SdkLocationManager* = ref object
  SdkAudioManager* = ref object
  SdkDisplayManager* = ref object
  SdkDownloadManager* = ref object
  SdkInputMethodManager* = ref object
  SdkPermissionManager* = ref object
  # System managers
  SdkLifecycleManager* = ref object
  SdkStateManager* = ref object
  SdkResurrectionManager* = ref object
  SdkMemoryManager* = ref object
  SdkThreadManager* = ref object
  SdkSchedulerManager* = ref object
  SdkBackgroundTaskManager* = ref object
  SdkEventBusManager* = ref object
  # Feature managers
  SdkNetworkManager* = ref object
  SdkSensorManager* = ref object
  SdkCameraManager* = ref object
  SdkMediaManager* = ref object
  # Extra managers (Phase 5)
  SdkCryptographyManager* = ref object
  SdkFileManager* = ref object
  SdkBiometricManager* = ref object
  SdkBluetoothManager* = ref object
  SdkNfcManager* = ref object
  SdkTelephonyManager* = ref object
  SdkAnalyticsManager* = ref object
  # Future NDK/hybrid managers:
  # AudioManager* = ref object  # Will auto-select NDK or SDK
  # CameraManager* = ref object # Will auto-select NDK or SDK

  AndroidFeature* = enum
    afAudio, afCamera, afLocation, afStorage, afVibration,
    afNotifications, afSensors, afBluetooth, afNFC, afTelephony,
    afNetwork, afDatabase, afCrypto

  AndroidRuntimeState = enum
    Uninitialized
    Initializing
    Initialized
    Shutdown

  AndroidRuntime* = ref object
    state: AndroidRuntimeState
    applicationContext: jobject
    currentActivity: Option[jobject]

    # SDK Manager instances (lazy-initialized)
    sdkPackageManager*: Option[SdkPackageManager]
    sdkNotificationManager*: Option[SdkNotificationManager]
    sdkVibrationManager*: Option[SdkVibrationManager]
    sdkClipboardManager*: Option[SdkClipboardManager]
    sdkConnectivityManager*: Option[SdkConnectivityManager]
    sdkPowerManager*: Option[SdkPowerManager]
    sdkStorageManager*: Option[SdkStorageManager]
    sdkLocationManager*: Option[SdkLocationManager]
    sdkAudioManager*: Option[SdkAudioManager]
    sdkDisplayManager*: Option[SdkDisplayManager]
    sdkDownloadManager*: Option[SdkDownloadManager]
    sdkInputMethodManager*: Option[SdkInputMethodManager]
    sdkPermissionManager*: Option[SdkPermissionManager]
    # System managers
    sdkLifecycleManager*: Option[SdkLifecycleManager]
    sdkStateManager*: Option[SdkStateManager]
    sdkResurrectionManager*: Option[SdkResurrectionManager]
    sdkMemoryManager*: Option[SdkMemoryManager]
    sdkThreadManager*: Option[SdkThreadManager]
    sdkSchedulerManager*: Option[SdkSchedulerManager]
    sdkBackgroundTaskManager*: Option[SdkBackgroundTaskManager]
    sdkEventBusManager*: Option[SdkEventBusManager]
    # Feature managers
    sdkNetworkManager*: Option[SdkNetworkManager]
    sdkSensorManager*: Option[SdkSensorManager]
    sdkCameraManager*: Option[SdkCameraManager]
    sdkMediaManager*: Option[SdkMediaManager]
    # Extra managers
    sdkCryptographyManager*: Option[SdkCryptographyManager]
    sdkFileManager*: Option[SdkFileManager]
    sdkBiometricManager*: Option[SdkBiometricManager]
    sdkBluetoothManager*: Option[SdkBluetoothManager]
    sdkNfcManager*: Option[SdkNfcManager]
    sdkTelephonyManager*: Option[SdkTelephonyManager]
    sdkAnalyticsManager*: Option[SdkAnalyticsManager]

    # Feature tracking
    enabledFeatures: set[AndroidFeature]

# Global singleton
var gRuntime: AndroidRuntime = nil

# Note: jnimport removed - JNI imports handled per-manager
# jnimport:
#   import android.content.Context
#   import android.app.Application

proc isInitialized*(): bool =
  ## Check if AndroidRuntime is initialized
  return gRuntime != nil and gRuntime.state == Initialized

proc runtime*(): AndroidRuntime =
  ## Get the global AndroidRuntime instance
  ## Raises RuntimeError if not initialized
  if gRuntime == nil or gRuntime.state != Initialized:
    raise newException(ValueError,
      "AndroidRuntime not initialized. Call init() first from your Android Application.")
  return gRuntime

proc init*(context: jobject): AndroidRuntime =
  ## Initialize AndroidRuntime with Android Application context
  ##
  ## This should be called from your Android Application's onCreate()
  ##
  ## Args:
  ##   context: Android Application or Activity context (jobject)
  ##
  ## Returns:
  ##   The initialized AndroidRuntime singleton

  # Return existing if already initialized
  if gRuntime != nil and gRuntime.state == Initialized:
    return gRuntime

  if gRuntime != nil and gRuntime.state == Initializing:
    raise newException(ValueError, "AndroidRuntime.init() called recursively")

  # Create new runtime
  gRuntime = AndroidRuntime(
    state: Initializing,
    enabledFeatures: {}
  )

  # Store context (jnim handles reference management)
  gRuntime.applicationContext = context
  gRuntime.state = Initialized

  return gRuntime

proc getContext*(): jobject =
  ## Get the Application context
  ## Always returns Application context (safe to cache, long-lived)
  return runtime().applicationContext

proc getActivity*(): Option[jobject] =
  ## Get the current Activity context
  ## Returns None if no Activity is set
  return runtime().currentActivity

proc setCurrentActivity*(activity: jobject) =
  ## Update the current Activity reference
  ## Should be called from Activity.onCreate()
  runtime().currentActivity = some(activity)

proc clearCurrentActivity*() =
  ## Clear the current Activity reference
  ## Should be called from Activity.onDestroy()
  runtime().currentActivity = none(jobject)

proc shutdown*() =
  ## Shutdown the runtime and cleanup resources
  ## Should be called from Application.onTerminate()
  if gRuntime == nil or gRuntime.state != Initialized:
    return

  gRuntime.state = Shutdown

  # Cleanup managers (if implemented)
  # TODO: Call shutdown on each manager

  gRuntime = nil


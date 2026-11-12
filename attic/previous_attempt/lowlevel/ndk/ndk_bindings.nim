# app/src/main/nim/lowlevel/ndk_bindings.nim
# FFI bindings for Android NDK C APIs
# Target Min API Level: 24, with support for newer APIs where available.
# User must check API level at runtime before calling newer functions.

# --- NDK Libraries to Link ---
{.passL: "-llog".}         # Android Logging
{.passL: "-landroid".}     # Core Android NDK (AAssetManager, ANativeWindow, ASensorManager, ALooper, etc.)
{.passL: "-lcamera2ndk".}  # Native Camera2 API (ACameraManager, etc.) - API 24+
{.passL: "-lmediandk".}    # Native Media APIs (AMediaCodec, AMediaExtractor, etc.) - API 21+
{.passL: "-laaudio".}      # AAudio high-performance audio - API 26+
{.passL: "-lOpenSLES".}    # OpenSL ES audio
{.passL: "-lEGL".}         # EGL for graphics surface management
{.passL: "-lGLESv2".}      # OpenGL ES 2.0 (use GLESv1_CM, GLESv3 for others)
# {.passL: "-lGLESv3".}      # OpenGL ES 3.x
{.passL: "-lvulkan".}      # Vulkan graphics API
# For Neural Networks API (NNAPI): {.passL: "-libneuralnetworks".} - API 27+

import jnim # For JNIEnv, jobject types when NDK APIs bridge with JNI

#------------------------------------------------------------------------------
# Android Logging <android/log.h>
#------------------------------------------------------------------------------
type
  android_LogPriority* = enum
    ANDROID_LOG_UNKNOWN = 0
    ANDROID_LOG_DEFAULT    # only for SetMinPriority()
    ANDROID_LOG_VERBOSE
    ANDROID_LOG_DEBUG
    ANDROID_LOG_INFO
    ANDROID_LOG_WARN
    ANDROID_LOG_ERROR
    ANDROID_LOG_FATAL
    ANDROID_LOG_SILENT     # only for SetMinPriority(); must be last

proc android_log_write*(prio: cint, tag: cstring, text: cstring): cint {.
  importc: "__android_log_write", header: "<android/log.h>", dynlib: "liblog.so".}
proc android_log_print*(prio: cint, tag: cstring, fmt: cstring): cint {.
  varargs, importc: "__android_log_print", header: "<android/log.h>", dynlib: "liblog.so".}
proc android_log_vprint*(prio: cint, tag: cstring, fmt: cstring, ap: pointer): cint {. # va_list
  importc: "__android_log_vprint", header: "<android/log.h>", dynlib: "liblog.so".}
# android_set_log_tag_prefix, android_log_assert also exist.

#------------------------------------------------------------------------------
# Android Looper <android/looper.h>
# Used for event loops, sensor events, input events, NativeActivity.
#------------------------------------------------------------------------------
type
  ALooper* {.importc: "ALooper", header: "<android/looper.h>".} = distinct pointer
  ALooper_callbackFunc* = proc(fd: cint, events: cint, data: pointer): cint {.cdecl.} # Returns 1 to continue, 0 to stop.

const
  ALOOPER_PREPARE_ALLOW_NON_CALLBACKS* = 1 shl 0
  ALOOPER_POLL_WAKE* = -1; ALOOPER_POLL_CALLBACK* = -2
  ALOOPER_POLL_TIMEOUT* = -3; ALOOPER_POLL_ERROR* = -4
  ALOOPER_EVENT_INPUT* = 1 shl 0; ALOOPER_EVENT_OUTPUT* = 1 shl 1
  ALOOPER_EVENT_ERROR* = 1 shl 2; ALOOPER_EVENT_HANGUP* = 1 shl 3
  ALOOPER_EVENT_INVALID* = 1 shl 4

proc ALooper_forThread*(): ptr ALooper {. # API 26+
  importc: "ALooper_forThread", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_prepare*(opts: cint): ptr ALooper {.
  importc: "ALooper_prepare", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_acquire*(looper: ptr ALooper) {.
  importc: "ALooper_acquire", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_release*(looper: ptr ALooper) {.
  importc: "ALooper_release", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_pollAll*(timeoutMillis: cint, outFd: ptr cint, outEvents: ptr cint, outData: var pointer): cint {.
  importc: "ALooper_pollAll", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_pollOnce*(timeoutMillis: cint, outFd: ptr cint, outEvents: ptr cint, outData: var pointer): cint {. # API 23+
  importc: "ALooper_pollOnce", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_wake*(looper: ptr ALooper) {.
  importc: "ALooper_wake", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_addFd*(looper: ptr ALooper, fd: cint, ident: cint, events: cint, callback: ALooper_callbackFunc, data: pointer): cint {.
  importc: "ALooper_addFd", header: "<android/looper.h>", dynlib: "libandroid.so".}
proc ALooper_removeFd*(looper: ptr ALooper, fd: cint): cint {.
  importc: "ALooper_removeFd", header: "<android/looper.h>", dynlib: "libandroid.so".}

#------------------------------------------------------------------------------
# Android Asset Manager <android/asset_manager.h> & <android/asset_manager_jni.h>
#------------------------------------------------------------------------------
type
  AAssetManager* {.importc: "AAssetManager", header: "<android/asset_manager.h>".} = distinct pointer
  AAsset* {.importc: "AAsset", header: "<android/asset_manager.h>".} = distinct pointer
  AAssetDir* {.importc: "AAssetDir", header: "<android/asset_manager.h>".} = distinct pointer

const
  AASSET_MODE_UNKNOWN* = 0; AASSET_MODE_RANDOM* = 1
  AASSET_MODE_STREAMING* = 2; AASSET_MODE_BUFFER* = 3

proc AAssetManager_fromJava*(env: JNIEnv, assetManager: jobject): ptr AAssetManager {.
  importc: "AAssetManager_fromJava", header: "<android/asset_manager_jni.h>", dynlib: "libandroid.so".}
proc AAssetManager_openDir*(mgr: ptr AAssetManager, dirName: cstring): ptr AAssetDir {.
  importc: "AAssetManager_openDir", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAssetManager_open*(mgr: ptr AAssetManager, filename: cstring, mode: cint): ptr AAsset {.
  importc: "AAssetManager_open", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}

proc AAssetDir_getNextFileName*(assetDir: ptr AAssetDir): cstring {.
  importc: "AAssetDir_getNextFileName", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAssetDir_rewind*(assetDir: ptr AAssetDir) {.
  importc: "AAssetDir_rewind", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAssetDir_close*(assetDir: ptr AAssetDir) {.
  importc: "AAssetDir_close", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}

proc AAsset_read*(asset: ptr AAsset, buf: pointer, count: csize): cint {.
  importc: "AAsset_read", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_seek*(asset: ptr AAsset, offset: int32, whence: cint): int32 {. # off_t, use AAsset_seek64 for large files
  importc: "AAsset_seek", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_seek64*(asset: ptr AAsset, offset: int64, whence: cint): int64 {.
  importc: "AAsset_seek64", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_close*(asset: ptr AAsset) {.
  importc: "AAsset_close", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_getBuffer*(asset: ptr AAsset): pointer {.
  importc: "AAsset_getBuffer", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_getLength*(asset: ptr AAsset): int32 {. # off_t
  importc: "AAsset_getLength", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_getLength64*(asset: ptr AAsset): int64 {.
  importc: "AAsset_getLength64", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_getRemainingLength*(asset: ptr AAsset): int32 {. # off_t
  importc: "AAsset_getRemainingLength", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_getRemainingLength64*(asset: ptr AAsset): int64 {.
  importc: "AAsset_getRemainingLength64", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_openFileDescriptor*(asset: ptr AAsset, outStart: ptr int32, outLength: ptr int32): cint {. # off_t
  importc: "AAsset_openFileDescriptor", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_openFileDescriptor64*(asset: ptr AAsset, outStart: ptr int64, outLength: ptr int64): cint {.
  importc: "AAsset_openFileDescriptor64", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}
proc AAsset_isAllocated*(asset: ptr AAsset): cint {.
  importc: "AAsset_isAllocated", header: "<android/asset_manager.h>", dynlib: "libandroid.so".}

#------------------------------------------------------------------------------
# Android Native Window <android/native_window.h> & <android/native_window_jni.h>
# Used for direct rendering to a surface (e.g. from Java Surface object).
#------------------------------------------------------------------------------
type
  ANativeWindow* {.importc: "ANativeWindow", header: "<android/native_window.h>".} = distinct pointer
  ARect* {.importc: "ARect", header: "<android/rect.h>".} = object # From <android/rect.h>
    left*: int32;
    top*: int32;
    right*: int32; 
    bottom*: int32
  ANativeWindow_Buffer* {.importc: "ANativeWindow_Buffer", header: "<android/native_window.h>".} = object
    width*: int32; height*: int32; stride*: int32; format*: int32
    bits*: pointer
    reserved*: array[6, uint32] # Must match C struct layout

const # ANativeWindow_LegacyFormat, see NDK headers or graphics.h for complete list
  WINDOW_FORMAT_RGBA_8888* = 1; WINDOW_FORMAT_RGBX_8888* = 2
  WINDOW_FORMAT_RGB_565*   = 4
  # For ANativeWindow_setBuffersTransform (API 26+)
  ANATIVEWINDOW_TRANSFORM_IDENTITY* = 0x00
  ANATIVEWINDOW_TRANSFORM_FLIP_H*   = 0x01 # HAL_TRANSFORM_FLIP_H
  ANATIVEWINDOW_TRANSFORM_FLIP_V*   = 0x02 # HAL_TRANSFORM_FLIP_V
  ANATIVEWINDOW_TRANSFORM_ROT_90*   = 0x04 # HAL_TRANSFORM_ROT_90
  # ... more transform flags

proc ANativeWindow_fromSurface*(env: JNIEnv, surface: jobject): ptr ANativeWindow {.
  importc: "ANativeWindow_fromSurface", header: "<android/native_window_jni.h>", dynlib: "libandroid.so".}
proc ANativeWindow_acquire*(window: ptr ANativeWindow) {.
  importc: "ANativeWindow_acquire", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_release*(window: ptr ANativeWindow) {.
  importc: "ANativeWindow_release", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_getWidth*(window: ptr ANativeWindow): int32 {.
  importc: "ANativeWindow_getWidth", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_getHeight*(window: ptr ANativeWindow): int32 {.
  importc: "ANativeWindow_getHeight", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_getFormat*(window: ptr ANativeWindow): int32 {.
  importc: "ANativeWindow_getFormat", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_setBuffersGeometry*(window: ptr ANativeWindow, width: int32, height: int32, format: int32): cint {.
  importc: "ANativeWindow_setBuffersGeometry", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_lock*(window: ptr ANativeWindow, outBuffer: ptr ANativeWindow_Buffer, inOutDirtyBounds: ptr ARect): cint {.
  importc: "ANativeWindow_lock", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_unlockAndPost*(window: ptr ANativeWindow): cint {.
  importc: "ANativeWindow_unlockAndPost", header: "<android/native_window.h>", dynlib: "libandroid.so".}
proc ANativeWindow_setBuffersTransform*(window: ptr ANativeWindow, transform: cint): cint {. # API 26+
  importc: "ANativeWindow_setBuffersTransform", header: "<android/native_window.h>", dynlib: "libandroid.so".}
# ANativeWindow_setBuffersDataSpace, ANativeWindow_getBuffersDataSpace (API 28+)
# ANativeWindow_setBuffersUsage, ANativeWindow_setBuffersUsage64 (API 26+)
# ANativeWindow_setFrameRate (API 30+)

#------------------------------------------------------------------------------
# Android Sensor Manager <android/sensor.h>
#------------------------------------------------------------------------------
type
  ASensorManager* {.importc: "ASensorManager", header: "<android/sensor.h>".} = distinct pointer
  ASensor* {.importc: "ASensor", header: "<android/sensor.h>".} = distinct pointer # This is `const ASensor*` in C
  ASensorEventQueue* {.importc: "ASensorEventQueue", header: "<android/sensor.h>".} = distinct pointer

  # Simplified ASensorEvent, focusing on common vector data.
  # Real C struct uses a union for different data types.
  ASensorVector* {.importc: "ASensorVector", header: "<android/sensor.h>".} = object
    x*: cfloat; y*: cfloat; z*: cfloat; w*: cfloat # w for rotation_vector, quaternion
    status*: cint # accuracy
  ASensorEvent* {.importc: "ASensorEvent", header: "<android/sensor.h>".} = object
    version*: cint; sensor*: cint; typeKind*: cint; reserved0*: cint # typeKind for sensor_t.type
    timestamp*: int64
    # The `data` field is a union in C. Access via appropriate member or cast.
    # E.g., for vector data:
    vector*: ASensorVector # Or use data: array[16, cfloat] and access by index
    # Other union members: magnetic, orientation, gyro, pressure, temperature, etc.
    # This requires careful handling based on event.typeKind
    # For direct access to the float array:
    data_values*: array[16, cfloat]

const # Sensor types (ASENSOR_TYPE_...) from <android/sensor.h>
  ASENSOR_TYPE_ACCELEROMETER* = 1; ASENSOR_TYPE_MAGNETIC_FIELD* = 2
  ASENSOR_TYPE_ORIENTATION* = 3; ASENSOR_TYPE_GYROSCOPE* = 4
  ASENSOR_TYPE_LIGHT* = 5; ASENSOR_TYPE_PRESSURE* = 6
  ASENSOR_TYPE_TEMPERATURE* = 7; ASENSOR_TYPE_PROXIMITY* = 8 # Deprecated in favor of AMBIENT_TEMPERATURE
  ASENSOR_TYPE_GRAVITY* = 9; ASENSOR_TYPE_LINEAR_ACCELERATION* = 10
  ASENSOR_TYPE_ROTATION_VECTOR* = 11; ASENSOR_TYPE_RELATIVE_HUMIDITY* = 12
  ASENSOR_TYPE_AMBIENT_TEMPERATURE* = 13; ASENSOR_TYPE_MAGNETIC_FIELD_UNCALIBRATED* = 14
  ASENSOR_TYPE_GAME_ROTATION_VECTOR* = 15; ASENSOR_TYPE_GYROSCOPE_UNCALIBRATED* = 16
  ASENSOR_TYPE_SIGNIFICANT_MOTION* = 17; ASENSOR_TYPE_STEP_DETECTOR* = 18
  ASENSOR_TYPE_STEP_COUNTER* = 19; ASENSOR_TYPE_GEOMAGNETIC_ROTATION_VECTOR* = 20
  ASENSOR_TYPE_HEART_RATE* = 21 # Needs BODY_SENSORS permission
  ASENSOR_TYPE_ACCELEROMETER_UNCALIBRATED* = 35 # API 26+
  # ... and more including dynamic sensors.

const # Sensor accuracy
  ASENSOR_STATUS_NO_CONTACT* = -1; ASENSOR_STATUS_UNRELIABLE* = 0
  ASENSOR_STATUS_ACCURACY_LOW* = 1; ASENSOR_STATUS_ACCURACY_MEDIUM* = 2
  ASENSOR_STATUS_ACCURACY_HIGH* = 3

proc ASensorManager_getInstance*(): ptr ASensorManager {. # Deprecated in API 26
  importc: "ASensorManager_getInstance", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_getInstanceForPackage*(packageName: cstring): ptr ASensorManager {. # API 26+
  importc: "ASensorManager_getInstanceForPackage", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_create*(): ptr ASensorManager {. # API 31+
  importc: "ASensorManager_create", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_destroy*(manager: ptr ASensorManager) {. # API 31+
  importc: "ASensorManager_destroy", header: "<android/sensor.h>", dynlib: "libandroid.so".}

proc ASensorManager_getSensorList*(manager: ptr ASensorManager, list: var ptr ptr ASensor): cint {. # Returns count
  importc: "ASensorManager_getSensorList", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_getDefaultSensor*(manager: ptr ASensorManager, typeSensor: cint): ptr ASensor {.
  importc: "ASensorManager_getDefaultSensor", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_getDefaultSensorEx*(manager: ptr ASensorManager, typeSensor: cint, wakeUp: bool): ptr ASensor {. # API 21+
  importc: "ASensorManager_getDefaultSensorEx", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_createEventQueue*(manager: ptr ASensorManager, looper: ptr ALooper, ident: cint, callback: ALooper_callbackFunc, data: pointer): ptr ASensorEventQueue {.
  importc: "ASensorManager_createEventQueue", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorManager_destroyEventQueue*(manager: ptr ASensorManager, queue: ptr ASensorEventQueue): cint {.
  importc: "ASensorManager_destroyEventQueue", header: "<android/sensor.h>", dynlib: "libandroid.so".}

proc ASensorEventQueue_enableSensor*(queue: ptr ASensorEventQueue, sensor: ptr ASensor): cint {.
  importc: "ASensorEventQueue_enableSensor", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorEventQueue_disableSensor*(queue: ptr ASensorEventQueue, sensor: ptr ASensor): cint {.
  importc: "ASensorEventQueue_disableSensor", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorEventQueue_setEventRate*(queue: ptr ASensorEventQueue, sensor: ptr ASensor, usec: int32): cint {.
  importc: "ASensorEventQueue_setEventRate", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorEventQueue_hasEvents*(queue: ptr ASensorEventQueue): cint {. # API 26+
  importc: "ASensorEventQueue_hasEvents", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensorEventQueue_getEvents*(queue: ptr ASensorEventQueue, events: ptr ASensorEvent, count: csize): cint {.
  importc: "ASensorEventQueue_getEvents", header: "<android/sensor.h>", dynlib: "libandroid.so".}

proc ASensor_getName*(sensor: ptr ASensor): cstring {.
  importc: "ASensor_getName", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getVendor*(sensor: ptr ASensor): cstring {.
  importc: "ASensor_getVendor", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getType*(sensor: ptr ASensor): cint {.
  importc: "ASensor_getType", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getResolution*(sensor: ptr ASensor): cfloat {.
  importc: "ASensor_getResolution", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getMinDelay*(sensor: ptr ASensor): cint {.
  importc: "ASensor_getMinDelay", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getFifoMaxEventCount*(sensor: ptr ASensor): cint {. # API 19+
  importc: "ASensor_getFifoMaxEventCount", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getFifoReservedEventCount*(sensor: ptr ASensor): cint {. # API 19+
  importc: "ASensor_getFifoReservedEventCount", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getStringType*(sensor: ptr ASensor): cstring {. # API 21+
  importc: "ASensor_getStringType", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getReportingMode*(sensor: ptr ASensor): cint {. # API 21+ ASENSOR_REPORTING_MODE_...
  importc: "ASensor_getReportingMode", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_isWakeUpSensor*(sensor: ptr ASensor): bool {. # API 21+
  importc: "ASensor_isWakeUpSensor", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getHandle*(sensor: ptr ASensor): cint {. # API 26+
  importc: "ASensor_getHandle", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_isDirectChannelTypeSupported*(sensor: ptr ASensor, channelType: cint): bool {. # API 26+
  importc: "ASensor_isDirectChannelTypeSupported", header: "<android/sensor.h>", dynlib: "libandroid.so".}
proc ASensor_getHighestDirectReportRateLevel*(sensor: ptr ASensor): cint {. # API 26+
  importc: "ASensor_getHighestDirectReportRateLevel", header: "<android/sensor.h>", dynlib: "libandroid.so".}

#------------------------------------------------------------------------------
# Android Native Camera2 <camera/NdkCameraManager.h> etc. (API 24+)
# This is a very large API. Only a subset is shown.
#------------------------------------------------------------------------------
type # Forward declare complex listener structs
  ACameraDevice_stateCallbacks* {.importc:"ACameraDevice_stateCallbacks", header:"<camera/NdkCameraDevice.h>".} = object # callbacks defined below
  ACameraCaptureSession_stateCallbacks* {.importc:"ACameraCaptureSession_stateCallbacks", header:"<camera/NdkCameraCaptureSession.h>".} = object
  ACameraCaptureSession_captureCallbacks* {.importc:"ACameraCaptureSession_captureCallbacks", header:"<camera/NdkCameraCaptureSession.h>".} = object

type # Opaque types
  ACameraManager* {.importc: "ACameraManager", header: "<camera/NdkCameraManager.h>".} = distinct pointer
  ACameraDevice* {.importc: "ACameraDevice", header: "<camera/NdkCameraDevice.h>".} = distinct pointer
  ACameraMetadata* {.importc: "ACameraMetadata", header: "<camera/NdkCameraMetadata.h>".} = distinct pointer
  ACaptureRequest* {.importc: "ACaptureRequest", header: "<camera/NdkCaptureRequest.h>".} = distinct pointer
  ACameraOutputTarget* {.importc: "ACameraOutputTarget", header: "<camera/NdkCameraDevice.h>".} = distinct pointer # For NdkCameraDevice.h
  ACaptureSessionOutput* {.importc: "ACaptureSessionOutput", header: "<camera/NdkCaptureSessionOutput.h>".} = distinct pointer
  ACaptureSessionOutputContainer* {.importc: "ACaptureSessionOutputContainer", header: "<camera/NdkCaptureSessionOutput.h>".} = distinct pointer
  ACameraCaptureSession* {.importc: "ACameraCaptureSession", header: "<camera/NdkCameraCaptureSession.h>".} = distinct pointer
  AImageReader* {.importc: "AImageReader", header: "<media/NdkImageReader.h>".} = distinct pointer # From media/NdkImageReader.h
  AImage* {.importc: "AImage", header: "<media/NdkImage.h>".} = distinct pointer # From media/NdkImage.h

type # Structs
  ACameraIdList* {.importc: "ACameraIdList", header: "<camera/NdkCameraManager.h>".} = object
    numCameras*: cint; cameraIds**: ptr cstring # array of cstrings

  # Callbacks for ACameraDevice
  ACameraDevice_StateCallback_onDisconnected* = proc(context: pointer, device: ptr ACameraDevice) {.cdecl.}
  ACameraDevice_StateCallback_onError* = proc(context: pointer, device: ptr ACameraDevice, error: cint) {.cdecl.} # error is camera_status_t
  ACameraDevice_stateCallbacks.fields: # Define fields for previously forward-declared object
    context*: pointer
    onDisconnected*: ACameraDevice_StateCallback_onDisconnected
    onError*: ACameraDevice_StateCallback_onError
    # API 28+ add onOpened, onClosed (not shown for brevity)

  # Callbacks for ACameraCaptureSession (state)
  ACameraCaptureSession_StateCallback_onReady* = proc(context: pointer, session: ptr ACameraCaptureSession) {.cdecl.}
  ACameraCaptureSession_StateCallback_onActive* = proc(context: pointer, session: ptr ACameraCaptureSession) {.cdecl.} # API 23+ (via Java), NDK from 24
  ACameraCaptureSession_StateCallback_onClosed* = proc(context: pointer, session: ptr ACameraCaptureSession) {.cdecl.} # API 28+
  ACameraCaptureSession_stateCallbacks.fields:
    context*: pointer
    onReady*: ACameraCaptureSession_StateCallback_onReady
    onActive*: ACameraCaptureSession_StateCallback_onActive
    # onClosed, onConfigured, onConfigureFailed, etc.

  # Callbacks for ACameraCaptureSession (capture progress, result)
  # ... This is extensive with many callbacks like onCaptureStarted, onCaptureProgressed, onCaptureCompleted etc.

const # camera_status_t enum from <camera/NdkCameraError.h>
  ACAMERA_OK* = 0; ACAMERA_ERROR_UNKNOWN* = -1 # Should be int, not cint for error codes
  ACAMERA_ERROR_INVALID_PARAMETER* = -2; ACAMERA_ERROR_CAMERA_DISABLED* = -3
  ACAMERA_ERROR_CAMERA_DISCONNECTED* = -6; ACAMERA_ERROR_CAMERA_IN_USE* = -7
  # ... many more error codes.

proc ACameraManager_create*(): ptr ACameraManager {.
  importc: "ACameraManager_create", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
proc ACameraManager_delete*(manager: ptr ACameraManager) {.
  importc: "ACameraManager_delete", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
proc ACameraManager_getCameraIdList*(manager: ptr ACameraManager, idList: var ptr ACameraIdList): cint {. # camera_status_t
  importc: "ACameraManager_getCameraIdList", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
proc ACameraManager_deleteCameraIdList*(idList: ptr ACameraIdList) {.
  importc: "ACameraManager_deleteCameraIdList", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
proc ACameraManager_getCameraCharacteristics*(manager: ptr ACameraManager, cameraId: cstring, characteristics: var ptr ACameraMetadata): cint {.
  importc: "ACameraManager_getCameraCharacteristics", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
proc ACameraManager_openCamera*(manager: ptr ACameraManager, cameraId: cstring, callback: ptr ACameraDevice_stateCallbacks, device: var ptr ACameraDevice): cint {.
  importc: "ACameraManager_openCamera", header: "<camera/NdkCameraManager.h>", dynlib: "libcamera2ndk.so".}
# ... ACameraManager_registerAvailabilityCallback, etc.

proc ACameraDevice_getId*(device: ptr ACameraDevice): cstring {.
  importc: "ACameraDevice_getId", header: "<camera/NdkCameraDevice.h>", dynlib: "libcamera2ndk.so".}
proc ACameraDevice_createCaptureRequest*(device: ptr ACameraDevice, templateId: cint, request: var ptr ACaptureRequest): cint {. # templateId from ACameraDevice_request_template
  importc: "ACameraDevice_createCaptureRequest", header: "<camera/NdkCameraDevice.h>", dynlib: "libcamera2ndk.so".}
proc ACameraDevice_close*(device: ptr ACameraDevice): cint {.
  importc: "ACameraDevice_close", header: "<camera/NdkCameraDevice.h>", dynlib: "libcamera2ndk.so".}
proc ACameraDevice_createCaptureSession*(device: ptr ACameraDevice, outputs: ptr ACaptureSessionOutputContainer, callbacks: ptr ACameraCaptureSession_stateCallbacks, session: var ptr ACameraCaptureSession): cint {.
  importc: "ACameraDevice_createCaptureSession", header: "<camera/NdkCameraDevice.h>", dynlib: "libcamera2ndk.so".}
# ... Many ACameraMetadata_ (get/add entry), ACaptureRequest_ (add target, get/set metadata), ACameraOutputTarget_ (create) etc.

#------------------------------------------------------------------------------
# Android Native Media <media/NdkMediaCodec.h>, <media/NdkMediaFormat.h> etc (API 21+)
#------------------------------------------------------------------------------
type
  AMediaCodec* {.importc: "AMediaCodec", header: "<media/NdkMediaCodec.h>".} = distinct pointer
  AMediaExtractor* {.importc: "AMediaExtractor", header: "<media/NdkMediaExtractor.h>".} = distinct pointer
  AMediaFormat* {.importc: "AMediaFormat", header: "<media/NdkMediaFormat.h>".} = distinct pointer
  AMediaCrypto* {.importc: "AMediaCrypto", header: "<media/NdkMediaCrypto.h>".} = distinct pointer # For DRM
  AMediaCodecBufferInfo* {.importc: "AMediaCodecBufferInfo", header: "<media/NdkMediaCodec.h>".} = object
    offset*: cint; size*: cint; presentationTimeUs*: int64; flags*: uint32

  # Callbacks for AMediaCodec (API 23+)
  AMediaCodecOnAsyncNotifyCallback* = proc(codec: ptr AMediaCodec, userdata: pointer, info: ptr AMediaCodecBufferInfo) {.cdecl.} # For output
  AMediaCodecOnAsyncInputAvailable* = proc(codec: ptr AMediaCodec, userdata: pointer, index: cint) {.cdecl.}
  AMediaCodecOnAsyncFormatChanged* = proc(codec: ptr AMediaCodec, userdata: pointer, format: ptr AMediaFormat) {.cdecl.}
  AMediaCodecOnAsyncError* = proc(codec: ptr AMediaCodec, userdata: pointer, error: cint, actionCode: cint) {.cdecl.} # media_status_t, action code

  AMediaCodecCryptoInfo* {.importc: "AMediaCodecCryptoInfo", header: "<media/NdkMediaCrypto.h>".} = distinct pointer # API 21+
  # ... and associated functions for crypto info.

const # media_status_t enum from <media/NdkMediaError.h>
  AMEDIA_OK* = 0
  AMEDIA_ERROR_BASE* = -10000; AMEDIA_ERROR_UNKNOWN* = AMEDIA_ERROR_BASE
  AMEDIA_ERROR_MALFORMED* = AMEDIA_ERROR_BASE - 1; AMEDIA_ERROR_UNSUPPORTED* = AMEDIA_ERROR_BASE - 2
  AMEDIA_ERROR_INVALID_OBJECT* = AMEDIA_ERROR_BASE - 3; AMEDIA_ERROR_INVALID_PARAMETER* = AMEDIA_ERROR_BASE - 4
  AMEDIA_ERROR_INVALID_OPERATION* = AMEDIA_ERROR_BASE - 5 # API 28+
  AMEDIA_ERROR_END_OF_STREAM* = AMEDIA_ERROR_BASE - 6 # API 28+
  AMEDIA_ERROR_IO* = AMEDIA_ERROR_BASE - 7 # API 28+
  AMEDIA_ERROR_WOULD_BLOCK* = AMEDIA_ERROR_BASE - 8 # API 28+
  AMEDIA_DRM_ERROR_BASE* = -20000 # ... and DRM errors
  AMEDIACODEC_ERROR_INSUFFICIENT_RESOURCE* = 1100; AMEDIACODEC_ERROR_RECLAIMED* = 1101 # Specific to AMediaCodec
  AMEDIACODEC_INFO_OUTPUT_BUFFERS_CHANGED* = -2 # Special value for dequeueOutputBuffer, Java: INFO_OUTPUT_BUFFERS_CHANGED
  AMEDIACODEC_INFO_OUTPUT_FORMAT_CHANGED* = -3  # Java: INFO_OUTPUT_FORMAT_CHANGED
  AMEDIACODEC_INFO_TRY_AGAIN_LATER* = -1        # Java: INFO_TRY_AGAIN_LATER
  # Buffer flags (AMEDIACODEC_BUFFER_FLAG_...)
  AMEDIACODEC_BUFFER_FLAG_KEY_FRAME* = 1 # Also known as SYNC_FRAME
  AMEDIACODEC_BUFFER_FLAG_CODEC_CONFIG* = 2
  AMEDIACODEC_BUFFER_FLAG_END_OF_STREAM* = 4
  AMEDIACODEC_BUFFER_FLAG_PARTIAL_FRAME* = 8 # API 26+

# AMediaCodec functions (subset)
proc AMediaCodec_createDecoderByType*(mimeType: cstring): ptr AMediaCodec {.
  importc: "AMediaCodec_createDecoderByType", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_createEncoderByType*(mimeType: cstring): ptr AMediaCodec {.
  importc: "AMediaCodec_createEncoderByType", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_createCodecByName*(name: cstring): ptr AMediaCodec {.
  importc: "AMediaCodec_createCodecByName", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_delete*(codec: ptr AMediaCodec): cint {. # media_status_t
  importc: "AMediaCodec_delete", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_configure*(codec: ptr AMediaCodec, format: ptr AMediaFormat, surface: ptr ANativeWindow, crypto: ptr AMediaCrypto, flags: uint32): cint {.
  importc: "AMediaCodec_configure", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_start*(codec: ptr AMediaCodec): cint {.
  importc: "AMediaCodec_start", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_stop*(codec: ptr AMediaCodec): cint {.
  importc: "AMediaCodec_stop", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_flush*(codec: ptr AMediaCodec): cint {.
  importc: "AMediaCodec_flush", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getInputBuffer*(codec: ptr AMediaCodec, idx: csize, out_size: var csize): ptr uint8 {. # API 21-28
  deprecated: "Use AMediaCodec_getBufferAddress for API 29+",
  importc: "AMediaCodec_getInputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getOutputBuffer*(codec: ptr AMediaCodec, idx: csize, out_size: var csize): ptr uint8 {. # API 21-28
  deprecated: "Use AMediaCodec_getBufferAddress for API 29+",
  importc: "AMediaCodec_getOutputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getBufferAddress*(codec: ptr AMediaCodec, idx: csize, isInput: bool, out_addr: var pointer, out_size: var csize): cint {. # API 29+
  importc: "AMediaCodec_getBufferAddress", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_dequeueInputBuffer*(codec: ptr AMediaCodec, timeoutUs: int64): int {. # ssize_t (index or error)
  importc: "AMediaCodec_dequeueInputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_queueInputBuffer*(codec: ptr AMediaCodec, idx: csize, offset: csize, size: csize, time: uint64, flags: uint32): cint {.
  importc: "AMediaCodec_queueInputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_queueSecureInputBuffer*(codec: ptr AMediaCodec, idx: csize, offset: csize, cryptoInfo: ptr AMediaCodecCryptoInfo, time: uint64, flags: uint32): cint {.
  importc: "AMediaCodec_queueSecureInputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_dequeueOutputBuffer*(codec: ptr AMediaCodec, info: var AMediaCodecBufferInfo, timeoutUs: int64): int {. # ssize_t
  importc: "AMediaCodec_dequeueOutputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getOutputFormat*(codec: ptr AMediaCodec): ptr AMediaFormat {.
  importc: "AMediaCodec_getOutputFormat", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getOutputFormatForIndex*(codec: ptr AMediaCodec, index: csize): ptr AMediaFormat {. # API 29+
  importc: "AMediaCodec_getOutputFormatForIndex", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_releaseOutputBuffer*(codec: ptr AMediaCodec, idx: csize, render: bool): cint {.
  importc: "AMediaCodec_releaseOutputBuffer", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_releaseOutputBufferAtTime*(codec: ptr AMediaCodec, idx: csize, timestampNs: int64): cint {. # API 21+
  importc: "AMediaCodec_releaseOutputBufferAtTime", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
proc AMediaCodec_getName*(codec: ptr AMediaCodec, name: var cstring): cint {. # API 29+
  importc: "AMediaCodec_getName", header: "<media/NdkMediaCodec.h>", dynlib: "libmediandk.so".}
# ... AMediaCodec_setParameters, AMediaCodec_setCallback (API 23+), AMediaCodec_createInputSurface (API 23+)

# AMediaFormat functions (subset)
proc AMediaFormat_new*(): ptr AMediaFormat {.
  importc: "AMediaFormat_new", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_delete*(format: ptr AMediaFormat): cint {.
  importc: "AMediaFormat_delete", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_toString*(format: ptr AMediaFormat): cstring {.
  importc: "AMediaFormat_toString", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getInt32*(format: ptr AMediaFormat, name: cstring, output:var int32): bool {.
  importc: "AMediaFormat_getInt32", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getInt64*(format: ptr AMediaFormat, name: cstring, output:var int64): bool {.
  importc: "AMediaFormat_getInt64", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getFloat*(format: ptr AMediaFormat, name: cstring, output:var cfloat): bool {.
  importc: "AMediaFormat_getFloat", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getSize*(format: ptr AMediaFormat, name: cstring, output:var csize): bool {. # API 28+
  importc: "AMediaFormat_getSize", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getString*(format: ptr AMediaFormat, name: cstring, output:var cstring): bool {.
  importc: "AMediaFormat_getString", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_getBuffer*(format: ptr AMediaFormat, name: cstring, data: var pointer, size: var csize): bool {.
  importc: "AMediaFormat_getBuffer", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_setInt32*(format: ptr AMediaFormat, name: cstring, value: int32) {.
  importc: "AMediaFormat_setInt32", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_setInt64*(format: ptr AMediaFormat, name: cstring, value: int64) {.
  importc: "AMediaFormat_setInt64", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_setFloat*(format: ptr AMediaFormat, name: cstring, value: cfloat) {.
  importc: "AMediaFormat_setFloat", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_setString*(format: ptr AMediaFormat, name: cstring, value: cstring) {.
  importc: "AMediaFormat_setString", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
proc AMediaFormat_setBuffer*(format: ptr AMediaFormat, name: cstring, data: pointer, size: csize) {.
  importc: "AMediaFormat_setBuffer", header: "<media/NdkMediaFormat.h>", dynlib: "libmediandk.so".}
# Constants for AMediaFormat keys (KEY_WIDTH, KEY_HEIGHT, KEY_MIME, etc.) are strings, e.g. "width", "mime".

# AMediaExtractor functions (subset)
proc AMediaExtractor_new*(): ptr AMediaExtractor {.
  importc: "AMediaExtractor_new", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_delete*(ex: ptr AMediaExtractor): cint {.
  importc: "AMediaExtractor_delete", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_setDataSource*(ex: ptr AMediaExtractor, location: cstring): cint {.
  importc: "AMediaExtractor_setDataSource", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_setDataSourceFd*(ex: ptr AMediaExtractor, fd: cint, offset: int64, length: int64): cint {.
  importc: "AMediaExtractor_setDataSourceFd", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_getTrackCount*(ex: ptr AMediaExtractor): csize {.
  importc: "AMediaExtractor_getTrackCount", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_getTrackFormat*(ex: ptr AMediaExtractor, idx: csize): ptr AMediaFormat {.
  importc: "AMediaExtractor_getTrackFormat", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_selectTrack*(ex: ptr AMediaExtractor, idx: csize): cint {.
  importc: "AMediaExtractor_selectTrack", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_unselectTrack*(ex: ptr AMediaExtractor, idx: csize): cint {. # API 28+
  importc: "AMediaExtractor_unselectTrack", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_readSampleData*(ex: ptr AMediaExtractor, buffer: ptr uint8, capacity: csize): int {. # ssize_t (bytes read or error)
  importc: "AMediaExtractor_readSampleData", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_getSampleTrackIndex*(ex: ptr AMediaExtractor): int {. # ssize_t
  importc: "AMediaExtractor_getSampleTrackIndex", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_getSampleTime*(ex: ptr AMediaExtractor): int64 {.
  importc: "AMediaExtractor_getSampleTime", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_getSampleFlags*(ex: ptr AMediaExtractor, flags: var uint32): cint {. # API 28+, or use AMEDIAEXTRACTOR_SAMPLE_FLAG... constants
  importc: "AMediaExtractor_getSampleFlags", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_advance*(ex: ptr AMediaExtractor): bool {.
  importc: "AMediaExtractor_advance", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
proc AMediaExtractor_seekTo*(ex: ptr AMediaExtractor, timeUs: int64, mode: cint): cint {. # mode: AMEDIAEXTRACTOR_SEEK_PREVIOUS_SYNC etc.
  importc: "AMediaExtractor_seekTo", header: "<media/NdkMediaExtractor.h>", dynlib: "libmediandk.so".}
# ... and AMediaExtractor_getPsshInfo, AMediaExtractor_getCachedDuration, etc.

# NdkImage.h and NdkImageReader.h (for Camera2, MediaCodec surface input/output)
# ...This is also a substantial API involving AImage_getPlaneData, AImageReader_new, AImageReader_setImageListener etc.

#------------------------------------------------------------------------------
# Android Hardware Buffer <android/hardware_buffer.h> & <android/hardware_buffer_jni.h> (API 26+)
# For sharing buffers of graphical data efficiently.
#------------------------------------------------------------------------------
type
  AHardwareBuffer* {.importc: "AHardwareBuffer", header: "<android/hardware_buffer.h>".} = distinct pointer
  AHardwareBuffer_Desc* {.importc: "AHardwareBuffer_Desc", header: "<android/hardware_buffer.h>".} = object
    width*: uint32; height*: uint32; layers*: uint32
    format*: uint32 # AHARDWAREBUFFER_FORMAT_*
    usage*: uint64  # AHARDWAREBUFFER_USAGE_*
    stride*: uint32 # Stride in pixels, not bytes
    rfu0*: uint32; rfu1*: uint64 # Reserved for future use

const # AHARDWAREBUFFER_FORMAT_* (subset) from <android/hardware_buffer.h>
  AHARDWAREBUFFER_FORMAT_R8G8B8A8_UNORM* = 1
  AHARDWAREBUFFER_FORMAT_R8G8B8X8_UNORM* = 2
  AHARDWAREBUFFER_FORMAT_R8G8B8_UNORM*   = 3
  AHARDWAREBUFFER_FORMAT_R5G6B5_UNORM*   = 4
  AHARDWAREBUFFER_FORMAT_BLOB*           = 0x21 # Used for JPEG data, for example
  # ... many more formats, YUV formats etc.

const # AHARDWAREBUFFER_USAGE_* (subset)
  AHARDWAREBUFFER_USAGE_CPU_READ_NEVER*   = 0ULL
  AHARDWAREBUFFER_USAGE_CPU_READ_RARELY*  = 2ULL
  AHARDWAREBUFFER_USAGE_CPU_READ_OFTEN*   = 3ULL
  AHARDWAREBUFFER_USAGE_CPU_WRITE_NEVER*  = 0ULL << 4
  AHARDWAREBUFFER_USAGE_CPU_WRITE_RARELY* = 2ULL << 4
  AHARDWAREBUFFER_USAGE_CPU_WRITE_OFTEN*  = 3ULL << 4
  AHARDWAREBUFFER_USAGE_GPU_SAMPLED_IMAGE*= 1ULL << 8
  AHARDWAREBUFFER_USAGE_GPU_COLOR_OUTPUT* = 1ULL << 9
  AHARDWAREBUFFER_USAGE_PROTECTED_CONTENT*= 1ULL << 14
  # ... many more usage flags for video encoder/decoder, sensors etc.

proc AHardwareBuffer_fromHardwareBuffer*(env: JNIEnv, hardwareBufferObj: jobject): ptr AHardwareBuffer {. # API 26+
  importc: "AHardwareBuffer_fromHardwareBuffer", header: "<android/hardware_buffer_jni.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_toHardwareBuffer*(env: JNIEnv, hardwareBuffer: ptr AHardwareBuffer): jobject {. # API 26+
  importc: "AHardwareBuffer_toHardwareBuffer", header: "<android/hardware_buffer_jni.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_allocate*(desc: ptr AHardwareBuffer_Desc, outBuffer: var ptr AHardwareBuffer): cint {. # API 26+
  importc: "AHardwareBuffer_allocate", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_acquire*(buffer: ptr AHardwareBuffer) {. # API 26+
  importc: "AHardwareBuffer_acquire", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_release*(buffer: ptr AHardwareBuffer) {. # API 26+
  importc: "AHardwareBuffer_release", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_describe*(buffer: ptr AHardwareBuffer, outDesc: var AHardwareBuffer_Desc) {. # API 26+
  importc: "AHardwareBuffer_describe", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_lock*(buffer: ptr AHardwareBuffer, usage: uint64, fence: cint, rect: ptr ARect, outVirtualAddress: var pointer): cint {. # API 26+
  importc: "AHardwareBuffer_lock", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
proc AHardwareBuffer_unlock*(buffer: ptr AHardwareBuffer, fence: var cint): cint {. # API 26+
  importc: "AHardwareBuffer_unlock", header: "<android/hardware_buffer.h>", dynlib: "libandroid.so".}
# ... AHardwareBuffer_isSupported, AHardwareBuffer_recvHandleFromUnixSocket, AHardwareBuffer_sendHandleToUnixSocket

#------------------------------------------------------------------------------
# AAudio <aaudio/AAudio.h> (API 26+) - High-performance audio
#------------------------------------------------------------------------------
type
  AAudioStreamBuilder* {.importc: "AAudioStreamBuilder", header: "<aaudio/AAudio.h>".} = distinct pointer
  AAudioStream* {.importc: "AAudioStream", header: "<aaudio/AAudio.h>".} = distinct pointer
  AAudioStream_dataCallback* = proc(stream: ptr AAudioStream, userData: pointer, audioData: pointer, numFrames: int32): cint {.cdecl.} # aaudio_data_callback_result_t
  AAudioStream_errorCallback* = proc(stream: ptr AAudioStream, userData: pointer, error: cint) {.cdecl.} # aaudio_result_t

const # aaudio_result_t, aaudio_stream_state_t, aaudio_direction_t, etc. from AAudio.h
  AAUDIO_OK* = 0; AAUDIO_ERROR_BASE* = -900 # ... numerous error codes
  AAUDIO_DIRECTION_OUTPUT* = 0; AAUDIO_DIRECTION_INPUT* = 1
  AAUDIO_FORMAT_INVALID* = -1; AAUDIO_FORMAT_UNSPECIFIED* = 0
  AAUDIO_FORMAT_PCM_I16* = 1; AAUDIO_FORMAT_PCM_FLOAT* = 2
  AAUDIO_SHARING_MODE_EXCLUSIVE* = 0; AAUDIO_SHARING_MODE_SHARED* = 1
  AAUDIO_PERFORMANCE_MODE_NONE* = 10; AAUDIO_PERFORMANCE_MODE_POWER_SAVING* = 11
  AAUDIO_PERFORMANCE_MODE_LOW_LATENCY* = 12
  AAUDIO_STREAM_STATE_UNINITIALIZED* = 0; AAUDIO_STREAM_STATE_UNKNOWN* = 1
  AAUDIO_STREAM_STATE_OPEN* = 2; AAUDIO_STREAM_STATE_STARTING* = 3
  AAUDIO_STREAM_STATE_STARTED* = 4 # ... and more states
  AAUDIO_CALLBACK_RESULT_CONTINUE* = 0; AAUDIO_CALLBACK_RESULT_STOP* = 1

proc AAudio_createStreamBuilder*(builder: var ptr AAudioStreamBuilder): cint {. # aaudio_result_t
  importc: "AAudio_createStreamBuilder", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_delete*(builder: ptr AAudioStreamBuilder): cint {.
  importc: "AAudioStreamBuilder_delete", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setDeviceId*(builder: ptr AAudioStreamBuilder, deviceId: int32) {.
  importc: "AAudioStreamBuilder_setDeviceId", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setDirection*(builder: ptr AAudioStreamBuilder, direction: cint) {. # aaudio_direction_t
  importc: "AAudioStreamBuilder_setDirection", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setSharingMode*(builder: ptr AAudioStreamBuilder, mode: cint) {. # aaudio_sharing_mode_t
  importc: "AAudioStreamBuilder_setSharingMode", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setSampleRate*(builder: ptr AAudioStreamBuilder, sampleRate: int32) {.
  importc: "AAudioStreamBuilder_setSampleRate", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setChannelCount*(builder: ptr AAudioStreamBuilder, channelCount: int32) {.
  importc: "AAudioStreamBuilder_setChannelCount", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setFormat*(builder: ptr AAudioStreamBuilder, format: cint) {. # aaudio_format_t
  importc: "AAudioStreamBuilder_setFormat", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setBufferCapacityInFrames*(builder: ptr AAudioStreamBuilder, numFrames: int32) {.
  importc: "AAudioStreamBuilder_setBufferCapacityInFrames", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setPerformanceMode*(builder: ptr AAudioStreamBuilder, mode: cint) {. # aaudio_performance_mode_t
  importc: "AAudioStreamBuilder_setPerformanceMode", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setDataCallback*(builder: ptr AAudioStreamBuilder, callback: AAudioStream_dataCallback, userData: pointer) {.
  importc: "AAudioStreamBuilder_setDataCallback", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_setErrorCallback*(builder: ptr AAudioStreamBuilder, callback: AAudioStream_errorCallback, userData: pointer) {.
  importc: "AAudioStreamBuilder_setErrorCallback", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStreamBuilder_openStream*(builder: ptr AAudioStreamBuilder, stream: var ptr AAudioStream): cint {.
  importc: "AAudioStreamBuilder_openStream", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}

proc AAudioStream_close*(stream: ptr AAudioStream): cint {.
  importc: "AAudioStream_close", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_requestStart*(stream: ptr AAudioStream): cint {.
  importc: "AAudioStream_requestStart", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_requestStop*(stream: ptr AAudioStream): cint {.
  importc: "AAudioStream_requestStop", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_requestPause*(stream: ptr AAudioStream): cint {.
  importc: "AAudioStream_requestPause", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_requestFlush*(stream: ptr AAudioStream): cint {.
  importc: "AAudioStream_requestFlush", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_waitForStateChange*(stream: ptr AAudioStream, currentState: cint, nextState: var cint, timeoutNanoseconds: int64): cint {. # aaudio_stream_state_t
  importc: "AAudioStream_waitForStateChange", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_read*(stream: ptr AAudioStream, buffer: pointer, numFrames: int32, timeoutNanoseconds: int64): cint {. # frames read or error
  importc: "AAudioStream_read", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
proc AAudioStream_write*(stream: ptr AAudioStream, buffer: pointer, numFrames: int32, timeoutNanoseconds: int64): cint {. # frames written or error
  importc: "AAudioStream_write", header: "<aaudio/AAudio.h>", dynlib: "libaaudio.so".}
# ... Many more AAudioStream_get* functions for properties.

#------------------------------------------------------------------------------
# OpenSL ES <SLES/OpenSLES.h> & <SLES/OpenSLES_Android.h> - Older audio API
# This API is very extensive and uses an object-oriented C style.
# Only a tiny fraction shown for structure.
#------------------------------------------------------------------------------
type
  SLObjectItf* = ptr ptr SLObjectItf_ # Effectively const struct SLObjectItf**
  SLObjectItf_ = object # The actual interface struct
    RegisterCallback*: proc(self: SLObjectItf, callback: pointer, pContext: pointer): cint {.cdecl.} # SLresult
    # ... many more methods like AbortAsyncOperation, Realize, Resume, GetState, etc.
  # Each OpenSL ES interface (SLEngineItf, SLPlayItf, SLRecordItf, etc.) has a similar structure.

const
  SL_RESULT_SUCCESS* = 0 # ... and many other SL_RESULT_* codes

# Example: Engine creation
proc slCreateEngine*(pEngine: var SLObjectItf, numOptions: SLuint32, pEngineOptions: pointer, numInterfaces: SLuint32, pInterfaceIds: pointer, pInterfaceRequired: pointer): cint {. # SLresult
  importc: "slCreateEngine", header: "<SLES/OpenSLES.h>", dynlib: "libOpenSLES.so".}

#------------------------------------------------------------------------------
# EGL & OpenGL ES - Graphics APIs from Khronos Group
# Headers: <EGL/egl.h>, <EGL/eglext.h>, <GLES2/gl2.h>, <GLES3/gl3.h>, etc.
# These are extremely large APIs. Bindings are often generated by tools (e.g., glad, c2nim on processed headers).
# This section is just a placeholder for where such bindings would go.
# Example structure:
# type EGLDisplay* = pointer
# proc eglGetDisplay*(native_display: pointer): EGLDisplay {.importc: "eglGetDisplay", dynlib: "libEGL.so".}
# proc glClearColor*(red, green, blue, alpha: cfloat) {.importc: "glClearColor", dynlib: "libGLESv2.so".}
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Vulkan - Modern Graphics API from Khronos Group
# Headers: <vulkan/vulkan.h>, <vulkan/vulkan_android.h>
# Also an extremely large API. Bindings typically generated.
# Example structure:
# type VkInstance* = distinct pointer
# proc vkCreateInstance*(pCreateInfo: pointer, pAllocator: pointer, pInstance: var VkInstance): cint {.importc:"vkCreateInstance", dynlib:"libvulkan.so".} # VkResult
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Neural Networks API (NNAPI) <android/NeuralNetworks.h> (API 27+)
# For hardware-accelerated machine learning.
#------------------------------------------------------------------------------
type
  ANeuralNetworksModel* {.importc: "ANeuralNetworksModel", header: "<android/NeuralNetworks.h>".} = distinct pointer
  ANeuralNetworksCompilation* {.importc: "ANeuralNetworksCompilation", header: "<android/NeuralNetworks.h>".} = distinct pointer
  ANeuralNetworksExecution* {.importc: "ANeuralNetworksExecution", header: "<android/NeuralNetworks.h>".} = distinct pointer
  ANeuralNetworksEvent* {.importc: "ANeuralNetworksEvent", header: "<android/NeuralNetworks.h>".} = distinct pointer
  ANeuralNetworksOperandType* {.importc: "ANeuralNetworksOperandType", header: "<android/NeuralNetworks.h>".} = object # struct
    typeKind*: cint # ANEURALNETWORKS_TENSOR_FLOAT32 etc. (use typeKind to avoid Nim keyword 'type')
    dimensionCount*: uint32
    dimensions*: ptr uint32
    scale*: cfloat
    zeroPoint*: cint

const # Result codes ANEURALNETWORKS_* from <android/NeuralNetworksTypes.h>
  ANEURALNETWORKS_NO_ERROR* = 0; ANEURALNETWORKS_OUT_OF_MEMORY* = 1
  # ... many more error codes and operand/operation types

proc ANeuralNetworksModel_create*(model: var ptr ANeuralNetworksModel): cint {. # API 27+
  importc: "ANeuralNetworksModel_create", header: "<android/NeuralNetworks.h>", dynlib: "libneuralnetworks.so".}
proc ANeuralNetworksModel_free*(model: ptr ANeuralNetworksModel) {. # API 27+
  importc: "ANeuralNetworksModel_free", header: "<android/NeuralNetworks.h>", dynlib: "libneuralnetworks.so".}
# ... Many functions for adding operands, operations, identifying inputs/outputs, compiling, executing.
# This is a complex stateful API.
#------------------------------------------------------------------------------

# Add other NDK modules as needed:
# - <android/obb.h> (AObbScanner)
# - <android/storage_manager.h> (AStorageManager, AStorageOBBEntry) - API 26+
# - <android/surface_texture.h> (ASurfaceTexture) - API 30+
# - <android/thermal.h> (AThermalManager) - API 29+
# - <android/trace.h> (ATrace_beginSection, ATrace_isEnabled)
# - etc.

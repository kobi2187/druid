import jnim

jclass android.hardware.Camera* of JVMObject:
  proc getNumberOfCameras*(): jint {.`static`.}
  proc getNumberOfCameras*(context: Context): jint {.`static`.}
  proc getCameraInfo*(cameraId: jint, cameraInfo: CameraInfo) {.`static`.}
  proc getCameraInfo*(cameraId: jint, context: Context, rotationOverride: jint, cameraInfo: CameraInfo) {.`static`.}
  proc open*(cameraId: jint): Camera {.`static`.}
  proc open*(cameraId: jint, context: Context, rotationOverride: jint): Camera {.`static`.}
  proc open*(): Camera {.`static`.}
  proc openLegacy*(cameraId: jint, halVersion: jint): Camera {.`static`.}
  proc checkInitErrors*(err: jint): jboolean {.`static`.}
  proc openUninitialized*(): Camera {.`static`.}
  proc release*()
  proc unlock*()
  proc lock*()
  proc reconnect*()
  proc setPreviewDisplay*(holder: SurfaceHolder)
  proc setPreviewSurface*(surface: Surface)
  proc setPreviewTexture*(surfaceTexture: SurfaceTexture)
  proc startPreview*()
  proc stopPreview*()
  proc previewEnabled*(): jboolean
  proc setPreviewCallback*(cb: PreviewCallback)
  proc setOneShotPreviewCallback*(cb: PreviewCallback)
  proc setPreviewCallbackWithBuffer*(cb: PreviewCallback)
  proc addCallbackBuffer*(callbackBuffer: seq[jbyte])
  proc addRawImageCallbackBuffer*(callbackBuffer: seq[jbyte])
  proc autoFocus*(cb: AutoFocusCallback)
  proc cancelAutoFocus*()
  proc setAutoFocusMoveCallback*(cb: AutoFocusMoveCallback)
  proc takePicture*(shutter: ShutterCallback, raw: PictureCallback, jpeg: PictureCallback)
  proc takePicture*(shutter: ShutterCallback, raw: PictureCallback, postview: PictureCallback, jpeg: PictureCallback)
  proc startSmoothZoom*(value: jint)
  proc stopSmoothZoom*()
  proc setDisplayOrientation*(degrees: jint)
  proc enableShutterSound*(enabled: jboolean): jboolean
  proc disableShutterSound*(): jboolean
  proc setZoomChangeListener*(listener: OnZoomChangeListener)
  proc setFaceDetectionListener*(listener: FaceDetectionListener)
  proc startFaceDetection*()
  proc stopFaceDetection*()
  proc setErrorCallback*(cb: ErrorCallback)
  proc setDetailedErrorCallback*(cb: ErrorCallback)
  proc setParameters*(params: Parameters)
  proc getParameters*(): Parameters
  proc getEmptyParameters*(): Parameters {.`static`.}
  proc getParametersCopy*(parameters: Camera.Parameters): Parameters {.`static`.}
  proc setAudioRestriction*(mode: jint)
  proc getAudioRestriction*(): jint
  ACTION_NEW_PICTURE*: string {.`static`.}
  ACTION_NEW_VIDEO*: string {.`static`.}
  CAMERA_HAL_API_VERSION_1_0*: jint {.`static`.}
  CAMERA_HAL_API_VERSION_3_0*: jint {.`static`.}
  CAMERA_ERROR_UNKNOWN*: jint {.`static`.}
  CAMERA_ERROR_EVICTED*: jint {.`static`.}
  CAMERA_ERROR_DISABLED*: jint {.`static`.}
  CAMERA_ERROR_SERVER_DIED*: jint {.`static`.}

jclass android.hardware.Camera.Size* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.hardware.Camera.Area* of JVMObject:
  proc equals*(obj: JObject): jboolean

jclass android.hardware.Camera.Parameters* of JVMObject:
  proc copyFrom*(other: Parameters)
  proc same*(other: Parameters): jboolean
  proc dump*()
  proc flatten*(): string
  proc unflatten*(flattened: string)
  proc remove*(key: string)
  proc set*(key: string, value: string)
  proc set*(key: string, value: jint)
  proc get*(key: string): string
  proc getInt*(key: string): jint
  proc setPreviewSize*(width: jint, height: jint)
  proc getPreviewSize*(): Size
  proc getSupportedPreviewSizes*(): List[Size]
  proc getSupportedVideoSizes*(): List[Size]
  proc getPreferredPreviewSizeForVideo*(): Size
  proc setJpegThumbnailSize*(width: jint, height: jint)
  proc getJpegThumbnailSize*(): Size
  proc getSupportedJpegThumbnailSizes*(): List[Size]
  proc setJpegThumbnailQuality*(quality: jint)
  proc getJpegThumbnailQuality*(): jint
  proc setJpegQuality*(quality: jint)
  proc getJpegQuality*(): jint
  proc setPreviewFrameRate*(fps: jint)
  proc getPreviewFrameRate*(): jint
  proc getSupportedPreviewFrameRates*(): List[Integer]
  proc setPreviewFpsRange*(min: jint, max: jint)
  proc getPreviewFpsRange*(range: seq[jint])
  proc getSupportedPreviewFpsRange*(): List[seq[jint]]
  proc setPreviewFormat*(pixel_format: jint)
  proc getPreviewFormat*(): jint
  proc getSupportedPreviewFormats*(): List[Integer]
  proc setPictureSize*(width: jint, height: jint)
  proc getPictureSize*(): Size
  proc getSupportedPictureSizes*(): List[Size]
  proc setPictureFormat*(pixel_format: jint)
  proc getPictureFormat*(): jint
  proc getSupportedPictureFormats*(): List[Integer]
  proc setRotation*(rotation: jint)
  proc setGpsLatitude*(latitude: jdouble)
  proc setGpsLongitude*(longitude: jdouble)
  proc setGpsAltitude*(altitude: jdouble)
  proc setGpsTimestamp*(timestamp: jlong)
  proc setGpsProcessingMethod*(processing_method: string)
  proc removeGpsData*()
  proc getWhiteBalance*(): string
  proc setWhiteBalance*(value: string)
  proc getSupportedWhiteBalance*(): List[string]
  proc getColorEffect*(): string
  proc setColorEffect*(value: string)
  proc getSupportedColorEffects*(): List[string]
  proc getAntibanding*(): string
  proc setAntibanding*(antibanding: string)
  proc getSupportedAntibanding*(): List[string]
  proc getSceneMode*(): string
  proc setSceneMode*(value: string)
  proc getSupportedSceneModes*(): List[string]
  proc getFlashMode*(): string
  proc setFlashMode*(value: string)
  proc getSupportedFlashModes*(): List[string]
  proc getFocusMode*(): string
  proc setFocusMode*(value: string)
  proc getSupportedFocusModes*(): List[string]
  proc getFocalLength*(): jfloat
  proc getHorizontalViewAngle*(): jfloat
  proc getVerticalViewAngle*(): jfloat
  proc getExposureCompensation*(): jint
  proc setExposureCompensation*(value: jint)
  proc getMaxExposureCompensation*(): jint
  proc getMinExposureCompensation*(): jint
  proc getExposureCompensationStep*(): jfloat
  proc setAutoExposureLock*(toggle: jboolean)
  proc getAutoExposureLock*(): jboolean
  proc isAutoExposureLockSupported*(): jboolean
  proc setAutoWhiteBalanceLock*(toggle: jboolean)
  proc getAutoWhiteBalanceLock*(): jboolean
  proc isAutoWhiteBalanceLockSupported*(): jboolean
  proc getZoom*(): jint
  proc setZoom*(value: jint)
  proc isZoomSupported*(): jboolean
  proc getMaxZoom*(): jint
  proc getZoomRatios*(): List[Integer]
  proc isSmoothZoomSupported*(): jboolean
  proc getFocusDistances*(output: seq[jfloat])
  proc getMaxNumFocusAreas*(): jint
  proc getFocusAreas*(): List[Area]
  proc setFocusAreas*(focusAreas: List[Area])
  proc getMaxNumMeteringAreas*(): jint
  proc getMeteringAreas*(): List[Area]
  proc setMeteringAreas*(meteringAreas: List[Area])
  proc getMaxNumDetectedFaces*(): jint
  proc setRecordingHint*(hint: jboolean)
  proc isVideoSnapshotSupported*(): jboolean
  proc setVideoStabilization*(toggle: jboolean)
  proc getVideoStabilization*(): jboolean
  proc isVideoStabilizationSupported*(): jboolean

jclass android.hardware.CameraInfo* of JVMObject:
  CAMERA_FACING_BACK*: jint {.`static`.}
  CAMERA_FACING_FRONT*: jint {.`static`.}
  facing*: jint
  orientation*: jint
  canDisableShutterSound*: jboolean






jclass android.hardware.Face* of JVMObject:
  rect*: Rect
  score*: jint
  id*: jint
  leftEye*: Point
  rightEye*: Point
  mouth*: Point


jclass android.hardware.Size* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  width*: jint
  height*: jint

jclass android.hardware.Area* of JVMObject:
  proc equals*(obj: JObject): jboolean
  rect*: Rect
  weight*: jint

jclass android.hardware.Parameters* of JVMObject:
  proc copyFrom*(other: Parameters)
  proc same*(other: Parameters): jboolean
  proc dump*()
  proc flatten*(): string
  proc unflatten*(flattened: string)
  proc remove*(key: string)
  proc set*(key: string, value: string)
  proc set*(key: string, value: jint)
  proc get*(key: string): string
  proc getInt*(key: string): jint
  proc setPreviewSize*(width: jint, height: jint)
  proc getPreviewSize*(): Size
  proc getSupportedPreviewSizes*(): List[Size]
  proc getSupportedVideoSizes*(): List[Size]
  proc getPreferredPreviewSizeForVideo*(): Size
  proc setJpegThumbnailSize*(width: jint, height: jint)
  proc getJpegThumbnailSize*(): Size
  proc getSupportedJpegThumbnailSizes*(): List[Size]
  proc setJpegThumbnailQuality*(quality: jint)
  proc getJpegThumbnailQuality*(): jint
  proc setJpegQuality*(quality: jint)
  proc getJpegQuality*(): jint
  proc setPreviewFrameRate*(fps: jint)
  proc getPreviewFrameRate*(): jint
  proc getSupportedPreviewFrameRates*(): List[Integer]
  proc setPreviewFpsRange*(min: jint, max: jint)
  proc getPreviewFpsRange*(range: seq[jint])
  proc getSupportedPreviewFpsRange*(): List[seq[jint]]
  proc setPreviewFormat*(pixel_format: jint)
  proc getPreviewFormat*(): jint
  proc getSupportedPreviewFormats*(): List[Integer]
  proc setPictureSize*(width: jint, height: jint)
  proc getPictureSize*(): Size
  proc getSupportedPictureSizes*(): List[Size]
  proc setPictureFormat*(pixel_format: jint)
  proc getPictureFormat*(): jint
  proc getSupportedPictureFormats*(): List[Integer]
  proc setRotation*(rotation: jint)
  proc setGpsLatitude*(latitude: jdouble)
  proc setGpsLongitude*(longitude: jdouble)
  proc setGpsAltitude*(altitude: jdouble)
  proc setGpsTimestamp*(timestamp: jlong)
  proc setGpsProcessingMethod*(processing_method: string)
  proc removeGpsData*()
  proc getWhiteBalance*(): string
  proc setWhiteBalance*(value: string)
  proc getSupportedWhiteBalance*(): List[string]
  proc getColorEffect*(): string
  proc setColorEffect*(value: string)
  proc getSupportedColorEffects*(): List[string]
  proc getAntibanding*(): string
  proc setAntibanding*(antibanding: string)
  proc getSupportedAntibanding*(): List[string]
  proc getSceneMode*(): string
  proc setSceneMode*(value: string)
  proc getSupportedSceneModes*(): List[string]
  proc getFlashMode*(): string
  proc setFlashMode*(value: string)
  proc getSupportedFlashModes*(): List[string]
  proc getFocusMode*(): string
  proc setFocusMode*(value: string)
  proc getSupportedFocusModes*(): List[string]
  proc getFocalLength*(): jfloat
  proc getHorizontalViewAngle*(): jfloat
  proc getVerticalViewAngle*(): jfloat
  proc getExposureCompensation*(): jint
  proc setExposureCompensation*(value: jint)
  proc getMaxExposureCompensation*(): jint
  proc getMinExposureCompensation*(): jint
  proc getExposureCompensationStep*(): jfloat
  proc setAutoExposureLock*(toggle: jboolean)
  proc getAutoExposureLock*(): jboolean
  proc isAutoExposureLockSupported*(): jboolean
  proc setAutoWhiteBalanceLock*(toggle: jboolean)
  proc getAutoWhiteBalanceLock*(): jboolean
  proc isAutoWhiteBalanceLockSupported*(): jboolean
  proc getZoom*(): jint
  proc setZoom*(value: jint)
  proc isZoomSupported*(): jboolean
  proc getMaxZoom*(): jint
  proc getZoomRatios*(): List[Integer]
  proc isSmoothZoomSupported*(): jboolean
  proc getFocusDistances*(output: seq[jfloat])
  proc getMaxNumFocusAreas*(): jint
  proc getFocusAreas*(): List[Area]
  proc setFocusAreas*(focusAreas: List[Area])
  proc getMaxNumMeteringAreas*(): jint
  proc getMeteringAreas*(): List[Area]
  proc setMeteringAreas*(meteringAreas: List[Area])
  proc getMaxNumDetectedFaces*(): jint
  proc setRecordingHint*(hint: jboolean)
  proc isVideoSnapshotSupported*(): jboolean
  proc setVideoStabilization*(toggle: jboolean)
  proc getVideoStabilization*(): jboolean
  proc isVideoStabilizationSupported*(): jboolean
  WHITE_BALANCE_AUTO*: string {.`static`.}
  WHITE_BALANCE_INCANDESCENT*: string {.`static`.}
  WHITE_BALANCE_FLUORESCENT*: string {.`static`.}
  WHITE_BALANCE_WARM_FLUORESCENT*: string {.`static`.}
  WHITE_BALANCE_DAYLIGHT*: string {.`static`.}
  WHITE_BALANCE_CLOUDY_DAYLIGHT*: string {.`static`.}
  WHITE_BALANCE_TWILIGHT*: string {.`static`.}
  WHITE_BALANCE_SHADE*: string {.`static`.}
  EFFECT_NONE*: string {.`static`.}
  EFFECT_MONO*: string {.`static`.}
  EFFECT_NEGATIVE*: string {.`static`.}
  EFFECT_SOLARIZE*: string {.`static`.}
  EFFECT_SEPIA*: string {.`static`.}
  EFFECT_POSTERIZE*: string {.`static`.}
  EFFECT_WHITEBOARD*: string {.`static`.}
  EFFECT_BLACKBOARD*: string {.`static`.}
  EFFECT_AQUA*: string {.`static`.}
  ANTIBANDING_AUTO*: string {.`static`.}
  ANTIBANDING_50HZ*: string {.`static`.}
  ANTIBANDING_60HZ*: string {.`static`.}
  ANTIBANDING_OFF*: string {.`static`.}
  FLASH_MODE_OFF*: string {.`static`.}
  FLASH_MODE_AUTO*: string {.`static`.}
  FLASH_MODE_ON*: string {.`static`.}
  FLASH_MODE_RED_EYE*: string {.`static`.}
  FLASH_MODE_TORCH*: string {.`static`.}
  SCENE_MODE_AUTO*: string {.`static`.}
  SCENE_MODE_ACTION*: string {.`static`.}
  SCENE_MODE_PORTRAIT*: string {.`static`.}
  SCENE_MODE_LANDSCAPE*: string {.`static`.}
  SCENE_MODE_NIGHT*: string {.`static`.}
  SCENE_MODE_NIGHT_PORTRAIT*: string {.`static`.}
  SCENE_MODE_THEATRE*: string {.`static`.}
  SCENE_MODE_BEACH*: string {.`static`.}
  SCENE_MODE_SNOW*: string {.`static`.}
  SCENE_MODE_SUNSET*: string {.`static`.}
  SCENE_MODE_STEADYPHOTO*: string {.`static`.}
  SCENE_MODE_FIREWORKS*: string {.`static`.}
  SCENE_MODE_SPORTS*: string {.`static`.}
  SCENE_MODE_PARTY*: string {.`static`.}
  SCENE_MODE_CANDLELIGHT*: string {.`static`.}
  SCENE_MODE_BARCODE*: string {.`static`.}
  SCENE_MODE_HDR*: string {.`static`.}
  FOCUS_MODE_AUTO*: string {.`static`.}
  FOCUS_MODE_INFINITY*: string {.`static`.}
  FOCUS_MODE_MACRO*: string {.`static`.}
  FOCUS_MODE_FIXED*: string {.`static`.}
  FOCUS_MODE_EDOF*: string {.`static`.}
  FOCUS_MODE_CONTINUOUS_VIDEO*: string {.`static`.}
  FOCUS_MODE_CONTINUOUS_PICTURE*: string {.`static`.}
  FOCUS_DISTANCE_NEAR_INDEX*: jint {.`static`.}
  FOCUS_DISTANCE_OPTIMAL_INDEX*: jint {.`static`.}
  FOCUS_DISTANCE_FAR_INDEX*: jint {.`static`.}
  PREVIEW_FPS_MIN_INDEX*: jint {.`static`.}
  PREVIEW_FPS_MAX_INDEX*: jint {.`static`.}


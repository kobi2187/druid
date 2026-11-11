import jnim

jclass android.hardware.CameraSessionStats* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc getCameraId*(): string
  proc getFacing*(): jint
  proc getNewCameraState*(): jint
  proc getClientName*(): string
  proc getApiLevel*(): jint
  proc isNdk*(): jboolean
  proc getLatencyMs*(): jint
  proc getLogId*(): jlong
  proc getMaxPreviewFps*(): jfloat
  proc getSessionType*(): jint
  proc getInternalReconfigureCount*(): jint
  proc getRequestCount*(): jlong
  proc getResultErrorCount*(): jlong
  proc getDeviceErrorFlag*(): jboolean
  proc getStreamStats*(): List[CameraStreamStats]
  proc getUserTag*(): string
  proc getVideoStabilizationMode*(): jint
  proc getUsedUltraWide*(): jboolean
  proc getUsedZoomOverride*(): jboolean
  proc getSessionIndex*(): jint
  proc getExtensionSessionStats*(): CameraExtensionSessionStats
  proc getMostRequestedFpsRange*(): Range[Integer]
  CAMERA_STATE_OPEN*: jint {.`static`.}
  CAMERA_STATE_ACTIVE*: jint {.`static`.}
  CAMERA_STATE_IDLE*: jint {.`static`.}
  CAMERA_STATE_CLOSED*: jint {.`static`.}
  CAMERA_FACING_BACK*: jint {.`static`.}
  CAMERA_FACING_FRONT*: jint {.`static`.}
  CAMERA_FACING_EXTERNAL*: jint {.`static`.}
  CAMERA_API_LEVEL_1*: jint {.`static`.}
  CAMERA_API_LEVEL_2*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CameraSessionStats] {.`static`.}


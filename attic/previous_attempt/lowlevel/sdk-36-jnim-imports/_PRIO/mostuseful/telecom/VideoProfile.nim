import jnim

jclass android.telecom.VideoProfile* of JVMObject:
  proc getVideoState*(): jint
  proc getQuality*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc videoStateToString*(videoState: jint): string {.`static`.}
  proc isAudioOnly*(videoState: jint): jboolean {.`static`.}
  proc isVideo*(videoState: jint): jboolean {.`static`.}
  proc isTransmissionEnabled*(videoState: jint): jboolean {.`static`.}
  proc isReceptionEnabled*(videoState: jint): jboolean {.`static`.}
  proc isBidirectional*(videoState: jint): jboolean {.`static`.}
  proc isPaused*(videoState: jint): jboolean {.`static`.}
  QUALITY_UNKNOWN*: jint {.`static`.}
  QUALITY_HIGH*: jint {.`static`.}
  QUALITY_MEDIUM*: jint {.`static`.}
  QUALITY_LOW*: jint {.`static`.}
  QUALITY_DEFAULT*: jint {.`static`.}
  STATE_AUDIO_ONLY*: jint {.`static`.}
  STATE_TX_ENABLED*: jint {.`static`.}
  STATE_RX_ENABLED*: jint {.`static`.}
  STATE_BIDIRECTIONAL*: jint {.`static`.}
  STATE_PAUSED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VideoProfile] {.`static`.}

jclass android.telecom.VideoProfile.CameraCapabilities* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc isZoomSupported*(): jboolean
  proc getMaxZoom*(): jfloat

jclass android.telecom.CameraCapabilities* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc isZoomSupported*(): jboolean
  proc getMaxZoom*(): jfloat
  CREATOR*: Parcelable.Creator[CameraCapabilities] {.`static`.}


import jnim

jclass android.media.RemoteDisplayState* of JVMObject:
  proc isValid*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  SERVICE_INTERFACE*: string {.`static`.}
  DISCOVERY_MODE_NONE*: jint {.`static`.}
  DISCOVERY_MODE_PASSIVE*: jint {.`static`.}
  DISCOVERY_MODE_ACTIVE*: jint {.`static`.}
  displays*: ArrayList[RemoteDisplayInfo]
  CREATOR*: Parcelable.Creator[RemoteDisplayState] {.`static`.}

jclass android.media.RemoteDisplayState.RemoteDisplayInfo* of JVMObject:
  proc isValid*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.media.RemoteDisplayInfo* of JVMObject:
  proc isValid*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  STATUS_NOT_AVAILABLE*: jint {.`static`.}
  STATUS_IN_USE*: jint {.`static`.}
  STATUS_AVAILABLE*: jint {.`static`.}
  STATUS_CONNECTING*: jint {.`static`.}
  STATUS_CONNECTED*: jint {.`static`.}
  PLAYBACK_VOLUME_VARIABLE*: jint {.`static`.}
  PLAYBACK_VOLUME_FIXED*: jint {.`static`.}
  id*: string
  name*: string
  description*: string
  status*: jint
  volume*: jint
  volumeMax*: jint
  volumeHandling*: jint
  presentationDisplayId*: jint
  CREATOR*: Parcelable.Creator[RemoteDisplayInfo] {.`static`.}


import jnim

jclass android.media.MediaRouterClientState* of JVMObject:
  proc getRoute*(id: string): RouteInfo
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  routes*: ArrayList[RouteInfo]
  CREATOR*: Parcelable.Creator[MediaRouterClientState] {.`static`.}

jclass android.media.MediaRouterClientState.RouteInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.media.RouteInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  id*: string
  name*: string
  description*: string
  supportedTypes*: jint
  enabled*: jboolean
  statusCode*: jint
  playbackType*: jint
  playbackStream*: jint
  volume*: jint
  volumeMax*: jint
  volumeHandling*: jint
  presentationDisplayId*: jint
  deviceType*: jint
  CREATOR*: Parcelable.Creator[RouteInfo] {.`static`.}


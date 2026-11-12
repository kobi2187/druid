import jnim

jclass android.telecom.AudioState* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc audioRouteToString*(route: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  proc isMuted*(): jboolean
  proc getRoute*(): jint
  proc getSupportedRouteMask*(): jint
  ROUTE_EARPIECE*: jint {.`static`.}
  ROUTE_BLUETOOTH*: jint {.`static`.}
  ROUTE_WIRED_HEADSET*: jint {.`static`.}
  ROUTE_SPEAKER*: jint {.`static`.}
  ROUTE_WIRED_OR_EARPIECE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioState] {.`static`.}


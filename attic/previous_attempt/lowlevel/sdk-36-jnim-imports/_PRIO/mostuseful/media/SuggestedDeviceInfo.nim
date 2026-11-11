import jnim

jclass android.media.SuggestedDeviceInfo* of JVMObject:
  proc getDeviceDisplayName*(): string
  proc getRouteId*(): string
  proc getType*(): jint
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[SuggestedDeviceInfo] {.`static`.}

jclass android.media.SuggestedDeviceInfo.Builder* of JVMObject:
  proc build*(): SuggestedDeviceInfo
  proc setDeviceDisplayName*(deviceDisplayName: string): Builder
  proc setRouteId*(routeId: string): Builder
  proc setType*(type: jint): Builder
  proc setExtras*(extras: Bundle): Builder

jclass android.media.Builder* of JVMObject:
  proc build*(): SuggestedDeviceInfo
  proc setDeviceDisplayName*(deviceDisplayName: string): Builder
  proc setRouteId*(routeId: string): Builder
  proc setType*(type: jint): Builder
  proc setExtras*(extras: Bundle): Builder


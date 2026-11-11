import jnim

jclass android.content.AttributionSource* of JVMObject:
  proc withNextAttributionSource*(next: AttributionSource): AttributionSource
  proc withPackageName*(packageName: string): AttributionSource
  proc withToken*(token: IBinder): AttributionSource
  proc withDefaultToken*(): AttributionSource
  proc withPid*(pid: jint): AttributionSource
  proc withDeviceId*(deviceId: jint): AttributionSource
  proc asState*(): AttributionSourceState
  proc asScopedParcelState*(): ScopedParcelState
  proc myAttributionSource*(): AttributionSource {.`static`.}
  proc enforceCallingUid*()
  proc checkCallingUid*(): jboolean
  proc enforceCallingPid*()
  proc toString*(): string
  proc getNextUid*(): jint
  proc getNextPackageName*(): string
  proc getNextAttributionTag*(): string
  proc getNextToken*(): IBinder
  proc getNextDeviceId*(): jint
  proc isTrusted*(context: Context): jboolean
  proc getRenouncedPermissions*(): Set[string]
  proc getUid*(): jint
  proc getPid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getDeviceId*(): jint
  proc getToken*(): IBinder
  proc getNext*(): AttributionSource
  proc equals*(o: JObject): jboolean
  proc equalsExceptToken*(o: AttributionSource): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AttributionSource] {.`static`.}

jclass android.content.AttributionSource.ScopedParcelState* of JVMObject:
  proc getParcel*(): Parcel
  proc close*()

jclass android.content.AttributionSource.Builder* of JVMObject:
  proc setPid*(value: jint): Builder
  proc setPackageName*(value: string): Builder
  proc setAttributionTag*(value: string): Builder
  proc setRenouncedPermissions*(renouncedPermissions: Set[string]): Builder
  proc setDeviceId*(deviceId: jint): Builder
  proc setNext*(value: AttributionSource): Builder
  proc setNextAttributionSource*(value: AttributionSource): Builder
  proc build*(): AttributionSource

jclass android.content.ScopedParcelState* of JVMObject:
  proc getParcel*(): Parcel
  proc close*()

jclass android.content.Builder* of JVMObject:
  proc setPid*(value: jint): Builder
  proc setPackageName*(value: string): Builder
  proc setAttributionTag*(value: string): Builder
  proc setRenouncedPermissions*(renouncedPermissions: Set[string]): Builder
  proc setDeviceId*(deviceId: jint): Builder
  proc setNext*(value: AttributionSource): Builder
  proc setNextAttributionSource*(value: AttributionSource): Builder
  proc build*(): AttributionSource


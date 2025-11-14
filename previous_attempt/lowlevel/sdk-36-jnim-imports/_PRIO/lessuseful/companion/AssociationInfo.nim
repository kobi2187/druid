import jnim

jclass android.companion.AssociationInfo* of JVMObject:
  proc getId*(): jint
  proc getUserId*(): jint
  proc getPackageName*(): string
  proc getDeviceId*(): DeviceId
  proc getDeviceMacAddress*(): MacAddress
  proc getDeviceMacAddressAsString*(): string
  proc getDisplayName*(): CharSequence
  proc getDeviceProfile*(): string
  proc getAssociatedDevice*(): AssociatedDevice
  proc isSelfManaged*(): jboolean
  proc isNotifyOnDeviceNearby*(): jboolean
  proc getTimeApprovedMs*(): jlong
  proc belongsToPackage*(userId: jint, packageName: string): jboolean
  proc isRevoked*(): jboolean
  proc isPending*(): jboolean
  proc isActive*(): jboolean
  proc getLastTimeConnectedMs*(): jlong
  proc getSystemDataSyncFlags*(): jint
  proc getDeviceIcon*(): Icon
  proc isLinkedTo*(addr: string): jboolean
  proc shouldBindWhenPresent*(): jboolean
  proc toShortString*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[AssociationInfo] {.`static`.}

jclass android.companion.AssociationInfo.Builder* of JVMObject:
  proc setDeviceId*(deviceId: DeviceId): Builder
  proc setDeviceMacAddress*(deviceMacAddress: MacAddress): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setDeviceProfile*(deviceProfile: string): Builder
  proc setAssociatedDevice*(associatedDevice: AssociatedDevice): Builder
  proc setSelfManaged*(selfManaged: jboolean): Builder
  proc setNotifyOnDeviceNearby*(notifyOnDeviceNearby: jboolean): Builder
  proc setRevoked*(revoked: jboolean): Builder
  proc setPending*(pending: jboolean): Builder
  proc setTimeApproved*(timeApprovedMs: jlong): Builder
  proc setLastTimeConnected*(lastTimeConnectedMs: jlong): Builder
  proc setSystemDataSyncFlags*(flags: jint): Builder
  proc setDeviceIcon*(deviceIcon: Icon): Builder
  proc build*(): AssociationInfo

jclass android.companion.Builder* of JVMObject:
  proc setDeviceId*(deviceId: DeviceId): Builder
  proc setDeviceMacAddress*(deviceMacAddress: MacAddress): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setDeviceProfile*(deviceProfile: string): Builder
  proc setAssociatedDevice*(associatedDevice: AssociatedDevice): Builder
  proc setSelfManaged*(selfManaged: jboolean): Builder
  proc setNotifyOnDeviceNearby*(notifyOnDeviceNearby: jboolean): Builder
  proc setRevoked*(revoked: jboolean): Builder
  proc setPending*(pending: jboolean): Builder
  proc setTimeApproved*(timeApprovedMs: jlong): Builder
  proc setLastTimeConnected*(lastTimeConnectedMs: jlong): Builder
  proc setSystemDataSyncFlags*(flags: jint): Builder
  proc setDeviceIcon*(deviceIcon: Icon): Builder
  proc build*(): AssociationInfo


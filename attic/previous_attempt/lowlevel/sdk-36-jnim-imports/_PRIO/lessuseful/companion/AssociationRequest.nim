import jnim

jclass android.companion.AssociationRequest* of JVMObject:
  proc getDeviceProfile*(): string
  proc getDisplayName*(): CharSequence
  proc isSelfManaged*(): jboolean
  proc isForceConfirmation*(): jboolean
  proc isSkipRoleGrant*(): jboolean
  proc isSingleDevice*(): jboolean
  proc getDeviceIcon*(): Icon
  proc setPackageName*(packageName: string)
  proc setUserId*(userId: jint)
  proc setDeviceProfilePrivilegesDescription*(desc: string)
  proc setSkipPrompt*(value: jboolean)
  proc setDisplayName*(displayName: CharSequence)
  proc setAssociatedDevice*(associatedDevice: AssociatedDevice)
  proc setDeviceIcon*(deviceIcon: Icon)
  proc getDeviceFilters*(): List[DeviceFilter[?]]
  proc getAssociatedDevice*(): AssociatedDevice
  proc getPackageName*(): string
  proc getUserId*(): jint
  proc getDeviceProfilePrivilegesDescription*(): string
  proc getCreationTime*(): jlong
  proc isSkipPrompt*(): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  DEVICE_PROFILE_WATCH*: string {.`static`.}
  DEVICE_PROFILE_GLASSES*: string {.`static`.}
  DEVICE_PROFILE_WEARABLE_SENSING*: string {.`static`.}
  DEVICE_PROFILE_APP_STREAMING*: string {.`static`.}
  DEVICE_PROFILE_NEARBY_DEVICE_STREAMING*: string {.`static`.}
  DEVICE_PROFILE_VIRTUAL_DEVICE*: string {.`static`.}
  DEVICE_PROFILE_AUTOMOTIVE_PROJECTION*: string {.`static`.}
  DEVICE_PROFILE_COMPUTER*: string {.`static`.}
  CREATOR*: Parcelable.Creator[AssociationRequest] {.`static`.}

jclass android.companion.AssociationRequest.Builder* of JVMObject:
  proc setSingleDevice*(singleDevice: jboolean): Builder
  proc addDeviceFilter*(deviceFilter: DeviceFilter[?]): Builder
  proc setDeviceProfile*(deviceProfile: string): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setSelfManaged*(selfManaged: jboolean): Builder
  proc setForceConfirmation*(forceConfirmation: jboolean): Builder
  proc setSkipRoleGrant*(skipRoleGrant: jboolean): Builder
  proc setDeviceIcon*(deviceIcon: Icon): Builder
  proc build*(): AssociationRequest

jclass android.companion.Builder* of OneTimeUseBuilder:
  proc setSingleDevice*(singleDevice: jboolean): Builder
  proc addDeviceFilter*(deviceFilter: DeviceFilter[?]): Builder
  proc setDeviceProfile*(deviceProfile: string): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setSelfManaged*(selfManaged: jboolean): Builder
  proc setForceConfirmation*(forceConfirmation: jboolean): Builder
  proc setSkipRoleGrant*(skipRoleGrant: jboolean): Builder
  proc setDeviceIcon*(deviceIcon: Icon): Builder
  proc build*(): AssociationRequest


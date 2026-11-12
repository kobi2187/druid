import jnim

jclass android.location.LastLocationRequest* of JVMObject:
  proc isHiddenFromAppOps*(): jboolean
  proc isAdasGnssBypass*(): jboolean
  proc isLocationSettingsIgnored*(): jboolean
  proc isBypass*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[LastLocationRequest] {.`static`.}

jclass android.location.LastLocationRequest.Builder* of JVMObject:
  proc setHiddenFromAppOps*(hiddenFromAppOps: jboolean): Builder
  proc setAdasGnssBypass*(adasGnssBypass: jboolean): LastLocationRequest.Builder
  proc setLocationSettingsIgnored*(locationSettingsIgnored: jboolean): Builder
  proc build*(): LastLocationRequest

jclass android.location.Builder* of JVMObject:
  proc setHiddenFromAppOps*(hiddenFromAppOps: jboolean): Builder
  proc setAdasGnssBypass*(adasGnssBypass: jboolean): LastLocationRequest.Builder
  proc setLocationSettingsIgnored*(locationSettingsIgnored: jboolean): Builder
  proc build*(): LastLocationRequest


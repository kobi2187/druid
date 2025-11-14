import jnim

jclass android.telecom.GatewayInfo* of JVMObject:
  proc getGatewayProviderPackageName*(): string
  proc getGatewayAddress*(): Uri
  proc getOriginalAddress*(): Uri
  proc isEmpty*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[GatewayInfo] {.`static`.}


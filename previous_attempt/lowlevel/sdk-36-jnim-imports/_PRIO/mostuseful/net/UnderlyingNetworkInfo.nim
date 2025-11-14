import jnim

jclass android.net.UnderlyingNetworkInfo* of JVMObject:
  proc getOwnerUid*(): jint
  proc getInterface*(): string
  proc getUnderlyingInterfaces*(): List[string]
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[UnderlyingNetworkInfo] {.`static`.}


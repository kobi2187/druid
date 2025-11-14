import jnim

jclass android.net.NetworkStateSnapshot* of JVMObject:
  proc getNetwork*(): Network
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc getLinkProperties*(): LinkProperties
  proc getSubscriberId*(): string
  proc getSubId*(): jint
  proc getLegacyType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[NetworkStateSnapshot] {.`static`.}


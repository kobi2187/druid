import jnim

jclass android.net.EthernetNetworkSpecifier* of NetworkSpecifier:
  proc getInterfaceName*(): string
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[EthernetNetworkSpecifier] {.`static`.}


import jnim

jclass android.net.TestNetworkSpecifier* of NetworkSpecifier:
  proc getInterfaceName*(): string
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[TestNetworkSpecifier] {.`static`.}


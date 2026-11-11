import jnim

jclass android.net.StringNetworkSpecifier* of NetworkSpecifier:
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  specifier*: string
  CREATOR*: Parcelable.Creator[StringNetworkSpecifier] {.`static`.}


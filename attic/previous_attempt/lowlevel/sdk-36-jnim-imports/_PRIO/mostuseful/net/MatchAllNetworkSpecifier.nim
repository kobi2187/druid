import jnim

jclass android.net.MatchAllNetworkSpecifier* of NetworkSpecifier:
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[MatchAllNetworkSpecifier] {.`static`.}


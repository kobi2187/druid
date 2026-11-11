import jnim

jclass android.net.EthernetNetworkManagementException* of RuntimeException:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[EthernetNetworkManagementException] {.`static`.}


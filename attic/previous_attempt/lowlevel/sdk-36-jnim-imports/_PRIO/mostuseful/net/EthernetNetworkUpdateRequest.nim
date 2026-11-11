import jnim

jclass android.net.EthernetNetworkUpdateRequest* of JVMObject:
  proc getIpConfiguration*(): IpConfiguration
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[EthernetNetworkUpdateRequest] {.`static`.}

jclass android.net.EthernetNetworkUpdateRequest.Builder* of JVMObject:
  proc setIpConfiguration*(ipConfig: IpConfiguration): Builder
  proc setNetworkCapabilities*(nc: NetworkCapabilities): Builder
  proc build*(): EthernetNetworkUpdateRequest

jclass android.net.Builder* of JVMObject:
  proc setIpConfiguration*(ipConfig: IpConfiguration): Builder
  proc setNetworkCapabilities*(nc: NetworkCapabilities): Builder
  proc build*(): EthernetNetworkUpdateRequest


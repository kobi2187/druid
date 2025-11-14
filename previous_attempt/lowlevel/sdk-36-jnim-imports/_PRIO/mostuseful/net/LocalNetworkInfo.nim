import jnim

jclass android.net.LocalNetworkInfo* of JVMObject:
  proc getUpstreamNetwork*(): Network
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[LocalNetworkInfo] {.`static`.}

jclass android.net.LocalNetworkInfo.Builder* of JVMObject:
  proc setUpstreamNetwork*(network: Network): Builder
  proc build*(): LocalNetworkInfo

jclass android.net.Builder* of JVMObject:
  proc setUpstreamNetwork*(network: Network): Builder
  proc build*(): LocalNetworkInfo


import jnim

jclass android.net.MulticastRoutingConfig* of JVMObject:
  proc getForwardingMode*(): jint
  proc getMinimumScope*(): jint
  proc getListeningAddresses*(): Set[Inet6Address]
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  FORWARD_NONE*: jint {.`static`.}
  FORWARD_SELECTED*: jint {.`static`.}
  FORWARD_WITH_MIN_SCOPE*: jint {.`static`.}
  MULTICAST_SCOPE_NONE*: jint {.`static`.}
  CONFIG_FORWARD_NONE*: MulticastRoutingConfig {.`static`.}
  CREATOR*: Creator[MulticastRoutingConfig] {.`static`.}

jclass android.net.MulticastRoutingConfig.Builder* of JVMObject:
  proc setMinimumScope*(scope: jint): Builder
  proc addListeningAddress*(address: Inet6Address): Builder
  proc clearListeningAddress*(address: Inet6Address): Builder
  proc build*(): MulticastRoutingConfig

jclass android.net.Builder* of JVMObject:
  proc setMinimumScope*(scope: jint): Builder
  proc addListeningAddress*(address: Inet6Address): Builder
  proc clearListeningAddress*(address: Inet6Address): Builder
  proc build*(): MulticastRoutingConfig


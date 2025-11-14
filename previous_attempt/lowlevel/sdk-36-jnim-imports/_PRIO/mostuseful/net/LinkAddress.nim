import jnim

jclass android.net.LinkAddress* of JVMObject:
  proc isIpv6*(): jboolean
  proc isIPv6*(): jboolean
  proc isIpv4*(): jboolean
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc isSameAddressAs*(other: LinkAddress): jboolean
  proc getAddress*(): InetAddress
  proc getPrefixLength*(): jint
  proc getNetworkPrefixLength*(): jint
  proc getFlags*(): jint
  proc getScope*(): jint
  proc getDeprecationTime*(): jlong
  proc getExpirationTime*(): jlong
  proc isGlobalPreferred*(): jboolean
  proc isPreferred*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  LIFETIME_UNKNOWN*: jlong {.`static`.}
  LIFETIME_PERMANENT*: jlong {.`static`.}
  CREATOR*: Creator[LinkAddress] {.`static`.}


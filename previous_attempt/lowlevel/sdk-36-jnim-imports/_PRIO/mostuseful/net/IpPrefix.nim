import jnim

jclass android.net.IpPrefix* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getAddress*(): InetAddress
  proc getRawAddress*(): seq[jbyte]
  proc getPrefixLength*(): jint
  proc contains*(address: InetAddress): jboolean
  proc containsPrefix*(otherPrefix: IpPrefix): jboolean
  proc isIPv6*(): jboolean
  proc isIPv4*(): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc lengthComparator*(): Comparator[IpPrefix] {.`static`.}
  CREATOR*: Creator[IpPrefix] {.`static`.}


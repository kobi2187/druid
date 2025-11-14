import jnim

jclass android.net.DhcpInfo* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ipAddress*: jint
  gateway*: jint
  netmask*: jint
  dns1*: jint
  dns2*: jint
  serverAddress*: jint
  leaseDuration*: jint
  CREATOR*: Creator[DhcpInfo] {.`static`.}


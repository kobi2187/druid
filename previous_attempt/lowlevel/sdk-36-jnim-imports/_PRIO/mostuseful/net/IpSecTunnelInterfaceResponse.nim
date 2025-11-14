import jnim

jclass android.net.IpSecTunnelInterfaceResponse* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  resourceId*: jint
  interfaceName*: string
  status*: jint
  CREATOR*: Parcelable.Creator[IpSecTunnelInterfaceResponse] {.`static`.}


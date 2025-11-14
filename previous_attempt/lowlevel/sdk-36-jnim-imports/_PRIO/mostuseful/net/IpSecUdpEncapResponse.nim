import jnim

jclass android.net.IpSecUdpEncapResponse* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  resourceId*: jint
  port*: jint
  status*: jint
  fileDescriptor*: ParcelFileDescriptor
  CREATOR*: Parcelable.Creator[IpSecUdpEncapResponse] {.`static`.}


import jnim

jclass android.net.IpSecSpiResponse* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  resourceId*: jint
  status*: jint
  spi*: jint
  CREATOR*: Parcelable.Creator[IpSecSpiResponse] {.`static`.}


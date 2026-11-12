import jnim

jclass android.net.TestNetworkInterface* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getFileDescriptor*(): ParcelFileDescriptor
  proc getInterfaceName*(): string
  proc getMacAddress*(): MacAddress
  proc getMtu*(): jint
  CREATOR*: Parcelable.Creator[TestNetworkInterface] {.`static`.}


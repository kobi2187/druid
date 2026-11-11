import jnim

jclass android.net.QosSocketInfo* of JVMObject:
  proc getNetwork*(): Network
  proc getParcelFileDescriptor*(): ParcelFileDescriptor
  proc getLocalSocketAddress*(): InetSocketAddress
  proc getRemoteSocketAddress*(): InetSocketAddress
  proc getSocketType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc writeToParcelWithoutFd*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[QosSocketInfo] {.`static`.}


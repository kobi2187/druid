import jnim

jclass android.net.ConnectionInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  protocol*: jint
  local*: InetSocketAddress
  remote*: InetSocketAddress
  CREATOR*: Creator[ConnectionInfo] {.`static`.}


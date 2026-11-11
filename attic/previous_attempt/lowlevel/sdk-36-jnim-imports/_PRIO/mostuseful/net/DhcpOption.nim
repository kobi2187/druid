import jnim

jclass android.net.DhcpOption* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getType*(): jbyte
  proc getValue*(): seq[jbyte]
  CREATOR*: Creator[DhcpOption] {.`static`.}


import jnim

jclass android.telecom.ParcelableRttCall* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getRttMode*(): jint
  proc getReceiveStream*(): ParcelFileDescriptor
  proc getTransmitStream*(): ParcelFileDescriptor
  CREATOR*: Creator[ParcelableRttCall] {.`static`.}


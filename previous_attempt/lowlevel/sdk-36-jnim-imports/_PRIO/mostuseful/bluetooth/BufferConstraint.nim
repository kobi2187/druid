import jnim

jclass android.bluetooth.BufferConstraint* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc getDefaultMillis*(): jint
  proc getMaxMillis*(): jint
  proc getMinMillis*(): jint
  CREATOR*: Parcelable.Creator[BufferConstraint] {.`static`.}


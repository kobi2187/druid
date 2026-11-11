import jnim

jclass android.bluetooth.UidTraffic* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setRxBytes*(bytes: jlong)
  proc setTxBytes*(bytes: jlong)
  proc addRxBytes*(bytes: jlong)
  proc addTxBytes*(bytes: jlong)
  proc getUid*(): jint
  proc getRxBytes*(): jlong
  proc getTxBytes*(): jlong
  proc describeContents*(): jint
  proc clone*(): UidTraffic
  proc toString*(): string
  CREATOR*: Creator[UidTraffic] {.`static`.}


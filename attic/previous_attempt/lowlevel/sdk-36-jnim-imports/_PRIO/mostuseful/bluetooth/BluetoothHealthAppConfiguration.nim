import jnim

jclass android.bluetooth.BluetoothHealthAppConfiguration* of JVMObject:
  proc describeContents*(): jint
  proc getDataType*(): jint
  proc getName*(): string
  proc getRole*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[BluetoothHealthAppConfiguration] {.`static`.}


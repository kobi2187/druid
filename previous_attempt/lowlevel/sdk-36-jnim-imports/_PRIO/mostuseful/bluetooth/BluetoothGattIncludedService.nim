import jnim

jclass android.bluetooth.BluetoothGattIncludedService* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getUuid*(): UUID
  proc getInstanceId*(): jint
  proc getType*(): jint
  CREATOR*: Creator[BluetoothGattIncludedService] {.`static`.}


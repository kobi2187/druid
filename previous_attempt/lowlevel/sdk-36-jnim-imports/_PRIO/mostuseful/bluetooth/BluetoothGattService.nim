import jnim

jclass android.bluetooth.BluetoothGattService* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc addService*(service: BluetoothGattService): jboolean
  proc addCharacteristic*(characteristic: BluetoothGattCharacteristic): jboolean
  proc setInstanceId*(instanceId: jint)
  proc setHandles*(handles: jint)
  proc addIncludedService*(includedService: BluetoothGattService)
  proc getUuid*(): UUID
  proc getInstanceId*(): jint
  proc getType*(): jint
  proc getIncludedServices*(): List[BluetoothGattService]
  proc getCharacteristics*(): List[BluetoothGattCharacteristic]
  proc getCharacteristic*(uuid: UUID): BluetoothGattCharacteristic
  proc isAdvertisePreferred*(): jboolean
  proc setAdvertisePreferred*(advertisePreferred: jboolean)
  SERVICE_TYPE_PRIMARY*: jint {.`static`.}
  SERVICE_TYPE_SECONDARY*: jint {.`static`.}
  CREATOR*: Creator[BluetoothGattService] {.`static`.}


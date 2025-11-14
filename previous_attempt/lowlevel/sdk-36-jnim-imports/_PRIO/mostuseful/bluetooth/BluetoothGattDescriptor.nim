import jnim

jclass android.bluetooth.BluetoothGattDescriptor* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getCharacteristic*(): BluetoothGattCharacteristic
  proc getUuid*(): UUID
  proc getInstanceId*(): jint
  proc setInstanceId*(instanceId: jint)
  proc getPermissions*(): jint
  proc getValue*(): seq[jbyte]
  proc setValue*(value: seq[jbyte]): jboolean
  ENABLE_NOTIFICATION_VALUE*: jbyte {.`static`.}
  ENABLE_INDICATION_VALUE*: jbyte {.`static`.}
  DISABLE_NOTIFICATION_VALUE*: jbyte {.`static`.}
  PERMISSION_READ*: jint {.`static`.}
  PERMISSION_READ_ENCRYPTED*: jint {.`static`.}
  PERMISSION_READ_ENCRYPTED_MITM*: jint {.`static`.}
  PERMISSION_WRITE*: jint {.`static`.}
  PERMISSION_WRITE_ENCRYPTED*: jint {.`static`.}
  PERMISSION_WRITE_ENCRYPTED_MITM*: jint {.`static`.}
  PERMISSION_WRITE_SIGNED*: jint {.`static`.}
  PERMISSION_WRITE_SIGNED_MITM*: jint {.`static`.}
  CREATOR*: Creator[BluetoothGattDescriptor] {.`static`.}


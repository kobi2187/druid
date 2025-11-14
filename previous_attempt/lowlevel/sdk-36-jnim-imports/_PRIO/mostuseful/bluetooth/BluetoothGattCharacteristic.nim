import jnim

jclass android.bluetooth.BluetoothGattCharacteristic* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getKeySize*(): jint
  proc addDescriptor*(descriptor: BluetoothGattDescriptor): jboolean
  proc getService*(): BluetoothGattService
  proc getUuid*(): UUID
  proc getInstanceId*(): jint
  proc setInstanceId*(instanceId: jint)
  proc getProperties*(): jint
  proc getPermissions*(): jint
  proc getWriteType*(): jint
  proc setWriteType*(writeType: jint)
  proc setKeySize*(keySize: jint)
  proc getDescriptors*(): List[BluetoothGattDescriptor]
  proc getDescriptor*(uuid: UUID): BluetoothGattDescriptor
  proc getValue*(): seq[jbyte]
  proc getIntValue*(formatType: jint, offset: jint): Integer
  proc getFloatValue*(formatType: jint, offset: jint): Float
  proc getStringValue*(offset: jint): string
  proc setValue*(value: seq[jbyte]): jboolean
  proc setValue*(value: jint, formatType: jint, offset: jint): jboolean
  proc setValue*(mantissa: jint, exponent: jint, formatType: jint, offset: jint): jboolean
  proc setValue*(value: string): jboolean
  PROPERTY_BROADCAST*: jint {.`static`.}
  PROPERTY_READ*: jint {.`static`.}
  PROPERTY_WRITE_NO_RESPONSE*: jint {.`static`.}
  PROPERTY_WRITE*: jint {.`static`.}
  PROPERTY_NOTIFY*: jint {.`static`.}
  PROPERTY_INDICATE*: jint {.`static`.}
  PROPERTY_SIGNED_WRITE*: jint {.`static`.}
  PROPERTY_EXTENDED_PROPS*: jint {.`static`.}
  PERMISSION_READ*: jint {.`static`.}
  PERMISSION_READ_ENCRYPTED*: jint {.`static`.}
  PERMISSION_READ_ENCRYPTED_MITM*: jint {.`static`.}
  PERMISSION_WRITE*: jint {.`static`.}
  PERMISSION_WRITE_ENCRYPTED*: jint {.`static`.}
  PERMISSION_WRITE_ENCRYPTED_MITM*: jint {.`static`.}
  PERMISSION_WRITE_SIGNED*: jint {.`static`.}
  PERMISSION_WRITE_SIGNED_MITM*: jint {.`static`.}
  WRITE_TYPE_DEFAULT*: jint {.`static`.}
  WRITE_TYPE_NO_RESPONSE*: jint {.`static`.}
  WRITE_TYPE_SIGNED*: jint {.`static`.}
  FORMAT_UINT8*: jint {.`static`.}
  FORMAT_UINT16*: jint {.`static`.}
  FORMAT_UINT32*: jint {.`static`.}
  FORMAT_SINT8*: jint {.`static`.}
  FORMAT_SINT16*: jint {.`static`.}
  FORMAT_SINT32*: jint {.`static`.}
  FORMAT_SFLOAT*: jint {.`static`.}
  FORMAT_FLOAT*: jint {.`static`.}
  CREATOR*: Creator[BluetoothGattCharacteristic] {.`static`.}


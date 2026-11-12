import jnim

jclass android.companion.BluetoothDeviceFilter* of JVMObject:
  proc matches*(device: BluetoothDevice): jboolean
  proc getDeviceDisplayName*(device: BluetoothDevice): string
  proc getMediumType*(): jint
  proc getNamePattern*(): Pattern
  proc getAddress*(): string
  proc getServiceUuids*(): List[ParcelUuid]
  proc getServiceUuidMasks*(): List[ParcelUuid]
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  CREATOR*: Creator[BluetoothDeviceFilter] {.`static`.}

jclass android.companion.BluetoothDeviceFilter.Builder* of JVMObject:
  proc setNamePattern*(regex: Pattern): Builder
  proc setAddress*(address: string): Builder
  proc addServiceUuid*(serviceUuid: ParcelUuid, serviceUuidMask: ParcelUuid): Builder
  proc build*(): BluetoothDeviceFilter

jclass android.companion.Builder* of OneTimeUseBuilder:
  proc setNamePattern*(regex: Pattern): Builder
  proc setAddress*(address: string): Builder
  proc addServiceUuid*(serviceUuid: ParcelUuid, serviceUuidMask: ParcelUuid): Builder
  proc build*(): BluetoothDeviceFilter


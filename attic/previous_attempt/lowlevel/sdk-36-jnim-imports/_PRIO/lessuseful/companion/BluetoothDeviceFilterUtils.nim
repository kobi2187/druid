import jnim

jclass android.companion.BluetoothDeviceFilterUtils* of JVMObject:
  proc getDeviceDisplayNameInternal*(device: BluetoothDevice): string {.`static`.}
  proc getDeviceDisplayNameInternal*(device: ScanResult): string {.`static`.}
  proc getDeviceMacAddress*(device: Parcelable): string {.`static`.}
  proc uuidsMaskedEquals*(data: UUID, uuid: UUID, mask: UUID): jboolean {.`static`.}


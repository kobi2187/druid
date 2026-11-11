import jnim

jclass android.bluetooth.BluetoothHidDeviceAppSdpSettings* of JVMObject:
  proc getName*(): string
  proc getDescription*(): string
  proc getProvider*(): string
  proc getSubclass*(): jbyte
  proc getDescriptors*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[BluetoothHidDeviceAppSdpSettings] {.`static`.}


import jnim

jclass android.companion.AssociatedDevice* of JVMObject:
  proc getBluetoothDevice*(): BluetoothDevice
  proc getBleDevice*(): android.bluetooth.le.ScanResult
  proc getWifiDevice*(): android.net.wifi.ScanResult
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[AssociatedDevice] {.`static`.}


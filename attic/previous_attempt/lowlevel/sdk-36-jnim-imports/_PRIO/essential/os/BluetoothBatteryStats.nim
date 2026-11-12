import jnim

jclass android.os.BluetoothBatteryStats* of JVMObject:
  proc getUidStats*(): List[UidStats]
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[BluetoothBatteryStats] {.`static`.}

jclass android.os.BluetoothBatteryStats.UidStats* of JVMObject:
  proc toString*(): string

jclass android.os.UidStats* of JVMObject:
  proc toString*(): string
  uid*: jint
  scanTimeMs*: jlong
  unoptimizedScanTimeMs*: jlong
  scanResultCount*: jint
  rxTimeMs*: jlong
  txTimeMs*: jlong


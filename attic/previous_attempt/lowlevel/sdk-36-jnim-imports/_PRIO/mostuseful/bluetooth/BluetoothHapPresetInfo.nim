import jnim

jclass android.bluetooth.BluetoothHapPresetInfo* of JVMObject:
  proc getIndex*(): jint
  proc getName*(): string
  proc isWritable*(): jboolean
  proc isAvailable*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[BluetoothHapPresetInfo] {.`static`.}

jclass android.bluetooth.BluetoothHapPresetInfo.Builder* of JVMObject:
  proc setWritable*(isWritable: jboolean): Builder
  proc setAvailable*(isAvailable: jboolean): Builder
  proc build*(): BluetoothHapPresetInfo

jclass android.bluetooth.Builder* of JVMObject:
  proc setWritable*(isWritable: jboolean): Builder
  proc setAvailable*(isAvailable: jboolean): Builder
  proc build*(): BluetoothHapPresetInfo


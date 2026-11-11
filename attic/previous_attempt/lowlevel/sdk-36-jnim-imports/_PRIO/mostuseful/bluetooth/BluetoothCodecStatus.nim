import jnim

jclass android.bluetooth.BluetoothCodecStatus* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc isCodecConfigSelectable*(codecConfig: BluetoothCodecConfig): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getCodecConfig*(): BluetoothCodecConfig
  proc getCodecsLocalCapabilities*(): List[BluetoothCodecConfig]
  proc getCodecsSelectableCapabilities*(): List[BluetoothCodecConfig]
  EXTRA_CODEC_STATUS*: string {.`static`.}
  CREATOR*: Creator[BluetoothCodecStatus] {.`static`.}

jclass android.bluetooth.BluetoothCodecStatus.Builder* of JVMObject:
  proc setCodecConfig*(codecConfig: BluetoothCodecConfig): Builder
  proc setCodecsLocalCapabilities*(codecsLocalCapabilities: List[BluetoothCodecConfig]): Builder
  proc setCodecsSelectableCapabilities*(codecsSelectableCapabilities: List[BluetoothCodecConfig]): Builder
  proc build*(): BluetoothCodecStatus

jclass android.bluetooth.Builder* of JVMObject:
  proc setCodecConfig*(codecConfig: BluetoothCodecConfig): Builder
  proc setCodecsLocalCapabilities*(codecsLocalCapabilities: List[BluetoothCodecConfig]): Builder
  proc setCodecsSelectableCapabilities*(codecsSelectableCapabilities: List[BluetoothCodecConfig]): Builder
  proc build*(): BluetoothCodecStatus


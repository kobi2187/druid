import jnim

jclass android.bluetooth.BluetoothLeAudioCodecStatus* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc isInputCodecConfigSelectable*(codecConfig: BluetoothLeAudioCodecConfig): jboolean
  proc isOutputCodecConfigSelectable*(codecConfig: BluetoothLeAudioCodecConfig): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getInputCodecConfig*(): BluetoothLeAudioCodecConfig
  proc getOutputCodecConfig*(): BluetoothLeAudioCodecConfig
  proc getInputCodecLocalCapabilities*(): List[BluetoothLeAudioCodecConfig]
  proc getOutputCodecLocalCapabilities*(): List[BluetoothLeAudioCodecConfig]
  proc getInputCodecSelectableCapabilities*(): List[BluetoothLeAudioCodecConfig]
  proc getOutputCodecSelectableCapabilities*(): List[BluetoothLeAudioCodecConfig]
  EXTRA_LE_AUDIO_CODEC_STATUS*: string {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothLeAudioCodecStatus] {.`static`.}


import jnim

jclass android.bluetooth.BluetoothLeBroadcastSubgroup* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getCodecId*(): jlong
  proc getCodecSpecificConfig*(): BluetoothLeAudioCodecConfigMetadata
  proc getContentMetadata*(): BluetoothLeAudioContentMetadata
  proc hasChannelPreference*(): jboolean
  proc getChannels*(): List[BluetoothLeBroadcastChannel]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[BluetoothLeBroadcastSubgroup] {.`static`.}

jclass android.bluetooth.BluetoothLeBroadcastSubgroup.Builder* of JVMObject:
  proc setCodecId*(codecId: jlong): Builder
  proc setCodecSpecificConfig*(codecSpecificConfig: BluetoothLeAudioCodecConfigMetadata): Builder
  proc setContentMetadata*(contentMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addChannel*(channel: BluetoothLeBroadcastChannel): Builder
  proc clearChannel*(): Builder
  proc build*(): BluetoothLeBroadcastSubgroup

jclass android.bluetooth.Builder* of JVMObject:
  proc setCodecId*(codecId: jlong): Builder
  proc setCodecSpecificConfig*(codecSpecificConfig: BluetoothLeAudioCodecConfigMetadata): Builder
  proc setContentMetadata*(contentMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addChannel*(channel: BluetoothLeBroadcastChannel): Builder
  proc clearChannel*(): Builder
  proc build*(): BluetoothLeBroadcastSubgroup


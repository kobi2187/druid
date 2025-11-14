import jnim

jclass android.bluetooth.BluetoothLeBroadcastChannel* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc isSelected*(): jboolean
  proc getChannelIndex*(): jint
  proc getCodecMetadata*(): BluetoothLeAudioCodecConfigMetadata
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[BluetoothLeBroadcastChannel] {.`static`.}

jclass android.bluetooth.BluetoothLeBroadcastChannel.Builder* of JVMObject:
  proc setSelected*(isSelected: jboolean): Builder
  proc setChannelIndex*(channelIndex: jint): Builder
  proc setCodecMetadata*(codecMetadata: BluetoothLeAudioCodecConfigMetadata): Builder
  proc build*(): BluetoothLeBroadcastChannel

jclass android.bluetooth.Builder* of JVMObject:
  proc setSelected*(isSelected: jboolean): Builder
  proc setChannelIndex*(channelIndex: jint): Builder
  proc setCodecMetadata*(codecMetadata: BluetoothLeAudioCodecConfigMetadata): Builder
  proc build*(): BluetoothLeBroadcastChannel


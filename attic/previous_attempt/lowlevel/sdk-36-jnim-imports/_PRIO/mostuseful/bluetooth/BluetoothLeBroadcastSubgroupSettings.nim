import jnim

jclass android.bluetooth.BluetoothLeBroadcastSubgroupSettings* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getContentMetadata*(): BluetoothLeAudioContentMetadata
  proc getPreferredQuality*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  QUALITY_STANDARD*: jint {.`static`.}
  QUALITY_HIGH*: jint {.`static`.}
  CREATOR*: Creator[BluetoothLeBroadcastSubgroupSettings] {.`static`.}

jclass android.bluetooth.BluetoothLeBroadcastSubgroupSettings.Builder* of JVMObject:
  proc setPreferredQuality*(preferredQuality: jint): Builder
  proc setContentMetadata*(contentMetadata: BluetoothLeAudioContentMetadata): Builder
  proc build*(): BluetoothLeBroadcastSubgroupSettings

jclass android.bluetooth.Builder* of JVMObject:
  proc setPreferredQuality*(preferredQuality: jint): Builder
  proc setContentMetadata*(contentMetadata: BluetoothLeAudioContentMetadata): Builder
  proc build*(): BluetoothLeBroadcastSubgroupSettings


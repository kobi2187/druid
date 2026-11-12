import jnim

jclass android.bluetooth.BluetoothLeBroadcastSettings* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc isPublicBroadcast*(): jboolean
  proc getBroadcastName*(): string
  proc getBroadcastCode*(): seq[jbyte]
  proc getPublicBroadcastMetadata*(): BluetoothLeAudioContentMetadata
  proc getSubgroupSettings*(): List[BluetoothLeBroadcastSubgroupSettings]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[BluetoothLeBroadcastSettings] {.`static`.}

jclass android.bluetooth.BluetoothLeBroadcastSettings.Builder* of JVMObject:
  proc setPublicBroadcast*(isPublicBroadcast: jboolean): Builder
  proc setBroadcastName*(broadcastName: string): Builder
  proc setBroadcastCode*(broadcastCode: seq[jbyte]): Builder
  proc setPublicBroadcastMetadata*(publicBroadcastMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addSubgroupSettings*(subgroupSettings: BluetoothLeBroadcastSubgroupSettings): Builder
  proc clearSubgroupSettings*(): Builder
  proc build*(): BluetoothLeBroadcastSettings

jclass android.bluetooth.Builder* of JVMObject:
  proc setPublicBroadcast*(isPublicBroadcast: jboolean): Builder
  proc setBroadcastName*(broadcastName: string): Builder
  proc setBroadcastCode*(broadcastCode: seq[jbyte]): Builder
  proc setPublicBroadcastMetadata*(publicBroadcastMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addSubgroupSettings*(subgroupSettings: BluetoothLeBroadcastSubgroupSettings): Builder
  proc clearSubgroupSettings*(): Builder
  proc build*(): BluetoothLeBroadcastSettings


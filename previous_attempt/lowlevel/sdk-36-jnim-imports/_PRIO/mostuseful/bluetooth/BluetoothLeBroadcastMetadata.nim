import jnim

jclass android.bluetooth.BluetoothLeBroadcastMetadata* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getSourceAddressType*(): jint
  proc getSourceDevice*(): BluetoothDevice
  proc getSourceAdvertisingSid*(): jint
  proc getBroadcastId*(): jint
  proc getPaSyncInterval*(): jint
  proc isEncrypted*(): jboolean
  proc isPublicBroadcast*(): jboolean
  proc getBroadcastName*(): string
  proc getBroadcastCode*(): seq[jbyte]
  proc getPresentationDelayMicros*(): jint
  proc getAudioConfigQuality*(): jint
  proc getRssi*(): jint
  proc getPublicBroadcastMetadata*(): BluetoothLeAudioContentMetadata
  proc getSubgroups*(): List[BluetoothLeBroadcastSubgroup]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  AUDIO_CONFIG_QUALITY_NONE*: jint {.`static`.}
  AUDIO_CONFIG_QUALITY_STANDARD*: jint {.`static`.}
  AUDIO_CONFIG_QUALITY_HIGH*: jint {.`static`.}
  PA_SYNC_INTERVAL_UNKNOWN*: jint {.`static`.}
  RSSI_UNKNOWN*: jint {.`static`.}
  CREATOR*: Creator[BluetoothLeBroadcastMetadata] {.`static`.}

jclass android.bluetooth.BluetoothLeBroadcastMetadata.Builder* of JVMObject:
  proc setSourceDevice*(sourceDevice: BluetoothDevice, sourceAddressType: jint): Builder
  proc setSourceAdvertisingSid*(sourceAdvertisingSid: jint): Builder
  proc setBroadcastId*(broadcastId: jint): Builder
  proc setPaSyncInterval*(paSyncInterval: jint): Builder
  proc setEncrypted*(isEncrypted: jboolean): Builder
  proc setPublicBroadcast*(isPublicBroadcast: jboolean): Builder
  proc setBroadcastName*(broadcastName: string): Builder
  proc setBroadcastCode*(broadcastCode: seq[jbyte]): Builder
  proc setPresentationDelayMicros*(presentationDelayMicros: jint): Builder
  proc setAudioConfigQuality*(audioConfigQuality: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setPublicBroadcastMetadata*(publicBroadcastMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addSubgroup*(subgroup: BluetoothLeBroadcastSubgroup): Builder
  proc clearSubgroup*(): Builder
  proc build*(): BluetoothLeBroadcastMetadata

jclass android.bluetooth.Builder* of JVMObject:
  proc setSourceDevice*(sourceDevice: BluetoothDevice, sourceAddressType: jint): Builder
  proc setSourceAdvertisingSid*(sourceAdvertisingSid: jint): Builder
  proc setBroadcastId*(broadcastId: jint): Builder
  proc setPaSyncInterval*(paSyncInterval: jint): Builder
  proc setEncrypted*(isEncrypted: jboolean): Builder
  proc setPublicBroadcast*(isPublicBroadcast: jboolean): Builder
  proc setBroadcastName*(broadcastName: string): Builder
  proc setBroadcastCode*(broadcastCode: seq[jbyte]): Builder
  proc setPresentationDelayMicros*(presentationDelayMicros: jint): Builder
  proc setAudioConfigQuality*(audioConfigQuality: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setPublicBroadcastMetadata*(publicBroadcastMetadata: BluetoothLeAudioContentMetadata): Builder
  proc addSubgroup*(subgroup: BluetoothLeBroadcastSubgroup): Builder
  proc clearSubgroup*(): Builder
  proc build*(): BluetoothLeBroadcastMetadata


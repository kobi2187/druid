import jnim

jclass android.bluetooth.BluetoothLeAudioContentMetadata* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getProgramInfo*(): string
  proc getLanguage*(): string
  proc getRawMetadata*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc fromRawBytes*(rawBytes: seq[jbyte]): BluetoothLeAudioContentMetadata {.`static`.}
  CREATOR*: Creator[BluetoothLeAudioContentMetadata] {.`static`.}

jclass android.bluetooth.BluetoothLeAudioContentMetadata.Builder* of JVMObject:
  proc setProgramInfo*(programInfo: string): Builder
  proc setLanguage*(language: string): Builder
  proc build*(): BluetoothLeAudioContentMetadata

jclass android.bluetooth.Builder* of JVMObject:
  proc setProgramInfo*(programInfo: string): Builder
  proc setLanguage*(language: string): Builder
  proc build*(): BluetoothLeAudioContentMetadata


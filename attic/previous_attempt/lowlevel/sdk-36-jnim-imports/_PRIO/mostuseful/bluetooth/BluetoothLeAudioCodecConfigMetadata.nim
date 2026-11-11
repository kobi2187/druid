import jnim

jclass android.bluetooth.BluetoothLeAudioCodecConfigMetadata* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getAudioLocation*(): jlong
  proc getSampleRate*(): jint
  proc getFrameDuration*(): jint
  proc getOctetsPerFrame*(): jint
  proc getRawMetadata*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc fromRawBytes*(rawBytes: seq[jbyte]): BluetoothLeAudioCodecConfigMetadata {.`static`.}
  CREATOR*: Creator[BluetoothLeAudioCodecConfigMetadata] {.`static`.}

jclass android.bluetooth.BluetoothLeAudioCodecConfigMetadata.Builder* of JVMObject:
  proc setAudioLocation*(audioLocation: jlong): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setFrameDuration*(frameDuration: jint): Builder
  proc setOctetsPerFrame*(octetsPerFrame: jint): Builder
  proc build*(): BluetoothLeAudioCodecConfigMetadata

jclass android.bluetooth.Builder* of JVMObject:
  proc setAudioLocation*(audioLocation: jlong): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setFrameDuration*(frameDuration: jint): Builder
  proc setOctetsPerFrame*(octetsPerFrame: jint): Builder
  proc build*(): BluetoothLeAudioCodecConfigMetadata


import jnim

jclass android.bluetooth.BluetoothAudioConfig* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getSampleRate*(): jint
  proc getChannelConfig*(): jint
  proc getAudioFormat*(): jint
  CREATOR*: Creator[BluetoothAudioConfig] {.`static`.}


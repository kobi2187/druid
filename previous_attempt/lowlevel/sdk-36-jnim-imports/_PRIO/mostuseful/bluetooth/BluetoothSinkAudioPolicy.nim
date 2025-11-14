import jnim

jclass android.bluetooth.BluetoothSinkAudioPolicy* of JVMObject:
  proc getCallEstablishPolicy*(): jint
  proc getActiveDevicePolicyAfterConnection*(): jint
  proc getInBandRingtonePolicy*(): jint
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  POLICY_UNCONFIGURED*: jint {.`static`.}
  POLICY_ALLOWED*: jint {.`static`.}
  POLICY_NOT_ALLOWED*: jint {.`static`.}
  HFP_SET_SINK_AUDIO_POLICY_ID*: string {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothSinkAudioPolicy] {.`static`.}

jclass android.bluetooth.BluetoothSinkAudioPolicy.Builder* of JVMObject:
  proc setCallEstablishPolicy*(callEstablishPolicy: jint): Builder
  proc setActiveDevicePolicyAfterConnection*(connectingTimePolicy: jint): Builder
  proc setInBandRingtonePolicy*(inBandRingtonePolicy: jint): Builder
  proc build*(): BluetoothSinkAudioPolicy

jclass android.bluetooth.Builder* of JVMObject:
  proc setCallEstablishPolicy*(callEstablishPolicy: jint): Builder
  proc setActiveDevicePolicyAfterConnection*(connectingTimePolicy: jint): Builder
  proc setInBandRingtonePolicy*(inBandRingtonePolicy: jint): Builder
  proc build*(): BluetoothSinkAudioPolicy


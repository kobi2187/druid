import jnim

jclass android.media.AudioRecordingConfiguration* of JVMObject:
  proc dump*(pw: PrintWriter)
  proc toLogFriendlyString*(arc: AudioRecordingConfiguration): string {.`static`.}
  proc anonymizedCopy*(in: AudioRecordingConfiguration): AudioRecordingConfiguration {.`static`.}
  proc getClientAudioSource*(): jint
  proc getClientAudioSessionId*(): jint
  proc getFormat*(): AudioFormat
  proc getClientFormat*(): AudioFormat
  proc getClientPackageName*(): string
  proc getClientUid*(): jint
  proc getAudioDevice*(): AudioDeviceInfo
  proc getClientPortId*(): jint
  proc isClientSilenced*(): jboolean
  proc getAudioSource*(): jint
  proc getClientEffects*(): List[AudioEffect.Descriptor]
  proc getEffects*(): List[AudioEffect.Descriptor]
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  CREATOR*: Parcelable.Creator[AudioRecordingConfiguration] {.`static`.}


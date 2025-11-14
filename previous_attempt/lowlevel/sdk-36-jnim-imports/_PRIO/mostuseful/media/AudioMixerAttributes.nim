import jnim

jclass android.media.AudioMixerAttributes* of JVMObject:
  proc getFormat*(): AudioFormat
  proc getMixerBehavior*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  MIXER_BEHAVIOR_DEFAULT*: jint {.`static`.}
  MIXER_BEHAVIOR_BIT_PERFECT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioMixerAttributes] {.`static`.}

jclass android.media.AudioMixerAttributes.Builder* of JVMObject:
  proc build*(): AudioMixerAttributes
  proc setMixerBehavior*(mixerBehavior: jint): Builder

jclass android.media.Builder* of JVMObject:
  proc build*(): AudioMixerAttributes
  proc setMixerBehavior*(mixerBehavior: jint): Builder


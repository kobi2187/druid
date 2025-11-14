import jnim

jclass android.media.AudioProfile* of JVMObject:
  proc getFormat*(): jint
  proc getChannelMasks*(): seq[jint]
  proc getChannelIndexMasks*(): seq[jint]
  proc getSampleRates*(): seq[jint]
  proc getEncapsulationType*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  AUDIO_ENCAPSULATION_TYPE_NONE*: jint {.`static`.}
  AUDIO_ENCAPSULATION_TYPE_IEC61937*: jint {.`static`.}
  AUDIO_ENCAPSULATION_TYPE_PCM*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioProfile] {.`static`.}


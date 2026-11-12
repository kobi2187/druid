import jnim

jclass android.media.AudioPort* of JVMObject:
  proc id*(): jint
  proc role*(): jint
  proc name*(): string
  proc samplingRates*(): seq[jint]
  proc channelMasks*(): seq[jint]
  proc channelIndexMasks*(): seq[jint]
  proc formats*(): seq[jint]
  proc profiles*(): List[AudioProfile]
  proc audioDescriptors*(): List[AudioDescriptor]
  proc gains*(): seq[AudioGain]
  proc buildConfig*(samplingRate: jint, channelMask: jint, format: jint, gain: AudioGainConfig): AudioPortConfig
  proc activeConfig*(): AudioPortConfig
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  ROLE_NONE*: jint {.`static`.}
  ROLE_SOURCE*: jint {.`static`.}
  ROLE_SINK*: jint {.`static`.}
  TYPE_NONE*: jint {.`static`.}
  TYPE_DEVICE*: jint {.`static`.}
  TYPE_SUBMIX*: jint {.`static`.}
  TYPE_SESSION*: jint {.`static`.}


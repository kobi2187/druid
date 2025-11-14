import jnim

jclass android.media.AudioDevicePort* of AudioPort:
  proc createForTesting*(type: jint, name: string, address: string): AudioDevicePort {.`static`.}
  proc createForTesting*(speakerLayoutChannelMask: jint): AudioDevicePort {.`static`.}
  proc type*(): jint
  proc address*(): string
  proc speakerLayoutChannelMask*(): jint
  proc encapsulationModes*(): seq[jint]
  proc encapsulationMetadataTypes*(): seq[jint]
  proc buildConfig*(samplingRate: jint, channelMask: jint, format: jint, gain: AudioGainConfig): AudioDevicePortConfig
  proc equals*(o: JObject): jboolean
  proc isSameAs*(other: AudioDevicePort): jboolean
  proc toString*(): string


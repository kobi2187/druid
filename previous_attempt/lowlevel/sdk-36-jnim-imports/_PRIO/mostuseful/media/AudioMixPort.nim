import jnim

jclass android.media.AudioMixPort* of AudioPort:
  proc buildConfig*(samplingRate: jint, channelMask: jint, format: jint, gain: AudioGainConfig): AudioMixPortConfig
  proc ioHandle*(): jint
  proc equals*(o: JObject): jboolean


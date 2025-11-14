import jnim

jclass android.media.LoudnessCodecDispatcher* of JVMObject:
  proc register*(register: jboolean)
  proc addLoudnessCodecListener*(configurator: LoudnessCodecController, executor: Executor, listener: OnLoudnessCodecUpdateListener)
  proc removeLoudnessCodecListener*(configurator: LoudnessCodecController)
  proc startLoudnessCodecUpdates*(sessionId: jint)
  proc stopLoudnessCodecUpdates*(sessionId: jint)
  proc addLoudnessCodecInfo*(sessionId: jint, mediaCodecHash: jint, mcInfo: LoudnessCodecInfo)
  proc removeLoudnessCodecInfo*(sessionId: jint, mcInfo: LoudnessCodecInfo)
  proc getLoudnessCodecParams*(mcInfo: LoudnessCodecInfo): Bundle


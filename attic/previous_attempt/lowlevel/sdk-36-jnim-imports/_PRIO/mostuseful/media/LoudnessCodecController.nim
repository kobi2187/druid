import jnim

jclass android.media.LoudnessCodecController* of JVMObject:
  proc create*(sessionId: jint): LoudnessCodecController {.`static`.}
  proc create*(sessionId: jint, executor: Executor, listener: OnLoudnessCodecUpdateListener): LoudnessCodecController {.`static`.}
  proc createForTesting*(sessionId: jint, executor: Executor, listener: OnLoudnessCodecUpdateListener, service: IAudioService): LoudnessCodecController {.`static`.}
  proc addMediaCodec*(mediaCodec: MediaCodec): jboolean
  proc removeMediaCodec*(mediaCodec: MediaCodec)
  proc getLoudnessCodecParams*(mediaCodec: MediaCodec): Bundle
  proc close*()


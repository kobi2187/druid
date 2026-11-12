import jnim

jclass android.media.EncoderCapabilities* of JVMObject:
  proc getOutputFileFormats*(): seq[jint] {.`static`.}
  proc getVideoEncoders*(): List[VideoEncoderCap] {.`static`.}
  proc getAudioEncoders*(): List[AudioEncoderCap] {.`static`.}

jclass android.media.VideoEncoderCap* of JVMObject:
  mCodec*: jint
  mMinBitRate*: jint
  mMaxBitRate*: jint
  mMinFrameRate*: jint
  mMaxFrameRate*: jint
  mMinFrameWidth*: jint
  mMaxFrameWidth*: jint
  mMinFrameHeight*: jint
  mMaxFrameHeight*: jint

jclass android.media.AudioEncoderCap* of JVMObject:
  mCodec*: jint
  mMinChannels*: jint
  mMaxChannels*: jint
  mMinSampleRate*: jint
  mMaxSampleRate*: jint
  mMinBitRate*: jint
  mMaxBitRate*: jint


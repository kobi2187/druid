import jnim

jclass android.media.EncoderProfiles* of JVMObject:
  proc getDefaultDurationSeconds*(): jint
  proc getRecommendedFileFormat*(): jint
  proc getAudioProfiles*(): List[AudioProfile]
  proc getVideoProfiles*(): List[VideoProfile]

jclass android.media.EncoderProfiles.VideoProfile* of JVMObject:
  proc getCodec*(): jint
  proc getMediaType*(): string
  proc getBitrate*(): jint
  proc getFrameRate*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getProfile*(): jint
  proc getBitDepth*(): jint
  proc getChromaSubsampling*(): jint
  proc getHdrFormat*(): jint

jclass android.media.EncoderProfiles.AudioProfile* of JVMObject:
  proc getCodec*(): jint
  proc getMediaType*(): string
  proc getBitrate*(): jint
  proc getSampleRate*(): jint
  proc getChannels*(): jint
  proc getProfile*(): jint

jclass android.media.VideoProfile* of JVMObject:
  proc getCodec*(): jint
  proc getMediaType*(): string
  proc getBitrate*(): jint
  proc getFrameRate*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getProfile*(): jint
  proc getBitDepth*(): jint
  proc getChromaSubsampling*(): jint
  proc getHdrFormat*(): jint
  HDR_NONE*: jint {.`static`.}
  HDR_HLG*: jint {.`static`.}
  HDR_HDR10*: jint {.`static`.}
  HDR_HDR10PLUS*: jint {.`static`.}
  HDR_DOLBY_VISION*: jint {.`static`.}
  YUV_420*: jint {.`static`.}
  YUV_422*: jint {.`static`.}
  YUV_444*: jint {.`static`.}

jclass android.media.AudioProfile* of JVMObject:
  proc getCodec*(): jint
  proc getMediaType*(): string
  proc getBitrate*(): jint
  proc getSampleRate*(): jint
  proc getChannels*(): jint
  proc getProfile*(): jint


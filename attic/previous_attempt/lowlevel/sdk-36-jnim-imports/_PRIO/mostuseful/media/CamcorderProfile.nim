import jnim

jclass android.media.CamcorderProfile* of JVMObject:
  proc get*(quality: jint): CamcorderProfile {.`static`.}
  proc get*(cameraId: jint, quality: jint): CamcorderProfile {.`static`.}
  proc getAll*(cameraId: string, quality: jint): EncoderProfiles {.`static`.}
  proc hasProfile*(quality: jint): jboolean {.`static`.}
  proc hasProfile*(cameraId: jint, quality: jint): jboolean {.`static`.}
  QUALITY_LOW*: jint {.`static`.}
  QUALITY_HIGH*: jint {.`static`.}
  QUALITY_QCIF*: jint {.`static`.}
  QUALITY_CIF*: jint {.`static`.}
  QUALITY_480P*: jint {.`static`.}
  QUALITY_720P*: jint {.`static`.}
  QUALITY_1080P*: jint {.`static`.}
  QUALITY_QVGA*: jint {.`static`.}
  QUALITY_2160P*: jint {.`static`.}
  QUALITY_VGA*: jint {.`static`.}
  QUALITY_4KDCI*: jint {.`static`.}
  QUALITY_QHD*: jint {.`static`.}
  QUALITY_2K*: jint {.`static`.}
  QUALITY_8KUHD*: jint {.`static`.}
  QUALITY_TIME_LAPSE_LOW*: jint {.`static`.}
  QUALITY_TIME_LAPSE_HIGH*: jint {.`static`.}
  QUALITY_TIME_LAPSE_QCIF*: jint {.`static`.}
  QUALITY_TIME_LAPSE_CIF*: jint {.`static`.}
  QUALITY_TIME_LAPSE_480P*: jint {.`static`.}
  QUALITY_TIME_LAPSE_720P*: jint {.`static`.}
  QUALITY_TIME_LAPSE_1080P*: jint {.`static`.}
  QUALITY_TIME_LAPSE_QVGA*: jint {.`static`.}
  QUALITY_TIME_LAPSE_2160P*: jint {.`static`.}
  QUALITY_TIME_LAPSE_VGA*: jint {.`static`.}
  QUALITY_TIME_LAPSE_4KDCI*: jint {.`static`.}
  QUALITY_TIME_LAPSE_QHD*: jint {.`static`.}
  QUALITY_TIME_LAPSE_2K*: jint {.`static`.}
  QUALITY_TIME_LAPSE_8KUHD*: jint {.`static`.}
  QUALITY_HIGH_SPEED_LOW*: jint {.`static`.}
  QUALITY_HIGH_SPEED_HIGH*: jint {.`static`.}
  QUALITY_HIGH_SPEED_480P*: jint {.`static`.}
  QUALITY_HIGH_SPEED_720P*: jint {.`static`.}
  QUALITY_HIGH_SPEED_1080P*: jint {.`static`.}
  QUALITY_HIGH_SPEED_2160P*: jint {.`static`.}
  QUALITY_HIGH_SPEED_CIF*: jint {.`static`.}
  QUALITY_HIGH_SPEED_VGA*: jint {.`static`.}
  QUALITY_HIGH_SPEED_4KDCI*: jint {.`static`.}
  duration*: jint
  quality*: jint
  fileFormat*: jint
  videoCodec*: jint
  videoBitRate*: jint
  videoFrameRate*: jint
  videoFrameWidth*: jint
  videoFrameHeight*: jint
  audioCodec*: jint
  audioBitRate*: jint
  audioSampleRate*: jint
  audioChannels*: jint
  RETURN_ADVANCED_VIDEO_PROFILES*: jlong {.`static`.}


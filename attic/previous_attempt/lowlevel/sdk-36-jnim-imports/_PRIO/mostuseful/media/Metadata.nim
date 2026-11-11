import jnim

jclass android.media.Metadata* of JVMObject:
  proc parse*(parcel: Parcel): jboolean
  proc keySet*(): Set[Integer]
  proc has*(metadataId: jint): jboolean
  proc getString*(key: jint): string
  proc getInt*(key: jint): jint
  proc getBoolean*(key: jint): jboolean
  proc getLong*(key: jint): jlong
  proc getDouble*(key: jint): jdouble
  proc getByteArray*(key: jint): seq[jbyte]
  proc getDate*(key: jint): Date
  proc lastSytemId*(): jint {.`static`.}
  proc firstCustomId*(): jint {.`static`.}
  proc lastType*(): jint {.`static`.}
  ANY*: jint {.`static`.}
  PAUSE_AVAILABLE*: jint {.`static`.}
  SEEK_BACKWARD_AVAILABLE*: jint {.`static`.}
  SEEK_FORWARD_AVAILABLE*: jint {.`static`.}
  SEEK_AVAILABLE*: jint {.`static`.}
  TITLE*: jint {.`static`.}
  COMMENT*: jint {.`static`.}
  COPYRIGHT*: jint {.`static`.}
  ALBUM*: jint {.`static`.}
  ARTIST*: jint {.`static`.}
  AUTHOR*: jint {.`static`.}
  COMPOSER*: jint {.`static`.}
  GENRE*: jint {.`static`.}
  DATE*: jint {.`static`.}
  DURATION*: jint {.`static`.}
  CD_TRACK_NUM*: jint {.`static`.}
  CD_TRACK_MAX*: jint {.`static`.}
  RATING*: jint {.`static`.}
  ALBUM_ART*: jint {.`static`.}
  VIDEO_FRAME*: jint {.`static`.}
  BIT_RATE*: jint {.`static`.}
  AUDIO_BIT_RATE*: jint {.`static`.}
  VIDEO_BIT_RATE*: jint {.`static`.}
  AUDIO_SAMPLE_RATE*: jint {.`static`.}
  VIDEO_FRAME_RATE*: jint {.`static`.}
  MIME_TYPE*: jint {.`static`.}
  AUDIO_CODEC*: jint {.`static`.}
  VIDEO_CODEC*: jint {.`static`.}
  VIDEO_HEIGHT*: jint {.`static`.}
  VIDEO_WIDTH*: jint {.`static`.}
  NUM_TRACKS*: jint {.`static`.}
  DRM_CRIPPLED*: jint {.`static`.}
  MATCH_NONE*: Set[Integer] {.`static`.}
  MATCH_ALL*: Set[Integer] {.`static`.}
  STRING_VAL*: jint {.`static`.}
  INTEGER_VAL*: jint {.`static`.}
  BOOLEAN_VAL*: jint {.`static`.}
  LONG_VAL*: jint {.`static`.}
  DOUBLE_VAL*: jint {.`static`.}
  DATE_VAL*: jint {.`static`.}
  BYTE_ARRAY_VAL*: jint {.`static`.}


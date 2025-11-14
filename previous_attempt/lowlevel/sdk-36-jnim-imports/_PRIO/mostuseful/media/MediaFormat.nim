import jnim

jclass android.media.MediaFormat* of JVMObject:
  proc containsKey*(name: string): jboolean
  proc containsFeature*(name: string): jboolean
  proc getValueTypeForKey*(name: string): jint
  proc getNumber*(name: string): Number
  proc getNumber*(name: string, defaultValue: Number): Number
  proc getInteger*(name: string): jint
  proc getInteger*(name: string, defaultValue: jint): jint
  proc getLong*(name: string): jlong
  proc getLong*(name: string, defaultValue: jlong): jlong
  proc getFloat*(name: string): jfloat
  proc getFloat*(name: string, defaultValue: jfloat): jfloat
  proc getString*(name: string): string
  proc getString*(name: string, defaultValue: string): string
  proc getByteBuffer*(name: string): ByteBuffer
  proc getByteBuffer*(name: string, defaultValue: ByteBuffer): ByteBuffer
  proc getFeatureEnabled*(feature: string): jboolean
  proc setInteger*(name: string, value: jint)
  proc setLong*(name: string, value: jlong)
  proc setFloat*(name: string, value: jfloat)
  proc setString*(name: string, value: string)
  proc setByteBuffer*(name: string, bytes: ByteBuffer)
  proc removeKey*(name: string)
  proc removeFeature*(name: string)
  proc getKeys*(): java.util.Set[string]
  proc getFeatures*(): java.util.Set[string]
  proc setFeatureEnabled*(feature: string, enabled: jboolean)
  proc createAudioFormat*(mime: string, sampleRate: jint, channelCount: jint): MediaFormat {.`static`.}
  proc createSubtitleFormat*(mime: string, language: string): MediaFormat {.`static`.}
  proc createVideoFormat*(mime: string, width: jint, height: jint): MediaFormat {.`static`.}
  proc toString*(): string
  MIMETYPE_VIDEO_VP8*: string {.`static`.}
  MIMETYPE_VIDEO_VP9*: string {.`static`.}
  MIMETYPE_VIDEO_APV*: string {.`static`.}
  MIMETYPE_VIDEO_AV1*: string {.`static`.}
  MIMETYPE_VIDEO_AVC*: string {.`static`.}
  MIMETYPE_VIDEO_HEVC*: string {.`static`.}
  MIMETYPE_VIDEO_MPEG4*: string {.`static`.}
  MIMETYPE_VIDEO_H263*: string {.`static`.}
  MIMETYPE_VIDEO_MPEG2*: string {.`static`.}
  MIMETYPE_VIDEO_RAW*: string {.`static`.}
  MIMETYPE_VIDEO_DOLBY_VISION*: string {.`static`.}
  MIMETYPE_VIDEO_SCRAMBLED*: string {.`static`.}
  MIMETYPE_AUDIO_AMR_NB*: string {.`static`.}
  MIMETYPE_AUDIO_AMR_WB*: string {.`static`.}
  MIMETYPE_AUDIO_MPEG*: string {.`static`.}
  MIMETYPE_AUDIO_AAC*: string {.`static`.}
  MIMETYPE_AUDIO_QCELP*: string {.`static`.}
  MIMETYPE_AUDIO_VORBIS*: string {.`static`.}
  MIMETYPE_AUDIO_OPUS*: string {.`static`.}
  MIMETYPE_AUDIO_G711_ALAW*: string {.`static`.}
  MIMETYPE_AUDIO_G711_MLAW*: string {.`static`.}
  MIMETYPE_AUDIO_RAW*: string {.`static`.}
  MIMETYPE_AUDIO_FLAC*: string {.`static`.}
  MIMETYPE_AUDIO_MSGSM*: string {.`static`.}
  MIMETYPE_AUDIO_AC3*: string {.`static`.}
  MIMETYPE_AUDIO_EAC3*: string {.`static`.}
  MIMETYPE_AUDIO_EAC3_JOC*: string {.`static`.}
  MIMETYPE_AUDIO_AC4*: string {.`static`.}
  MIMETYPE_AUDIO_SCRAMBLED*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_MHA1*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_MHM1*: string {.`static`.}
  MIMETYPE_AUDIO_DTS*: string {.`static`.}
  MIMETYPE_AUDIO_DTS_HD*: string {.`static`.}
  MIMETYPE_AUDIO_DTS_UHD*: string {.`static`.}
  MIMETYPE_AUDIO_DRA*: string {.`static`.}
  MIMETYPE_AUDIO_DOLBY_MAT*: string {.`static`.}
  MIMETYPE_AUDIO_DOLBY_TRUEHD*: string {.`static`.}
  MIMETYPE_AUDIO_AAC_LC*: string {.`static`.}
  MIMETYPE_AUDIO_AAC_HE_V1*: string {.`static`.}
  MIMETYPE_AUDIO_AAC_HE_V2*: string {.`static`.}
  MIMETYPE_AUDIO_AAC_ELD*: string {.`static`.}
  MIMETYPE_AUDIO_AAC_XHE*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_BL_L3*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_BL_L4*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_LC_L3*: string {.`static`.}
  MIMETYPE_AUDIO_MPEGH_LC_L4*: string {.`static`.}
  MIMETYPE_AUDIO_IEC61937*: string {.`static`.}
  MIMETYPE_AUDIO_IAMF*: string {.`static`.}
  MIMETYPE_IMAGE_ANDROID_HEIC*: string {.`static`.}
  MIMETYPE_IMAGE_AVIF*: string {.`static`.}
  MIMETYPE_TEXT_VTT*: string {.`static`.}
  MIMETYPE_TEXT_SUBRIP*: string {.`static`.}
  MIMETYPE_TEXT_CEA_608*: string {.`static`.}
  MIMETYPE_TEXT_CEA_708*: string {.`static`.}
  LOG_SESSION_ID*: string {.`static`.}
  KEY_MIME*: string {.`static`.}
  KEY_CODECS_STRING*: string {.`static`.}
  KEY_LOW_LATENCY*: string {.`static`.}
  KEY_LANGUAGE*: string {.`static`.}
  KEY_CAPTION_SERVICE_NUMBER*: string {.`static`.}
  KEY_SAMPLE_RATE*: string {.`static`.}
  KEY_CHANNEL_COUNT*: string {.`static`.}
  KEY_WIDTH*: string {.`static`.}
  KEY_HEIGHT*: string {.`static`.}
  KEY_CROP_BOTTOM*: string {.`static`.}
  KEY_CROP_LEFT*: string {.`static`.}
  KEY_CROP_RIGHT*: string {.`static`.}
  KEY_CROP_TOP*: string {.`static`.}
  KEY_MAX_WIDTH*: string {.`static`.}
  KEY_MAX_HEIGHT*: string {.`static`.}
  KEY_MAX_INPUT_SIZE*: string {.`static`.}
  KEY_BUFFER_BATCH_MAX_OUTPUT_SIZE*: string {.`static`.}
  KEY_BUFFER_BATCH_THRESHOLD_OUTPUT_SIZE*: string {.`static`.}
  KEY_PIXEL_ASPECT_RATIO_WIDTH*: string {.`static`.}
  KEY_PIXEL_ASPECT_RATIO_HEIGHT*: string {.`static`.}
  KEY_BIT_RATE*: string {.`static`.}
  KEY_HARDWARE_AV_SYNC_ID*: string {.`static`.}
  KEY_MAX_BIT_RATE*: string {.`static`.}
  KEY_COLOR_FORMAT*: string {.`static`.}
  KEY_FRAME_RATE*: string {.`static`.}
  KEY_TILE_WIDTH*: string {.`static`.}
  KEY_TILE_HEIGHT*: string {.`static`.}
  KEY_GRID_ROWS*: string {.`static`.}
  KEY_GRID_COLUMNS*: string {.`static`.}
  KEY_PCM_ENCODING*: string {.`static`.}
  KEY_CAPTURE_RATE*: string {.`static`.}
  KEY_SLOW_MOTION_MARKERS*: string {.`static`.}
  KEY_I_FRAME_INTERVAL*: string {.`static`.}
  KEY_INTRA_REFRESH_PERIOD*: string {.`static`.}
  KEY_PREPEND_HEADER_TO_SYNC_FRAMES*: string {.`static`.}
  KEY_TEMPORAL_LAYERING*: string {.`static`.}
  KEY_STRIDE*: string {.`static`.}
  KEY_SLICE_HEIGHT*: string {.`static`.}
  KEY_REPEAT_PREVIOUS_FRAME_AFTER*: string {.`static`.}
  KEY_MAX_FPS_TO_ENCODER*: string {.`static`.}
  KEY_MAX_PTS_GAP_TO_ENCODER*: string {.`static`.}
  KEY_CREATE_INPUT_SURFACE_SUSPENDED*: string {.`static`.}
  KEY_PUSH_BLANK_BUFFERS_ON_STOP*: string {.`static`.}
  KEY_DURATION*: string {.`static`.}
  KEY_IS_ADTS*: string {.`static`.}
  KEY_CHANNEL_MASK*: string {.`static`.}
  KEY_MAX_OUTPUT_CHANNEL_COUNT*: string {.`static`.}
  KEY_ENCODER_DELAY*: string {.`static`.}
  KEY_ENCODER_PADDING*: string {.`static`.}
  KEY_AAC_PROFILE*: string {.`static`.}
  KEY_AAC_SBR_MODE*: string {.`static`.}
  KEY_AAC_MAX_OUTPUT_CHANNEL_COUNT*: string {.`static`.}
  KEY_AAC_DRC_TARGET_REFERENCE_LEVEL*: string {.`static`.}
  KEY_AAC_DRC_EFFECT_TYPE*: string {.`static`.}
  KEY_AAC_ENCODED_TARGET_LEVEL*: string {.`static`.}
  KEY_AAC_DRC_BOOST_FACTOR*: string {.`static`.}
  KEY_AAC_DRC_ATTENUATION_FACTOR*: string {.`static`.}
  KEY_AAC_DRC_HEAVY_COMPRESSION*: string {.`static`.}
  KEY_AAC_DRC_OUTPUT_LOUDNESS*: string {.`static`.}
  KEY_AAC_DRC_ALBUM_MODE*: string {.`static`.}
  KEY_FLAC_COMPRESSION_LEVEL*: string {.`static`.}
  KEY_MPEGH_PROFILE_LEVEL_INDICATION*: string {.`static`.}
  KEY_MPEGH_COMPATIBLE_SETS*: string {.`static`.}
  KEY_MPEGH_REFERENCE_CHANNEL_LAYOUT*: string {.`static`.}
  KEY_COMPLEXITY*: string {.`static`.}
  KEY_QUALITY*: string {.`static`.}
  KEY_PRIORITY*: string {.`static`.}
  KEY_OPERATING_RATE*: string {.`static`.}
  KEY_PROFILE*: string {.`static`.}
  KEY_LEVEL*: string {.`static`.}
  KEY_LATENCY*: string {.`static`.}
  KEY_OUTPUT_REORDER_DEPTH*: string {.`static`.}
  KEY_ROTATION*: string {.`static`.}
  KEY_BITRATE_MODE*: string {.`static`.}
  KEY_VIDEO_QP_MAX*: string {.`static`.}
  KEY_VIDEO_QP_MIN*: string {.`static`.}
  KEY_VIDEO_QP_I_MAX*: string {.`static`.}
  KEY_VIDEO_QP_I_MIN*: string {.`static`.}
  KEY_VIDEO_QP_P_MAX*: string {.`static`.}
  KEY_VIDEO_QP_P_MIN*: string {.`static`.}
  KEY_VIDEO_QP_B_MAX*: string {.`static`.}
  KEY_VIDEO_QP_B_MIN*: string {.`static`.}
  KEY_VIDEO_ENCODING_STATISTICS_LEVEL*: string {.`static`.}
  VIDEO_ENCODING_STATISTICS_LEVEL_NONE*: jint {.`static`.}
  VIDEO_ENCODING_STATISTICS_LEVEL_1*: jint {.`static`.}
  KEY_VIDEO_QP_AVERAGE*: string {.`static`.}
  KEY_PICTURE_TYPE*: string {.`static`.}
  PICTURE_TYPE_UNKNOWN*: jint {.`static`.}
  PICTURE_TYPE_I*: jint {.`static`.}
  PICTURE_TYPE_P*: jint {.`static`.}
  PICTURE_TYPE_B*: jint {.`static`.}
  KEY_AUDIO_SESSION_ID*: string {.`static`.}
  KEY_AUDIO_HW_SYNC*: string {.`static`.}
  KEY_IS_AUTOSELECT*: string {.`static`.}
  KEY_IS_DEFAULT*: string {.`static`.}
  KEY_IS_FORCED_SUBTITLE*: string {.`static`.}
  KEY_HAPTIC_CHANNEL_COUNT*: string {.`static`.}
  KEY_IS_TIMED_TEXT*: string {.`static`.}
  KEY_COLOR_STANDARD*: string {.`static`.}
  COLOR_STANDARD_BT709*: jint {.`static`.}
  COLOR_STANDARD_BT601_PAL*: jint {.`static`.}
  COLOR_STANDARD_BT601_NTSC*: jint {.`static`.}
  COLOR_STANDARD_BT2020*: jint {.`static`.}
  KEY_COLOR_TRANSFER*: string {.`static`.}
  COLOR_TRANSFER_LINEAR*: jint {.`static`.}
  COLOR_TRANSFER_SDR_VIDEO*: jint {.`static`.}
  COLOR_TRANSFER_ST2084*: jint {.`static`.}
  COLOR_TRANSFER_HLG*: jint {.`static`.}
  KEY_COLOR_RANGE*: string {.`static`.}
  COLOR_RANGE_LIMITED*: jint {.`static`.}
  COLOR_RANGE_FULL*: jint {.`static`.}
  KEY_HDR_STATIC_INFO*: string {.`static`.}
  KEY_HDR10_PLUS_INFO*: string {.`static`.}
  KEY_COLOR_TRANSFER_REQUEST*: string {.`static`.}
  KEY_TRACK_ID*: string {.`static`.}
  KEY_CA_SYSTEM_ID*: string {.`static`.}
  KEY_CA_SESSION_ID*: string {.`static`.}
  KEY_CA_PRIVATE_DATA*: string {.`static`.}
  KEY_MAX_B_FRAMES*: string {.`static`.}
  KEY_ALLOW_FRAME_DROP*: string {.`static`.}
  KEY_IMPORTANCE*: string {.`static`.}
  FLAG_SECURITY_MODEL_SANDBOXED*: jint {.`static`.}
  FLAG_SECURITY_MODEL_MEMORY_SAFE*: jint {.`static`.}
  FLAG_SECURITY_MODEL_TRUSTED_CONTENT_ONLY*: jint {.`static`.}
  KEY_SECURITY_MODEL*: string {.`static`.}
  KEY_NUM_SLOTS*: string {.`static`.}
  KEY_PICTURE_PROFILE_ID*: string {.`static`.}
  KEY_PICTURE_PROFILE_INSTANCE*: string {.`static`.}
  TYPE_NULL*: jint {.`static`.}
  TYPE_INTEGER*: jint {.`static`.}
  TYPE_LONG*: jint {.`static`.}
  TYPE_FLOAT*: jint {.`static`.}
  TYPE_STRING*: jint {.`static`.}
  TYPE_BYTE_BUFFER*: jint {.`static`.}
  KEY_FEATURE_*: string {.`static`.}

jclass android.media.MediaFormat.QpOffsetRect* of JVMObject:
  proc set*(contour: Rect, qpOffset: jint)
  proc flattenToString*(): string
  proc flattenToString*(qpOffsetRects: List[QpOffsetRect]): string {.`static`.}

jclass android.media.QpOffsetRect* of JVMObject:
  proc set*(contour: Rect, qpOffset: jint)
  proc flattenToString*(): string
  proc flattenToString*(qpOffsetRects: List[QpOffsetRect]): string {.`static`.}


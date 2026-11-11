import jnim

jclass android.media.AudioFormat* of JVMObject:
  proc toLogFriendlyEncoding*(enc: jint): string {.`static`.}
  proc inChannelMaskFromOutChannelMask*(outMask: jint): jint {.`static`.}
  proc channelCountFromInChannelMask*(mask: jint): jint {.`static`.}
  proc channelCountFromOutChannelMask*(mask: jint): jint {.`static`.}
  proc convertChannelOutMaskToNativeMask*(javaMask: jint): jint {.`static`.}
  proc convertNativeChannelMaskToOutMask*(nativeMask: jint): jint {.`static`.}
  proc javaChannelOutMaskToString*(javaMask: jint): string {.`static`.}
  proc getBytesPerSample*(audioFormat: jint): jint {.`static`.}
  proc isValidEncoding*(audioFormat: jint): jboolean {.`static`.}
  proc isPublicEncoding*(audioFormat: jint): jboolean {.`static`.}
  proc isEncodingLinearPcm*(audioFormat: jint): jboolean {.`static`.}
  proc isEncodingLinearFrames*(audioFormat: jint): jboolean {.`static`.}
  proc filterPublicFormats*(formats: seq[jint]): seq[jint] {.`static`.}
  proc getEncoding*(): jint
  proc getSampleRate*(): jint
  proc getChannelMask*(): jint
  proc getChannelIndexMask*(): jint
  proc getChannelCount*(): jint
  proc getFrameSizeInBytes*(): jint
  proc getPropertySetMask*(): jint
  proc toLogFriendlyString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc toDisplayName*(audioFormat: jint): string {.`static`.}
  ENCODING_INVALID*: jint {.`static`.}
  ENCODING_DEFAULT*: jint {.`static`.}
  ENCODING_PCM_16BIT*: jint {.`static`.}
  ENCODING_PCM_8BIT*: jint {.`static`.}
  ENCODING_PCM_FLOAT*: jint {.`static`.}
  ENCODING_AC3*: jint {.`static`.}
  ENCODING_E_AC3*: jint {.`static`.}
  ENCODING_DTS*: jint {.`static`.}
  ENCODING_DTS_HD*: jint {.`static`.}
  ENCODING_MP3*: jint {.`static`.}
  ENCODING_AAC_LC*: jint {.`static`.}
  ENCODING_AAC_HE_V1*: jint {.`static`.}
  ENCODING_AAC_HE_V2*: jint {.`static`.}
  ENCODING_IEC61937*: jint {.`static`.}
  ENCODING_DOLBY_TRUEHD*: jint {.`static`.}
  ENCODING_AAC_ELD*: jint {.`static`.}
  ENCODING_AAC_XHE*: jint {.`static`.}
  ENCODING_AC4*: jint {.`static`.}
  ENCODING_E_AC3_JOC*: jint {.`static`.}
  ENCODING_DOLBY_MAT*: jint {.`static`.}
  ENCODING_OPUS*: jint {.`static`.}
  ENCODING_LEGACY_SHORT_ARRAY_THRESHOLD*: jint {.`static`.}
  ENCODING_PCM_24BIT_PACKED*: jint {.`static`.}
  ENCODING_PCM_32BIT*: jint {.`static`.}
  ENCODING_MPEGH_BL_L3*: jint {.`static`.}
  ENCODING_MPEGH_BL_L4*: jint {.`static`.}
  ENCODING_MPEGH_LC_L3*: jint {.`static`.}
  ENCODING_MPEGH_LC_L4*: jint {.`static`.}
  ENCODING_DTS_UHD*: jint {.`static`.}
  ENCODING_DRA*: jint {.`static`.}
  ENCODING_DTS_HD_MA*: jint {.`static`.}
  ENCODING_DTS_UHD_P1*: jint {.`static`.}
  ENCODING_DTS_UHD_P2*: jint {.`static`.}
  ENCODING_DSD*: jint {.`static`.}
  ENCODING_AC4_L4*: jint {.`static`.}
  ENCODING_IAMF_SIMPLE_PROFILE_OPUS*: jint {.`static`.}
  ENCODING_IAMF_SIMPLE_PROFILE_AAC*: jint {.`static`.}
  ENCODING_IAMF_SIMPLE_PROFILE_FLAC*: jint {.`static`.}
  ENCODING_IAMF_SIMPLE_PROFILE_PCM*: jint {.`static`.}
  ENCODING_IAMF_BASE_PROFILE_OPUS*: jint {.`static`.}
  ENCODING_IAMF_BASE_PROFILE_AAC*: jint {.`static`.}
  ENCODING_IAMF_BASE_PROFILE_FLAC*: jint {.`static`.}
  ENCODING_IAMF_BASE_PROFILE_PCM*: jint {.`static`.}
  ENCODING_IAMF_BASE_ENHANCED_PROFILE_OPUS*: jint {.`static`.}
  ENCODING_IAMF_BASE_ENHANCED_PROFILE_AAC*: jint {.`static`.}
  ENCODING_IAMF_BASE_ENHANCED_PROFILE_FLAC*: jint {.`static`.}
  ENCODING_IAMF_BASE_ENHANCED_PROFILE_PCM*: jint {.`static`.}
  CHANNEL_CONFIGURATION_INVALID*: jint {.`static`.}
  CHANNEL_CONFIGURATION_DEFAULT*: jint {.`static`.}
  CHANNEL_CONFIGURATION_MONO*: jint {.`static`.}
  CHANNEL_CONFIGURATION_STEREO*: jint {.`static`.}
  CHANNEL_INVALID*: jint {.`static`.}
  CHANNEL_OUT_DEFAULT*: jint {.`static`.}
  CHANNEL_OUT_FRONT_LEFT*: jint {.`static`.}
  CHANNEL_OUT_FRONT_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_FRONT_CENTER*: jint {.`static`.}
  CHANNEL_OUT_LOW_FREQUENCY*: jint {.`static`.}
  CHANNEL_OUT_BACK_LEFT*: jint {.`static`.}
  CHANNEL_OUT_BACK_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_FRONT_LEFT_OF_CENTER*: jint {.`static`.}
  CHANNEL_OUT_FRONT_RIGHT_OF_CENTER*: jint {.`static`.}
  CHANNEL_OUT_BACK_CENTER*: jint {.`static`.}
  CHANNEL_OUT_SIDE_LEFT*: jint {.`static`.}
  CHANNEL_OUT_SIDE_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_TOP_CENTER*: jint {.`static`.}
  CHANNEL_OUT_TOP_FRONT_LEFT*: jint {.`static`.}
  CHANNEL_OUT_TOP_FRONT_CENTER*: jint {.`static`.}
  CHANNEL_OUT_TOP_FRONT_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_TOP_BACK_LEFT*: jint {.`static`.}
  CHANNEL_OUT_TOP_BACK_CENTER*: jint {.`static`.}
  CHANNEL_OUT_TOP_BACK_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_TOP_SIDE_LEFT*: jint {.`static`.}
  CHANNEL_OUT_TOP_SIDE_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_BOTTOM_FRONT_LEFT*: jint {.`static`.}
  CHANNEL_OUT_BOTTOM_FRONT_CENTER*: jint {.`static`.}
  CHANNEL_OUT_BOTTOM_FRONT_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_LOW_FREQUENCY_2*: jint {.`static`.}
  CHANNEL_OUT_FRONT_WIDE_LEFT*: jint {.`static`.}
  CHANNEL_OUT_FRONT_WIDE_RIGHT*: jint {.`static`.}
  CHANNEL_OUT_HAPTIC_B*: jint {.`static`.}
  CHANNEL_OUT_HAPTIC_A*: jint {.`static`.}
  CHANNEL_OUT_MONO*: jint {.`static`.}
  CHANNEL_OUT_STEREO*: jint {.`static`.}
  CHANNEL_OUT_QUAD*: jint {.`static`.}
  CHANNEL_OUT_QUAD_SIDE*: jint {.`static`.}
  CHANNEL_OUT_SURROUND*: jint {.`static`.}
  CHANNEL_OUT_5POINT1*: jint {.`static`.}
  CHANNEL_OUT_6POINT1*: jint {.`static`.}
  CHANNEL_OUT_5POINT1_SIDE*: jint {.`static`.}
  CHANNEL_OUT_7POINT1*: jint {.`static`.}
  CHANNEL_OUT_7POINT1_SURROUND*: jint {.`static`.}
  CHANNEL_OUT_5POINT1POINT2*: jint {.`static`.}
  CHANNEL_OUT_5POINT1POINT4*: jint {.`static`.}
  CHANNEL_OUT_7POINT1POINT2*: jint {.`static`.}
  CHANNEL_OUT_7POINT1POINT4*: jint {.`static`.}
  CHANNEL_OUT_9POINT1POINT4*: jint {.`static`.}
  CHANNEL_OUT_9POINT1POINT6*: jint {.`static`.}
  CHANNEL_OUT_13POINT0*: jint {.`static`.}
  CHANNEL_OUT_22POINT2*: jint {.`static`.}
  SAMPLE_RATE_HZ_MIN*: jint {.`static`.}
  SAMPLE_RATE_HZ_MAX*: jint {.`static`.}
  SAMPLE_RATE_UNSPECIFIED*: jint {.`static`.}
  CHANNEL_IN_DEFAULT*: jint {.`static`.}
  CHANNEL_IN_LEFT*: jint {.`static`.}
  CHANNEL_IN_RIGHT*: jint {.`static`.}
  CHANNEL_IN_FRONT*: jint {.`static`.}
  CHANNEL_IN_BACK*: jint {.`static`.}
  CHANNEL_IN_LEFT_PROCESSED*: jint {.`static`.}
  CHANNEL_IN_RIGHT_PROCESSED*: jint {.`static`.}
  CHANNEL_IN_FRONT_PROCESSED*: jint {.`static`.}
  CHANNEL_IN_BACK_PROCESSED*: jint {.`static`.}
  CHANNEL_IN_PRESSURE*: jint {.`static`.}
  CHANNEL_IN_X_AXIS*: jint {.`static`.}
  CHANNEL_IN_Y_AXIS*: jint {.`static`.}
  CHANNEL_IN_Z_AXIS*: jint {.`static`.}
  CHANNEL_IN_VOICE_UPLINK*: jint {.`static`.}
  CHANNEL_IN_VOICE_DNLINK*: jint {.`static`.}
  CHANNEL_IN_BACK_LEFT*: jint {.`static`.}
  CHANNEL_IN_BACK_RIGHT*: jint {.`static`.}
  CHANNEL_IN_CENTER*: jint {.`static`.}
  CHANNEL_IN_LOW_FREQUENCY*: jint {.`static`.}
  CHANNEL_IN_TOP_LEFT*: jint {.`static`.}
  CHANNEL_IN_TOP_RIGHT*: jint {.`static`.}
  CHANNEL_IN_MONO*: jint {.`static`.}
  CHANNEL_IN_STEREO*: jint {.`static`.}
  CHANNEL_IN_2POINT0POINT2*: jint {.`static`.}
  CHANNEL_IN_2POINT1POINT2*: jint {.`static`.}
  CHANNEL_IN_3POINT0POINT2*: jint {.`static`.}
  CHANNEL_IN_3POINT1POINT2*: jint {.`static`.}
  CHANNEL_IN_5POINT1*: jint {.`static`.}
  CHANNEL_IN_FRONT_BACK*: jint {.`static`.}
  AUDIO_FORMAT_HAS_PROPERTY_NONE*: jint {.`static`.}
  AUDIO_FORMAT_HAS_PROPERTY_ENCODING*: jint {.`static`.}
  AUDIO_FORMAT_HAS_PROPERTY_SAMPLE_RATE*: jint {.`static`.}
  AUDIO_FORMAT_HAS_PROPERTY_CHANNEL_MASK*: jint {.`static`.}
  AUDIO_FORMAT_HAS_PROPERTY_CHANNEL_INDEX_MASK*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioFormat] {.`static`.}
  SURROUND_SOUND_ENCODING*: jint {.`static`.}

jclass android.media.AudioFormat.Builder* of JVMObject:
  proc build*(): AudioFormat
  proc setEncoding*(encoding: jint): Builder
  proc setChannelMask*(channelMask: jint): Builder
  proc setChannelIndexMask*(channelIndexMask: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder

jclass android.media.Builder* of JVMObject:
  proc build*(): AudioFormat
  proc setEncoding*(encoding: jint): Builder
  proc setChannelMask*(channelMask: jint): Builder
  proc setChannelIndexMask*(channelIndexMask: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder


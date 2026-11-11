import jnim

jclass android.bluetooth.BluetoothCodecConfig* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getCodecName*(codecType: jint): string {.`static`.}
  proc getCodecType*(): jint
  proc getExtendedCodecType*(): BluetoothCodecType
  proc isMandatoryCodec*(): jboolean
  proc getCodecPriority*(): jint
  proc setCodecPriority*(codecPriority: jint)
  proc getSampleRate*(): jint
  proc getBitsPerSample*(): jint
  proc getChannelMode*(): jint
  proc getCodecSpecific1*(): jlong
  proc getCodecSpecific2*(): jlong
  proc getCodecSpecific3*(): jlong
  proc getCodecSpecific4*(): jlong
  proc hasSingleSampleRate*(): jboolean
  proc hasSingleBitsPerSample*(): jboolean
  proc hasSingleChannelMode*(): jboolean
  proc sameAudioFeedingParameters*(other: BluetoothCodecConfig): jboolean
  proc similarCodecFeedingParameters*(other: BluetoothCodecConfig): jboolean
  proc sameCodecSpecificParameters*(other: BluetoothCodecConfig): jboolean
  SOURCE_CODEC_TYPE_SBC*: jint {.`static`.}
  SOURCE_CODEC_TYPE_AAC*: jint {.`static`.}
  SOURCE_CODEC_TYPE_APTX*: jint {.`static`.}
  SOURCE_CODEC_TYPE_APTX_HD*: jint {.`static`.}
  SOURCE_CODEC_TYPE_LDAC*: jint {.`static`.}
  SOURCE_CODEC_TYPE_LC3*: jint {.`static`.}
  SOURCE_CODEC_TYPE_OPUS*: jint {.`static`.}
  SOURCE_CODEC_TYPE_INVALID*: jint {.`static`.}
  CODEC_PRIORITY_DISABLED*: jint {.`static`.}
  CODEC_PRIORITY_DEFAULT*: jint {.`static`.}
  CODEC_PRIORITY_HIGHEST*: jint {.`static`.}
  SAMPLE_RATE_NONE*: jint {.`static`.}
  SAMPLE_RATE_44100*: jint {.`static`.}
  SAMPLE_RATE_48000*: jint {.`static`.}
  SAMPLE_RATE_88200*: jint {.`static`.}
  SAMPLE_RATE_96000*: jint {.`static`.}
  SAMPLE_RATE_176400*: jint {.`static`.}
  SAMPLE_RATE_192000*: jint {.`static`.}
  BITS_PER_SAMPLE_NONE*: jint {.`static`.}
  BITS_PER_SAMPLE_16*: jint {.`static`.}
  BITS_PER_SAMPLE_24*: jint {.`static`.}
  BITS_PER_SAMPLE_32*: jint {.`static`.}
  CHANNEL_MODE_NONE*: jint {.`static`.}
  CHANNEL_MODE_MONO*: jint {.`static`.}
  CHANNEL_MODE_STEREO*: jint {.`static`.}
  CREATOR*: Creator[BluetoothCodecConfig] {.`static`.}

jclass android.bluetooth.BluetoothCodecConfig.Builder* of JVMObject:
  proc setCodecType*(codecType: jint): Builder
  proc setExtendedCodecType*(codecType: BluetoothCodecType): Builder
  proc setCodecPriority*(codecPriority: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setBitsPerSample*(bitsPerSample: jint): Builder
  proc setChannelMode*(channelMode: jint): Builder
  proc setCodecSpecific1*(codecSpecific1: jlong): Builder
  proc setCodecSpecific2*(codecSpecific2: jlong): Builder
  proc setCodecSpecific3*(codecSpecific3: jlong): Builder
  proc setCodecSpecific4*(codecSpecific4: jlong): Builder
  proc build*(): BluetoothCodecConfig

jclass android.bluetooth.Builder* of JVMObject:
  proc setCodecType*(codecType: jint): Builder
  proc setExtendedCodecType*(codecType: BluetoothCodecType): Builder
  proc setCodecPriority*(codecPriority: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setBitsPerSample*(bitsPerSample: jint): Builder
  proc setChannelMode*(channelMode: jint): Builder
  proc setCodecSpecific1*(codecSpecific1: jlong): Builder
  proc setCodecSpecific2*(codecSpecific2: jlong): Builder
  proc setCodecSpecific3*(codecSpecific3: jlong): Builder
  proc setCodecSpecific4*(codecSpecific4: jlong): Builder
  proc build*(): BluetoothCodecConfig


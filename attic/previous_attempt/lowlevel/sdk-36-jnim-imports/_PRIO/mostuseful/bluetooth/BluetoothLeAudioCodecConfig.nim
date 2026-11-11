import jnim

jclass android.bluetooth.BluetoothLeAudioCodecConfig* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc getCodecType*(): jint
  proc getCodecName*(): string
  proc getCodecPriority*(): jint
  proc getSampleRate*(): jint
  proc getBitsPerSample*(): jint
  proc getChannelCount*(): jint
  proc getFrameDuration*(): jint
  proc getOctetsPerFrame*(): jint
  proc getMinOctetsPerFrame*(): jint
  proc getMaxOctetsPerFrame*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  SOURCE_CODEC_TYPE_LC3*: jint {.`static`.}
  SOURCE_CODEC_TYPE_OPUS*: jint {.`static`.}
  SOURCE_CODEC_TYPE_INVALID*: jint {.`static`.}
  CODEC_PRIORITY_DISABLED*: jint {.`static`.}
  CODEC_PRIORITY_DEFAULT*: jint {.`static`.}
  CODEC_PRIORITY_HIGHEST*: jint {.`static`.}
  SAMPLE_RATE_NONE*: jint {.`static`.}
  SAMPLE_RATE_8000*: jint {.`static`.}
  SAMPLE_RATE_11025*: jint {.`static`.}
  SAMPLE_RATE_16000*: jint {.`static`.}
  SAMPLE_RATE_22050*: jint {.`static`.}
  SAMPLE_RATE_24000*: jint {.`static`.}
  SAMPLE_RATE_32000*: jint {.`static`.}
  SAMPLE_RATE_44100*: jint {.`static`.}
  SAMPLE_RATE_48000*: jint {.`static`.}
  SAMPLE_RATE_88200*: jint {.`static`.}
  SAMPLE_RATE_96000*: jint {.`static`.}
  SAMPLE_RATE_176400*: jint {.`static`.}
  SAMPLE_RATE_192000*: jint {.`static`.}
  SAMPLE_RATE_384000*: jint {.`static`.}
  BITS_PER_SAMPLE_NONE*: jint {.`static`.}
  BITS_PER_SAMPLE_16*: jint {.`static`.}
  BITS_PER_SAMPLE_24*: jint {.`static`.}
  BITS_PER_SAMPLE_32*: jint {.`static`.}
  CHANNEL_COUNT_NONE*: jint {.`static`.}
  CHANNEL_COUNT_1*: jint {.`static`.}
  CHANNEL_COUNT_2*: jint {.`static`.}
  FRAME_DURATION_NONE*: jint {.`static`.}
  FRAME_DURATION_7500*: jint {.`static`.}
  FRAME_DURATION_10000*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothLeAudioCodecConfig] {.`static`.}

jclass android.bluetooth.BluetoothLeAudioCodecConfig.Builder* of JVMObject:
  proc setCodecType*(codecType: jint): Builder
  proc setCodecPriority*(codecPriority: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setBitsPerSample*(bitsPerSample: jint): Builder
  proc setChannelCount*(channelCount: jint): Builder
  proc setFrameDuration*(frameDuration: jint): Builder
  proc setOctetsPerFrame*(octetsPerFrame: jint): Builder
  proc setMinOctetsPerFrame*(minOctetsPerFrame: jint): Builder
  proc setMaxOctetsPerFrame*(maxOctetsPerFrame: jint): Builder
  proc build*(): BluetoothLeAudioCodecConfig

jclass android.bluetooth.Builder* of JVMObject:
  proc setCodecType*(codecType: jint): Builder
  proc setCodecPriority*(codecPriority: jint): Builder
  proc setSampleRate*(sampleRate: jint): Builder
  proc setBitsPerSample*(bitsPerSample: jint): Builder
  proc setChannelCount*(channelCount: jint): Builder
  proc setFrameDuration*(frameDuration: jint): Builder
  proc setOctetsPerFrame*(octetsPerFrame: jint): Builder
  proc setMinOctetsPerFrame*(minOctetsPerFrame: jint): Builder
  proc setMaxOctetsPerFrame*(maxOctetsPerFrame: jint): Builder
  proc build*(): BluetoothLeAudioCodecConfig


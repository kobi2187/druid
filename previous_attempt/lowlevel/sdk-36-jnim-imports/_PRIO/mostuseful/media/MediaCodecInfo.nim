import jnim

jclass android.media.MediaCodecInfo* of JVMObject:
  proc getName*(): string
  proc getCanonicalName*(): string
  proc isAlias*(): jboolean
  proc isEncoder*(): jboolean
  proc isVendor*(): jboolean
  proc isSoftwareOnly*(): jboolean
  proc isHardwareAccelerated*(): jboolean
  proc getSupportedTypes*(): seq[string]
  proc getSecurityModel*(): jint
  proc getCapabilitiesForType*(type: string): CodecCapabilities
  proc makeRegular*(): MediaCodecInfo
  SECURITY_MODEL_SANDBOXED*: jint {.`static`.}
  SECURITY_MODEL_MEMORY_SAFE*: jint {.`static`.}
  SECURITY_MODEL_TRUSTED_CONTENT_ONLY*: jint {.`static`.}

jclass android.media.MediaCodecInfo.CodecCapabilities* of JVMObject:
  proc isFeatureSupported*(name: string): jboolean
  proc isFeatureRequired*(name: string): jboolean
  proc validFeatures*(): seq[string]
  proc isRegular*(): jboolean
  proc isFormatSupported*(format: MediaFormat): jboolean
  proc getDefaultFormat*(): MediaFormat
  proc getMimeType*(): string
  proc getMaxSupportedInstances*(): jint
  proc getAudioCapabilities*(): AudioCapabilities
  proc getEncoderCapabilities*(): EncoderCapabilities
  proc getVideoCapabilities*(): VideoCapabilities
  proc dup*(): CodecCapabilities
  proc createFromProfileLevel*(mime: string, profile: jint, level: jint): CodecCapabilities {.`static`.}

jclass android.media.MediaCodecInfo.AudioCapabilities* of JVMObject:
  proc getBitrateRange*(): Range[Integer]
  proc getSupportedSampleRates*(): seq[jint]
  proc getSupportedSampleRateRanges*(): Range[Integer]
  proc getMaxInputChannelCount*(): jint
  proc getMinInputChannelCount*(): jint
  proc getInputChannelCountRanges*(): Range[Integer]
  proc create*(info: MediaFormat, parent: CodecCapabilities): AudioCapabilities {.`static`.}
  proc isSampleRateSupported*(sampleRate: jint): jboolean
  proc getDefaultFormat*(format: MediaFormat)
  proc supportsFormat*(format: MediaFormat): jboolean

jclass android.media.MediaCodecInfo.VideoCapabilities* of JVMObject:
  proc getBitrateRange*(): Range[Integer]
  proc getSupportedWidths*(): Range[Integer]
  proc getSupportedHeights*(): Range[Integer]
  proc getWidthAlignment*(): jint
  proc getHeightAlignment*(): jint
  proc getSmallerDimensionUpperLimit*(): jint
  proc getSupportedFrameRates*(): Range[Integer]
  proc getSupportedWidthsFor*(height: jint): Range[Integer]
  proc getSupportedHeightsFor*(width: jint): Range[Integer]
  proc getSupportedFrameRatesFor*(width: jint, height: jint): Range[Double]
  proc getAchievableFrameRatesFor*(width: jint, height: jint): Range[Double]
  proc getSupportedPerformancePoints*(): List[PerformancePoint]
  proc areSizeAndRateSupported*(width: jint, height: jint, frameRate: jdouble): jboolean
  proc isSizeSupported*(width: jint, height: jint): jboolean
  proc supportsFormat*(format: MediaFormat): jboolean
  proc create*(info: MediaFormat, parent: CodecCapabilities): VideoCapabilities {.`static`.}
  proc getBlockSize*(): Size
  proc getBlockCountRange*(): Range[Integer]
  proc getBlocksPerSecondRange*(): Range[Long]
  proc getAspectRatioRange*(blocks: jboolean): Range[Rational]
  proc equivalentVP9Level*(info: MediaFormat): jint {.`static`.}

jclass android.media.MediaCodecInfo.EncoderCapabilities* of JVMObject:
  proc getQualityRange*(): Range[Integer]
  proc getComplexityRange*(): Range[Integer]
  proc isBitrateModeSupported*(mode: jint): jboolean
  proc create*(info: MediaFormat, parent: CodecCapabilities): EncoderCapabilities {.`static`.}
  proc getDefaultFormat*(format: MediaFormat)
  proc supportsFormat*(format: MediaFormat): jboolean

jclass android.media.MediaCodecInfo.CodecProfileLevel* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.CodecCapabilities* of JVMObject:
  proc isFeatureSupported*(name: string): jboolean
  proc isFeatureRequired*(name: string): jboolean
  proc validFeatures*(): seq[string]
  proc isRegular*(): jboolean
  proc isFormatSupported*(format: MediaFormat): jboolean
  proc getDefaultFormat*(): MediaFormat
  proc getMimeType*(): string
  proc getMaxSupportedInstances*(): jint
  proc getAudioCapabilities*(): AudioCapabilities
  proc getEncoderCapabilities*(): EncoderCapabilities
  proc getVideoCapabilities*(): VideoCapabilities
  proc dup*(): CodecCapabilities
  proc createFromProfileLevel*(mime: string, profile: jint, level: jint): CodecCapabilities {.`static`.}
  profileLevels*: CodecProfileLevel
  COLOR_FormatMonochrome*: jint {.`static`.}
  COLOR_Format8bitRGB332*: jint {.`static`.}
  COLOR_Format12bitRGB444*: jint {.`static`.}
  COLOR_Format16bitARGB4444*: jint {.`static`.}
  COLOR_Format16bitARGB1555*: jint {.`static`.}
  COLOR_Format16bitRGB565*: jint {.`static`.}
  COLOR_Format16bitBGR565*: jint {.`static`.}
  COLOR_Format18bitRGB666*: jint {.`static`.}
  COLOR_Format18bitARGB1665*: jint {.`static`.}
  COLOR_Format19bitARGB1666*: jint {.`static`.}
  COLOR_Format24bitRGB888*: jint {.`static`.}
  COLOR_Format24bitBGR888*: jint {.`static`.}
  COLOR_Format24bitARGB1887*: jint {.`static`.}
  COLOR_Format25bitARGB1888*: jint {.`static`.}
  COLOR_Format32bitBGRA8888*: jint {.`static`.}
  COLOR_Format32bitARGB8888*: jint {.`static`.}
  COLOR_FormatYUV411Planar*: jint {.`static`.}
  COLOR_FormatYUV411PackedPlanar*: jint {.`static`.}
  COLOR_FormatYUV420Planar*: jint {.`static`.}
  COLOR_FormatYUV420PackedPlanar*: jint {.`static`.}
  COLOR_FormatYUV420SemiPlanar*: jint {.`static`.}
  COLOR_FormatYUV422Planar*: jint {.`static`.}
  COLOR_FormatYUV422PackedPlanar*: jint {.`static`.}
  COLOR_FormatYUV422SemiPlanar*: jint {.`static`.}
  COLOR_FormatYCbYCr*: jint {.`static`.}
  COLOR_FormatYCrYCb*: jint {.`static`.}
  COLOR_FormatCbYCrY*: jint {.`static`.}
  COLOR_FormatCrYCbY*: jint {.`static`.}
  COLOR_FormatYUV444Interleaved*: jint {.`static`.}
  COLOR_FormatRawBayer8bit*: jint {.`static`.}
  COLOR_FormatRawBayer10bit*: jint {.`static`.}
  COLOR_FormatRawBayer8bitcompressed*: jint {.`static`.}
  COLOR_FormatL2*: jint {.`static`.}
  COLOR_FormatL4*: jint {.`static`.}
  COLOR_FormatL8*: jint {.`static`.}
  COLOR_FormatL16*: jint {.`static`.}
  COLOR_FormatL24*: jint {.`static`.}
  COLOR_FormatL32*: jint {.`static`.}
  COLOR_FormatYUV420PackedSemiPlanar*: jint {.`static`.}
  COLOR_FormatYUV422PackedSemiPlanar*: jint {.`static`.}
  COLOR_Format18BitBGR666*: jint {.`static`.}
  COLOR_Format24BitARGB6666*: jint {.`static`.}
  COLOR_Format24BitABGR6666*: jint {.`static`.}
  COLOR_FormatYUVP010*: jint {.`static`.}
  COLOR_FormatYUVP210*: jint {.`static`.}
  COLOR_TI_FormatYUV420PackedSemiPlanar*: jint {.`static`.}
  COLOR_FormatSurface*: jint {.`static`.}
  COLOR_Format64bitABGRFloat*: jint {.`static`.}
  COLOR_Format32bitABGR8888*: jint {.`static`.}
  COLOR_Format32bitABGR2101010*: jint {.`static`.}
  COLOR_FormatYUV420Flexible*: jint {.`static`.}
  COLOR_FormatYUV422Flexible*: jint {.`static`.}
  COLOR_FormatYUV444Flexible*: jint {.`static`.}
  COLOR_FormatRGBFlexible*: jint {.`static`.}
  COLOR_FormatRGBAFlexible*: jint {.`static`.}
  COLOR_QCOM_FormatYUV420SemiPlanar*: jint {.`static`.}
  colorFormats*: jint
  FEATURE_AdaptivePlayback*: string {.`static`.}
  FEATURE_SecurePlayback*: string {.`static`.}
  FEATURE_TunneledPlayback*: string {.`static`.}
  FEATURE_DynamicTimestamp*: string {.`static`.}
  FEATURE_FrameParsing*: string {.`static`.}
  FEATURE_MultipleFrames*: string {.`static`.}
  FEATURE_PartialFrame*: string {.`static`.}
  FEATURE_IntraRefresh*: string {.`static`.}
  FEATURE_LowLatency*: string {.`static`.}
  FEATURE_QpBounds*: string {.`static`.}
  FEATURE_EncodingStatistics*: string {.`static`.}
  FEATURE_HdrEditing*: string {.`static`.}
  FEATURE_HlgEditing*: string {.`static`.}
  FEATURE_DynamicColorAspects*: string {.`static`.}
  FEATURE_Roi*: string {.`static`.}
  FEATURE_DetachedSurface*: string {.`static`.}

jclass android.media.AudioCapabilities* of JVMObject:
  proc getBitrateRange*(): Range[Integer]
  proc getSupportedSampleRates*(): seq[jint]
  proc getSupportedSampleRateRanges*(): Range[Integer]
  proc getMaxInputChannelCount*(): jint
  proc getMinInputChannelCount*(): jint
  proc getInputChannelCountRanges*(): Range[Integer]
  proc create*(info: MediaFormat, parent: CodecCapabilities): AudioCapabilities {.`static`.}
  proc isSampleRateSupported*(sampleRate: jint): jboolean
  proc getDefaultFormat*(format: MediaFormat)
  proc supportsFormat*(format: MediaFormat): jboolean

jclass android.media.VideoCapabilities* of JVMObject:
  proc getBitrateRange*(): Range[Integer]
  proc getSupportedWidths*(): Range[Integer]
  proc getSupportedHeights*(): Range[Integer]
  proc getWidthAlignment*(): jint
  proc getHeightAlignment*(): jint
  proc getSmallerDimensionUpperLimit*(): jint
  proc getSupportedFrameRates*(): Range[Integer]
  proc getSupportedWidthsFor*(height: jint): Range[Integer]
  proc getSupportedHeightsFor*(width: jint): Range[Integer]
  proc getSupportedFrameRatesFor*(width: jint, height: jint): Range[Double]
  proc getAchievableFrameRatesFor*(width: jint, height: jint): Range[Double]
  proc getSupportedPerformancePoints*(): List[PerformancePoint]
  proc areSizeAndRateSupported*(width: jint, height: jint, frameRate: jdouble): jboolean
  proc isSizeSupported*(width: jint, height: jint): jboolean
  proc supportsFormat*(format: MediaFormat): jboolean
  proc create*(info: MediaFormat, parent: CodecCapabilities): VideoCapabilities {.`static`.}
  proc getBlockSize*(): Size
  proc getBlockCountRange*(): Range[Integer]
  proc getBlocksPerSecondRange*(): Range[Long]
  proc getAspectRatioRange*(blocks: jboolean): Range[Rational]
  proc equivalentVP9Level*(info: MediaFormat): jint {.`static`.}

jclass android.media.VideoCapabilities.PerformancePoint* of JVMObject:
  proc getMaxMacroBlocks*(): jint
  proc getMaxFrameRate*(): jint
  proc getMaxMacroBlockRate*(): jlong
  proc toString*(): string
  proc hashCode*(): jint
  proc covers*(format: MediaFormat): jboolean
  proc covers*(other: PerformancePoint): jboolean
  proc equals*(o: JObject): jboolean

jclass android.media.PerformancePoint* of JVMObject:
  proc getMaxMacroBlocks*(): jint
  proc getMaxFrameRate*(): jint
  proc getMaxMacroBlockRate*(): jlong
  proc toString*(): string
  proc hashCode*(): jint
  proc covers*(format: MediaFormat): jboolean
  proc covers*(other: PerformancePoint): jboolean
  proc equals*(o: JObject): jboolean
  SD_24*: PerformancePoint {.`static`.}
  SD_25*: PerformancePoint {.`static`.}
  SD_30*: PerformancePoint {.`static`.}
  SD_48*: PerformancePoint {.`static`.}
  SD_50*: PerformancePoint {.`static`.}
  SD_60*: PerformancePoint {.`static`.}
  HD_24*: PerformancePoint {.`static`.}
  HD_25*: PerformancePoint {.`static`.}
  HD_30*: PerformancePoint {.`static`.}
  HD_50*: PerformancePoint {.`static`.}
  HD_60*: PerformancePoint {.`static`.}
  HD_100*: PerformancePoint {.`static`.}
  HD_120*: PerformancePoint {.`static`.}
  HD_200*: PerformancePoint {.`static`.}
  HD_240*: PerformancePoint {.`static`.}
  FHD_24*: PerformancePoint {.`static`.}
  FHD_25*: PerformancePoint {.`static`.}
  FHD_30*: PerformancePoint {.`static`.}
  FHD_50*: PerformancePoint {.`static`.}
  FHD_60*: PerformancePoint {.`static`.}
  FHD_100*: PerformancePoint {.`static`.}
  FHD_120*: PerformancePoint {.`static`.}
  FHD_200*: PerformancePoint {.`static`.}
  FHD_240*: PerformancePoint {.`static`.}
  UHD_24*: PerformancePoint {.`static`.}
  UHD_25*: PerformancePoint {.`static`.}
  UHD_30*: PerformancePoint {.`static`.}
  UHD_50*: PerformancePoint {.`static`.}
  UHD_60*: PerformancePoint {.`static`.}
  UHD_100*: PerformancePoint {.`static`.}
  UHD_120*: PerformancePoint {.`static`.}
  UHD_200*: PerformancePoint {.`static`.}
  UHD_240*: PerformancePoint {.`static`.}

jclass android.media.EncoderCapabilities* of JVMObject:
  proc getQualityRange*(): Range[Integer]
  proc getComplexityRange*(): Range[Integer]
  proc isBitrateModeSupported*(mode: jint): jboolean
  proc create*(info: MediaFormat, parent: CodecCapabilities): EncoderCapabilities {.`static`.}
  proc getDefaultFormat*(format: MediaFormat)
  proc supportsFormat*(format: MediaFormat): jboolean
  BITRATE_MODE_CQ*: jint {.`static`.}
  BITRATE_MODE_VBR*: jint {.`static`.}
  BITRATE_MODE_CBR*: jint {.`static`.}
  BITRATE_MODE_CBR_FD*: jint {.`static`.}

jclass android.media.CodecProfileLevel* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  AVCProfileBaseline*: jint {.`static`.}
  AVCProfileMain*: jint {.`static`.}
  AVCProfileExtended*: jint {.`static`.}
  AVCProfileHigh*: jint {.`static`.}
  AVCProfileHigh10*: jint {.`static`.}
  AVCProfileHigh422*: jint {.`static`.}
  AVCProfileHigh444*: jint {.`static`.}
  AVCProfileConstrainedBaseline*: jint {.`static`.}
  AVCProfileConstrainedHigh*: jint {.`static`.}
  AVCLevel1*: jint {.`static`.}
  AVCLevel1b*: jint {.`static`.}
  AVCLevel11*: jint {.`static`.}
  AVCLevel12*: jint {.`static`.}
  AVCLevel13*: jint {.`static`.}
  AVCLevel2*: jint {.`static`.}
  AVCLevel21*: jint {.`static`.}
  AVCLevel22*: jint {.`static`.}
  AVCLevel3*: jint {.`static`.}
  AVCLevel31*: jint {.`static`.}
  AVCLevel32*: jint {.`static`.}
  AVCLevel4*: jint {.`static`.}
  AVCLevel41*: jint {.`static`.}
  AVCLevel42*: jint {.`static`.}
  AVCLevel5*: jint {.`static`.}
  AVCLevel51*: jint {.`static`.}
  AVCLevel52*: jint {.`static`.}
  AVCLevel6*: jint {.`static`.}
  AVCLevel61*: jint {.`static`.}
  AVCLevel62*: jint {.`static`.}
  H263ProfileBaseline*: jint {.`static`.}
  H263ProfileH320Coding*: jint {.`static`.}
  H263ProfileBackwardCompatible*: jint {.`static`.}
  H263ProfileISWV2*: jint {.`static`.}
  H263ProfileISWV3*: jint {.`static`.}
  H263ProfileHighCompression*: jint {.`static`.}
  H263ProfileInternet*: jint {.`static`.}
  H263ProfileInterlace*: jint {.`static`.}
  H263ProfileHighLatency*: jint {.`static`.}
  H263Level10*: jint {.`static`.}
  H263Level20*: jint {.`static`.}
  H263Level30*: jint {.`static`.}
  H263Level40*: jint {.`static`.}
  H263Level45*: jint {.`static`.}
  H263Level50*: jint {.`static`.}
  H263Level60*: jint {.`static`.}
  H263Level70*: jint {.`static`.}
  MPEG4ProfileSimple*: jint {.`static`.}
  MPEG4ProfileSimpleScalable*: jint {.`static`.}
  MPEG4ProfileCore*: jint {.`static`.}
  MPEG4ProfileMain*: jint {.`static`.}
  MPEG4ProfileNbit*: jint {.`static`.}
  MPEG4ProfileScalableTexture*: jint {.`static`.}
  MPEG4ProfileSimpleFace*: jint {.`static`.}
  MPEG4ProfileSimpleFBA*: jint {.`static`.}
  MPEG4ProfileBasicAnimated*: jint {.`static`.}
  MPEG4ProfileHybrid*: jint {.`static`.}
  MPEG4ProfileAdvancedRealTime*: jint {.`static`.}
  MPEG4ProfileCoreScalable*: jint {.`static`.}
  MPEG4ProfileAdvancedCoding*: jint {.`static`.}
  MPEG4ProfileAdvancedCore*: jint {.`static`.}
  MPEG4ProfileAdvancedScalable*: jint {.`static`.}
  MPEG4ProfileAdvancedSimple*: jint {.`static`.}
  MPEG4Level0*: jint {.`static`.}
  MPEG4Level0b*: jint {.`static`.}
  MPEG4Level1*: jint {.`static`.}
  MPEG4Level2*: jint {.`static`.}
  MPEG4Level3*: jint {.`static`.}
  MPEG4Level3b*: jint {.`static`.}
  MPEG4Level4*: jint {.`static`.}
  MPEG4Level4a*: jint {.`static`.}
  MPEG4Level5*: jint {.`static`.}
  MPEG4Level6*: jint {.`static`.}
  MPEG2ProfileSimple*: jint {.`static`.}
  MPEG2ProfileMain*: jint {.`static`.}
  MPEG2Profile422*: jint {.`static`.}
  MPEG2ProfileSNR*: jint {.`static`.}
  MPEG2ProfileSpatial*: jint {.`static`.}
  MPEG2ProfileHigh*: jint {.`static`.}
  MPEG2LevelLL*: jint {.`static`.}
  MPEG2LevelML*: jint {.`static`.}
  MPEG2LevelH14*: jint {.`static`.}
  MPEG2LevelHL*: jint {.`static`.}
  MPEG2LevelHP*: jint {.`static`.}
  AACObjectMain*: jint {.`static`.}
  AACObjectLC*: jint {.`static`.}
  AACObjectSSR*: jint {.`static`.}
  AACObjectLTP*: jint {.`static`.}
  AACObjectHE*: jint {.`static`.}
  AACObjectScalable*: jint {.`static`.}
  AACObjectERLC*: jint {.`static`.}
  AACObjectERScalable*: jint {.`static`.}
  AACObjectLD*: jint {.`static`.}
  AACObjectHE_PS*: jint {.`static`.}
  AACObjectELD*: jint {.`static`.}
  AACObjectXHE*: jint {.`static`.}
  VP8Level_Version0*: jint {.`static`.}
  VP8Level_Version1*: jint {.`static`.}
  VP8Level_Version2*: jint {.`static`.}
  VP8Level_Version3*: jint {.`static`.}
  VP8ProfileMain*: jint {.`static`.}
  VP9Profile0*: jint {.`static`.}
  VP9Profile1*: jint {.`static`.}
  VP9Profile2*: jint {.`static`.}
  VP9Profile3*: jint {.`static`.}
  VP9Profile2HDR*: jint {.`static`.}
  VP9Profile3HDR*: jint {.`static`.}
  VP9Profile2HDR10Plus*: jint {.`static`.}
  VP9Profile3HDR10Plus*: jint {.`static`.}
  VP9Level1*: jint {.`static`.}
  VP9Level11*: jint {.`static`.}
  VP9Level2*: jint {.`static`.}
  VP9Level21*: jint {.`static`.}
  VP9Level3*: jint {.`static`.}
  VP9Level31*: jint {.`static`.}
  VP9Level4*: jint {.`static`.}
  VP9Level41*: jint {.`static`.}
  VP9Level5*: jint {.`static`.}
  VP9Level51*: jint {.`static`.}
  VP9Level52*: jint {.`static`.}
  VP9Level6*: jint {.`static`.}
  VP9Level61*: jint {.`static`.}
  VP9Level62*: jint {.`static`.}
  HEVCProfileMain*: jint {.`static`.}
  HEVCProfileMain10*: jint {.`static`.}
  HEVCProfileMainStill*: jint {.`static`.}
  HEVCProfileMain10HDR10*: jint {.`static`.}
  HEVCProfileMain10HDR10Plus*: jint {.`static`.}
  HEVCMainTierLevel1*: jint {.`static`.}
  HEVCHighTierLevel1*: jint {.`static`.}
  HEVCMainTierLevel2*: jint {.`static`.}
  HEVCHighTierLevel2*: jint {.`static`.}
  HEVCMainTierLevel21*: jint {.`static`.}
  HEVCHighTierLevel21*: jint {.`static`.}
  HEVCMainTierLevel3*: jint {.`static`.}
  HEVCHighTierLevel3*: jint {.`static`.}
  HEVCMainTierLevel31*: jint {.`static`.}
  HEVCHighTierLevel31*: jint {.`static`.}
  HEVCMainTierLevel4*: jint {.`static`.}
  HEVCHighTierLevel4*: jint {.`static`.}
  HEVCMainTierLevel41*: jint {.`static`.}
  HEVCHighTierLevel41*: jint {.`static`.}
  HEVCMainTierLevel5*: jint {.`static`.}
  HEVCHighTierLevel5*: jint {.`static`.}
  HEVCMainTierLevel51*: jint {.`static`.}
  HEVCHighTierLevel51*: jint {.`static`.}
  HEVCMainTierLevel52*: jint {.`static`.}
  HEVCHighTierLevel52*: jint {.`static`.}
  HEVCMainTierLevel6*: jint {.`static`.}
  HEVCHighTierLevel6*: jint {.`static`.}
  HEVCMainTierLevel61*: jint {.`static`.}
  HEVCHighTierLevel61*: jint {.`static`.}
  HEVCMainTierLevel62*: jint {.`static`.}
  HEVCHighTierLevel62*: jint {.`static`.}
  DolbyVisionProfileDvavPer*: jint {.`static`.}
  DolbyVisionProfileDvavPen*: jint {.`static`.}
  DolbyVisionProfileDvheDer*: jint {.`static`.}
  DolbyVisionProfileDvheDen*: jint {.`static`.}
  DolbyVisionProfileDvheDtr*: jint {.`static`.}
  DolbyVisionProfileDvheStn*: jint {.`static`.}
  DolbyVisionProfileDvheDth*: jint {.`static`.}
  DolbyVisionProfileDvheDtb*: jint {.`static`.}
  DolbyVisionProfileDvheSt*: jint {.`static`.}
  DolbyVisionProfileDvavSe*: jint {.`static`.}
  DolbyVisionProfileDvav110*: jint {.`static`.}
  DolbyVisionLevelHd24*: jint {.`static`.}
  DolbyVisionLevelHd30*: jint {.`static`.}
  DolbyVisionLevelFhd24*: jint {.`static`.}
  DolbyVisionLevelFhd30*: jint {.`static`.}
  DolbyVisionLevelFhd60*: jint {.`static`.}
  DolbyVisionLevelUhd24*: jint {.`static`.}
  DolbyVisionLevelUhd30*: jint {.`static`.}
  DolbyVisionLevelUhd48*: jint {.`static`.}
  DolbyVisionLevelUhd60*: jint {.`static`.}
  DolbyVisionLevelUhd120*: jint {.`static`.}
  DolbyVisionLevel8k30*: jint {.`static`.}
  DolbyVisionLevel8k60*: jint {.`static`.}
  AV1ProfileMain8*: jint {.`static`.}
  AV1ProfileMain10*: jint {.`static`.}
  AV1ProfileMain10HDR10*: jint {.`static`.}
  AV1ProfileMain10HDR10Plus*: jint {.`static`.}
  AV1Level2*: jint {.`static`.}
  AV1Level21*: jint {.`static`.}
  AV1Level22*: jint {.`static`.}
  AV1Level23*: jint {.`static`.}
  AV1Level3*: jint {.`static`.}
  AV1Level31*: jint {.`static`.}
  AV1Level32*: jint {.`static`.}
  AV1Level33*: jint {.`static`.}
  AV1Level4*: jint {.`static`.}
  AV1Level41*: jint {.`static`.}
  AV1Level42*: jint {.`static`.}
  AV1Level43*: jint {.`static`.}
  AV1Level5*: jint {.`static`.}
  AV1Level51*: jint {.`static`.}
  AV1Level52*: jint {.`static`.}
  AV1Level53*: jint {.`static`.}
  AV1Level6*: jint {.`static`.}
  AV1Level61*: jint {.`static`.}
  AV1Level62*: jint {.`static`.}
  AV1Level63*: jint {.`static`.}
  AV1Level7*: jint {.`static`.}
  AV1Level71*: jint {.`static`.}
  AV1Level72*: jint {.`static`.}
  AV1Level73*: jint {.`static`.}
  DTS_HDProfileHRA*: jint {.`static`.}
  DTS_HDProfileLBR*: jint {.`static`.}
  DTS_HDProfileMA*: jint {.`static`.}
  DTS_UHDProfileP1*: jint {.`static`.}
  DTS_UHDProfileP2*: jint {.`static`.}
  AC4Profile00*: jint {.`static`.}
  AC4Profile10*: jint {.`static`.}
  AC4Profile11*: jint {.`static`.}
  AC4Profile21*: jint {.`static`.}
  AC4Profile22*: jint {.`static`.}
  AC4Level0*: jint {.`static`.}
  AC4Level1*: jint {.`static`.}
  AC4Level2*: jint {.`static`.}
  AC4Level3*: jint {.`static`.}
  AC4Level4*: jint {.`static`.}
  APVProfile422_10*: jint {.`static`.}
  APVProfile422_10HDR10*: jint {.`static`.}
  APVProfile422_10HDR10Plus*: jint {.`static`.}
  APVLevel1Band0*: jint {.`static`.}
  APVLevel1Band1*: jint {.`static`.}
  APVLevel1Band2*: jint {.`static`.}
  APVLevel1Band3*: jint {.`static`.}
  APVLevel11Band0*: jint {.`static`.}
  APVLevel11Band1*: jint {.`static`.}
  APVLevel11Band2*: jint {.`static`.}
  APVLevel11Band3*: jint {.`static`.}
  APVLevel2Band0*: jint {.`static`.}
  APVLevel2Band1*: jint {.`static`.}
  APVLevel2Band2*: jint {.`static`.}
  APVLevel2Band3*: jint {.`static`.}
  APVLevel21Band0*: jint {.`static`.}
  APVLevel21Band1*: jint {.`static`.}
  APVLevel21Band2*: jint {.`static`.}
  APVLevel21Band3*: jint {.`static`.}
  APVLevel3Band0*: jint {.`static`.}
  APVLevel3Band1*: jint {.`static`.}
  APVLevel3Band2*: jint {.`static`.}
  APVLevel3Band3*: jint {.`static`.}
  APVLevel31Band0*: jint {.`static`.}
  APVLevel31Band1*: jint {.`static`.}
  APVLevel31Band2*: jint {.`static`.}
  APVLevel31Band3*: jint {.`static`.}
  APVLevel4Band0*: jint {.`static`.}
  APVLevel4Band1*: jint {.`static`.}
  APVLevel4Band2*: jint {.`static`.}
  APVLevel4Band3*: jint {.`static`.}
  APVLevel41Band0*: jint {.`static`.}
  APVLevel41Band1*: jint {.`static`.}
  APVLevel41Band2*: jint {.`static`.}
  APVLevel41Band3*: jint {.`static`.}
  APVLevel5Band0*: jint {.`static`.}
  APVLevel5Band1*: jint {.`static`.}
  APVLevel5Band2*: jint {.`static`.}
  APVLevel5Band3*: jint {.`static`.}
  APVLevel51Band0*: jint {.`static`.}
  APVLevel51Band1*: jint {.`static`.}
  APVLevel51Band2*: jint {.`static`.}
  APVLevel51Band3*: jint {.`static`.}
  APVLevel6Band0*: jint {.`static`.}
  APVLevel6Band1*: jint {.`static`.}
  APVLevel6Band2*: jint {.`static`.}
  APVLevel6Band3*: jint {.`static`.}
  APVLevel61Band0*: jint {.`static`.}
  APVLevel61Band1*: jint {.`static`.}
  APVLevel61Band2*: jint {.`static`.}
  APVLevel61Band3*: jint {.`static`.}
  APVLevel7Band0*: jint {.`static`.}
  APVLevel7Band1*: jint {.`static`.}
  APVLevel7Band2*: jint {.`static`.}
  APVLevel7Band3*: jint {.`static`.}
  APVLevel71Band0*: jint {.`static`.}
  APVLevel71Band1*: jint {.`static`.}
  APVLevel71Band2*: jint {.`static`.}
  APVLevel71Band3*: jint {.`static`.}
  IAMFProfileSimpleOpus*: jint {.`static`.}
  IAMFProfileSimpleAac*: jint {.`static`.}
  IAMFProfileSimpleFlac*: jint {.`static`.}
  IAMFProfileSimplePcm*: jint {.`static`.}
  IAMFProfileBaseOpus*: jint {.`static`.}
  IAMFProfileBaseAac*: jint {.`static`.}
  IAMFProfileBaseFlac*: jint {.`static`.}
  IAMFProfileBasePcm*: jint {.`static`.}
  IAMFProfileBaseEnhancedOpus*: jint {.`static`.}
  IAMFProfileBaseEnhancedAac*: jint {.`static`.}
  IAMFProfileBaseEnhancedFlac*: jint {.`static`.}
  IAMFProfileBaseEnhancedPcm*: jint {.`static`.}
  profile*: jint
  level*: jint


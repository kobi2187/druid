import jnim

jclass android.media.MediaParser* of JVMObject:
  proc createByName*(name: string, outputConsumer: OutputConsumer): MediaParser {.`static`.}
  proc create*(outputConsumer: OutputConsumer, parserNames: string): MediaParser {.`static`.}
  proc getParserNames*(mediaFormat: MediaFormat): List[string] {.`static`.}
  proc setParameter*(parameterName: string, value: JObject): MediaParser
  proc supportsParameter*(parameterName: string): jboolean
  proc getParserName*(): string
  proc advance*(seekableInputReader: SeekableInputReader): jboolean
  proc seek*(seekPoint: SeekPoint)
  proc release*()
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId
  SAMPLE_FLAG_KEY_FRAME*: jint {.`static`.}
  SAMPLE_FLAG_HAS_SUPPLEMENTAL_DATA*: jint {.`static`.}
  SAMPLE_FLAG_LAST_SAMPLE*: jint {.`static`.}
  SAMPLE_FLAG_ENCRYPTED*: jint {.`static`.}
  SAMPLE_FLAG_DECODE_ONLY*: jint {.`static`.}
  PARSER_NAME_UNKNOWN*: string {.`static`.}
  PARSER_NAME_MATROSKA*: string {.`static`.}
  PARSER_NAME_FMP4*: string {.`static`.}
  PARSER_NAME_MP4*: string {.`static`.}
  PARSER_NAME_MP3*: string {.`static`.}
  PARSER_NAME_ADTS*: string {.`static`.}
  PARSER_NAME_AC3*: string {.`static`.}
  PARSER_NAME_TS*: string {.`static`.}
  PARSER_NAME_FLV*: string {.`static`.}
  PARSER_NAME_OGG*: string {.`static`.}
  PARSER_NAME_PS*: string {.`static`.}
  PARSER_NAME_WAV*: string {.`static`.}
  PARSER_NAME_AMR*: string {.`static`.}
  PARSER_NAME_AC4*: string {.`static`.}
  PARSER_NAME_FLAC*: string {.`static`.}
  PARAMETER_ADTS_ENABLE_CBR_SEEKING*: string {.`static`.}
  PARAMETER_AMR_ENABLE_CBR_SEEKING*: string {.`static`.}
  PARAMETER_FLAC_DISABLE_ID3*: string {.`static`.}
  PARAMETER_MP4_IGNORE_EDIT_LISTS*: string {.`static`.}
  PARAMETER_MP4_IGNORE_TFDT_BOX*: string {.`static`.}
  PARAMETER_MP4_TREAT_VIDEO_FRAMES_AS_KEYFRAMES*: string {.`static`.}
  PARAMETER_MATROSKA_DISABLE_CUES_SEEKING*: string {.`static`.}
  PARAMETER_MP3_DISABLE_ID3*: string {.`static`.}
  PARAMETER_MP3_ENABLE_CBR_SEEKING*: string {.`static`.}
  PARAMETER_MP3_ENABLE_INDEX_SEEKING*: string {.`static`.}
  PARAMETER_TS_MODE*: string {.`static`.}
  PARAMETER_TS_ALLOW_NON_IDR_AVC_KEYFRAMES*: string {.`static`.}
  PARAMETER_TS_IGNORE_AAC_STREAM*: string {.`static`.}
  PARAMETER_TS_IGNORE_AVC_STREAM*: string {.`static`.}
  PARAMETER_TS_IGNORE_SPLICE_INFO_STREAM*: string {.`static`.}
  PARAMETER_TS_DETECT_ACCESS_UNITS*: string {.`static`.}
  PARAMETER_TS_ENABLE_HDMV_DTS_AUDIO_STREAMS*: string {.`static`.}
  PARAMETER_IN_BAND_CRYPTO_INFO*: string {.`static`.}
  PARAMETER_INCLUDE_SUPPLEMENTAL_DATA*: string {.`static`.}
  PARAMETER_IGNORE_TIMESTAMP_OFFSET*: string {.`static`.}
  PARAMETER_EAGERLY_EXPOSE_TRACKTYPE*: string {.`static`.}
  PARAMETER_EXPOSE_DUMMY_SEEKMAP*: string {.`static`.}
  PARAMETER_EXPOSE_CHUNK_INDEX_AS_MEDIA_FORMAT*: string {.`static`.}
  PARAMETER_EXPOSE_CAPTION_FORMATS*: string {.`static`.}
  PARAMETER_OVERRIDE_IN_BAND_CAPTION_DECLARATIONS*: string {.`static`.}
  PARAMETER_EXPOSE_EMSG_TRACK*: string {.`static`.}

jclass android.media.MediaParser.SeekMap* of JVMObject:
  proc isSeekable*(): jboolean
  proc getDurationMicros*(): jlong
  proc getSeekPoints*(timeMicros: jlong): Pair[SeekPoint, SeekPoint]

jclass android.media.MediaParser.SeekPoint* of JVMObject:
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.SeekMap* of JVMObject:
  proc isSeekable*(): jboolean
  proc getDurationMicros*(): jlong
  proc getSeekPoints*(timeMicros: jlong): Pair[SeekPoint, SeekPoint]
  UNKNOWN_DURATION*: jint {.`static`.}
  DUMMY*: SeekMap {.`static`.}

jclass android.media.TrackData* of JVMObject:
  mediaFormat*: MediaFormat
  drmInitData*: DrmInitData

jclass android.media.SeekPoint* of JVMObject:
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  START*: SeekPoint {.`static`.}
  timeMicros*: jlong
  position*: jlong


jclass android.media.SeekableInputReader* of InputReader:


jclass android.media.UnrecognizedInputFormatException* of IOException:

jclass android.media.ParsingException* of IOException:


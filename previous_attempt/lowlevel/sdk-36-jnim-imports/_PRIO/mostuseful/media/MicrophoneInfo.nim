import jnim

jclass android.media.MicrophoneInfo* of JVMObject:
  proc getDescription*(): string
  proc getId*(): jint
  proc getInternalDeviceType*(): jint
  proc getType*(): jint
  proc getAddress*(): string
  proc getLocation*(): jint
  proc getGroup*(): jint
  proc getIndexInTheGroup*(): jint
  proc getPosition*(): Coordinate3F
  proc getOrientation*(): Coordinate3F
  proc getFrequencyResponse*(): List[Pair<Float, Float>]
  proc getChannelMapping*(): List[Pair<Integer, Integer>]
  proc getSensitivity*(): jfloat
  proc getMaxSpl*(): jfloat
  proc getMinSpl*(): jfloat
  proc getDirectionality*(): jint
  proc setId*(portId: jint)
  proc setChannelMapping*(channelMapping: List[Pair<Integer, Integer>])
  LOCATION_UNKNOWN*: jint {.`static`.}
  LOCATION_MAINBODY*: jint {.`static`.}
  LOCATION_MAINBODY_MOVABLE*: jint {.`static`.}
  LOCATION_PERIPHERAL*: jint {.`static`.}
  DIRECTIONALITY_UNKNOWN*: jint {.`static`.}
  DIRECTIONALITY_OMNI*: jint {.`static`.}
  DIRECTIONALITY_BI_DIRECTIONAL*: jint {.`static`.}
  DIRECTIONALITY_CARDIOID*: jint {.`static`.}
  DIRECTIONALITY_HYPER_CARDIOID*: jint {.`static`.}
  DIRECTIONALITY_SUPER_CARDIOID*: jint {.`static`.}
  CHANNEL_MAPPING_DIRECT*: jint {.`static`.}
  CHANNEL_MAPPING_PROCESSED*: jint {.`static`.}
  GROUP_UNKNOWN*: jint {.`static`.}
  INDEX_IN_THE_GROUP_UNKNOWN*: jint {.`static`.}
  POSITION_UNKNOWN*: Coordinate3F {.`static`.}
  ORIENTATION_UNKNOWN*: Coordinate3F {.`static`.}
  SENSITIVITY_UNKNOWN*: jfloat {.`static`.}
  SPL_UNKNOWN*: jfloat {.`static`.}

jclass android.media.MicrophoneInfo.Coordinate3F* of JVMObject:
  proc equals*(obj: JObject): jboolean

jclass android.media.Coordinate3F* of JVMObject:
  proc equals*(obj: JObject): jboolean
  x*: jfloat
  y*: jfloat
  z*: jfloat


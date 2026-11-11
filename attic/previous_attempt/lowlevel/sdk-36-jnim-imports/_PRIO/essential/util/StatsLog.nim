import jnim

jclass android.util.StatsLog* of JVMObject:
  proc logStart*(label: jint): jboolean {.`static`.}
  proc logStop*(label: jint): jboolean {.`static`.}
  proc logEvent*(label: jint): jboolean {.`static`.}
  proc logBinaryPushStateChanged*(trainName: string, trainVersionCode: jlong, options: jint, state: jint, experimentIds: seq[jlong]): jboolean {.`static`.}
  proc writeRaw*(buffer: seq[jbyte], size: jint) {.`static`.}
  proc write*(statsEvent: StatsEvent) {.`static`.}
  ANNOTATION_ID_IS_UID*: jbyte {.`static`.}
  ANNOTATION_ID_TRUNCATE_TIMESTAMP*: jbyte {.`static`.}
  ANNOTATION_ID_PRIMARY_FIELD*: jbyte {.`static`.}
  ANNOTATION_ID_EXCLUSIVE_STATE*: jbyte {.`static`.}
  ANNOTATION_ID_PRIMARY_FIELD_FIRST_UID*: jbyte {.`static`.}
  ANNOTATION_ID_DEFAULT_STATE*: jbyte {.`static`.}
  ANNOTATION_ID_TRIGGER_STATE_RESET*: jbyte {.`static`.}
  ANNOTATION_ID_STATE_NESTED*: jbyte {.`static`.}
  ANNOTATION_ID_RESTRICTION_CATEGORY*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_PERIPHERAL_DEVICE_INFO*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_APP_USAGE*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_APP_ACTIVITY*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_HEALTH_CONNECT*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_ACCESSIBILITY*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_SYSTEM_SEARCH*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_USER_ENGAGEMENT*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_AMBIENT_SENSING*: jbyte {.`static`.}
  ANNOTATION_ID_FIELD_RESTRICTION_DEMOGRAPHIC_CLASSIFICATION*: jbyte {.`static`.}
  RESTRICTION_CATEGORY_DIAGNOSTIC*: jint {.`static`.}
  RESTRICTION_CATEGORY_SYSTEM_INTELLIGENCE*: jint {.`static`.}
  RESTRICTION_CATEGORY_AUTHENTICATION*: jint {.`static`.}
  RESTRICTION_CATEGORY_FRAUD_AND_ABUSE*: jint {.`static`.}


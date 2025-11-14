import jnim

jclass android.util.StatsEvent* of JVMObject:
  proc newBuilder*(): StatsEvent.Builder {.`static`.}
  proc getAtomId*(): jint
  proc getBytes*(): seq[jbyte]
  proc getNumBytes*(): jint
  proc release*()
  TYPE_INT*: jbyte {.`static`.}
  TYPE_LONG*: jbyte {.`static`.}
  TYPE_STRING*: jbyte {.`static`.}
  TYPE_LIST*: jbyte {.`static`.}
  TYPE_FLOAT*: jbyte {.`static`.}
  TYPE_BOOLEAN*: jbyte {.`static`.}
  TYPE_BYTE_ARRAY*: jbyte {.`static`.}
  TYPE_OBJECT*: jbyte {.`static`.}
  TYPE_KEY_VALUE_PAIRS*: jbyte {.`static`.}
  TYPE_ATTRIBUTION_CHAIN*: jbyte {.`static`.}
  TYPE_ERRORS*: jbyte {.`static`.}
  ERROR_NO_TIMESTAMP*: jint {.`static`.}
  ERROR_NO_ATOM_ID*: jint {.`static`.}
  ERROR_OVERFLOW*: jint {.`static`.}
  ERROR_ATTRIBUTION_CHAIN_TOO_LONG*: jint {.`static`.}
  ERROR_TOO_MANY_KEY_VALUE_PAIRS*: jint {.`static`.}
  ERROR_ANNOTATION_DOES_NOT_FOLLOW_FIELD*: jint {.`static`.}
  ERROR_INVALID_ANNOTATION_ID*: jint {.`static`.}
  ERROR_ANNOTATION_ID_TOO_LARGE*: jint {.`static`.}
  ERROR_TOO_MANY_ANNOTATIONS*: jint {.`static`.}
  ERROR_TOO_MANY_FIELDS*: jint {.`static`.}
  ERROR_ATTRIBUTION_UIDS_TAGS_SIZES_NOT_EQUAL*: jint {.`static`.}
  ERROR_ATOM_ID_INVALID_POSITION*: jint {.`static`.}
  ERROR_LIST_TOO_LONG*: jint {.`static`.}
  MAX_ANNOTATION_COUNT*: jint {.`static`.}
  MAX_ATTRIBUTION_NODES*: jint {.`static`.}
  MAX_NUM_ELEMENTS*: jint {.`static`.}
  MAX_KEY_VALUE_PAIRS*: jint {.`static`.}

jclass android.util.StatsEvent.Builder* of JVMObject:
  proc setAtomId*(atomId: jint): Builder
  proc writeBoolean*(value: jboolean): Builder
  proc writeInt*(value: jint): Builder
  proc writeLong*(value: jlong): Builder
  proc writeFloat*(value: jfloat): Builder
  proc writeString*(value: string): Builder
  proc writeByteArray*(value: seq[jbyte]): Builder
  proc writeAttributionChain*(uids: seq[jint], tags: seq[string]): Builder
  proc writeKeyValuePairs*(intMap: SparseIntArray, longMap: SparseLongArray, stringMap: SparseArray[string], floatMap: SparseArray[Float]): Builder
  proc writeBooleanArray*(elements: seq[jboolean]): Builder
  proc writeIntArray*(elements: seq[jint]): Builder
  proc writeLongArray*(elements: seq[jlong]): Builder
  proc writeFloatArray*(elements: seq[jfloat]): Builder
  proc writeStringArray*(elements: seq[string]): Builder
  proc addBooleanAnnotation*(annotationId: jbyte, value: jboolean): Builder
  proc addIntAnnotation*(annotationId: jbyte, value: jint): Builder
  proc usePooledBuffer*(): Builder
  proc build*(): StatsEvent

jclass android.util.Builder* of JVMObject:
  proc setAtomId*(atomId: jint): Builder
  proc writeBoolean*(value: jboolean): Builder
  proc writeInt*(value: jint): Builder
  proc writeLong*(value: jlong): Builder
  proc writeFloat*(value: jfloat): Builder
  proc writeString*(value: string): Builder
  proc writeByteArray*(value: seq[jbyte]): Builder
  proc writeAttributionChain*(uids: seq[jint], tags: seq[string]): Builder
  proc writeKeyValuePairs*(intMap: SparseIntArray, longMap: SparseLongArray, stringMap: SparseArray[string], floatMap: SparseArray[Float]): Builder
  proc writeBooleanArray*(elements: seq[jboolean]): Builder
  proc writeIntArray*(elements: seq[jint]): Builder
  proc writeLongArray*(elements: seq[jlong]): Builder
  proc writeFloatArray*(elements: seq[jfloat]): Builder
  proc writeStringArray*(elements: seq[string]): Builder
  proc addBooleanAnnotation*(annotationId: jbyte, value: jboolean): Builder
  proc addIntAnnotation*(annotationId: jbyte, value: jint): Builder
  proc usePooledBuffer*(): Builder
  proc build*(): StatsEvent


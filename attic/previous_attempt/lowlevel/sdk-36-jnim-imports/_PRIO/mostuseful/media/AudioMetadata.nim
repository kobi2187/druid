import jnim

jclass android.media.AudioMetadata* of JVMObject:
  proc createMap*(): AudioMetadataMap {.`static`.}
  proc createKey*(name: string, type: Class[T]): Key[T] {.`static`.}
  proc fromByteBuffer*(buffer: ByteBuffer): BaseMap {.`static`.}
  proc toByteBuffer*(data: BaseMap, order: ByteOrder): ByteBuffer {.`static`.}

jclass android.media.AudioMetadata.BaseMap* of JVMObject:
  proc containsKey*(key: Key[T]): jboolean
  proc dup*(): AudioMetadataMap
  proc get*(key: Key[T]): T
  proc keySet*(): Set[Key[?]]
  proc remove*(key: Key[T]): T
  proc set*(key: Key[T], value: T): T
  proc size*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint


jclass android.media.Format* of JVMObject:
  KEY_BIT_RATE*: Key[Integer] {.`static`.}
  KEY_CHANNEL_MASK*: Key[Integer] {.`static`.}
  KEY_MIME*: Key[string] {.`static`.}
  KEY_SAMPLE_RATE*: Key[Integer] {.`static`.}
  KEY_BIT_WIDTH*: Key[Integer] {.`static`.}
  KEY_ATMOS_PRESENT*: Key[Boolean] {.`static`.}
  KEY_HAS_ATMOS*: Key[Integer] {.`static`.}
  KEY_AUDIO_ENCODING*: Key[Integer] {.`static`.}
  KEY_PRESENTATION_ID*: Key[Integer] {.`static`.}
  KEY_PROGRAM_ID*: Key[Integer] {.`static`.}
  KEY_PRESENTATION_CONTENT_CLASSIFIER*: Key[Integer] {.`static`.}
  KEY_PRESENTATION_LANGUAGE*: Key[string] {.`static`.}

jclass android.media.BaseMap* of JVMObject:
  proc containsKey*(key: Key[T]): jboolean
  proc dup*(): AudioMetadataMap
  proc get*(key: Key[T]): T
  proc keySet*(): Set[Key[?]]
  proc remove*(key: Key[T]): T
  proc set*(key: Key[T], value: T): T
  proc size*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint


import jnim

jclass android.media.MediaMetrics* of JVMObject:
  proc createKey*(name: string, type: Class[T]): Key[T] {.`static`.}
  TAG*: string {.`static`.}
  SEPARATOR*: string {.`static`.}

jclass android.media.MediaMetrics.Item* of JVMObject:
  proc set*(key: Key[T], value: T): Item
  proc putInt*(key: string, value: jint): Item
  proc putLong*(key: string, value: jlong): Item
  proc putDouble*(key: string, value: jdouble): Item
  proc putString*(key: string, value: string): Item
  proc setPid*(pid: jint): Item
  proc setUid*(uid: jint): Item
  proc setTimestamp*(timeNs: jlong): Item
  proc clear*(): Item
  proc record*(): jboolean
  proc toBundle*(): Bundle
  proc toBundle*(buffer: ByteBuffer): Bundle {.`static`.}

jclass android.media.Name* of JVMObject:
  AUDIO*: string {.`static`.}
  AUDIO_BLUETOOTH*: string {.`static`.}
  AUDIO_DEVICE*: string {.`static`.}
  AUDIO_FOCUS*: string {.`static`.}
  AUDIO_FORCE_USE*: string {.`static`.}
  AUDIO_MIC*: string {.`static`.}
  AUDIO_MIDI*: string {.`static`.}
  AUDIO_MODE*: string {.`static`.}
  AUDIO_SERVICE*: string {.`static`.}
  AUDIO_VOLUME*: string {.`static`.}
  AUDIO_VOLUME_EVENT*: string {.`static`.}
  METRICS_MANAGER*: string {.`static`.}

jclass android.media.Value* of JVMObject:
  CONNECT*: string {.`static`.}
  CONNECTED*: string {.`static`.}
  DISCONNECT*: string {.`static`.}
  DISCONNECTED*: string {.`static`.}
  DOWN*: string {.`static`.}
  MUTE*: string {.`static`.}
  NO*: string {.`static`.}
  OFF*: string {.`static`.}
  ON*: string {.`static`.}
  UNMUTE*: string {.`static`.}
  UP*: string {.`static`.}
  YES*: string {.`static`.}

jclass android.media.Property* of JVMObject:
  ADDRESS*: Key[string] {.`static`.}
  ATTRIBUTES*: Key[string] {.`static`.}
  CALLING_PACKAGE*: Key[string] {.`static`.}
  CLIENT_NAME*: Key[string] {.`static`.}
  CLOSED_COUNT*: Key[Integer] {.`static`.}
  DELAY_MS*: Key[Integer] {.`static`.}
  DEVICE*: Key[string] {.`static`.}
  DEVICE_DISCONNECTED*: Key[string] {.`static`.}
  DEVICE_ID*: Key[Integer] {.`static`.}
  DIRECTION*: Key[string] {.`static`.}
  DURATION_NS*: Key[Long] {.`static`.}
  EARLY_RETURN*: Key[string] {.`static`.}
  ENCODING*: Key[string] {.`static`.}
  EVENT*: Key[string] {.`static`.}
  ENABLED*: Key[string] {.`static`.}
  EXTERNAL*: Key[string] {.`static`.}
  FLAGS*: Key[Integer] {.`static`.}
  FOCUS_CHANGE_HINT*: Key[string] {.`static`.}
  FORCE_USE_DUE_TO*: Key[string] {.`static`.}
  FORCE_USE_MODE*: Key[string] {.`static`.}
  GAIN_DB*: Key[Double] {.`static`.}
  GROUP*: Key[string] {.`static`.}
  HAS_HEAD_TRACKER*: Key[string] {.`static`.}
  HARDWARE_TYPE*: Key[Integer] {.`static`.}
  HEAD_TRACKER_ENABLED*: Key[string] {.`static`.}
  INDEX*: Key[Integer] {.`static`.}
  OLD_INDEX*: Key[Integer] {.`static`.}
  INPUT_PORT_COUNT*: Key[Integer] {.`static`.}
  IS_SHARED*: Key[string] {.`static`.}
  LOG_SESSION_ID*: Key[string] {.`static`.}
  MAX_INDEX*: Key[Integer] {.`static`.}
  MIN_INDEX*: Key[Integer] {.`static`.}
  MODE*: Key[string] {.`static`.}
  MUTE*: Key[string] {.`static`.}
  NAME*: Key[string] {.`static`.}
  OBSERVERS*: Key[Integer] {.`static`.}
  OPENED_COUNT*: Key[Integer] {.`static`.}
  OUTPUT_PORT_COUNT*: Key[Integer] {.`static`.}
  REQUEST*: Key[string] {.`static`.}
  REQUESTED_MODE*: Key[string] {.`static`.}
  SCO_AUDIO_MODE*: Key[string] {.`static`.}
  SDK*: Key[Integer] {.`static`.}
  STATE*: Key[string] {.`static`.}
  STATUS*: Key[Integer] {.`static`.}
  STREAM_TYPE*: Key[string] {.`static`.}
  SUPPORTS_MIDI_UMP*: Key[string] {.`static`.}
  TOTAL_INPUT_BYTES*: Key[Integer] {.`static`.}
  TOTAL_OUTPUT_BYTES*: Key[Integer] {.`static`.}
  USING_ALSA*: Key[string] {.`static`.}


jclass android.media.Item* of JVMObject:
  proc set*(key: Key[T], value: T): Item
  proc putInt*(key: string, value: jint): Item
  proc putLong*(key: string, value: jlong): Item
  proc putDouble*(key: string, value: jdouble): Item
  proc putString*(key: string, value: string): Item
  proc setPid*(pid: jint): Item
  proc setUid*(uid: jint): Item
  proc setTimestamp*(timeNs: jlong): Item
  proc clear*(): Item
  proc record*(): jboolean
  proc toBundle*(): Bundle
  proc toBundle*(buffer: ByteBuffer): Bundle {.`static`.}
  BUNDLE_TOTAL_SIZE*: string {.`static`.}
  BUNDLE_HEADER_SIZE*: string {.`static`.}
  BUNDLE_VERSION*: string {.`static`.}
  BUNDLE_KEY_SIZE*: string {.`static`.}
  BUNDLE_KEY*: string {.`static`.}
  BUNDLE_PID*: string {.`static`.}
  BUNDLE_UID*: string {.`static`.}
  BUNDLE_TIMESTAMP*: string {.`static`.}
  BUNDLE_PROPERTY_COUNT*: string {.`static`.}


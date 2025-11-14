import jnim

jclass android.provider.BlockedNumberContract* of JVMObject:
  proc isBlocked*(context: Context, phoneNumber: string): jboolean {.`static`.}
  proc unblock*(context: Context, phoneNumber: string): jint {.`static`.}
  proc canCurrentUserBlockNumbers*(context: Context): jboolean {.`static`.}
  AUTHORITY*: string {.`static`.}
  AUTHORITY_URI*: Uri {.`static`.}
  METHOD_IS_BLOCKED*: string {.`static`.}
  METHOD_UNBLOCK*: string {.`static`.}
  RES_NUMBER_IS_BLOCKED*: string {.`static`.}
  STATUS_NOT_BLOCKED*: jint {.`static`.}
  STATUS_BLOCKED_IN_LIST*: jint {.`static`.}
  STATUS_BLOCKED_RESTRICTED*: jint {.`static`.}
  STATUS_BLOCKED_UNKNOWN_NUMBER*: jint {.`static`.}
  STATUS_BLOCKED_PAYPHONE*: jint {.`static`.}
  STATUS_BLOCKED_NOT_IN_CONTACTS*: jint {.`static`.}
  STATUS_BLOCKED_UNAVAILABLE*: jint {.`static`.}
  RES_BLOCK_STATUS*: string {.`static`.}
  RES_NUM_ROWS_DELETED*: string {.`static`.}
  METHOD_CAN_CURRENT_USER_BLOCK_NUMBERS*: string {.`static`.}
  RES_CAN_BLOCK_NUMBERS*: string {.`static`.}
  RES_ENHANCED_SETTING_IS_ENABLED*: string {.`static`.}
  RES_SHOW_EMERGENCY_CALL_NOTIFICATION*: string {.`static`.}
  EXTRA_ENHANCED_SETTING_KEY*: string {.`static`.}
  EXTRA_ENHANCED_SETTING_VALUE*: string {.`static`.}
  EXTRA_CONTACT_EXIST*: string {.`static`.}
  EXTRA_CALL_PRESENTATION*: string {.`static`.}

jclass android.provider.BlockedNumberContract.SystemContract* of JVMObject:
  proc notifyEmergencyContact*(context: Context) {.`static`.}
  proc endBlockSuppression*(context: Context) {.`static`.}
  proc shouldSystemBlockNumber*(context: Context, phoneNumber: string, extras: Bundle): jint {.`static`.}
  proc getBlockSuppressionStatus*(context: Context): BlockSuppressionStatus {.`static`.}
  proc shouldShowEmergencyCallNotification*(context: Context): jboolean {.`static`.}
  proc getEnhancedBlockSetting*(context: Context, key: string): jboolean {.`static`.}
  proc setEnhancedBlockSetting*(context: Context, key: string, value: jboolean) {.`static`.}
  proc blockStatusToString*(blockStatus: jint): string {.`static`.}

jclass android.provider.BlockedNumbers* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  COLUMN_ID*: string {.`static`.}
  COLUMN_ORIGINAL_NUMBER*: string {.`static`.}
  COLUMN_E164_NUMBER*: string {.`static`.}

jclass android.provider.SystemContract* of JVMObject:
  proc notifyEmergencyContact*(context: Context) {.`static`.}
  proc endBlockSuppression*(context: Context) {.`static`.}
  proc shouldSystemBlockNumber*(context: Context, phoneNumber: string, extras: Bundle): jint {.`static`.}
  proc getBlockSuppressionStatus*(context: Context): BlockSuppressionStatus {.`static`.}
  proc shouldShowEmergencyCallNotification*(context: Context): jboolean {.`static`.}
  proc getEnhancedBlockSetting*(context: Context, key: string): jboolean {.`static`.}
  proc setEnhancedBlockSetting*(context: Context, key: string, value: jboolean) {.`static`.}
  proc blockStatusToString*(blockStatus: jint): string {.`static`.}
  ACTION_BLOCK_SUPPRESSION_STATE_CHANGED*: string {.`static`.}
  METHOD_NOTIFY_EMERGENCY_CONTACT*: string {.`static`.}
  METHOD_END_BLOCK_SUPPRESSION*: string {.`static`.}
  METHOD_SHOULD_SYSTEM_BLOCK_NUMBER*: string {.`static`.}
  METHOD_GET_BLOCK_SUPPRESSION_STATUS*: string {.`static`.}
  METHOD_SHOULD_SHOW_EMERGENCY_CALL_NOTIFICATION*: string {.`static`.}
  RES_IS_BLOCKING_SUPPRESSED*: string {.`static`.}
  RES_BLOCKING_SUPPRESSED_UNTIL_TIMESTAMP*: string {.`static`.}
  METHOD_GET_ENHANCED_BLOCK_SETTING*: string {.`static`.}
  METHOD_SET_ENHANCED_BLOCK_SETTING*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNREGISTERED*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_PRIVATE*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_PAYPHONE*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNKNOWN*: string {.`static`.}
  ENHANCED_SETTING_KEY_SHOW_EMERGENCY_CALL_NOTIFICATION*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNAVAILABLE*: string {.`static`.}

jclass android.provider.SystemContract.BlockSuppressionStatus* of JVMObject:
  proc toString*(): string

jclass android.provider.BlockSuppressionStatus* of JVMObject:
  proc toString*(): string
  isSuppressed*: jboolean
  untilTimestampMillis*: jlong


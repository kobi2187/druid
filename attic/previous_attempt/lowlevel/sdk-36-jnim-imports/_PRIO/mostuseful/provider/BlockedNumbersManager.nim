import jnim

jclass android.provider.BlockedNumbersManager* of JVMObject:
  proc notifyEmergencyContact*()
  proc endBlockSuppression*()
  proc shouldSystemBlockNumber*(phoneNumber: string, numberPresentation: jint, isNumberInContacts: jboolean): jint
  proc getBlockSuppressionStatus*(): BlockSuppressionStatus
  proc shouldShowEmergencyCallNotification*(): jboolean
  proc getBlockedNumberSetting*(key: string): jboolean
  proc setBlockedNumberSetting*(key: string, value: jboolean)
  ACTION_BLOCK_SUPPRESSION_STATE_CHANGED*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNREGISTERED*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_PRIVATE*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_PAYPHONE*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNKNOWN*: string {.`static`.}
  ENHANCED_SETTING_KEY_SHOW_EMERGENCY_CALL_NOTIFICATION*: string {.`static`.}
  ENHANCED_SETTING_KEY_BLOCK_UNAVAILABLE*: string {.`static`.}

jclass android.provider.BlockedNumbersManager.BlockSuppressionStatus* of JVMObject:
  proc toString*(): string
  proc getIsSuppressed*(): jboolean
  proc getUntilTimestampMillis*(): jlong

jclass android.provider.BlockSuppressionStatus* of JVMObject:
  proc toString*(): string
  proc getIsSuppressed*(): jboolean
  proc getUntilTimestampMillis*(): jlong


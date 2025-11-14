import jnim

jclass android.safetycenter.SafetyEvent* of JVMObject:
  proc getType*(): jint
  proc getRefreshBroadcastId*(): string
  proc getSafetySourceIssueId*(): string
  proc getSafetySourceIssueActionId*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  SAFETY_EVENT_TYPE_SOURCE_STATE_CHANGED*: jint {.`static`.}
  SAFETY_EVENT_TYPE_REFRESH_REQUESTED*: jint {.`static`.}
  SAFETY_EVENT_TYPE_RESOLVING_ACTION_SUCCEEDED*: jint {.`static`.}
  SAFETY_EVENT_TYPE_RESOLVING_ACTION_FAILED*: jint {.`static`.}
  SAFETY_EVENT_TYPE_DEVICE_LOCALE_CHANGED*: jint {.`static`.}
  SAFETY_EVENT_TYPE_DEVICE_REBOOTED*: jint {.`static`.}
  CREATOR*: Creator[SafetyEvent] {.`static`.}

jclass android.safetycenter.SafetyEvent.Builder* of JVMObject:
  proc setRefreshBroadcastId*(refreshBroadcastId: string): Builder
  proc setSafetySourceIssueId*(safetySourceIssueId: string): Builder
  proc setSafetySourceIssueActionId*(safetySourceIssueActionId: string): Builder
  proc build*(): SafetyEvent

jclass android.safetycenter.Builder* of JVMObject:
  proc setRefreshBroadcastId*(refreshBroadcastId: string): Builder
  proc setSafetySourceIssueId*(safetySourceIssueId: string): Builder
  proc setSafetySourceIssueActionId*(safetySourceIssueActionId: string): Builder
  proc build*(): SafetyEvent


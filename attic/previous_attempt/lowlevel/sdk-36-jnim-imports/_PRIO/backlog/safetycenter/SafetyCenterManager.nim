import jnim

jclass android.safetycenter.SafetyCenterManager* of JVMObject:
  proc isSafetyCenterEnabled*(): jboolean
  proc setSafetySourceData*(safetySourceId: string, safetySourceData: SafetySourceData, safetyEvent: SafetyEvent)
  proc getSafetySourceData*(safetySourceId: string): SafetySourceData
  proc reportSafetySourceError*(safetySourceId: string, safetySourceErrorDetails: SafetySourceErrorDetails)
  proc refreshSafetySources*(refreshReason: jint)
  proc refreshSafetySources*(refreshReason: jint, safetySourceIds: List[string])
  proc getSafetyCenterConfig*(): SafetyCenterConfig
  proc getSafetyCenterData*(): SafetyCenterData
  proc addOnSafetyCenterDataChangedListener*(executor: Executor, listener: OnSafetyCenterDataChangedListener)
  proc removeOnSafetyCenterDataChangedListener*(listener: OnSafetyCenterDataChangedListener)
  proc dismissSafetyCenterIssue*(safetyCenterIssueId: string)
  proc executeSafetyCenterIssueAction*(safetyCenterIssueId: string, safetyCenterIssueActionId: string)
  proc clearAllSafetySourceDataForTests*()
  proc setSafetyCenterConfigForTests*(safetyCenterConfig: SafetyCenterConfig)
  proc clearSafetyCenterConfigForTests*()
  ACTION_SAFETY_CENTER_ENABLED_CHANGED*: string {.`static`.}
  ACTION_REFRESH_SAFETY_SOURCES*: string {.`static`.}
  EXTRA_REFRESH_SAFETY_SOURCE_IDS*: string {.`static`.}
  EXTRA_REFRESH_SAFETY_SOURCES_REQUEST_TYPE*: string {.`static`.}
  EXTRA_REFRESH_SAFETY_SOURCES_BROADCAST_ID*: string {.`static`.}
  EXTRA_SAFETY_SOURCE_ISSUE_ID*: string {.`static`.}
  EXTRA_SAFETY_SOURCE_ID*: string {.`static`.}
  EXTRA_SAFETY_SOURCE_USER_HANDLE*: string {.`static`.}
  EXTRA_SAFETY_SOURCES_GROUP_ID*: string {.`static`.}
  EXTRA_REFRESH_REQUEST_TYPE_FETCH_FRESH_DATA*: jint {.`static`.}
  EXTRA_REFRESH_REQUEST_TYPE_GET_DATA*: jint {.`static`.}
  REFRESH_REASON_PAGE_OPEN*: jint {.`static`.}
  REFRESH_REASON_RESCAN_BUTTON_CLICK*: jint {.`static`.}
  REFRESH_REASON_DEVICE_REBOOT*: jint {.`static`.}
  REFRESH_REASON_DEVICE_LOCALE_CHANGE*: jint {.`static`.}
  REFRESH_REASON_SAFETY_CENTER_ENABLED*: jint {.`static`.}
  REFRESH_REASON_OTHER*: jint {.`static`.}
  REFRESH_REASON_PERIODIC*: jint {.`static`.}


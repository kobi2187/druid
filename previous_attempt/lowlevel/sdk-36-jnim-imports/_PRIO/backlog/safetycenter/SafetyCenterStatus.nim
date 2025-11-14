import jnim

jclass android.safetycenter.SafetyCenterStatus* of JVMObject:
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getSeverityLevel*(): jint
  proc getRefreshStatus*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  OVERALL_SEVERITY_LEVEL_UNKNOWN*: jint {.`static`.}
  OVERALL_SEVERITY_LEVEL_OK*: jint {.`static`.}
  OVERALL_SEVERITY_LEVEL_RECOMMENDATION*: jint {.`static`.}
  OVERALL_SEVERITY_LEVEL_CRITICAL_WARNING*: jint {.`static`.}
  REFRESH_STATUS_NONE*: jint {.`static`.}
  REFRESH_STATUS_DATA_FETCH_IN_PROGRESS*: jint {.`static`.}
  REFRESH_STATUS_FULL_RESCAN_IN_PROGRESS*: jint {.`static`.}
  CREATOR*: Creator[SafetyCenterStatus] {.`static`.}

jclass android.safetycenter.SafetyCenterStatus.Builder* of JVMObject:
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setRefreshStatus*(refreshStatus: jint): Builder
  proc build*(): SafetyCenterStatus

jclass android.safetycenter.Builder* of JVMObject:
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setRefreshStatus*(refreshStatus: jint): Builder
  proc build*(): SafetyCenterStatus


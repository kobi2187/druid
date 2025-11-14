import jnim

jclass android.safetycenter.SafetySourceData* of JVMObject:
  proc getStatus*(): SafetySourceStatus
  proc getIssues*(): List[SafetySourceIssue]
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  SEVERITY_LEVEL_UNSPECIFIED*: jint {.`static`.}
  SEVERITY_LEVEL_INFORMATION*: jint {.`static`.}
  SEVERITY_LEVEL_RECOMMENDATION*: jint {.`static`.}
  SEVERITY_LEVEL_CRITICAL_WARNING*: jint {.`static`.}
  CREATOR*: Creator[SafetySourceData] {.`static`.}

jclass android.safetycenter.SafetySourceData.Builder* of JVMObject:
  proc setStatus*(status: SafetySourceStatus): Builder
  proc addIssue*(safetySourceIssue: SafetySourceIssue): Builder
  proc setExtras*(extras: Bundle): Builder
  proc clearExtras*(): Builder
  proc clearIssues*(): Builder
  proc build*(): SafetySourceData

jclass android.safetycenter.Builder* of JVMObject:
  proc setStatus*(status: SafetySourceStatus): Builder
  proc addIssue*(safetySourceIssue: SafetySourceIssue): Builder
  proc setExtras*(extras: Bundle): Builder
  proc clearExtras*(): Builder
  proc clearIssues*(): Builder
  proc build*(): SafetySourceData


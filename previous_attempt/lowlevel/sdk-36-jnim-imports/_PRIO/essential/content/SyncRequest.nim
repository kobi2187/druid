import jnim

jclass android.content.SyncRequest* of JVMObject:
  proc isPeriodic*(): jboolean
  proc isExpedited*(): jboolean
  proc isScheduledAsExpeditedJob*(): jboolean
  proc getAccount*(): Account
  proc getProvider*(): string
  proc getBundle*(): Bundle
  proc getSyncFlexTime*(): jlong
  proc getSyncRunTime*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[SyncRequest] {.`static`.}

jclass android.content.SyncRequest.Builder* of JVMObject:
  proc syncOnce*(): Builder
  proc syncPeriodic*(pollFrequency: jlong, beforeSeconds: jlong): Builder
  proc setDisallowMetered*(disallow: jboolean): Builder
  proc setRequiresCharging*(requiresCharging: jboolean): Builder
  proc setSyncAdapter*(account: Account, authority: string): Builder
  proc setExtras*(bundle: Bundle): Builder
  proc setNoRetry*(noRetry: jboolean): Builder
  proc setIgnoreSettings*(ignoreSettings: jboolean): Builder
  proc setIgnoreBackoff*(ignoreBackoff: jboolean): Builder
  proc setManual*(isManual: jboolean): Builder
  proc setExpedited*(expedited: jboolean): Builder
  proc setScheduleAsExpeditedJob*(scheduleAsExpeditedJob: jboolean): Builder
  proc build*(): SyncRequest

jclass android.content.Builder* of JVMObject:
  proc syncOnce*(): Builder
  proc syncPeriodic*(pollFrequency: jlong, beforeSeconds: jlong): Builder
  proc setDisallowMetered*(disallow: jboolean): Builder
  proc setRequiresCharging*(requiresCharging: jboolean): Builder
  proc setSyncAdapter*(account: Account, authority: string): Builder
  proc setExtras*(bundle: Bundle): Builder
  proc setNoRetry*(noRetry: jboolean): Builder
  proc setIgnoreSettings*(ignoreSettings: jboolean): Builder
  proc setIgnoreBackoff*(ignoreBackoff: jboolean): Builder
  proc setManual*(isManual: jboolean): Builder
  proc setExpedited*(expedited: jboolean): Builder
  proc setScheduleAsExpeditedJob*(scheduleAsExpeditedJob: jboolean): Builder
  proc build*(): SyncRequest


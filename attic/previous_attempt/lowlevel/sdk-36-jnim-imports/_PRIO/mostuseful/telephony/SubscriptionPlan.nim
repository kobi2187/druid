import jnim

jclass android.telephony.SubscriptionPlan* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc getCycleRule*(): RecurrenceRule
  proc getPlanEndDate*(): ZonedDateTime
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getDataLimitBytes*(): jlong
  proc getDataLimitBehavior*(): jint
  proc getDataUsageBytes*(): jlong
  proc getDataUsageTime*(): jlong
  proc getNetworkTypes*(): seq[jint]
  proc cycleIterator*(): Iterator[Range[ZonedDateTime]]
  proc getSubscriptionStatus*(): jint
  LIMIT_BEHAVIOR_UNKNOWN*: jint {.`static`.}
  LIMIT_BEHAVIOR_DISABLED*: jint {.`static`.}
  LIMIT_BEHAVIOR_BILLED*: jint {.`static`.}
  LIMIT_BEHAVIOR_THROTTLED*: jint {.`static`.}
  BYTES_UNKNOWN*: jlong {.`static`.}
  BYTES_UNLIMITED*: jlong {.`static`.}
  TIME_UNKNOWN*: jlong {.`static`.}
  SUBSCRIPTION_STATUS_UNKNOWN*: jint {.`static`.}
  SUBSCRIPTION_STATUS_ACTIVE*: jint {.`static`.}
  SUBSCRIPTION_STATUS_INACTIVE*: jint {.`static`.}
  SUBSCRIPTION_STATUS_TRIAL*: jint {.`static`.}
  SUBSCRIPTION_STATUS_SUSPENDED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[SubscriptionPlan] {.`static`.}

jclass android.telephony.SubscriptionPlan.Builder* of JVMObject:
  proc createNonrecurring*(start: ZonedDateTime, end: ZonedDateTime): Builder {.`static`.}
  proc createRecurring*(start: ZonedDateTime, period: Period): Builder {.`static`.}
  proc createRecurringMonthly*(start: ZonedDateTime): Builder {.`static`.}
  proc createRecurringWeekly*(start: ZonedDateTime): Builder {.`static`.}
  proc createRecurringDaily*(start: ZonedDateTime): Builder {.`static`.}
  proc build*(): SubscriptionPlan
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setDataLimit*(dataLimitBytes: jlong, dataLimitBehavior: jint): Builder
  proc setDataUsage*(dataUsageBytes: jlong, dataUsageTime: jlong): Builder
  proc setNetworkTypes*(networkTypes: seq[jint]): Builder
  proc resetNetworkTypes*(): Builder
  proc setSubscriptionStatus*(subscriptionStatus: jint): Builder

jclass android.telephony.Builder* of JVMObject:
  proc createNonrecurring*(start: ZonedDateTime, end: ZonedDateTime): Builder {.`static`.}
  proc createRecurring*(start: ZonedDateTime, period: Period): Builder {.`static`.}
  proc createRecurringMonthly*(start: ZonedDateTime): Builder {.`static`.}
  proc createRecurringWeekly*(start: ZonedDateTime): Builder {.`static`.}
  proc createRecurringDaily*(start: ZonedDateTime): Builder {.`static`.}
  proc build*(): SubscriptionPlan
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setDataLimit*(dataLimitBytes: jlong, dataLimitBehavior: jint): Builder
  proc setDataUsage*(dataUsageBytes: jlong, dataUsageTime: jlong): Builder
  proc setNetworkTypes*(networkTypes: seq[jint]): Builder
  proc resetNetworkTypes*(): Builder
  proc setSubscriptionStatus*(subscriptionStatus: jint): Builder


import jnim

jclass android.net.NetworkPolicy* of JVMObject:
  proc buildRule*(cycleDay: jint, cycleTimezone: ZoneId): RecurrenceRule {.`static`.}
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc cycleIterator*(): Iterator[Range[ZonedDateTime]]
  proc isOverWarning*(totalBytes: jlong): jboolean
  proc isOverLimit*(totalBytes: jlong): jboolean
  proc clearSnooze*()
  proc hasCycle*(): jboolean
  proc compareTo*(another: NetworkPolicy): jint
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc getBytesForBackup*(): seq[jbyte]
  proc getNetworkPolicyFromBackup*(in: DataInputStream): NetworkPolicy {.`static`.}
  proc isTemplatePersistable*(template: NetworkTemplate): jboolean {.`static`.}
  CYCLE_NONE*: jint {.`static`.}
  WARNING_DISABLED*: jlong {.`static`.}
  LIMIT_DISABLED*: jlong {.`static`.}
  SNOOZE_NEVER*: jlong {.`static`.}
  template*: NetworkTemplate
  cycleRule*: RecurrenceRule
  warningBytes*: jlong
  limitBytes*: jlong
  lastWarningSnooze*: jlong
  lastLimitSnooze*: jlong
  lastRapidSnooze*: jlong
  metered*: jboolean
  inferred*: jboolean
  CREATOR*: Creator[NetworkPolicy] {.`static`.}


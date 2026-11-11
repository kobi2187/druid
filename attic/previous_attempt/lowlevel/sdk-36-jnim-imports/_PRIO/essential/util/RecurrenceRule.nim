import jnim

jclass android.util.RecurrenceRule* of JVMObject:
  proc buildNever*(): RecurrenceRule {.`static`.}
  proc buildRecurringMonthly*(dayOfMonth: jint, zone: ZoneId): RecurrenceRule {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc writeToStream*(output:DataOutputStream)
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc isRecurring*(): jboolean
  proc isMonthly*(): jboolean
  proc cycleIterator*(): Iterator[Range[ZonedDateTime]]
  proc convertZonedDateTime*(time: ZonedDateTime): string {.`static`.}
  proc convertZonedDateTime*(time: string): ZonedDateTime {.`static`.}
  proc convertPeriod*(period: Period): string {.`static`.}
  proc convertPeriod*(period: string): Period {.`static`.}
  sClock*: Clock {.`static`.}
  start*: ZonedDateTime
  end*: ZonedDateTime
  period*: Period
  CREATOR*: Parcelable.Creator[RecurrenceRule] {.`static`.}


import jnim

jclass java.time.ZoneOffset* of ZoneId:
  proc of*(offsetId: string): ZoneOffset {.`static`.}
  proc ofHours*(hours: jint): ZoneOffset {.`static`.}
  proc ofHoursMinutes*(hours: jint, minutes: jint): ZoneOffset {.`static`.}
  proc ofHoursMinutesSeconds*(hours: jint, minutes: jint, seconds: jint): ZoneOffset {.`static`.}
  proc from*(temporal: TemporalAccessor): ZoneOffset {.`static`.}
  proc ofTotalSeconds*(totalSeconds: jint): ZoneOffset {.`static`.}
  proc getTotalSeconds*(): jint
  proc getId*(): string
  proc getRules*(): ZoneRules
  proc normalized*(): ZoneId
  proc isSupported*(field: TemporalField): jboolean
  proc range*(field: TemporalField): ValueRange
  proc get*(field: TemporalField): jint
  proc getLong*(field: TemporalField): jlong
  proc query*(query: TemporalQuery[R]): R
  proc adjustInto*(temporal: Temporal): Temporal
  proc compareTo*(other: ZoneOffset): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  UTC*: ZoneOffset {.`static`.}
  MIN*: ZoneOffset {.`static`.}
  MAX*: ZoneOffset {.`static`.}


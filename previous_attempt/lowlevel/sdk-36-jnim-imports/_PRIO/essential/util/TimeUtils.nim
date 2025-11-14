import jnim

jclass android.util.TimeUtils* of JVMObject:
  proc getTimeZone*(offset: jint, dst: jboolean, when: jlong, country: string): java.util.TimeZone {.`static`.}
  proc getTimeZoneIdsForCountryCode*(countryCode: string): List[string] {.`static`.}
  proc getTimeZoneDatabaseVersion*(): string {.`static`.}
  proc formatDuration*(duration: jlong, builder: StringBuilder) {.`static`.}
  proc formatDuration*(duration: jlong, builder: StringBuilder, fieldLen: jint) {.`static`.}
  proc formatDuration*(duration: jlong, pw: PrintWriter, fieldLen: jint) {.`static`.}
  proc formatDuration*(duration: jlong): string {.`static`.}
  proc formatDuration*(duration: jlong, pw: PrintWriter) {.`static`.}
  proc formatDuration*(time: jlong, now: jlong, sb: StringBuilder) {.`static`.}
  proc formatDuration*(time: jlong, now: jlong, pw: PrintWriter) {.`static`.}
  proc formatUptime*(time: jlong): string {.`static`.}
  proc formatRealtime*(time: jlong): string {.`static`.}
  proc formatTime*(time: jlong, referenceTime: jlong): string {.`static`.}
  proc logTimeOfDay*(millis: jlong): string {.`static`.}
  proc formatForLogging*(millis: jlong): string {.`static`.}
  proc dumpTime*(pw: PrintWriter, time: jlong) {.`static`.}
  proc isTimeBetween*(reference: LocalTime, start: LocalTime, end: LocalTime): jboolean {.`static`.}
  proc dumpTimeWithDelta*(pw: PrintWriter, time: jlong, now: jlong) {.`static`.}
  sDumpDateFormat*: SimpleDateFormat {.`static`.}
  MIN_USE_DATE_OF_TIMEZONE*: Instant {.`static`.}
  HUNDRED_DAY_FIELD_LEN*: jint {.`static`.}
  NANOS_PER_MS*: jlong {.`static`.}


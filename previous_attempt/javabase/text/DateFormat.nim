import jnim

jclass java.text.DateFormat* of Format:
  proc format*(obj: JObject, toAppendTo: StringBuffer, fieldPosition: FieldPosition): StringBuffer
  proc format*(date: Date, toAppendTo: StringBuffer, fieldPosition: FieldPosition): StringBuffer
  proc format*(date: Date): string
  proc parse*(source: string): Date
  proc parse*(source: string, pos: ParsePosition): Date
  proc parseObject*(source: string, pos: ParsePosition): JObject
  proc getTimeInstance*(): DateFormat {.`static`.}
  proc getTimeInstance*(style: jint): DateFormat {.`static`.}
  proc getTimeInstance*(style: jint, aLocale: Locale): DateFormat {.`static`.}
  proc getDateInstance*(): DateFormat {.`static`.}
  proc getDateInstance*(style: jint): DateFormat {.`static`.}
  proc getDateInstance*(style: jint, aLocale: Locale): DateFormat {.`static`.}
  proc getDateTimeInstance*(): DateFormat {.`static`.}
  proc getDateTimeInstance*(dateStyle: jint, timeStyle: jint): DateFormat {.`static`.}
  proc getDateTimeInstance*(dateStyle: jint, timeStyle: jint, aLocale: Locale): DateFormat {.`static`.}
  proc getInstance*(): DateFormat {.`static`.}
  proc getAvailableLocales*(): seq[Locale] {.`static`.}
  proc setCalendar*(newCalendar: Calendar)
  proc getCalendar*(): Calendar
  proc setNumberFormat*(newNumberFormat: NumberFormat)
  proc getNumberFormat*(): NumberFormat
  proc setTimeZone*(zone: TimeZone)
  proc getTimeZone*(): TimeZone
  proc setLenient*(lenient: jboolean)
  proc isLenient*(): jboolean
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc clone*(): JObject
  ERA_FIELD*: jint {.`static`.}
  YEAR_FIELD*: jint {.`static`.}
  MONTH_FIELD*: jint {.`static`.}
  DATE_FIELD*: jint {.`static`.}
  HOUR_OF_DAY1_FIELD*: jint {.`static`.}
  HOUR_OF_DAY0_FIELD*: jint {.`static`.}
  MINUTE_FIELD*: jint {.`static`.}
  SECOND_FIELD*: jint {.`static`.}
  MILLISECOND_FIELD*: jint {.`static`.}
  DAY_OF_WEEK_FIELD*: jint {.`static`.}
  DAY_OF_YEAR_FIELD*: jint {.`static`.}
  DAY_OF_WEEK_IN_MONTH_FIELD*: jint {.`static`.}
  WEEK_OF_YEAR_FIELD*: jint {.`static`.}
  WEEK_OF_MONTH_FIELD*: jint {.`static`.}
  AM_PM_FIELD*: jint {.`static`.}
  HOUR1_FIELD*: jint {.`static`.}
  HOUR0_FIELD*: jint {.`static`.}
  TIMEZONE_FIELD*: jint {.`static`.}
  FULL*: jint {.`static`.}
  LONG*: jint {.`static`.}
  MEDIUM*: jint {.`static`.}
  SHORT*: jint {.`static`.}
  DEFAULT*: jint {.`static`.}

jclass java.text.DateFormat.Field* of JVMObject:
  proc ofCalendarField*(calendarField: jint): Field {.`static`.}
  proc getCalendarField*(): jint

jclass java.text.Field* of Field:
  proc ofCalendarField*(calendarField: jint): Field {.`static`.}
  proc getCalendarField*(): jint
  ERA*: Field {.`static`.}
  YEAR*: Field {.`static`.}
  MONTH*: Field {.`static`.}
  DAY_OF_MONTH*: Field {.`static`.}
  HOUR_OF_DAY1*: Field {.`static`.}
  HOUR_OF_DAY0*: Field {.`static`.}
  MINUTE*: Field {.`static`.}
  SECOND*: Field {.`static`.}
  MILLISECOND*: Field {.`static`.}
  DAY_OF_WEEK*: Field {.`static`.}
  DAY_OF_YEAR*: Field {.`static`.}
  DAY_OF_WEEK_IN_MONTH*: Field {.`static`.}
  WEEK_OF_YEAR*: Field {.`static`.}
  WEEK_OF_MONTH*: Field {.`static`.}
  AM_PM*: Field {.`static`.}
  HOUR1*: Field {.`static`.}
  HOUR0*: Field {.`static`.}
  TIME_ZONE*: Field {.`static`.}


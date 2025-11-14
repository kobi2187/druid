import jnim

jclass android.provider.CalendarContract* of JVMObject:
  proc startViewCalendarEventInManagedProfile*(context: Context, eventId: jlong, startMs: jlong, endMs: jlong, allDay: jboolean, flags: jint): jboolean {.`static`.}
  ACTION_EVENT_REMINDER*: string {.`static`.}
  ACTION_HANDLE_CUSTOM_EVENT*: string {.`static`.}
  ACTION_VIEW_MANAGED_PROFILE_CALENDAR_EVENT*: string {.`static`.}
  EXTRA_CUSTOM_APP_URI*: string {.`static`.}
  EXTRA_EVENT_BEGIN_TIME*: string {.`static`.}
  EXTRA_EVENT_END_TIME*: string {.`static`.}
  EXTRA_EVENT_ALL_DAY*: string {.`static`.}
  EXTRA_EVENT_ID*: string {.`static`.}
  AUTHORITY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_URI*: Uri {.`static`.}
  CALLER_IS_SYNCADAPTER*: string {.`static`.}
  ACCOUNT_TYPE_LOCAL*: string {.`static`.}

jclass android.provider.CalendarContract.CalendarEntity* of JVMObject:
  proc newEntityIterator*(cursor: Cursor): EntityIterator {.`static`.}

jclass android.provider.CalendarContract.Attendees* of JVMObject:
  proc query*(cr: ContentResolver, eventId: jlong, projection: seq[string]): Cursor {.`static`.}

jclass android.provider.CalendarContract.EventsEntity* of JVMObject:
  proc newEntityIterator*(cursor: Cursor, resolver: ContentResolver): EntityIterator {.`static`.}
  proc newEntityIterator*(cursor: Cursor, provider: ContentProviderClient): EntityIterator {.`static`.}

jclass android.provider.CalendarContract.Instances* of JVMObject:
  proc query*(cr: ContentResolver, projection: seq[string], begin: jlong, end: jlong): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], begin: jlong, end: jlong, searchQuery: string): Cursor {.`static`.}

jclass android.provider.CalendarContract.EventDays* of JVMObject:
  proc query*(cr: ContentResolver, startDay: jint, numDays: jint, projection: seq[string]): Cursor {.`static`.}

jclass android.provider.CalendarContract.Reminders* of JVMObject:
  proc query*(cr: ContentResolver, eventId: jlong, projection: seq[string]): Cursor {.`static`.}

jclass android.provider.CalendarContract.CalendarAlerts* of JVMObject:
  proc insert*(cr: ContentResolver, eventId: jlong, begin: jlong, end: jlong, alarmTime: jlong, minutes: jint): Uri {.`static`.}
  proc findNextAlarmTime*(cr: ContentResolver, millis: jlong): jlong {.`static`.}
  proc rescheduleMissedAlarms*(cr: ContentResolver, context: Context, manager: AlarmManager) {.`static`.}
  proc scheduleAlarm*(context: Context, manager: AlarmManager, alarmTime: jlong) {.`static`.}
  proc alarmExists*(cr: ContentResolver, eventId: jlong, begin: jlong, alarmTime: jlong): jboolean {.`static`.}

jclass android.provider.CalendarEntity* of JVMObject:
  proc newEntityIterator*(cursor: Cursor): EntityIterator {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.Calendars* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  NAME*: string {.`static`.}
  CALENDAR_LOCATION*: string {.`static`.}
  SYNC_WRITABLE_COLUMNS*: string {.`static`.}

jclass android.provider.Attendees* of JVMObject:
  proc query*(cr: ContentResolver, eventId: jlong, projection: seq[string]): Cursor {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.EventsEntity* of JVMObject:
  proc newEntityIterator*(cursor: Cursor, resolver: ContentResolver): EntityIterator {.`static`.}
  proc newEntityIterator*(cursor: Cursor, provider: ContentProviderClient): EntityIterator {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.Events* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_URI*: Uri {.`static`.}
  CONTENT_EXCEPTION_URI*: Uri {.`static`.}
  PROVIDER_WRITABLE_COLUMNS*: string {.`static`.}
  SYNC_WRITABLE_COLUMNS*: string {.`static`.}

jclass android.provider.Instances* of JVMObject:
  proc query*(cr: ContentResolver, projection: seq[string], begin: jlong, end: jlong): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], begin: jlong, end: jlong, searchQuery: string): Cursor {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_BY_DAY_URI*: Uri {.`static`.}
  CONTENT_SEARCH_URI*: Uri {.`static`.}
  CONTENT_SEARCH_BY_DAY_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_BY_DAY_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_SEARCH_URI*: Uri {.`static`.}
  ENTERPRISE_CONTENT_SEARCH_BY_DAY_URI*: Uri {.`static`.}
  BEGIN*: string {.`static`.}
  END*: string {.`static`.}
  EVENT_ID*: string {.`static`.}
  START_DAY*: string {.`static`.}
  END_DAY*: string {.`static`.}
  START_MINUTE*: string {.`static`.}
  END_MINUTE*: string {.`static`.}

jclass android.provider.CalendarCache* of JVMObject:
  URI*: Uri {.`static`.}
  KEY_TIMEZONE_TYPE*: string {.`static`.}
  KEY_TIMEZONE_INSTANCES*: string {.`static`.}
  KEY_TIMEZONE_INSTANCES_PREVIOUS*: string {.`static`.}
  TIMEZONE_TYPE_AUTO*: string {.`static`.}
  TIMEZONE_TYPE_HOME*: string {.`static`.}


jclass android.provider.EventDays* of JVMObject:
  proc query*(cr: ContentResolver, startDay: jint, numDays: jint, projection: seq[string]): Cursor {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.Reminders* of JVMObject:
  proc query*(cr: ContentResolver, eventId: jlong, projection: seq[string]): Cursor {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.CalendarAlerts* of JVMObject:
  proc insert*(cr: ContentResolver, eventId: jlong, begin: jlong, end: jlong, alarmTime: jlong, minutes: jint): Uri {.`static`.}
  proc findNextAlarmTime*(cr: ContentResolver, millis: jlong): jlong {.`static`.}
  proc rescheduleMissedAlarms*(cr: ContentResolver, context: Context, manager: AlarmManager) {.`static`.}
  proc scheduleAlarm*(context: Context, manager: AlarmManager, alarmTime: jlong) {.`static`.}
  proc alarmExists*(cr: ContentResolver, eventId: jlong, begin: jlong, alarmTime: jlong): jboolean {.`static`.}
  TABLE_NAME*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_URI_BY_INSTANCE*: Uri {.`static`.}

jclass android.provider.Colors* of JVMObject:
  TABLE_NAME*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.ExtendedProperties* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.SyncState* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}


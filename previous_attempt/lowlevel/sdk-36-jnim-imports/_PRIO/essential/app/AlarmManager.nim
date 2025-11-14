import jnim

jclass android.app.AlarmManager* of JVMObject:
  proc set*(type: jint, triggerAtMillis: jlong, operation: PendingIntent)
  proc set*(type: jint, triggerAtMillis: jlong, tag: string, listener: OnAlarmListener, targetHandler: Handler)
  proc setRepeating*(type: jint, triggerAtMillis: jlong, intervalMillis: jlong, operation: PendingIntent)
  proc setWindow*(type: jint, windowStartMillis: jlong, windowLengthMillis: jlong, operation: PendingIntent)
  proc setWindow*(type: jint, windowStartMillis: jlong, windowLengthMillis: jlong, tag: string, listener: OnAlarmListener, targetHandler: Handler)
  proc setWindow*(type: jint, windowStartMillis: jlong, windowLengthMillis: jlong, tag: string, executor: Executor, listener: OnAlarmListener)
  proc setWindow*(type: jint, windowStartMillis: jlong, windowLengthMillis: jlong, tag: string, executor: Executor, workSource: WorkSource, listener: OnAlarmListener)
  proc setPrioritized*(type: jint, windowStartMillis: jlong, windowLengthMillis: jlong, tag: string, executor: Executor, listener: OnAlarmListener)
  proc setExact*(type: jint, triggerAtMillis: jlong, operation: PendingIntent)
  proc setExact*(type: jint, triggerAtMillis: jlong, tag: string, listener: OnAlarmListener, targetHandler: Handler)
  proc setIdleUntil*(type: jint, triggerAtMillis: jlong, tag: string, listener: OnAlarmListener, targetHandler: Handler)
  proc setAlarmClock*(info: AlarmClockInfo, operation: PendingIntent)
  proc set*(type: jint, triggerAtMillis: jlong, windowMillis: jlong, intervalMillis: jlong, operation: PendingIntent, workSource: WorkSource)
  proc set*(type: jint, triggerAtMillis: jlong, windowMillis: jlong, intervalMillis: jlong, tag: string, listener: OnAlarmListener, targetHandler: Handler, workSource: WorkSource)
  proc set*(type: jint, triggerAtMillis: jlong, windowMillis: jlong, intervalMillis: jlong, listener: OnAlarmListener, targetHandler: Handler, workSource: WorkSource)
  proc setExact*(type: jint, triggerAtMillis: jlong, tag: string, executor: Executor, workSource: WorkSource, listener: OnAlarmListener)
  proc setInexactRepeating*(type: jint, triggerAtMillis: jlong, intervalMillis: jlong, operation: PendingIntent)
  proc setAndAllowWhileIdle*(type: jint, triggerAtMillis: jlong, operation: PendingIntent)
  proc setExactAndAllowWhileIdle*(type: jint, triggerAtMillis: jlong, operation: PendingIntent)
  proc setExactAndAllowWhileIdle*(type: jint, triggerAtMillis: jlong, tag: string, executor: Executor, workSource: WorkSource, listener: OnAlarmListener)
  proc cancel*(operation: PendingIntent)
  proc cancel*(listener: OnAlarmListener)
  proc cancelAll*()
  proc setTime*(millis: jlong)
  proc setTimeZone*(timeZone: string)
  proc getNextWakeFromIdleTime*(): jlong
  proc canScheduleExactAlarms*(): jboolean
  proc hasScheduleExactAlarm*(packageName: string, userId: jint): jboolean
  proc getNextAlarmClock*(): AlarmClockInfo
  proc getNextAlarmClock*(userId: jint): AlarmClockInfo
  RTC_WAKEUP*: jint {.`static`.}
  RTC*: jint {.`static`.}
  ELAPSED_REALTIME_WAKEUP*: jint {.`static`.}
  ELAPSED_REALTIME*: jint {.`static`.}
  ACTION_NEXT_ALARM_CLOCK_CHANGED*: string {.`static`.}
  ACTION_SCHEDULE_EXACT_ALARM_PERMISSION_STATE_CHANGED*: string {.`static`.}
  WINDOW_EXACT*: jlong {.`static`.}
  WINDOW_HEURISTIC*: jlong {.`static`.}
  FLAG_STANDALONE*: jint {.`static`.}
  FLAG_WAKE_FROM_IDLE*: jint {.`static`.}
  FLAG_ALLOW_WHILE_IDLE*: jint {.`static`.}
  FLAG_ALLOW_WHILE_IDLE_UNRESTRICTED*: jint {.`static`.}
  FLAG_IDLE_UNTIL*: jint {.`static`.}
  FLAG_ALLOW_WHILE_IDLE_COMPAT*: jint {.`static`.}
  FLAG_PRIORITIZE*: jint {.`static`.}
  REQUIRE_EXACT_ALARM_PERMISSION*: jlong {.`static`.}
  ENFORCE_MINIMUM_WINDOW_ON_INEXACT_ALARMS*: jlong {.`static`.}
  ENABLE_USE_EXACT_ALARM*: jlong {.`static`.}
  SCHEDULE_EXACT_ALARM_DENIED_BY_DEFAULT*: jlong {.`static`.}
  SCHEDULE_EXACT_ALARM_DOES_NOT_ELEVATE_BUCKET*: jlong {.`static`.}
  EXACT_LISTENER_ALARMS_DROPPED_ON_CACHED*: jlong {.`static`.}
  INTERVAL_FIFTEEN_MINUTES*: jlong {.`static`.}
  INTERVAL_HALF_HOUR*: jlong {.`static`.}
  INTERVAL_HOUR*: jlong {.`static`.}
  INTERVAL_HALF_DAY*: jlong {.`static`.}
  INTERVAL_DAY*: jlong {.`static`.}

jclass android.app.AlarmManager.AlarmClockInfo* of JVMObject:
  proc getTriggerTime*(): jlong
  proc getShowIntent*(): PendingIntent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)


jclass android.app.AlarmClockInfo* of JVMObject:
  proc getTriggerTime*(): jlong
  proc getShowIntent*(): PendingIntent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  CREATOR*: Creator[AlarmClockInfo] {.`static`.}


import jnim

jclass android.provider.AlarmClock* of JVMObject:
  ACTION_SET_ALARM*: string {.`static`.}
  ACTION_DISMISS_ALARM*: string {.`static`.}
  ACTION_SNOOZE_ALARM*: string {.`static`.}
  ACTION_SET_TIMER*: string {.`static`.}
  ACTION_DISMISS_TIMER*: string {.`static`.}
  ACTION_SHOW_TIMERS*: string {.`static`.}
  ACTION_SHOW_ALARMS*: string {.`static`.}
  EXTRA_ALARM_SEARCH_MODE*: string {.`static`.}
  ALARM_SEARCH_MODE_TIME*: string {.`static`.}
  ALARM_SEARCH_MODE_NEXT*: string {.`static`.}
  ALARM_SEARCH_MODE_ALL*: string {.`static`.}
  ALARM_SEARCH_MODE_LABEL*: string {.`static`.}
  EXTRA_IS_PM*: string {.`static`.}
  EXTRA_ALARM_SNOOZE_DURATION*: string {.`static`.}
  EXTRA_DAYS*: string {.`static`.}
  EXTRA_HOUR*: string {.`static`.}
  EXTRA_LENGTH*: string {.`static`.}
  EXTRA_MESSAGE*: string {.`static`.}
  EXTRA_MINUTES*: string {.`static`.}
  EXTRA_RINGTONE*: string {.`static`.}
  EXTRA_SKIP_UI*: string {.`static`.}
  EXTRA_VIBRATE*: string {.`static`.}
  VALUE_RINGTONE_SILENT*: string {.`static`.}


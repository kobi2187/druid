import jnim

jclass android.widget.TextClock* of TextView:
  proc getFormat12Hour*(): CharSequence
  proc setFormat12Hour*(format: CharSequence)
  proc setContentDescriptionFormat12Hour*(format: CharSequence)
  proc getFormat24Hour*(): CharSequence
  proc setFormat24Hour*(format: CharSequence)
  proc setContentDescriptionFormat24Hour*(format: CharSequence)
  proc setShowCurrentUserTime*(showCurrentUserTime: jboolean)
  proc setClockEventDelegate*(delegate: ClockEventDelegate)
  proc refreshTime*()
  proc is24HourModeEnabled*(): jboolean
  proc getTimeZone*(): string
  proc setTimeZone*(timeZone: string)
  proc getFormat*(): CharSequence
  proc onVisibilityAggregated*(isVisible: jboolean)
  proc disableClockTick*()
  DEFAULT_FORMAT_12_HOUR*: CharSequence {.`static`.}
  DEFAULT_FORMAT_24_HOUR*: CharSequence {.`static`.}

jclass android.widget.TextClock.ClockEventDelegate* of JVMObject:
  proc registerTimeChangeReceiver*(receiver: BroadcastReceiver, handler: Handler)
  proc unregisterTimeChangeReceiver*(receiver: BroadcastReceiver)
  proc registerFormatChangeObserver*(observer: ContentObserver, userHandle: jint)
  proc unregisterFormatChangeObserver*(observer: ContentObserver)

jclass android.widget.ClockEventDelegate* of JVMObject:
  proc registerTimeChangeReceiver*(receiver: BroadcastReceiver, handler: Handler)
  proc unregisterTimeChangeReceiver*(receiver: BroadcastReceiver)
  proc registerFormatChangeObserver*(observer: ContentObserver, userHandle: jint)
  proc unregisterFormatChangeObserver*(observer: ContentObserver)


import jnim

jclass android.widget.RadialTimePickerView* of View:
  proc initialize*(hour: jint, minute: jint, is24HourMode: jboolean)
  proc setCurrentItemShowing*(item: jint, animate: jboolean)
  proc getCurrentItemShowing*(): jint
  proc setOnValueSelectedListener*(listener: OnValueSelectedListener)
  proc setCurrentHour*(hour: jint)
  proc getCurrentHour*(): jint
  proc setCurrentMinute*(minute: jint)
  proc getCurrentMinute*(): jint
  proc setAmOrPm*(amOrPm: jint): jboolean
  proc getAmOrPm*(): jint
  proc showHours*(animate: jboolean)
  proc showMinutes*(animate: jboolean)
  proc onDraw*(canvas: Canvas)
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc dispatchHoverEvent*(event: MotionEvent): jboolean
  proc setInputEnabled*(inputEnabled: jboolean)
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  HOURS*: jint {.`static`.}
  MINUTES*: jint {.`static`.}


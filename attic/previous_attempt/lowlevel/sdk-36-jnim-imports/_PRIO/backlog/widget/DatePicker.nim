import jnim

jclass android.widget.DatePicker* of FrameLayout:
  proc getMode*(): jint
  proc init*(year: jint, monthOfYear: jint, dayOfMonth: jint, onDateChangedListener: OnDateChangedListener)
  proc setOnDateChangedListener*(onDateChangedListener: OnDateChangedListener)
  proc updateDate*(year: jint, month: jint, dayOfMonth: jint)
  proc getYear*(): jint
  proc getMonth*(): jint
  proc getDayOfMonth*(): jint
  proc getMinDate*(): jlong
  proc setMinDate*(minDate: jlong)
  proc getMaxDate*(): jlong
  proc setMaxDate*(maxDate: jlong)
  proc setValidationCallback*(callback: ValidationCallback)
  proc setEnabled*(enabled: jboolean)
  proc isEnabled*(): jboolean
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc onPopulateAccessibilityEventInternal*(event: AccessibilityEvent)
  proc getAccessibilityClassName*(): CharSequence
  proc setFirstDayOfWeek*(firstDayOfWeek: jint)
  proc getFirstDayOfWeek*(): jint
  proc getCalendarViewShown*(): jboolean
  proc getCalendarView*(): CalendarView
  proc setCalendarViewShown*(shown: jboolean)
  proc getSpinnersShown*(): jboolean
  proc setSpinnersShown*(shown: jboolean)
  proc dispatchProvideAutofillStructure*(structure: ViewStructure, flags: jint)
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue
  MODE_SPINNER*: jint {.`static`.}
  MODE_CALENDAR*: jint {.`static`.}



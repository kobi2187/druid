import jnim

jclass android.widget.TimePicker* of FrameLayout:
  proc getMode*(): jint
  proc setHour*(hour: jint)
  proc getHour*(): jint
  proc setMinute*(minute: jint)
  proc getMinute*(): jint
  proc setCurrentHour*(currentHour: Integer)
  proc getCurrentHour*(): Integer
  proc setCurrentMinute*(currentMinute: Integer)
  proc getCurrentMinute*(): Integer
  proc setIs24HourView*(is24HourView: Boolean)
  proc is24HourView*(): jboolean
  proc setOnTimeChangedListener*(onTimeChangedListener: OnTimeChangedListener)
  proc setEnabled*(enabled: jboolean)
  proc isEnabled*(): jboolean
  proc getBaseline*(): jint
  proc validateInput*(): jboolean
  proc getAccessibilityClassName*(): CharSequence
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc getHourView*(): View
  proc getMinuteView*(): View
  proc getAmView*(): View
  proc getPmView*(): View
  proc dispatchProvideAutofillStructure*(structure: ViewStructure, flags: jint)
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue
  MODE_SPINNER*: jint {.`static`.}
  MODE_CLOCK*: jint {.`static`.}


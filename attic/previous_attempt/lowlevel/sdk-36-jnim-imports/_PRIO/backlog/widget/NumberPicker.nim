import jnim

jclass android.widget.NumberPicker* of LinearLayout:
  proc getTwoDigitFormatter*(): Formatter {.`static`.}
  proc onInterceptTouchEvent*(event: MotionEvent): jboolean
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc dispatchTouchEvent*(event: MotionEvent): jboolean
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchTrackballEvent*(event: MotionEvent): jboolean
  proc computeScroll*()
  proc setEnabled*(enabled: jboolean)
  proc scrollBy*(x: jint, y: jint)
  proc getSolidColor*(): jint
  proc setOnValueChangedListener*(onValueChangedListener: OnValueChangeListener)
  proc setOnScrollListener*(onScrollListener: OnScrollListener)
  proc setFormatter*(formatter: Formatter)
  proc setValue*(value: jint)
  proc performClick*(): jboolean
  proc performLongClick*(): jboolean
  proc getWrapSelectorWheel*(): jboolean
  proc setWrapSelectorWheel*(wrapSelectorWheel: jboolean)
  proc setOnLongPressUpdateInterval*(intervalMillis: jlong)
  proc getValue*(): jint
  proc getMinValue*(): jint
  proc setMinValue*(minValue: jint)
  proc getMaxValue*(): jint
  proc setMaxValue*(maxValue: jint)
  proc getDisplayedValues*(): seq[string]
  proc setDisplayedValues*(displayedValues: seq[string])
  proc getDisplayedValueForCurrentSelection*(): CharSequence
  proc setSelectionDividerHeight*(height: jint)
  proc getSelectionDividerHeight*(): jint
  proc jumpDrawablesToCurrentState*()
  proc onResolveDrawables*(layoutDirection: jint)
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc getAccessibilityNodeProvider*(): AccessibilityNodeProvider
  proc setTextColor*(color: jint)
  proc getTextColor*(): jint
  proc setTextSize*(size: jfloat)
  proc getTextSize*(): jfloat

jclass android.widget.NumberPicker.OnScrollListener* of JVMObject:
  proc onScrollStateChange*(view: NumberPicker, scrollState: jint)

jclass android.widget.NumberPicker.Formatter* of JVMObject:
  proc format*(value: jint): string

jclass android.widget.NumberPicker.CustomEditText* of JVMObject:
  proc onEditorAction*(actionCode: jint)


jclass android.widget.OnScrollListener* of JVMObject:
  proc onScrollStateChange*(view: NumberPicker, scrollState: jint)
  SCROLL_STATE_IDLE*: jint {.`static`.}
  SCROLL_STATE_TOUCH_SCROLL*: jint {.`static`.}
  SCROLL_STATE_FLING*: jint {.`static`.}

jclass android.widget.Formatter* of JVMObject:
  proc format*(value: jint): string

jclass android.widget.CustomEditText* of EditText:
  proc onEditorAction*(actionCode: jint)


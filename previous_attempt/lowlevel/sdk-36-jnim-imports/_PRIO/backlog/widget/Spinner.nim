import jnim

jclass android.widget.Spinner* of AbsSpinner:
  proc getPopupContext*(): Context
  proc setPopupBackgroundDrawable*(background: Drawable)
  proc setPopupBackgroundResource*(resId: jint)
  proc getPopupBackground*(): Drawable
  proc isPopupShowing*(): jboolean
  proc setDropDownVerticalOffset*(pixels: jint)
  proc getDropDownVerticalOffset*(): jint
  proc setDropDownHorizontalOffset*(pixels: jint)
  proc getDropDownHorizontalOffset*(): jint
  proc setDropDownWidth*(pixels: jint)
  proc getDropDownWidth*(): jint
  proc setEnabled*(enabled: jboolean)
  proc setGravity*(gravity: jint)
  proc getGravity*(): jint
  proc setAdapter*(adapter: SpinnerAdapter)
  proc getBaseline*(): jint
  proc setOnItemClickListener*(l: OnItemClickListener)
  proc setOnItemClickListenerInt*(l: OnItemClickListener)
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc performClick*(): jboolean
  proc onClick*(dialog: DialogInterface, which: jint)
  proc onClick*(which: jint)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc setPrompt*(prompt: CharSequence)
  proc setPromptId*(promptId: jint)
  proc getPrompt*(): CharSequence
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  MODE_DIALOG*: jint {.`static`.}
  MODE_DROPDOWN*: jint {.`static`.}


import jnim

jclass android.widget.RelativeLayout* of ViewGroup:
  proc shouldDelayChildPressedState*(): jboolean
  proc setIgnoreGravity*(viewId: jint)
  proc getIgnoreGravity*(): jint
  proc getGravity*(): jint
  proc setGravity*(gravity: jint)
  proc setHorizontalGravity*(horizontalGravity: jint)
  proc setVerticalGravity*(verticalGravity: jint)
  proc getBaseline*(): jint
  proc requestLayout*()
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc getAccessibilityClassName*(): CharSequence
  TRUE*: jint {.`static`.}
  LEFT_OF*: jint {.`static`.}
  RIGHT_OF*: jint {.`static`.}
  ABOVE*: jint {.`static`.}
  BELOW*: jint {.`static`.}
  ALIGN_BASELINE*: jint {.`static`.}
  ALIGN_LEFT*: jint {.`static`.}
  ALIGN_TOP*: jint {.`static`.}
  ALIGN_RIGHT*: jint {.`static`.}
  ALIGN_BOTTOM*: jint {.`static`.}
  ALIGN_PARENT_LEFT*: jint {.`static`.}
  ALIGN_PARENT_TOP*: jint {.`static`.}
  ALIGN_PARENT_RIGHT*: jint {.`static`.}
  ALIGN_PARENT_BOTTOM*: jint {.`static`.}
  CENTER_IN_PARENT*: jint {.`static`.}
  CENTER_HORIZONTAL*: jint {.`static`.}
  CENTER_VERTICAL*: jint {.`static`.}
  START_OF*: jint {.`static`.}
  END_OF*: jint {.`static`.}
  ALIGN_START*: jint {.`static`.}
  ALIGN_END*: jint {.`static`.}
  ALIGN_PARENT_START*: jint {.`static`.}
  ALIGN_PARENT_END*: jint {.`static`.}

jclass android.widget.RelativeLayout.LayoutParams* of JVMObject:
  proc debug*(output: string): string
  proc addRule*(verb: jint)
  proc addRule*(verb: jint, subject: jint)
  proc removeRule*(verb: jint)
  proc getRule*(verb: jint): jint
  proc getRules*(layoutDirection: jint): seq[jint]
  proc getRules*(): seq[jint]
  proc resolveLayoutDirection*(layoutDirection: jint)

jclass android.widget.LayoutParams* of MarginLayoutParams:
  proc debug*(output: string): string
  proc addRule*(verb: jint)
  proc addRule*(verb: jint, subject: jint)
  proc removeRule*(verb: jint)
  proc getRule*(verb: jint): jint
  proc getRules*(layoutDirection: jint): seq[jint]
  proc getRules*(): seq[jint]
  proc resolveLayoutDirection*(layoutDirection: jint)
  alignWithParent*: jboolean

jclass android.widget.LayoutParams.InspectionCompanion* of JVMObject:
  proc mapProperties*(propertyMapper: PropertyMapper)
  proc readProperties*(node: LayoutParams, propertyReader: PropertyReader)

jclass android.widget.InspectionCompanion* of JVMObject:
  proc mapProperties*(propertyMapper: PropertyMapper)
  proc readProperties*(node: LayoutParams, propertyReader: PropertyReader)


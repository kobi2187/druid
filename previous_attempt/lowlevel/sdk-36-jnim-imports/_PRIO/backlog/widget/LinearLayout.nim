import jnim

jclass android.widget.LinearLayout* of ViewGroup:
  proc setShowDividers*(showDividers: jint)
  proc shouldDelayChildPressedState*(): jboolean
  proc getShowDividers*(): jint
  proc getDividerDrawable*(): Drawable
  proc setDividerDrawable*(divider: Drawable)
  proc setDividerPadding*(padding: jint)
  proc getDividerPadding*(): jint
  proc getDividerWidth*(): jint
  proc isBaselineAligned*(): jboolean
  proc setBaselineAligned*(baselineAligned: jboolean)
  proc isMeasureWithLargestChildEnabled*(): jboolean
  proc setMeasureWithLargestChildEnabled*(enabled: jboolean)
  proc getBaseline*(): jint
  proc getBaselineAlignedChildIndex*(): jint
  proc setBaselineAlignedChildIndex*(i: jint)
  proc getWeightSum*(): jfloat
  proc setWeightSum*(weightSum: jfloat)
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc setOrientation*(orientation: jint)
  proc getOrientation*(): jint
  proc setGravity*(gravity: jint)
  proc getGravity*(): jint
  proc setHorizontalGravity*(horizontalGravity: jint)
  proc setVerticalGravity*(verticalGravity: jint)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc getAccessibilityClassName*(): CharSequence
  HORIZONTAL*: jint {.`static`.}
  VERTICAL*: jint {.`static`.}
  SHOW_DIVIDER_NONE*: jint {.`static`.}
  SHOW_DIVIDER_BEGINNING*: jint {.`static`.}
  SHOW_DIVIDER_MIDDLE*: jint {.`static`.}
  SHOW_DIVIDER_END*: jint {.`static`.}

jclass android.widget.LinearLayout.LayoutParams* of JVMObject:
  proc debug*(output: string): string

jclass android.widget.LayoutParams* of MarginLayoutParams:
  proc debug*(output: string): string
  weight*: jfloat
  gravity*: jint


import jnim

jclass android.widget.FrameLayout* of ViewGroup:
  proc setForegroundGravity*(foregroundGravity: jint)
  proc setMeasureAllChildren*(measureAll: jboolean)
  proc getConsiderGoneChildrenWhenMeasuring*(): jboolean
  proc getMeasureAllChildren*(): jboolean
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc shouldDelayChildPressedState*(): jboolean
  proc getAccessibilityClassName*(): CharSequence

jclass android.widget.LayoutParams* of MarginLayoutParams:
  UNSPECIFIED_GRAVITY*: jint {.`static`.}
  gravity*: jint


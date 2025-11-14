import jnim

jclass android.view.NotificationTopLineView* of ViewGroup:
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc setFeedbackOnClickListener*(l: OnClickListener)
  proc setHeaderTextMarginEnd*(headerTextMarginEnd: jint)
  proc getHeaderTextMarginEnd*(): jint
  proc setPaddingStart*(paddingStart: jint)
  proc hasOverlappingRendering*(): jboolean
  proc isTitlePresent*(): jboolean
  proc isInTouchRect*(x: jfloat, y: jfloat): jboolean
  proc onTouchUp*(upX: jfloat, upY: jfloat, downX: jfloat, downY: jfloat): jboolean


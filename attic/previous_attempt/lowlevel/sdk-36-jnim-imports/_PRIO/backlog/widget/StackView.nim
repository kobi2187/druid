import jnim

jclass android.widget.StackView* of AdapterViewAnimator:
  proc showNext*()
  proc showPrevious*()
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc onInterceptTouchEvent*(ev: MotionEvent): jboolean
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc advance*()
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean


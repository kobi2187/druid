import jnim

jclass android.view.TouchDelegate* of JVMObject:
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onTouchExplorationHoverEvent*(event: MotionEvent): jboolean
  proc getTouchDelegateInfo*(): TouchDelegateInfo
  ABOVE*: jint {.`static`.}
  BELOW*: jint {.`static`.}
  TO_LEFT*: jint {.`static`.}
  TO_RIGHT*: jint {.`static`.}


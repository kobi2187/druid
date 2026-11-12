import jnim

jclass android.inputmethodservice.Keyboard* of JVMObject:
  proc getKeys*(): List[Key]
  proc getModifierKeys*(): List[Key]
  proc getHeight*(): jint
  proc getMinWidth*(): jint
  proc setShifted*(shiftState: jboolean): jboolean
  proc isShifted*(): jboolean
  proc getShiftKeyIndices*(): seq[jint]
  proc getShiftKeyIndex*(): jint
  proc getNearestKeys*(x: jint, y: jint): seq[jint]
  EDGE_LEFT*: jint {.`static`.}
  EDGE_RIGHT*: jint {.`static`.}
  EDGE_TOP*: jint {.`static`.}
  EDGE_BOTTOM*: jint {.`static`.}
  KEYCODE_SHIFT*: jint {.`static`.}
  KEYCODE_MODE_CHANGE*: jint {.`static`.}
  KEYCODE_CANCEL*: jint {.`static`.}
  KEYCODE_DONE*: jint {.`static`.}
  KEYCODE_DELETE*: jint {.`static`.}
  KEYCODE_ALT*: jint {.`static`.}

jclass android.inputmethodservice.Keyboard.Key* of JVMObject:
  proc onPressed*()
  proc onReleased*(inside: jboolean)
  proc isInside*(x: jint, y: jint): jboolean
  proc squaredDistanceFrom*(x: jint, y: jint): jint
  proc getCurrentDrawableState*(): seq[jint]

jclass android.inputmethodservice.Row* of JVMObject:
  defaultWidth*: jint
  defaultHeight*: jint
  defaultHorizontalGap*: jint
  verticalGap*: jint
  rowEdgeFlags*: jint
  mode*: jint

jclass android.inputmethodservice.Key* of JVMObject:
  proc onPressed*()
  proc onReleased*(inside: jboolean)
  proc isInside*(x: jint, y: jint): jboolean
  proc squaredDistanceFrom*(x: jint, y: jint): jint
  proc getCurrentDrawableState*(): seq[jint]
  codes*: jint
  label*: CharSequence
  icon*: Drawable
  iconPreview*: Drawable
  width*: jint
  height*: jint
  gap*: jint
  sticky*: jboolean
  x*: jint
  y*: jint
  pressed*: jboolean
  on*: jboolean
  text*: CharSequence
  popupCharacters*: CharSequence
  edgeFlags*: jint
  modifier*: jboolean
  popupResId*: jint
  repeatable*: jboolean


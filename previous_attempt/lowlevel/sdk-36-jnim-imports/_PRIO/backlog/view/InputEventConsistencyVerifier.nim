import jnim

jclass android.view.InputEventConsistencyVerifier* of JVMObject:
  proc isInstrumentationEnabled*(): jboolean {.`static`.}
  proc reset*()
  proc onInputEvent*(event: InputEvent, nestingLevel: jint)
  proc onKeyEvent*(event: KeyEvent, nestingLevel: jint)
  proc onTrackballEvent*(event: MotionEvent, nestingLevel: jint)
  proc onTouchEvent*(event: MotionEvent, nestingLevel: jint)
  proc onGenericMotionEvent*(event: MotionEvent, nestingLevel: jint)
  proc onUnhandledEvent*(event: InputEvent, nestingLevel: jint)
  FLAG_RAW_DEVICE_INPUT*: jint {.`static`.}


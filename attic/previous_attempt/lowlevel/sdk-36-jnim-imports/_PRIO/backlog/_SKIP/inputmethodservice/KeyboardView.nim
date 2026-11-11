import jnim

jclass android.inputmethodservice.KeyboardView* of View:
  proc setOnKeyboardActionListener*(listener: OnKeyboardActionListener)
  proc setKeyboard*(keyboard: Keyboard)
  proc getKeyboard*(): Keyboard
  proc setShifted*(shifted: jboolean): jboolean
  proc isShifted*(): jboolean
  proc setPreviewEnabled*(previewEnabled: jboolean)
  proc isPreviewEnabled*(): jboolean
  proc setVerticalCorrection*(verticalOffset: jint)
  proc setPopupParent*(v: View)
  proc setPopupOffset*(x: jint, y: jint)
  proc setProximityCorrectionEnabled*(enabled: jboolean)
  proc isProximityCorrectionEnabled*(): jboolean
  proc onClick*(v: View)
  proc onMeasure*(widthMeasureSpec: jint, heightMeasureSpec: jint)
  proc onSizeChanged*(w: jint, h: jint, oldw: jint, oldh: jint)
  proc onDraw*(canvas: Canvas)
  proc invalidateAllKeys*()
  proc invalidateKey*(keyIndex: jint)
  proc onHoverEvent*(event: MotionEvent): jboolean
  proc onTouchEvent*(me: MotionEvent): jboolean
  proc closing*()
  proc onDetachedFromWindow*()
  proc handleBack*(): jboolean


import jnim

jclass android.gesture.GestureOverlayView* of FrameLayout:
  proc getCurrentStroke*(): ArrayList[GesturePoint]
  proc getOrientation*(): jint
  proc setOrientation*(orientation: jint)
  proc setGestureColor*(color: jint)
  proc setUncertainGestureColor*(color: jint)
  proc getUncertainGestureColor*(): jint
  proc getGestureColor*(): jint
  proc getGestureStrokeWidth*(): jfloat
  proc setGestureStrokeWidth*(gestureStrokeWidth: jfloat)
  proc getGestureStrokeType*(): jint
  proc setGestureStrokeType*(gestureStrokeType: jint)
  proc getGestureStrokeLengthThreshold*(): jfloat
  proc setGestureStrokeLengthThreshold*(gestureStrokeLengthThreshold: jfloat)
  proc getGestureStrokeSquarenessTreshold*(): jfloat
  proc setGestureStrokeSquarenessTreshold*(gestureStrokeSquarenessTreshold: jfloat)
  proc getGestureStrokeAngleThreshold*(): jfloat
  proc setGestureStrokeAngleThreshold*(gestureStrokeAngleThreshold: jfloat)
  proc isEventsInterceptionEnabled*(): jboolean
  proc setEventsInterceptionEnabled*(enabled: jboolean)
  proc isFadeEnabled*(): jboolean
  proc setFadeEnabled*(fadeEnabled: jboolean)
  proc getGesture*(): Gesture
  proc setGesture*(gesture: Gesture)
  proc getGesturePath*(): Path
  proc getGesturePath*(path: Path): Path
  proc isGestureVisible*(): jboolean
  proc setGestureVisible*(visible: jboolean)
  proc getFadeOffset*(): jlong
  proc setFadeOffset*(fadeOffset: jlong)
  proc addOnGestureListener*(listener: OnGestureListener)
  proc removeOnGestureListener*(listener: OnGestureListener)
  proc removeAllOnGestureListeners*()
  proc addOnGesturePerformedListener*(listener: OnGesturePerformedListener)
  proc removeOnGesturePerformedListener*(listener: OnGesturePerformedListener)
  proc removeAllOnGesturePerformedListeners*()
  proc addOnGesturingListener*(listener: OnGesturingListener)
  proc removeOnGesturingListener*(listener: OnGesturingListener)
  proc removeAllOnGesturingListeners*()
  proc isGesturing*(): jboolean
  proc getGesturePaint*(): Paint
  proc draw*(canvas: Canvas)
  proc clear*(animated: jboolean)
  proc cancelClearAnimation*()
  proc cancelGesture*()
  proc dispatchTouchEvent*(event: MotionEvent): jboolean
  GESTURE_STROKE_TYPE_SINGLE*: jint {.`static`.}
  GESTURE_STROKE_TYPE_MULTIPLE*: jint {.`static`.}
  ORIENTATION_HORIZONTAL*: jint {.`static`.}
  ORIENTATION_VERTICAL*: jint {.`static`.}




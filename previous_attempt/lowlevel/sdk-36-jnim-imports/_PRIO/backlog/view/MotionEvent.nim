import jnim

jclass android.view.MotionEvent* of InputEvent:
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, pointerCount: jint, pointerProperties: seq[PointerProperties], pointerCoords: seq[PointerCoords], metaState: jint, buttonState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint, source: jint, displayId: jint, flags: jint, classification: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, pointerCount: jint, pointerProperties: seq[PointerProperties], pointerCoords: seq[PointerCoords], metaState: jint, buttonState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint, source: jint, displayId: jint, flags: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, pointerCount: jint, pointerProperties: seq[PointerProperties], pointerCoords: seq[PointerCoords], metaState: jint, buttonState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint, source: jint, flags: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, pointerCount: jint, pointerIds: seq[jint], pointerCoords: seq[PointerCoords], metaState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint, source: jint, flags: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, x: jfloat, y: jfloat, pressure: jfloat, size: jfloat, metaState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, x: jfloat, y: jfloat, pressure: jfloat, size: jfloat, metaState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint, source: jint, displayId: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, pointerCount: jint, x: jfloat, y: jfloat, pressure: jfloat, size: jfloat, metaState: jint, xPrecision: jfloat, yPrecision: jfloat, deviceId: jint, edgeFlags: jint): MotionEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, x: jfloat, y: jfloat, metaState: jint): MotionEvent {.`static`.}
  proc obtain*(other: MotionEvent): MotionEvent {.`static`.}
  proc obtainNoHistory*(other: MotionEvent): MotionEvent {.`static`.}
  proc copy*(): MotionEvent
  proc recycle*()
  proc scale*(scale: jfloat)
  proc getId*(): jint
  proc getDeviceId*(): jint
  proc getSource*(): jint
  proc setSource*(source: jint)
  proc getDisplayId*(): jint
  proc setDisplayId*(displayId: jint)
  proc getAction*(): jint
  proc getActionMasked*(): jint
  proc getActionIndex*(): jint
  proc isTouchEvent*(): jboolean
  proc isStylusPointer*(): jboolean
  proc isHoverEvent*(): jboolean
  proc getFlags*(): jint
  proc isTainted*(): jboolean
  proc setTainted*(tainted: jboolean)
  proc isTargetAccessibilityFocus*(): jboolean
  proc setTargetAccessibilityFocus*(targetsFocus: jboolean)
  proc isInjectedFromAccessibilityService*(): jboolean
  proc isInjectedFromAccessibilityTool*(): jboolean
  proc isHoverExitPending*(): jboolean
  proc setHoverExitPending*(hoverExitPending: jboolean)
  proc getDownTime*(): jlong
  proc setDownTime*(downTime: jlong)
  proc getEventTime*(): jlong
  proc getEventTimeNanos*(): jlong
  proc getX*(): jfloat
  proc getY*(): jfloat
  proc getPressure*(): jfloat
  proc getSize*(): jfloat
  proc getTouchMajor*(): jfloat
  proc getTouchMinor*(): jfloat
  proc getToolMajor*(): jfloat
  proc getToolMinor*(): jfloat
  proc getOrientation*(): jfloat
  proc getAxisValue*(axis: jint): jfloat
  proc getPointerCount*(): jint
  proc getPointerId*(pointerIndex: jint): jint
  proc getToolType*(pointerIndex: jint): jint
  proc findPointerIndex*(pointerId: jint): jint
  proc getX*(pointerIndex: jint): jfloat
  proc getY*(pointerIndex: jint): jfloat
  proc getPressure*(pointerIndex: jint): jfloat
  proc getSize*(pointerIndex: jint): jfloat
  proc getTouchMajor*(pointerIndex: jint): jfloat
  proc getTouchMinor*(pointerIndex: jint): jfloat
  proc getToolMajor*(pointerIndex: jint): jfloat
  proc getToolMinor*(pointerIndex: jint): jfloat
  proc getOrientation*(pointerIndex: jint): jfloat
  proc getAxisValue*(axis: jint, pointerIndex: jint): jfloat
  proc getPointerCoords*(pointerIndex: jint, outPointerCoords: PointerCoords)
  proc getPointerProperties*(pointerIndex: jint, outPointerProperties: PointerProperties)
  proc getMetaState*(): jint
  proc getButtonState*(): jint
  proc setButtonState*(buttonState: jint)
  proc getClassification*(): jint
  proc getActionButton*(): jint
  proc setActionButton*(button: jint)
  proc getRawX*(): jfloat
  proc getRawY*(): jfloat
  proc getRawX*(pointerIndex: jint): jfloat
  proc getRawY*(pointerIndex: jint): jfloat
  proc getXPrecision*(): jfloat
  proc getYPrecision*(): jfloat
  proc getXCursorPosition*(): jfloat
  proc getYCursorPosition*(): jfloat
  proc getHistorySize*(): jint
  proc getHistoricalEventTime*(pos: jint): jlong
  proc getHistoricalEventTimeNanos*(pos: jint): jlong
  proc getHistoricalX*(pos: jint): jfloat
  proc getHistoricalY*(pos: jint): jfloat
  proc getHistoricalPressure*(pos: jint): jfloat
  proc getHistoricalSize*(pos: jint): jfloat
  proc getHistoricalTouchMajor*(pos: jint): jfloat
  proc getHistoricalTouchMinor*(pos: jint): jfloat
  proc getHistoricalToolMajor*(pos: jint): jfloat
  proc getHistoricalToolMinor*(pos: jint): jfloat
  proc getHistoricalOrientation*(pos: jint): jfloat
  proc getHistoricalAxisValue*(axis: jint, pos: jint): jfloat
  proc getHistoricalX*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalY*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalPressure*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalSize*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalTouchMajor*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalTouchMinor*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalToolMajor*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalToolMinor*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalOrientation*(pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalAxisValue*(axis: jint, pointerIndex: jint, pos: jint): jfloat
  proc getHistoricalPointerCoords*(pointerIndex: jint, pos: jint, outPointerCoords: PointerCoords)
  proc getEdgeFlags*(): jint
  proc setEdgeFlags*(flags: jint)
  proc setAction*(action: jint)
  proc offsetLocation*(deltaX: jfloat, deltaY: jfloat)
  proc setLocation*(x: jfloat, y: jfloat)
  proc transform*(matrix: Matrix)
  proc applyTransform*(matrix: Matrix)
  proc addBatch*(eventTime: jlong, x: jfloat, y: jfloat, pressure: jfloat, size: jfloat, metaState: jint)
  proc addBatch*(eventTime: jlong, pointerCoords: seq[PointerCoords], metaState: jint)
  proc addBatch*(event: MotionEvent): jboolean
  proc isWithinBoundsNoHistory*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc clampNoHistory*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): MotionEvent
  proc getPointerIdBits*(): jint
  proc split*(idBits: jint): MotionEvent
  proc toString*(): string
  proc actionToString*(action: jint): string {.`static`.}
  proc axisToString*(axis: jint): string {.`static`.}
  proc axisFromString*(symbolicName: string): jint {.`static`.}
  proc buttonStateToString*(buttonState: jint): string {.`static`.}
  proc classificationToString*(classification: jint): string {.`static`.}
  proc toolTypeToString*(toolType: jint): string {.`static`.}
  proc isButtonPressed*(button: jint): jboolean
  proc getSurfaceRotation*(): jint
  proc createRotateMatrix*(rotation: jint, rotatedFrameWidth: jint, rotatedFrameHeight: jint): Matrix {.`static`.}
  proc createFromParcelBody*(in: Parcel): MotionEvent {.`static`.}
  proc cancel*()
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getXDispatchLocation*(pointerIndex: jint): jfloat
  proc getYDispatchLocation*(pointerIndex: jint): jfloat
  INVALID_POINTER_ID*: jint {.`static`.}
  ACTION_MASK*: jint {.`static`.}
  ACTION_DOWN*: jint {.`static`.}
  ACTION_UP*: jint {.`static`.}
  ACTION_MOVE*: jint {.`static`.}
  ACTION_CANCEL*: jint {.`static`.}
  ACTION_OUTSIDE*: jint {.`static`.}
  ACTION_POINTER_DOWN*: jint {.`static`.}
  ACTION_POINTER_UP*: jint {.`static`.}
  ACTION_HOVER_MOVE*: jint {.`static`.}
  ACTION_SCROLL*: jint {.`static`.}
  ACTION_HOVER_ENTER*: jint {.`static`.}
  ACTION_HOVER_EXIT*: jint {.`static`.}
  ACTION_BUTTON_PRESS*: jint {.`static`.}
  ACTION_BUTTON_RELEASE*: jint {.`static`.}
  ACTION_POINTER_INDEX_MASK*: jint {.`static`.}
  ACTION_POINTER_INDEX_SHIFT*: jint {.`static`.}
  ACTION_POINTER_1_DOWN*: jint {.`static`.}
  ACTION_POINTER_2_DOWN*: jint {.`static`.}
  ACTION_POINTER_3_DOWN*: jint {.`static`.}
  ACTION_POINTER_1_UP*: jint {.`static`.}
  ACTION_POINTER_2_UP*: jint {.`static`.}
  ACTION_POINTER_3_UP*: jint {.`static`.}
  ACTION_POINTER_ID_MASK*: jint {.`static`.}
  ACTION_POINTER_ID_SHIFT*: jint {.`static`.}
  FLAG_WINDOW_IS_OBSCURED*: jint {.`static`.}
  FLAG_WINDOW_IS_PARTIALLY_OBSCURED*: jint {.`static`.}
  FLAG_HOVER_EXIT_PENDING*: jint {.`static`.}
  FLAG_IS_GENERATED_GESTURE*: jint {.`static`.}
  FLAG_CANCELED*: jint {.`static`.}
  FLAG_NO_FOCUS_CHANGE*: jint {.`static`.}
  FLAG_IS_ACCESSIBILITY_EVENT*: jint {.`static`.}
  FLAG_INJECTED_FROM_ACCESSIBILITY_TOOL*: jint {.`static`.}
  FLAG_TAINTED*: jint {.`static`.}
  FLAG_TARGET_ACCESSIBILITY_FOCUS*: jint {.`static`.}
  EDGE_TOP*: jint {.`static`.}
  EDGE_BOTTOM*: jint {.`static`.}
  EDGE_LEFT*: jint {.`static`.}
  EDGE_RIGHT*: jint {.`static`.}
  AXIS_X*: jint {.`static`.}
  AXIS_Y*: jint {.`static`.}
  AXIS_PRESSURE*: jint {.`static`.}
  AXIS_SIZE*: jint {.`static`.}
  AXIS_TOUCH_MAJOR*: jint {.`static`.}
  AXIS_TOUCH_MINOR*: jint {.`static`.}
  AXIS_TOOL_MAJOR*: jint {.`static`.}
  AXIS_TOOL_MINOR*: jint {.`static`.}
  AXIS_ORIENTATION*: jint {.`static`.}
  AXIS_VSCROLL*: jint {.`static`.}
  AXIS_HSCROLL*: jint {.`static`.}
  AXIS_Z*: jint {.`static`.}
  AXIS_RX*: jint {.`static`.}
  AXIS_RY*: jint {.`static`.}
  AXIS_RZ*: jint {.`static`.}
  AXIS_HAT_X*: jint {.`static`.}
  AXIS_HAT_Y*: jint {.`static`.}
  AXIS_LTRIGGER*: jint {.`static`.}
  AXIS_RTRIGGER*: jint {.`static`.}
  AXIS_THROTTLE*: jint {.`static`.}
  AXIS_RUDDER*: jint {.`static`.}
  AXIS_WHEEL*: jint {.`static`.}
  AXIS_GAS*: jint {.`static`.}
  AXIS_BRAKE*: jint {.`static`.}
  AXIS_DISTANCE*: jint {.`static`.}
  AXIS_TILT*: jint {.`static`.}
  AXIS_SCROLL*: jint {.`static`.}
  AXIS_RELATIVE_X*: jint {.`static`.}
  AXIS_RELATIVE_Y*: jint {.`static`.}
  AXIS_GENERIC_1*: jint {.`static`.}
  AXIS_GENERIC_2*: jint {.`static`.}
  AXIS_GENERIC_3*: jint {.`static`.}
  AXIS_GENERIC_4*: jint {.`static`.}
  AXIS_GENERIC_5*: jint {.`static`.}
  AXIS_GENERIC_6*: jint {.`static`.}
  AXIS_GENERIC_7*: jint {.`static`.}
  AXIS_GENERIC_8*: jint {.`static`.}
  AXIS_GENERIC_9*: jint {.`static`.}
  AXIS_GENERIC_10*: jint {.`static`.}
  AXIS_GENERIC_11*: jint {.`static`.}
  AXIS_GENERIC_12*: jint {.`static`.}
  AXIS_GENERIC_13*: jint {.`static`.}
  AXIS_GENERIC_14*: jint {.`static`.}
  AXIS_GENERIC_15*: jint {.`static`.}
  AXIS_GENERIC_16*: jint {.`static`.}
  AXIS_GESTURE_X_OFFSET*: jint {.`static`.}
  AXIS_GESTURE_Y_OFFSET*: jint {.`static`.}
  AXIS_GESTURE_SCROLL_X_DISTANCE*: jint {.`static`.}
  AXIS_GESTURE_SCROLL_Y_DISTANCE*: jint {.`static`.}
  AXIS_GESTURE_PINCH_SCALE_FACTOR*: jint {.`static`.}
  AXIS_GESTURE_SWIPE_FINGER_COUNT*: jint {.`static`.}
  BUTTON_PRIMARY*: jint {.`static`.}
  BUTTON_SECONDARY*: jint {.`static`.}
  BUTTON_TERTIARY*: jint {.`static`.}
  BUTTON_BACK*: jint {.`static`.}
  BUTTON_FORWARD*: jint {.`static`.}
  BUTTON_STYLUS_PRIMARY*: jint {.`static`.}
  BUTTON_STYLUS_SECONDARY*: jint {.`static`.}
  CLASSIFICATION_NONE*: jint {.`static`.}
  CLASSIFICATION_AMBIGUOUS_GESTURE*: jint {.`static`.}
  CLASSIFICATION_DEEP_PRESS*: jint {.`static`.}
  CLASSIFICATION_TWO_FINGER_SWIPE*: jint {.`static`.}
  CLASSIFICATION_MULTI_FINGER_SWIPE*: jint {.`static`.}
  CLASSIFICATION_PINCH*: jint {.`static`.}
  TOOL_TYPE_UNKNOWN*: jint {.`static`.}
  TOOL_TYPE_FINGER*: jint {.`static`.}
  TOOL_TYPE_STYLUS*: jint {.`static`.}
  TOOL_TYPE_MOUSE*: jint {.`static`.}
  TOOL_TYPE_ERASER*: jint {.`static`.}
  TOOL_TYPE_PALM*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[MotionEvent] {.`static`.}

jclass android.view.MotionEvent.PointerCoords* of JVMObject:
  proc createArray*(size: jint): seq[PointerCoords] {.`static`.}
  proc isResampled*(): jboolean
  proc clear*()
  proc copyFrom*(other: PointerCoords)
  proc getAxisValue*(axis: jint): jfloat
  proc setAxisValue*(axis: jint, value: jfloat)

jclass android.view.MotionEvent.PointerProperties* of JVMObject:
  proc createArray*(size: jint): seq[PointerProperties] {.`static`.}
  proc clear*()
  proc copyFrom*(other: PointerProperties)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint

jclass android.view.PointerCoords* of JVMObject:
  proc createArray*(size: jint): seq[PointerCoords] {.`static`.}
  proc isResampled*(): jboolean
  proc clear*()
  proc copyFrom*(other: PointerCoords)
  proc getAxisValue*(axis: jint): jfloat
  proc setAxisValue*(axis: jint, value: jfloat)
  x*: jfloat
  y*: jfloat
  pressure*: jfloat
  size*: jfloat
  touchMajor*: jfloat
  touchMinor*: jfloat
  toolMajor*: jfloat
  toolMinor*: jfloat
  orientation*: jfloat
  relativeX*: jfloat
  relativeY*: jfloat
  isResampled*: jboolean

jclass android.view.PointerProperties* of JVMObject:
  proc createArray*(size: jint): seq[PointerProperties] {.`static`.}
  proc clear*()
  proc copyFrom*(other: PointerProperties)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  id*: jint
  toolType*: jint


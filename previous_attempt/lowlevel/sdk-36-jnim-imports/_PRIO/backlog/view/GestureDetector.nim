import jnim

jclass android.view.GestureDetector* of JVMObject:
  proc setOnDoubleTapListener*(onDoubleTapListener: OnDoubleTapListener)
  proc setContextClickListener*(onContextClickListener: OnContextClickListener)
  proc setIsLongpressEnabled*(isLongpressEnabled: jboolean)
  proc isLongpressEnabled*(): jboolean
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onGenericMotionEvent*(ev: MotionEvent): jboolean

jclass android.view.GestureDetector.SimpleOnGestureListener* of JVMObject:
  proc onSingleTapUp*(e: MotionEvent): jboolean
  proc onLongPress*(e: MotionEvent)
  proc onScroll*(e1: MotionEvent, e2: MotionEvent, distanceX: jfloat, distanceY: jfloat): jboolean
  proc onFling*(e1: MotionEvent, e2: MotionEvent, velocityX: jfloat, velocityY: jfloat): jboolean
  proc onShowPress*(e: MotionEvent)
  proc onDown*(e: MotionEvent): jboolean
  proc onDoubleTap*(e: MotionEvent): jboolean
  proc onDoubleTapEvent*(e: MotionEvent): jboolean
  proc onSingleTapConfirmed*(e: MotionEvent): jboolean
  proc onContextClick*(e: MotionEvent): jboolean



jclass android.view.SimpleOnGestureListener* of JVMObject:
  proc onSingleTapUp*(e: MotionEvent): jboolean
  proc onLongPress*(e: MotionEvent)
  proc onScroll*(e1: MotionEvent, e2: MotionEvent, distanceX: jfloat, distanceY: jfloat): jboolean
  proc onFling*(e1: MotionEvent, e2: MotionEvent, velocityX: jfloat, velocityY: jfloat): jboolean
  proc onShowPress*(e: MotionEvent)
  proc onDown*(e: MotionEvent): jboolean
  proc onDoubleTap*(e: MotionEvent): jboolean
  proc onDoubleTapEvent*(e: MotionEvent): jboolean
  proc onSingleTapConfirmed*(e: MotionEvent): jboolean
  proc onContextClick*(e: MotionEvent): jboolean


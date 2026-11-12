import jnim

jclass android.window.BackMotionEvent* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getTouchX*(): jfloat
  proc getTouchY*(): jfloat
  proc getProgress*(): jfloat
  proc getTriggerBack*(): jboolean
  proc getSwipeEdge*(): jint
  proc getFrameTimeMillis*(): jlong
  proc getDepartingAnimationTarget*(): RemoteAnimationTarget
  proc toString*(): string
  CREATOR*: Creator[BackMotionEvent] {.`static`.}


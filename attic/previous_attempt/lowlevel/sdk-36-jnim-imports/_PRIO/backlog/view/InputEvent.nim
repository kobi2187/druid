import jnim

jclass android.view.InputEvent* of JVMObject:
  proc getDeviceId*(): jint
  proc getDevice*(): InputDevice
  proc getSource*(): jint
  proc setSource*(source: jint)
  proc isFromSource*(source: jint): jboolean
  proc getDisplayId*(): jint
  proc setDisplayId*(displayId: jint)
  proc copy*(): InputEvent
  proc recycle*()
  proc recycleIfNeededAfterDispatch*()
  proc isTainted*(): jboolean
  proc setTainted*(tainted: jboolean)
  proc getEventTime*(): jlong
  proc getEventTimeNanos*(): jlong
  proc cancel*()
  proc getSequenceNumber*(): jint
  proc getId*(): jint
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[InputEvent] {.`static`.}


import jnim

jclass android.view.ViewFrameInfo* of JVMObject:
  proc populateFrameInfo*(frameInfo: FrameInfo)
  proc reset*()
  proc markDrawStart*()
  proc getAndIncreaseViewMeasuredCount*(): jint
  proc setInputEvent*(eventId: jint)
  drawStart*: jlong
  flags*: jlong


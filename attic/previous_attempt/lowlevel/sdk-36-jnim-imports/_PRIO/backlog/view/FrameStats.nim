import jnim

jclass android.view.FrameStats* of JVMObject:
  proc getRefreshPeriodNano*(): jlong
  proc getFrameCount*(): jint
  proc getStartTimeNano*(): jlong
  proc getEndTimeNano*(): jlong
  proc getFramePresentedTimeNano*(index: jint): jlong
  UNDEFINED_TIME_NANO*: jlong {.`static`.}


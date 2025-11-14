import jnim

jclass android.graphics.FrameInfo* of JVMObject:
  proc setVsync*(intendedVsync: jlong, usedVsync: jlong, frameTimelineVsyncId: jlong, frameDeadline: jlong, frameStartTime: jlong, frameInterval: jlong)
  proc markInputHandlingStart*()
  proc markAnimationsStart*()
  proc markPerformTraversalsStart*()
  proc addFlags*(flags: jlong)
  frameInfo*: jlong
  FLAGS*: jint {.`static`.}
  FLAG_WINDOW_VISIBILITY_CHANGED*: jlong {.`static`.}
  FLAG_SURFACE_CANVAS*: jlong {.`static`.}
  INVALID_VSYNC_ID*: jlong {.`static`.}
  FRAME_TIMELINE_VSYNC_ID*: jint {.`static`.}
  INTENDED_VSYNC*: jint {.`static`.}
  VSYNC*: jint {.`static`.}
  INPUT_EVENT_ID*: jint {.`static`.}
  HANDLE_INPUT_START*: jint {.`static`.}
  ANIMATION_START*: jint {.`static`.}
  PERFORM_TRAVERSALS_START*: jint {.`static`.}
  DRAW_START*: jint {.`static`.}
  FRAME_DEADLINE*: jint {.`static`.}
  FRAME_START_TIME*: jint {.`static`.}
  FRAME_INTERVAL*: jint {.`static`.}
  WORKLOAD_TARGET*: jint {.`static`.}


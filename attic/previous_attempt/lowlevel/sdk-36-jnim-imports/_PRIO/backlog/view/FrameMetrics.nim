import jnim

jclass android.view.FrameMetrics* of JVMObject:
  proc getMetric*(id: jint): jlong
  UNKNOWN_DELAY_DURATION*: jint {.`static`.}
  INPUT_HANDLING_DURATION*: jint {.`static`.}
  ANIMATION_DURATION*: jint {.`static`.}
  LAYOUT_MEASURE_DURATION*: jint {.`static`.}
  DRAW_DURATION*: jint {.`static`.}
  SYNC_DURATION*: jint {.`static`.}
  COMMAND_ISSUE_DURATION*: jint {.`static`.}
  SWAP_BUFFERS_DURATION*: jint {.`static`.}
  TOTAL_DURATION*: jint {.`static`.}
  FIRST_DRAW_FRAME*: jint {.`static`.}
  INTENDED_VSYNC_TIMESTAMP*: jint {.`static`.}
  VSYNC_TIMESTAMP*: jint {.`static`.}
  GPU_DURATION*: jint {.`static`.}
  DEADLINE*: jint {.`static`.}
  FRAME_TIMELINE_VSYNC_ID*: jint {.`static`.}
  mTimingData*: jlong


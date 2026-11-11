import jnim

jclass android.view.Choreographer* of JVMObject:
  proc onWaitForBufferRelease*(durationNanos: jlong)
  proc getInstance*(): Choreographer {.`static`.}
  proc getSfInstance*(): Choreographer {.`static`.}
  proc getMainThreadInstance*(): Choreographer {.`static`.}
  proc releaseInstance*() {.`static`.}
  proc getLooper*(): Looper
  proc getFrameDelay*(): jlong {.`static`.}
  proc setFrameDelay*(frameDelay: jlong) {.`static`.}
  proc subtractFrameDelay*(delayMillis: jlong): jlong {.`static`.}
  proc getFrameIntervalNanos*(): jlong
  proc postCallback*(callbackType: jint, action: Runnable, token: JObject)
  proc postCallbackDelayed*(callbackType: jint, action: Runnable, token: JObject, delayMillis: jlong)
  proc postVsyncCallback*(callback: VsyncCallback)
  proc removeCallbacks*(callbackType: jint, action: Runnable, token: JObject)
  proc postFrameCallback*(callback: FrameCallback)
  proc postFrameCallbackDelayed*(callback: FrameCallback, delayMillis: jlong)
  proc removeFrameCallback*(callback: FrameCallback)
  proc removeVsyncCallback*(callback: VsyncCallback)
  proc getFrameTime*(): jlong
  proc getFrameTimeNanos*(): jlong
  proc getLastFrameTimeNanos*(): jlong
  proc getExpectedPresentationTimeNanos*(): jlong
  proc getExpectedPresentationTimeMillis*(): jlong
  proc getLatestExpectedPresentTimeNanos*(): jlong
  proc getVsyncId*(): jlong
  proc getFrameDeadline*(): jlong
  CALLBACK_INPUT*: jint {.`static`.}
  CALLBACK_ANIMATION*: jint {.`static`.}
  CALLBACK_INSETS_ANIMATION*: jint {.`static`.}
  CALLBACK_TRAVERSAL*: jint {.`static`.}
  CALLBACK_COMMIT*: jint {.`static`.}

jclass android.view.Choreographer.FrameCallback* of JVMObject:
  proc doFrame*(frameTimeNanos: jlong)

jclass android.view.Choreographer.FrameTimeline* of JVMObject:
  proc getVsyncId*(): jlong
  proc getExpectedPresentationTimeNanos*(): jlong
  proc getDeadlineNanos*(): jlong

jclass android.view.Choreographer.FrameData* of JVMObject:
  proc getFrameTimeNanos*(): jlong
  proc getFrameTimelines*(): seq[FrameTimeline]
  proc getPreferredFrameTimeline*(): FrameTimeline

jclass android.view.FrameCallback* of JVMObject:
  proc doFrame*(frameTimeNanos: jlong)

jclass android.view.FrameTimeline* of JVMObject:
  proc getVsyncId*(): jlong
  proc getExpectedPresentationTimeNanos*(): jlong
  proc getDeadlineNanos*(): jlong

jclass android.view.FrameData* of JVMObject:
  proc getFrameTimeNanos*(): jlong
  proc getFrameTimelines*(): seq[FrameTimeline]
  proc getPreferredFrameTimeline*(): FrameTimeline


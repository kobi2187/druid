import jnim

jclass android.app.EventLogTags* of JVMObject:
  proc writeWmOnPausedCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnResumeCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnStopCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnCreateCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnRestartCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnStartCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnDestroyCalled*(token: jint, componentName: string, reason: string, time: jlong) {.`static`.}
  proc writeWmOnActivityResultCalled*(token: jint, componentName: string, reason: string) {.`static`.}
  proc writeWmOnTopResumedGainedCalled*(token: jint, componentName: string, reason: string) {.`static`.}
  proc writeWmOnTopResumedLostCalled*(token: jint, componentName: string, reason: string) {.`static`.}
  WM_ON_PAUSED_CALLED*: jint {.`static`.}
  WM_ON_RESUME_CALLED*: jint {.`static`.}
  WM_ON_STOP_CALLED*: jint {.`static`.}
  WM_ON_CREATE_CALLED*: jint {.`static`.}
  WM_ON_RESTART_CALLED*: jint {.`static`.}
  WM_ON_START_CALLED*: jint {.`static`.}
  WM_ON_DESTROY_CALLED*: jint {.`static`.}
  WM_ON_ACTIVITY_RESULT_CALLED*: jint {.`static`.}
  WM_ON_TOP_RESUMED_GAINED_CALLED*: jint {.`static`.}
  WM_ON_TOP_RESUMED_LOST_CALLED*: jint {.`static`.}


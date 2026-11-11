import jnim

jclass android.os.Trace* of JVMObject:
  proc isTagEnabled*(traceTag: jlong): jboolean {.`static`.}
  proc traceCounter*(traceTag: jlong, counterName: string, counterValue: jint) {.`static`.}
  proc setAppTracingAllowed*(allowed: jboolean) {.`static`.}
  proc setTracingEnabled*(enabled: jboolean, debugFlags: jint) {.`static`.}
  proc traceBegin*(traceTag: jlong, methodName: string) {.`static`.}
  proc traceEnd*(traceTag: jlong) {.`static`.}
  proc asyncTraceBegin*(traceTag: jlong, methodName: string, cookie: jint) {.`static`.}
  proc asyncTraceEnd*(traceTag: jlong, methodName: string, cookie: jint) {.`static`.}
  proc asyncTraceForTrackBegin*(traceTag: jlong, trackName: string, methodName: string, cookie: jint) {.`static`.}
  proc asyncTraceForTrackEnd*(traceTag: jlong, trackName: string, cookie: jint) {.`static`.}
  proc instant*(traceTag: jlong, methodName: string) {.`static`.}
  proc instantForTrack*(traceTag: jlong, trackName: string, methodName: string) {.`static`.}
  proc isEnabled*(): jboolean {.`static`.}
  proc beginSection*(sectionName: string) {.`static`.}
  proc endSection*() {.`static`.}
  proc beginAsyncSection*(methodName: string, cookie: jint) {.`static`.}
  proc endAsyncSection*(methodName: string, cookie: jint) {.`static`.}
  proc setCounter*(counterName: string, counterValue: jlong) {.`static`.}
  proc setCounter*(traceTag: jlong, counterName: string, counterValue: jlong) {.`static`.}
  proc registerWithPerfetto*() {.`static`.}
  TRACE_TAG_NEVER*: jlong {.`static`.}
  TRACE_TAG_ALWAYS*: jlong {.`static`.}
  TRACE_TAG_GRAPHICS*: jlong {.`static`.}
  TRACE_TAG_INPUT*: jlong {.`static`.}
  TRACE_TAG_VIEW*: jlong {.`static`.}
  TRACE_TAG_WEBVIEW*: jlong {.`static`.}
  TRACE_TAG_WINDOW_MANAGER*: jlong {.`static`.}
  TRACE_TAG_ACTIVITY_MANAGER*: jlong {.`static`.}
  TRACE_TAG_SYNC_MANAGER*: jlong {.`static`.}
  TRACE_TAG_AUDIO*: jlong {.`static`.}
  TRACE_TAG_VIDEO*: jlong {.`static`.}
  TRACE_TAG_CAMERA*: jlong {.`static`.}
  TRACE_TAG_HAL*: jlong {.`static`.}
  TRACE_TAG_APP*: jlong {.`static`.}
  TRACE_TAG_RESOURCES*: jlong {.`static`.}
  TRACE_TAG_DALVIK*: jlong {.`static`.}
  TRACE_TAG_RS*: jlong {.`static`.}
  TRACE_TAG_BIONIC*: jlong {.`static`.}
  TRACE_TAG_POWER*: jlong {.`static`.}
  TRACE_TAG_PACKAGE_MANAGER*: jlong {.`static`.}
  TRACE_TAG_SYSTEM_SERVER*: jlong {.`static`.}
  TRACE_TAG_DATABASE*: jlong {.`static`.}
  TRACE_TAG_NETWORK*: jlong {.`static`.}
  TRACE_TAG_ADB*: jlong {.`static`.}
  TRACE_TAG_VIBRATOR*: jlong {.`static`.}
  TRACE_TAG_AIDL*: jlong {.`static`.}
  TRACE_TAG_NNAPI*: jlong {.`static`.}
  TRACE_TAG_RRO*: jlong {.`static`.}
  TRACE_TAG_THERMAL*: jlong {.`static`.}
  MAX_SECTION_NAME_LEN*: jint {.`static`.}


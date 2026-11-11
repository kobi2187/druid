import jnim

jclass android.os.PerformanceHintManager* of JVMObject:
  proc create*(): PerformanceHintManager {.`static`.}
  proc getPreferredUpdateRateNanos*(): jlong
  proc createHintSession*(tids: seq[jint], initialTargetWorkDurationNanos: jlong): Session

jclass android.os.PerformanceHintManager.Session* of JVMObject:
  proc updateTargetWorkDuration*(targetDurationNanos: jlong)
  proc reportActualWorkDuration*(actualDurationNanos: jlong)
  proc close*()
  proc sendHint*(hint: jint)
  proc setPreferPowerEfficiency*(enabled: jboolean)
  proc setThreads*(tids: seq[jint])
  proc getThreadIds*(): seq[jint]
  proc reportActualWorkDuration*(workDuration: WorkDuration)

jclass android.os.Session* of JVMObject:
  proc updateTargetWorkDuration*(targetDurationNanos: jlong)
  proc reportActualWorkDuration*(actualDurationNanos: jlong)
  proc close*()
  proc sendHint*(hint: jint)
  proc setPreferPowerEfficiency*(enabled: jboolean)
  proc setThreads*(tids: seq[jint])
  proc getThreadIds*(): seq[jint]
  proc reportActualWorkDuration*(workDuration: WorkDuration)
  mNativeSessionPtr*: jlong
  CPU_LOAD_UP*: jint {.`static`.}
  CPU_LOAD_DOWN*: jint {.`static`.}
  CPU_LOAD_RESET*: jint {.`static`.}
  CPU_LOAD_RESUME*: jint {.`static`.}
  GPU_LOAD_UP*: jint {.`static`.}
  GPU_LOAD_DOWN*: jint {.`static`.}
  GPU_LOAD_RESET*: jint {.`static`.}


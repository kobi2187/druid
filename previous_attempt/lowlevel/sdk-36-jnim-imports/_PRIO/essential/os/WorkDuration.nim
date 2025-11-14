import jnim

jclass android.os.WorkDuration* of JVMObject:
  proc setActualTotalDurationNanos*(actualTotalDurationNanos: jlong)
  proc setWorkPeriodStartTimestampNanos*(workPeriodStartTimestampNanos: jlong)
  proc setActualCpuDurationNanos*(actualCpuDurationNanos: jlong)
  proc setActualGpuDurationNanos*(actualGpuDurationNanos: jlong)
  proc getActualTotalDurationNanos*(): jlong
  proc getWorkPeriodStartTimestampNanos*(): jlong
  proc getActualCpuDurationNanos*(): jlong
  proc getActualGpuDurationNanos*(): jlong
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint


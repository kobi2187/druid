import jnim

jclass android.util.SystemConfigFileCommitEventLogger* of JVMObject:
  proc setStartTime*(startTime: jlong)
  proc onStartWrite*()
  proc onFinishWrite*()
  proc writeLogRecord*(durationMs: jlong)


import jnim

jclass android.util.TimingsTraceLog* of JVMObject:
  proc traceBegin*(name: string)
  proc traceEnd*()
  proc logDuration*(name: string, timeMs: jlong)
  proc getUnfinishedTracesForDebug*(): List[string]


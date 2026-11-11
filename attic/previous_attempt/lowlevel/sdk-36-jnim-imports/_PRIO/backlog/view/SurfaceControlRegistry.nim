import jnim

jclass android.view.SurfaceControlRegistry* of JVMObject:
  proc setReportingThresholds*(maxLayersReportingThreshold: jint, resetReportingThreshold: jint, reporter: Reporter)
  proc setCallStackDebuggingParams*(matchName: string, matchCall: string)
  proc createProcessInstance*(context: Context) {.`static`.}
  proc destroyProcessInstance*() {.`static`.}
  proc getProcessInstance*(): SurfaceControlRegistry {.`static`.}
  proc hashCode*(): jint
  proc matchesForCallStackDebugging*(name: string, call: string): jboolean
  proc dump*(limit: jint, runGc: jboolean, pw: PrintWriter) {.`static`.}


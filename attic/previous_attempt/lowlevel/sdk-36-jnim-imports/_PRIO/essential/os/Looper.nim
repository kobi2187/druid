import jnim

jclass android.os.Looper* of JVMObject:
  proc prepare*() {.`static`.}
  proc prepareMainLooper*() {.`static`.}
  proc getMainLooper*(): Looper {.`static`.}
  proc setMainLooperForTest*(looper: Looper) {.`static`.}
  proc clearMainLooperForTest*() {.`static`.}
  proc setObserver*(observer: Observer) {.`static`.}
  proc loop*() {.`static`.}
  proc myLooper*(): Looper {.`static`.}
  proc myQueue*(): MessageQueue {.`static`.}
  proc isCurrentThread*(): jboolean
  proc setMessageLogging*(printer: Printer)
  proc setTraceTag*(traceTag: jlong)
  proc setSlowLogThresholdMs*(slowDispatchThresholdMs: jlong, slowDeliveryThresholdMs: jlong)
  proc quit*()
  proc quitSafely*()
  proc getThread*(): Thread
  proc getQueue*(): MessageQueue
  proc dump*(pw: Printer, prefix: string)
  proc dump*(pw: Printer, prefix: string, handler: Handler)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc toString*(): string


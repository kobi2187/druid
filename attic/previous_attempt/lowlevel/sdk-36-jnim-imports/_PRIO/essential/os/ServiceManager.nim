import jnim

jclass android.os.ServiceManager* of JVMObject:
  proc init$ravenwood*() {.`static`.}
  proc reset$ravenwood*() {.`static`.}
  proc getService*(name: string): IBinder {.`static`.}
  proc getService$ravenwood*(name: string): IBinder {.`static`.}
  proc getServiceOrThrow*(name: string): IBinder {.`static`.}
  proc addService*(name: string, service: IBinder) {.`static`.}
  proc addService*(name: string, service: IBinder, allowIsolated: jboolean) {.`static`.}
  proc addService*(name: string, service: IBinder, allowIsolated: jboolean, dumpPriority: jint) {.`static`.}
  proc addService$ravenwood*(name: string, service: IBinder, allowIsolated: jboolean, dumpPriority: jint) {.`static`.}
  proc checkService*(name: string): IBinder {.`static`.}
  proc isDeclared*(name: string): jboolean {.`static`.}
  proc getDeclaredInstances*(iface: string): seq[string] {.`static`.}
  proc waitForService*(name: string): IBinder {.`static`.}
  proc waitForDeclaredService*(name: string): IBinder {.`static`.}
  proc registerForNotifications*(name: string, callback: IServiceCallback) {.`static`.}
  proc listServices*(): seq[string] {.`static`.}
  proc getServiceDebugInfo*(): seq[ServiceDebugInfo] {.`static`.}
  proc initServiceCache*(cache: Map[string, IBinder]) {.`static`.}
  sStatLogger*: StatLogger {.`static`.}

jclass android.os.ServiceNotFoundException* of Exception:


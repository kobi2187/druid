import jnim

jclass android.os.HwBinder* of JVMObject:
  proc transact*(code: jint, request: HwParcel, reply: HwParcel, flags: jint)
  proc onTransact*(code: jint, request: HwParcel, reply: HwParcel, flags: jint)
  proc registerService*(serviceName: string)
  proc getService*(iface: string, serviceName: string): IHwBinder {.`static`.}
  proc getService*(iface: string, serviceName: string, retry: jboolean): IHwBinder {.`static`.}
  proc setTrebleTestingOverride*(testingOverride: jboolean) {.`static`.}
  proc configureRpcThreadpool*(maxThreads: jlong, callerWillJoin: jboolean) {.`static`.}
  proc joinRpcThreadpool*() {.`static`.}
  proc enableInstrumentation*() {.`static`.}
  proc reportSyspropChanged*() {.`static`.}


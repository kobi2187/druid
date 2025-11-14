import jnim

jclass android.os.VintfRuntimeInfo* of JVMObject:
  proc getKernelSepolicyVersion*(): jlong {.`static`.}
  proc getCpuInfo*(): string {.`static`.}
  proc getOsName*(): string {.`static`.}
  proc getNodeName*(): string {.`static`.}
  proc getOsRelease*(): string {.`static`.}
  proc getOsVersion*(): string {.`static`.}
  proc getHardwareId*(): string {.`static`.}
  proc getKernelVersion*(): string {.`static`.}
  proc getBootAvbVersion*(): string {.`static`.}
  proc getBootVbmetaAvbVersion*(): string {.`static`.}


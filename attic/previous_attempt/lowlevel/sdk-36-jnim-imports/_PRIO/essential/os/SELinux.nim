import jnim

jclass android.os.SELinux* of JVMObject:
  proc fileSelabelLookup*(path: string): string {.`static`.}
  proc isSELinuxEnabled*(): jboolean {.`static`.}
  proc isSELinuxEnforced*(): jboolean {.`static`.}
  proc setFSCreateContext*(context: string): jboolean {.`static`.}
  proc setFileContext*(path: string, context: string): jboolean {.`static`.}
  proc getFileContext*(path: string): string {.`static`.}
  proc getPeerContext*(fd: FileDescriptor): string {.`static`.}
  proc getFileContext*(fd: FileDescriptor): string {.`static`.}
  proc getContext*(): string {.`static`.}
  proc getPidContext*(pid: jint): string {.`static`.}
  proc checkSELinuxAccess*(scon: string, tcon: string, tclass: string, perm: string): jboolean {.`static`.}
  proc restorecon*(pathname: string): jboolean {.`static`.}
  proc restorecon*(file: File): jboolean {.`static`.}
  proc restoreconRecursive*(file: File): jboolean {.`static`.}
  proc getGenfsLabelsVersion*(): jint {.`static`.}


import jnim

jclass android.util.CloseGuard* of JVMObject:
  proc get*(): CloseGuard {.`static`.}
  proc open*(closeMethodName: string)
  proc close*()
  proc warnIfOpen*()


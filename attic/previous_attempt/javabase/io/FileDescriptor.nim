import jnim

jclass java.io.FileDescriptor* of JVMObject:
  proc valid*(): jboolean
  proc sync*()
  in*: FileDescriptor {.`static`.}
  out*: FileDescriptor {.`static`.}
  err*: FileDescriptor {.`static`.}


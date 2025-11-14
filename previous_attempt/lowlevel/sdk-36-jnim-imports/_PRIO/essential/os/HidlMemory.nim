import jnim

jclass android.os.HidlMemory* of JVMObject:
  proc dup*(): HidlMemory
  proc close*()
  proc releaseHandle*(): NativeHandle
  proc getName*(): string
  proc getSize*(): jlong
  proc getHandle*(): NativeHandle


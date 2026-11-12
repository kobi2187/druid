import jnim

jclass android.system.SystemCleaner* of JVMObject:
  proc cleaner*(): Cleaner {.`static`.}


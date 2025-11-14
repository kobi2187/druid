import jnim

jclass android.util.UtilConfig* of JVMObject:
  proc setThrowExceptionForUpperArrayOutOfBounds*(check: jboolean) {.`static`.}


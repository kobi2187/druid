import jnim

jclass android.graphics.Compatibility* of JVMObject:
  proc setTargetSdkVersion*(targetSdkVersion: jint) {.`static`.}
  proc getTargetSdkVersion*(): jint {.`static`.}


import jnim

jclass android.graphics.PorterDuff* of JVMObject:
  proc modeToInt*(mode: Mode): jint {.`static`.}
  proc intToMode*(val: jint): Mode {.`static`.}


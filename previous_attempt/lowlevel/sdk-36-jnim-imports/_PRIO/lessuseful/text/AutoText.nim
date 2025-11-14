import jnim

jclass android.text.AutoText* of JVMObject:
  proc get*(src: CharSequence, start: jint, end: jint, view: View): string {.`static`.}
  proc getSize*(view: View): jint {.`static`.}


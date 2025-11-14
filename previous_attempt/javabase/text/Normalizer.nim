import jnim

jclass java.text.Normalizer* of JVMObject:
  proc normalize*(src: CharSequence, form: Form): string {.`static`.}
  proc isNormalized*(src: CharSequence, form: Form): jboolean {.`static`.}


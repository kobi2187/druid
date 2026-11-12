import jnim

jclass android.util.CharsetUtils* of JVMObject:
  proc toModifiedUtf8Bytes*(src: string, dest: jlong, destOff: jint, destLen: jint): jint {.`static`.}
  proc fromModifiedUtf8Bytes*(src: jlong, srcOff: jint, srcLen: jint): string {.`static`.}


import jnim

jclass android.text.AndroidBidi* of JVMObject:
  proc bidi*(dir: jint, chs: seq[jchar], chInfo: seq[jbyte]): jint {.`static`.}
  proc directions*(dir: jint, levels: seq[jbyte], lstart: jint, chars: seq[jchar], cstart: jint, len: jint): Directions {.`static`.}


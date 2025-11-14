import jnim

jclass java.lang.Readable* of JVMObject:
  proc read*(cb: java.nio.CharBuffer): jint


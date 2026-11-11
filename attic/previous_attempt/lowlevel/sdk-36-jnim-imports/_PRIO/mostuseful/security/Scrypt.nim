import jnim

jclass android.security.Scrypt* of JVMObject:
  proc scrypt*(password: seq[jbyte], salt: seq[jbyte], n: jint, r: jint, p: jint, outLen: jint): seq[jbyte]


import jnim

jclass android.system.IcmpHeaders* of JVMObject:
  proc createIcmpEchoHdr*(ipv4: jboolean, seq: jint): seq[jbyte] {.`static`.}


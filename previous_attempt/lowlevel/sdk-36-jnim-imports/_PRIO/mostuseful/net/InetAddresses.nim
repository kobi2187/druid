import jnim

jclass android.net.InetAddresses* of JVMObject:
  proc isNumericAddress*(address: string): jboolean {.`static`.}
  proc parseNumericAddress*(address: string): InetAddress {.`static`.}


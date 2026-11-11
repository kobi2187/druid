import jnim

jclass android.net.PrivateDnsConnectivityChecker* of JVMObject:
  proc canConnectToPrivateDnsServer*(hostname: string): jboolean {.`static`.}


import jnim

jclass android.net.NetworkSpecifier* of JVMObject:
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc redact*(): NetworkSpecifier


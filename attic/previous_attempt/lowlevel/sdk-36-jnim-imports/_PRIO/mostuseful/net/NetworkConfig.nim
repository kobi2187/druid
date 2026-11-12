import jnim

jclass android.net.NetworkConfig* of JVMObject:
  proc isDefault*(): jboolean
  name*: string
  typ*: jint
  radio*: jint
  priority*: jint
  dependencyMet*: jboolean
  restoreTime*: jint


import jnim

jclass android.system.StructLinger* of JVMObject:
  proc isOn*(): jboolean
  proc toString*(): string
  l_onoff*: jint
  l_linger*: jint


import jnim

jclass java.util.TimerTask* of JVMObject:
  proc run*()
  proc cancel*(): jboolean
  proc scheduledExecutionTime*(): jlong


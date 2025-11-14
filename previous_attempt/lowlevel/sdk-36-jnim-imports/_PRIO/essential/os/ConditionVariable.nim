import jnim

jclass android.os.ConditionVariable* of JVMObject:
  proc open*()
  proc close*()
  proc block*()
  proc block*(timeoutMs: jlong): jboolean


import jnim

jclass android.util.TrustedTime* of JVMObject:
  proc forceRefresh*(): jboolean
  proc getCacheAge*(): jlong


import jnim

jclass android.media.MediaDrmThrowable* of JVMObject:
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint


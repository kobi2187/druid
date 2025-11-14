import jnim

jclass android.media.MediaDrmException* of Exception:
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint


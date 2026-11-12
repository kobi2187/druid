import jnim

jclass android.media.MediaCryptoException* of Exception:
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint


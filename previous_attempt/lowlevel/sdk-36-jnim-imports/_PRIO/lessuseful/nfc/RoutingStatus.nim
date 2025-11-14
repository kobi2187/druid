import jnim

jclass android.nfc.RoutingStatus* of JVMObject:
  proc getDefaultRoute*(): jint
  proc getDefaultIsoDepRoute*(): jint
  proc getDefaultOffHostRoute*(): jint


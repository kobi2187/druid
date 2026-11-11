import jnim

jclass android.nfc.NfcRoutingTableEntry* of JVMObject:
  proc getNfceeId*(): jint
  proc getType*(): jint
  proc getRouteType*(): jint
  TYPE_AID*: jint {.`static`.}
  TYPE_PROTOCOL*: jint {.`static`.}
  TYPE_TECHNOLOGY*: jint {.`static`.}
  TYPE_SYSTEM_CODE*: jint {.`static`.}


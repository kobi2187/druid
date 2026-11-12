import jnim

jclass android.mtp.MtpEvent* of JVMObject:
  proc getEventCode*(): jint
  proc getParameter1*(): jint
  proc getParameter2*(): jint
  proc getParameter3*(): jint
  proc getObjectHandle*(): jint
  proc getStorageId*(): jint
  proc getDevicePropCode*(): jint
  proc getTransactionId*(): jint
  proc getObjectPropCode*(): jint
  proc getObjectFormatCode*(): jint
  EVENT_UNDEFINED*: jint {.`static`.}
  EVENT_CANCEL_TRANSACTION*: jint {.`static`.}
  EVENT_OBJECT_ADDED*: jint {.`static`.}
  EVENT_OBJECT_REMOVED*: jint {.`static`.}
  EVENT_STORE_ADDED*: jint {.`static`.}
  EVENT_STORE_REMOVED*: jint {.`static`.}
  EVENT_DEVICE_PROP_CHANGED*: jint {.`static`.}
  EVENT_OBJECT_INFO_CHANGED*: jint {.`static`.}
  EVENT_DEVICE_INFO_CHANGED*: jint {.`static`.}
  EVENT_REQUEST_OBJECT_TRANSFER*: jint {.`static`.}
  EVENT_STORE_FULL*: jint {.`static`.}
  EVENT_DEVICE_RESET*: jint {.`static`.}
  EVENT_STORAGE_INFO_CHANGED*: jint {.`static`.}
  EVENT_CAPTURE_COMPLETE*: jint {.`static`.}
  EVENT_UNREPORTED_STATUS*: jint {.`static`.}
  EVENT_OBJECT_PROP_CHANGED*: jint {.`static`.}
  EVENT_OBJECT_PROP_DESC_CHANGED*: jint {.`static`.}
  EVENT_OBJECT_REFERENCES_CHANGED*: jint {.`static`.}


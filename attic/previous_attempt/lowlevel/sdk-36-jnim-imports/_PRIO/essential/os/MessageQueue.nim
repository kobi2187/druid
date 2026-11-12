import jnim

jclass android.os.MessageQueue* of JVMObject:
  proc isIdle*(): jboolean
  proc addIdleHandler*(handler: IdleHandler)
  proc removeIdleHandler*(handler: IdleHandler)
  proc isPolling*(): jboolean
  proc addOnFileDescriptorEventListener*(fd: FileDescriptor, events: jint, listener: OnFileDescriptorEventListener)
  proc removeOnFileDescriptorEventListener*(fd: FileDescriptor)
  proc postSyncBarrier*(): jint
  proc removeSyncBarrier*(token: jint)


jclass android.os.OnFileDescriptorEventListener* of JVMObject:
  EVENT_INPUT*: jint {.`static`.}
  EVENT_OUTPUT*: jint {.`static`.}
  EVENT_ERROR*: jint {.`static`.}


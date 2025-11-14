import jnim

jclass android.telecom.StreamingCall* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setAdapter*(adapter: StreamingCallAdapter)
  proc getComponentName*(): ComponentName
  proc getDisplayName*(): CharSequence
  proc getAddress*(): Uri
  proc getState*(): jint
  proc getExtras*(): Bundle
  proc requestStreamingState*(state: jint)
  STATE_STREAMING*: jint {.`static`.}
  STATE_HOLDING*: jint {.`static`.}
  STATE_DISCONNECTED*: jint {.`static`.}
  EXTRA_CALL_ID*: string {.`static`.}
  CREATOR*: Creator[StreamingCall] {.`static`.}


import jnim

jclass android.app.GameState* of JVMObject:
  proc isLoading*(): jboolean
  proc getMode*(): jint
  proc getLabel*(): jint
  proc getQuality*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  MODE_UNKNOWN*: jint {.`static`.}
  MODE_NONE*: jint {.`static`.}
  MODE_GAMEPLAY_INTERRUPTIBLE*: jint {.`static`.}
  MODE_GAMEPLAY_UNINTERRUPTIBLE*: jint {.`static`.}
  MODE_CONTENT*: jint {.`static`.}
  CREATOR*: Creator[GameState] {.`static`.}


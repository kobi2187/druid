import jnim

jclass android.os.UpdateLock* of JVMObject:
  proc setReferenceCounted*(isRefCounted: jboolean)
  proc isHeld*(): jboolean
  proc acquire*()
  proc release*()
  UPDATE_LOCK_CHANGED*: string {.`static`.}
  NOW_IS_CONVENIENT*: string {.`static`.}
  TIMESTAMP*: string {.`static`.}


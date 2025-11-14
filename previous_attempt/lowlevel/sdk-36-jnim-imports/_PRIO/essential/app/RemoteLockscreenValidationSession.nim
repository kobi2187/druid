import jnim

jclass android.app.RemoteLockscreenValidationSession* of JVMObject:
  proc getLockType*(): jint
  proc getSourcePublicKey*(): seq[jbyte]
  proc getRemainingAttempts*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[RemoteLockscreenValidationSession] {.`static`.}

jclass android.app.RemoteLockscreenValidationSession.Builder* of JVMObject:
  proc setLockType*(lockType: jint): Builder
  proc setSourcePublicKey*(publicKey: seq[jbyte]): Builder
  proc setRemainingAttempts*(remainingAttempts: jint): Builder
  proc build*(): RemoteLockscreenValidationSession

jclass android.app.Builder* of JVMObject:
  proc setLockType*(lockType: jint): Builder
  proc setSourcePublicKey*(publicKey: seq[jbyte]): Builder
  proc setRemainingAttempts*(remainingAttempts: jint): Builder
  proc build*(): RemoteLockscreenValidationSession


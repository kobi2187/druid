import jnim

jclass android.app.RemoteLockscreenValidationResult* of JVMObject:
  proc getResultCode*(): jint
  proc getTimeoutMillis*(): jlong
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  RESULT_GUESS_VALID*: jint {.`static`.}
  RESULT_GUESS_INVALID*: jint {.`static`.}
  RESULT_LOCKOUT*: jint {.`static`.}
  RESULT_NO_REMAINING_ATTEMPTS*: jint {.`static`.}
  RESULT_SESSION_EXPIRED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[RemoteLockscreenValidationResult] {.`static`.}

jclass android.app.RemoteLockscreenValidationResult.Builder* of JVMObject:
  proc setResultCode*(resultCode: jint): Builder
  proc setTimeoutMillis*(timeoutMillis: jlong): Builder
  proc build*(): RemoteLockscreenValidationResult

jclass android.app.Builder* of JVMObject:
  proc setResultCode*(resultCode: jint): Builder
  proc setTimeoutMillis*(timeoutMillis: jlong): Builder
  proc build*(): RemoteLockscreenValidationResult


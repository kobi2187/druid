import jnim

jclass android.telecom.CallException* of RuntimeException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCode*(): jint
  TRANSACTION_EXCEPTION_KEY*: string {.`static`.}
  CODE_ERROR_UNKNOWN*: jint {.`static`.}
  CODE_CANNOT_HOLD_CURRENT_ACTIVE_CALL*: jint {.`static`.}
  CODE_CALL_IS_NOT_BEING_TRACKED*: jint {.`static`.}
  CODE_CALL_CANNOT_BE_SET_TO_ACTIVE*: jint {.`static`.}
  CODE_CALL_NOT_PERMITTED_AT_PRESENT_TIME*: jint {.`static`.}
  CODE_OPERATION_TIMED_OUT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallException] {.`static`.}


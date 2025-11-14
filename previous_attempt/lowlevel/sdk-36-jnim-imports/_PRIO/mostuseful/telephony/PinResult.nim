import jnim

jclass android.telephony.PinResult* of JVMObject:
  proc getResult*(): jint
  proc getAttemptsRemaining*(): jint
  proc getDefaultFailedResult*(): PinResult {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  PIN_RESULT_TYPE_SUCCESS*: jint {.`static`.}
  PIN_RESULT_TYPE_INCORRECT*: jint {.`static`.}
  PIN_RESULT_TYPE_FAILURE*: jint {.`static`.}
  PIN_RESULT_TYPE_ABORTED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PinResult] {.`static`.}


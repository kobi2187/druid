import jnim

jclass android.telephony.DataThrottlingRequest* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc getDataThrottlingAction*(): jint
  proc getCompletionDurationMillis*(): jlong
  DATA_THROTTLING_ACTION_NO_DATA_THROTTLING*: jint {.`static`.}
  DATA_THROTTLING_ACTION_THROTTLE_SECONDARY_CARRIER*: jint {.`static`.}
  DATA_THROTTLING_ACTION_THROTTLE_PRIMARY_CARRIER*: jint {.`static`.}
  DATA_THROTTLING_ACTION_HOLD*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[DataThrottlingRequest] {.`static`.}

jclass android.telephony.DataThrottlingRequest.Builder* of JVMObject:
  proc setDataThrottlingAction*(dataThrottlingAction: jint): Builder
  proc setCompletionDurationMillis*(completionDurationMillis: jlong): Builder
  proc build*(): DataThrottlingRequest

jclass android.telephony.Builder* of JVMObject:
  proc setDataThrottlingAction*(dataThrottlingAction: jint): Builder
  proc setCompletionDurationMillis*(completionDurationMillis: jlong): Builder
  proc build*(): DataThrottlingRequest


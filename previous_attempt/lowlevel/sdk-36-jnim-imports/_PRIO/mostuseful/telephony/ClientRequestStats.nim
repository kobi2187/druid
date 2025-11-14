import jnim

jclass android.telephony.ClientRequestStats* of JVMObject:
  proc getCallingPackage*(): string
  proc setCallingPackage*(mCallingPackage: string)
  proc getCompletedRequestsWakelockTime*(): jlong
  proc addCompletedWakelockTime*(completedRequestsWakelockTime: jlong)
  proc getPendingRequestsWakelockTime*(): jlong
  proc setPendingRequestsWakelockTime*(pendingRequestsWakelockTime: jlong)
  proc getCompletedRequestsCount*(): jlong
  proc incrementCompletedRequestsCount*()
  proc getPendingRequestsCount*(): jlong
  proc setPendingRequestsCount*(pendingRequestsCount: jlong)
  proc getRequestHistograms*(): List[TelephonyHistogram]
  proc updateRequestHistograms*(requestId: jint, time: jint)
  proc toString*(): string
  proc describeContents*(): jint
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ClientRequestStats] {.`static`.}


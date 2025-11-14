import jnim

jclass android.net.CaptivePortal* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc reportCaptivePortalDismissed*()
  proc ignoreNetwork*()
  proc useNetwork*()
  proc reevaluateNetwork*()
  proc logEvent*(eventId: jint, packageName: string)
  proc setDelegateUid*(uid: jint, executor: Executor, receiver: OutcomeReceiver[Void, ServiceSpecificException])
  APP_RETURN_DISMISSED*: jint {.`static`.}
  APP_RETURN_UNWANTED*: jint {.`static`.}
  APP_RETURN_WANTED_AS_IS*: jint {.`static`.}
  APP_REQUEST_REEVALUATION_REQUIRED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CaptivePortal] {.`static`.}


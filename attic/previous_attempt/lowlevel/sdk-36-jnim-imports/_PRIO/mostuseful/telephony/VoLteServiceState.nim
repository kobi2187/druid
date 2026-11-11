import jnim

jclass android.telephony.VoLteServiceState* of JVMObject:
  proc newFromBundle*(m: Bundle): VoLteServiceState {.`static`.}
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc validateInput*()
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc fillInNotifierBundle*(m: Bundle)
  proc getSrvccState*(): jint
  INVALID*: jint {.`static`.}
  NOT_SUPPORTED*: jint {.`static`.}
  SUPPORTED*: jint {.`static`.}
  HANDOVER_STARTED*: jint {.`static`.}
  HANDOVER_COMPLETED*: jint {.`static`.}
  HANDOVER_FAILED*: jint {.`static`.}
  HANDOVER_CANCELED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VoLteServiceState] {.`static`.}


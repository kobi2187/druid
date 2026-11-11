import jnim

jclass android.telecom.CallScreeningService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  proc onScreenCall*(callDetails: Call.Details)
  proc respondToCall*(callDetails: Call.Details, response: CallResponse)
  SERVICE_INTERFACE*: string {.`static`.}

jclass android.telecom.CallScreeningService.ParcelableCallResponse* of JVMObject:
  proc toCallResponse*(): CallResponse
  proc shouldDisallowCall*(): jboolean
  proc shouldRejectCall*(): jboolean
  proc shouldSilenceCall*(): jboolean
  proc shouldSkipCallLog*(): jboolean
  proc shouldSkipNotification*(): jboolean
  proc shouldScreenCallViaAudioProcessing*(): jboolean
  proc getCallComposerAttachmentsToShow*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.telecom.CallScreeningService.CallResponse* of JVMObject:
  proc getDisallowCall*(): jboolean
  proc getRejectCall*(): jboolean
  proc getSilenceCall*(): jboolean
  proc getSkipCallLog*(): jboolean
  proc getSkipNotification*(): jboolean
  proc getShouldScreenCallViaAudioProcessing*(): jboolean
  proc getCallComposerAttachmentsToShow*(): jint
  proc toParcelable*(): ParcelableCallResponse
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.telecom.ParcelableCallResponse* of JVMObject:
  proc toCallResponse*(): CallResponse
  proc shouldDisallowCall*(): jboolean
  proc shouldRejectCall*(): jboolean
  proc shouldSilenceCall*(): jboolean
  proc shouldSkipCallLog*(): jboolean
  proc shouldSkipNotification*(): jboolean
  proc shouldScreenCallViaAudioProcessing*(): jboolean
  proc getCallComposerAttachmentsToShow*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[ParcelableCallResponse] {.`static`.}

jclass android.telecom.CallResponse* of JVMObject:
  proc getDisallowCall*(): jboolean
  proc getRejectCall*(): jboolean
  proc getSilenceCall*(): jboolean
  proc getSkipCallLog*(): jboolean
  proc getSkipNotification*(): jboolean
  proc getShouldScreenCallViaAudioProcessing*(): jboolean
  proc getCallComposerAttachmentsToShow*(): jint
  proc toParcelable*(): ParcelableCallResponse
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CALL_COMPOSER_ATTACHMENT_PICTURE*: jint {.`static`.}
  CALL_COMPOSER_ATTACHMENT_LOCATION*: jint {.`static`.}
  CALL_COMPOSER_ATTACHMENT_SUBJECT*: jint {.`static`.}
  CALL_COMPOSER_ATTACHMENT_PRIORITY*: jint {.`static`.}

jclass android.telecom.CallResponse.Builder* of JVMObject:
  proc setDisallowCall*(shouldDisallowCall: jboolean): Builder
  proc setRejectCall*(shouldRejectCall: jboolean): Builder
  proc setSilenceCall*(shouldSilenceCall: jboolean): Builder
  proc setSkipCallLog*(shouldSkipCallLog: jboolean): Builder
  proc setSkipNotification*(shouldSkipNotification: jboolean): Builder
  proc setShouldScreenCallViaAudioProcessing*(shouldScreenCallViaAudioProcessing: jboolean): Builder
  proc setCallComposerAttachmentsToShow*(callComposerAttachmentsToShow: jint): Builder
  proc build*(): CallResponse

jclass android.telecom.Builder* of JVMObject:
  proc setDisallowCall*(shouldDisallowCall: jboolean): Builder
  proc setRejectCall*(shouldRejectCall: jboolean): Builder
  proc setSilenceCall*(shouldSilenceCall: jboolean): Builder
  proc setSkipCallLog*(shouldSkipCallLog: jboolean): Builder
  proc setSkipNotification*(shouldSkipNotification: jboolean): Builder
  proc setShouldScreenCallViaAudioProcessing*(shouldScreenCallViaAudioProcessing: jboolean): Builder
  proc setCallComposerAttachmentsToShow*(callComposerAttachmentsToShow: jint): Builder
  proc build*(): CallResponse


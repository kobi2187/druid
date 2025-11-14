import jnim

jclass android.telecom.ConnectionRequest* of JVMObject:
  proc getAccountHandle*(): PhoneAccountHandle
  proc getAddress*(): Uri
  proc getParticipants*(): List[Uri]
  proc getExtras*(): Bundle
  proc getVideoState*(): jint
  proc getTelecomCallId*(): string
  proc shouldShowIncomingCallUi*(): jboolean
  proc isAdhocConferenceCall*(): jboolean
  proc getRttPipeToInCall*(): ParcelFileDescriptor
  proc getRttPipeFromInCall*(): ParcelFileDescriptor
  proc getRttTextStream*(): Connection.RttTextStream
  proc isRequestingRtt*(): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  CREATOR*: Creator[ConnectionRequest] {.`static`.}

jclass android.telecom.ConnectionRequest.Builder* of JVMObject:
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): Builder
  proc setParticipants*(participants: List[Uri]): Builder
  proc setAddress*(address: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setVideoState*(videoState: jint): Builder
  proc setTelecomCallId*(telecomCallId: string): Builder
  proc setShouldShowIncomingCallUi*(shouldShowIncomingCallUi: jboolean): Builder
  proc setIsAdhocConferenceCall*(isAdhocConference: jboolean): Builder
  proc setRttPipeFromInCall*(rttPipeFromInCall: ParcelFileDescriptor): Builder
  proc setRttPipeToInCall*(rttPipeToInCall: ParcelFileDescriptor): Builder
  proc build*(): ConnectionRequest

jclass android.telecom.Builder* of JVMObject:
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): Builder
  proc setParticipants*(participants: List[Uri]): Builder
  proc setAddress*(address: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setVideoState*(videoState: jint): Builder
  proc setTelecomCallId*(telecomCallId: string): Builder
  proc setShouldShowIncomingCallUi*(shouldShowIncomingCallUi: jboolean): Builder
  proc setIsAdhocConferenceCall*(isAdhocConference: jboolean): Builder
  proc setRttPipeFromInCall*(rttPipeFromInCall: ParcelFileDescriptor): Builder
  proc setRttPipeToInCall*(rttPipeToInCall: ParcelFileDescriptor): Builder
  proc build*(): ConnectionRequest


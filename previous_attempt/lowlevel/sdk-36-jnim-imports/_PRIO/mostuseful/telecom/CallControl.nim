import jnim

jclass android.telecom.CallControl* of JVMObject:
  proc getCallId*(): ParcelUuid
  proc setActive*(executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc answer*(videoState: jint, executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc setInactive*(executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc disconnect*(disconnectCause: DisconnectCause, executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc startCallStreaming*(executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc requestCallEndpointChange*(callEndpoint: CallEndpoint, executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc requestMuteState*(isMuted: jboolean, executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc requestVideoState*(videoState: jint, executor: Executor, callback: OutcomeReceiver[Void, CallException])
  proc sendEvent*(event: string, extras: Bundle)


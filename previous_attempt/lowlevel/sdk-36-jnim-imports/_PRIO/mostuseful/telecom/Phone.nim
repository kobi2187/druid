import jnim

jclass android.telecom.Phone* of JVMObject:
  proc addListener*(listener: Listener)
  proc removeListener*(listener: Listener)
  proc getCalls*(): List[Call]
  proc canAddCall*(): jboolean
  proc setMuted*(state: jboolean)
  proc setAudioRoute*(route: jint)
  proc requestBluetoothAudio*(bluetoothAddress: string)
  proc requestCallEndpointChange*(endpoint: CallEndpoint, executor: Executor, callback: OutcomeReceiver[Void, CallEndpointException])
  proc setProximitySensorOn*()
  proc setProximitySensorOff*(screenOnImmediately: jboolean)
  proc getAudioState*(): AudioState
  proc getCallAudioState*(): CallAudioState
  SDK_VERSION_R*: jint {.`static`.}

jclass android.telecom.Phone.Listener* of JVMObject:
  proc onAudioStateChanged*(phone: Phone, audioState: AudioState)
  proc onCallAudioStateChanged*(phone: Phone, callAudioState: CallAudioState)
  proc onBringToForeground*(phone: Phone, showDialpad: jboolean)
  proc onCallAdded*(phone: Phone, call: Call)
  proc onCallRemoved*(phone: Phone, call: Call)
  proc onCanAddCallChanged*(phone: Phone, canAddCall: jboolean)
  proc onSilenceRinger*(phone: Phone)

jclass android.telecom.Listener* of JVMObject:
  proc onAudioStateChanged*(phone: Phone, audioState: AudioState)
  proc onCallAudioStateChanged*(phone: Phone, callAudioState: CallAudioState)
  proc onBringToForeground*(phone: Phone, showDialpad: jboolean)
  proc onCallAdded*(phone: Phone, call: Call)
  proc onCallRemoved*(phone: Phone, call: Call)
  proc onCanAddCallChanged*(phone: Phone, canAddCall: jboolean)
  proc onSilenceRinger*(phone: Phone)


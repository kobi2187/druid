import jnim

jclass android.telecom.InCallService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  proc getPhone*(): Phone
  proc getCalls*(): List[Call]
  proc canAddCall*(): jboolean
  proc getAudioState*(): AudioState
  proc getCallAudioState*(): CallAudioState
  proc setMuted*(state: jboolean)
  proc setAudioRoute*(route: jint)
  proc requestBluetoothAudio*(bluetoothDevice: BluetoothDevice)
  proc requestCallEndpointChange*(endpoint: CallEndpoint, executor: Executor, callback: OutcomeReceiver[Void, CallEndpointException])
  proc getCurrentCallEndpoint*(): CallEndpoint
  proc onPhoneCreated*(phone: Phone)
  proc onPhoneDestroyed*(phone: Phone)
  proc onAudioStateChanged*(audioState: AudioState)
  proc onCallAudioStateChanged*(audioState: CallAudioState)
  proc onCallEndpointChanged*(callEndpoint: CallEndpoint)
  proc onAvailableCallEndpointsChanged*(availableEndpoints: List[CallEndpoint])
  proc onMuteStateChanged*(isMuted: jboolean)
  proc onBringToForeground*(showDialpad: jboolean)
  proc onCallAdded*(call: Call)
  proc onCallRemoved*(call: Call)
  proc onCanAddCallChanged*(canAddCall: jboolean)
  proc onSilenceRinger*()
  proc onConnectionEvent*(call: Call, event: string, extras: Bundle)
  SERVICE_INTERFACE*: string {.`static`.}

jclass android.telecom.InCallService.VideoCall* of JVMObject:
  proc destroy*()
  proc registerCallback*(callback: VideoCall.Callback)
  proc registerCallback*(callback: VideoCall.Callback, handler: Handler)
  proc unregisterCallback*(callback: VideoCall.Callback)
  proc setCamera*(cameraId: string)
  proc setPreviewSurface*(surface: Surface)
  proc setDisplaySurface*(surface: Surface)
  proc setDeviceOrientation*(rotation: jint)
  proc setZoom*(value: jfloat)
  proc sendSessionModifyRequest*(requestProfile: VideoProfile)
  proc sendSessionModifyResponse*(responseProfile: VideoProfile)
  proc requestCameraCapabilities*()
  proc requestCallDataUsage*()
  proc setPauseImage*(uri: Uri)

jclass android.telecom.VideoCall* of JVMObject:
  proc destroy*()
  proc registerCallback*(callback: VideoCall.Callback)
  proc registerCallback*(callback: VideoCall.Callback, handler: Handler)
  proc unregisterCallback*(callback: VideoCall.Callback)
  proc setCamera*(cameraId: string)
  proc setPreviewSurface*(surface: Surface)
  proc setDisplaySurface*(surface: Surface)
  proc setDeviceOrientation*(rotation: jint)
  proc setZoom*(value: jfloat)
  proc sendSessionModifyRequest*(requestProfile: VideoProfile)
  proc sendSessionModifyResponse*(responseProfile: VideoProfile)
  proc requestCameraCapabilities*()
  proc requestCallDataUsage*()
  proc setPauseImage*(uri: Uri)

jclass android.telecom.VideoCall.Callback* of JVMObject:
  proc onSessionModifyRequestReceived*(videoProfile: VideoProfile)
  proc onSessionModifyResponseReceived*(status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc onCallSessionEvent*(event: jint)
  proc onPeerDimensionsChanged*(width: jint, height: jint)
  proc onVideoQualityChanged*(videoQuality: jint)
  proc onCallDataUsageChanged*(dataUsage: jlong)
  proc onCameraCapabilitiesChanged*(cameraCapabilities: VideoProfile.CameraCapabilities)

jclass android.telecom.Callback* of JVMObject:
  proc onSessionModifyRequestReceived*(videoProfile: VideoProfile)
  proc onSessionModifyResponseReceived*(status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc onCallSessionEvent*(event: jint)
  proc onPeerDimensionsChanged*(width: jint, height: jint)
  proc onVideoQualityChanged*(videoQuality: jint)
  proc onCallDataUsageChanged*(dataUsage: jlong)
  proc onCameraCapabilitiesChanged*(cameraCapabilities: VideoProfile.CameraCapabilities)


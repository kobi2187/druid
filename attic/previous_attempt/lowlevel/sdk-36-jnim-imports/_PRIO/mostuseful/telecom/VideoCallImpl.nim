import jnim

jclass android.telecom.VideoCallImpl* of VideoCall:
  proc setTargetSdkVersion*(sdkVersion: jint)
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
  proc setVideoState*(videoState: jint)
  proc getVideoProvider*(): IVideoProvider


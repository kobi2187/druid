# camera.nim - Camera operations

import android, options

type
  CameraFacing* = enum
    Back, Front
    
  CameraFlashMode* = enum
    Off, On, Auto, Torch
    
  CameraFocusMode* = enum
    Auto, Continuous, Fixed, Infinity, Macro
    
  CameraResolution* = object
    width*: int
    height*: int
    
  CameraCaptureMode* = enum
    StillCapture, VideoCapture
    
  CameraState* = enum
    Closed, Opening, Configuring, Open, Error
    
  CameraPreviewCallback* = proc(imageData: seq[byte], width, height: int, format: int)
  CameraPictureCallback* = proc(imageData: seq[byte])
  CameraErrorCallback* = proc(error: string)
    
  CameraConfig* = object
    facing*: CameraFacing
    flashMode*: CameraFlashMode
    focusMode*: CameraFocusMode
    resolution*: CameraResolution
    jpegQuality*: int  # 0-100
    
  Camera* = ref object
    state*: CameraState
    id*: string
    config*: CameraConfig
    supportedResolutions*: seq[CameraResolution]
    supportedFlashModes*: set[CameraFlashMode]
    supportedFocusModes*: set[CameraFocusMode]
    previewCallback*: Option[CameraPreviewCallback]
    pictureCallback*: Option[CameraPictureCallback]
    errorCallback*: Option[CameraErrorCallback]
    impl: pointer  # JNI reference
    
  CameraManager* = ref object of Manager
    cameras: Table[string, Camera]
    availableCameraIds: seq[string]
    systemService: pointer  # JNI reference

# Constructor
proc newCameraManager*(context: Context): CameraManager
  ## Creates a new camera manager
  ## API 26+: Uses modern CameraManager API
  ## API 24-25: Uses Camera2 API
  ## Requires CAMERA permission

# Camera discovery
proc getAvailableCameras*(m: CameraManager): seq[tuple[id: string, facing: CameraFacing]]
  ## Gets available cameras
  ## API 26+: Uses CameraManager.getCameraIdList
  ## API 24-25: Uses CameraManager with legacy handling

# Camera operations
proc openCamera*(m: CameraManager, 
               cameraId: string,
               config: CameraConfig,
               errorCallback: Option[CameraErrorCallback] = none(CameraErrorCallback)): Option[Camera]
  ## Opens camera
  ## API 26+: Uses modern CameraDevice callbacks
  ## API 24-25: Uses older Camera2 API
  ## Requires CAMERA permission
  
proc startPreview*(camera: Camera, callback: CameraPreviewCallback): bool
  ## Starts camera preview with callback
  ## API 26+: Uses ImageReader with YUV format
  ## API 24-25: Uses ImageReader with legacy handling
  
proc stopPreview*(camera: Camera): bool
  ## Stops camera preview
  
proc takePicture*(camera: Camera, callback: CameraPictureCallback): bool
  ## Takes picture with callback
  ## API 26+: Uses modern CameraCaptureSession
  ## API 24-25: Uses older CameraCaptureSession API
  
proc setFlashMode*(camera: Camera, mode: CameraFlashMode): bool
  ## Sets flash mode
  ## API 26+: Uses CaptureRequest.Builder.set
  ## API 24-25: Uses legacy CaptureRequest method
  
proc setFocusMode*(camera: Camera, mode: CameraFocusMode): bool
  ## Sets focus mode
  ## API 26+: Uses CaptureRequest.Builder.set
  ## API 24-25: Uses legacy CaptureRequest method
  
proc closeCamera*(m: CameraManager, cameraId: string)
  ## Closes camera and releases resources
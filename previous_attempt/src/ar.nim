# ar.nim - Augmented Reality (ARCore)

import android, options

type
  ArAvailability* = enum
    Unknown, Unsupported, SupportedNotInstalled, SupportedInstalled
    
  Pose* = object
    translation*: tuple[x, y, z: float]
    rotation*: tuple[x, y, z, w: float]
    
  Anchor* = object
    id*: string
    pose*: Pose
    trackingState*: TrackingState
    cloudState*: Option[CloudAnchorState]
    
  Plane* = object
    id*: string
    centerPose*: Pose
    extents*: tuple[width, height: float]
    type*: PlaneType
    trackingState*: TrackingState
    
  TrackingState* = enum
    Tracking, Paused, Stopped
    
  PlaneType* = enum
    Horizontal, Vertical, Unknown
    
  CloudAnchorState* = enum
    None, TaskInProgress, Success, ErrorInternal,
    ErrorNotAuthorized, ErrorResourceExhausted, ErrorHostingFailed,
    ErrorResolvingFailed, ErrorCloudIdNotFound
    
  LightEstimate* = object
    pixelIntensity*: float
    colorCorrection*: tuple[r, g, b, a: float]
    
  TrackableType* = enum
    Point, Plane, Image, Object
    
  AugmentedImage* = object
    id*: string
    name*: string
    centerPose*: Pose
    extents*: tuple[width, height: float]
    trackingState*: TrackingState
    
  ArUpdateListener* = proc(anchors: seq[Anchor], planes: seq[Plane], lightEstimate: LightEstimate)
  ArTrackingFailedListener* = proc(reason: string)
  AugmentedImageListener* = proc(images: seq[AugmentedImage])
    
  ArManager* = ref object of Manager
    session: pointer  # JNI reference to ArSession
    config: pointer   # JNI reference to ArConfig
    updateListeners: seq[ArUpdateListener]
    trackingFailedListeners: seq[ArTrackingFailedListener]
    imageListeners: seq[AugmentedImageListener]
    anchors: Table[string, Anchor]
    planes: Table[string, Plane]
    augmentedImages: Table[string, AugmentedImage]

# Constructor
proc newArManager*(context: Context): ArManager
  ## Creates a new AR manager

# ARCore availability
proc checkAvailability*(m: ArManager): ArAvailability
  ## Checks ARCore availability
  ## API 26+: Uses ArCoreApk.getInstance().checkAvailability
  
proc requestInstall*(m: ArManager, activity: Activity, userPrompt: bool = true): bool
  ## Requests ARCore install
  ## API 26+: Uses ArCoreApk.getInstance().requestInstall
  
proc isSupported*(m: ArManager): bool
  ## Checks if ARCore is supported
  ## API 26+: Uses ArCoreApk.getInstance().checkAvailability

# Session management
proc createSession*(m: ArManager, activity: Activity): bool
  ## Creates AR session
  ## API 26+: Uses ArSession.create
  ## Requires CAMERA permission
  
proc resume*(m: ArManager): bool
  ## Resumes AR session
  ## API 26+: Uses ArSession.resume
  
proc pause*(m: ArManager): bool
  ## Pauses AR session
  ## API 26+: Uses ArSession.pause
  
proc destroy*(m: ArManager): bool
  ## Destroys AR session
  ## API 26+: Uses ArSession.close
  
proc registerUpdateListener*(m: ArManager, listener: ArUpdateListener): bool
  ## Registers frame update listener
  
proc registerTrackingFailedListener*(m: ArManager, listener: ArTrackingFailedListener): bool
  ## Registers tracking failed listener
  
proc registerAugmentedImageListener*(m: ArManager, listener: AugmentedImageListener): bool
  ## Registers augmented image listener

# Anchor management
proc createAnchor*(m: ArManager, pose: Pose): Option[string]
  ## Creates anchor at pose
  ## Returns anchor ID
  ## API 26+: Uses ArSession.createAnchor
  
proc hostCloudAnchor*(m: ArManager, anchorId: string): bool
  ## Hosts anchor to cloud
  ## API 26+: Uses ArSession.hostCloudAnchor
  
proc resolveCloudAnchor*(m: ArManager, cloudAnchorId: string): Option[string]
  ## Resolves cloud anchor
  ## Returns anchor ID
  ## API 26+: Uses ArSession.resolveCloudAnchor
  
proc removeAnchor*(m: ArManager, anchorId: string): bool
  ## Removes anchor
  ## API 26+: Uses ArSession.removeAnchor

# Image recognition
proc addImageToDatabase*(m: ArManager, name: string, bitmap: Bitmap, widthInMeters: float): bool
  ## Adds image to AR database
  ## API 26+: Uses AugmentedImageDatabase.addImage
  
proc enableImageRecognition*(m: ArManager, enabled: bool): bool
  ## Enables image recognition
  ## API 26+: Configures ArConfig appropriately

# Hit testing
proc hitTest*(m: ArManager, x: float, y: float): seq[tuple[pose: Pose, distance: float, type: TrackableType]]
  ## Performs hit test at screen coordinates
  ## API 26+: Uses ArSession.hitTest
  
proc createPlaneAnchor*(m: ArManager, planeId: string, pose: Pose): Option[string]
  ## Creates anchor on plane
  ## Returns anchor ID
  ## API 26+: Uses Plane.createAnchor
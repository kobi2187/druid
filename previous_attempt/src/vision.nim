# vision.nim - ML Kit Vision APIs

import android, options

type
  VisionDetector* = enum
    FaceDetector, BarcodeDetector, TextRecognizer,
    ImageLabeler, ObjectDetector, PoseDetector
    
  FaceDetectionMode* = enum
    Fast, Accurate
    
  FaceLandmark* = enum
    LeftEye, RightEye, LeftEar, RightEar, LeftCheek,
    RightCheek, NoseBase, MouthLeft, MouthRight, MouthBottom
    
  FaceContour* = enum
    Face, LeftEyebrow, RightEyebrow, LeftEye, RightEye,
    Nose, NoseBridge, LowerLipTop, LowerLipBottom,
    UpperLipTop, UpperLipBottom, LeftCheek, RightCheek
    
  Face* = object
    boundingBox*: tuple[left, top, right, bottom: int]
    trackingId*: Option[int]
    headEulerAngleX*: float  # pitch
    headEulerAngleY*: float  # yaw
    headEulerAngleZ*: float  # roll
    leftEyeOpenProbability*: Option[float]
    rightEyeOpenProbability*: Option[float]
    smilingProbability*: Option[float]
    landmarks*: Table[FaceLandmark, tuple[x, y: float]]
    contours*: Table[FaceContour, seq[tuple[x, y: float]]]
    
  ImageLabel* = object
    text*: string
    confidence*: float
    index*: int
    
  Object* = object
    boundingBox*: tuple[left, top, right, bottom: int]
    trackingId*: Option[int]
    category*: string
    confidence*: float
    
  PoseLandmark* = enum
    Nose, LeftEye, RightEye, LeftEar, RightEar, LeftShoulder,
    RightShoulder, LeftElbow, RightElbow, LeftWrist, RightWrist,
    LeftHip, RightHip, LeftKnee, RightKnee, LeftAnkle, RightAnkle
    
  Pose* = object
    landmarks*: Table[PoseLandmark, tuple[x, y, z: float, confidence: float]]
    
  VisionProcessorOptions* = object
    case detectorType*: VisionDetector
    of FaceDetector:
      faceMode*: FaceDetectionMode
      enableTracking*: bool
      minFaceSize*: float
      enableLandmarks*: bool
      enableContours*: bool
      enableClassification*: bool
    of BarcodeDetector:
      barcodeFormats*: seq[BarcodeFormat]  # From barcode.nim
      enableMultipleBarcodes*: bool
    of TextRecognizer:
      textLanguages*: seq[string]  # ISO 639-1 language codes
    of ImageLabeler:
      confidenceThreshold*: float
      maxResults*: int
    of ObjectDetector:
      objectCategories*: seq[string]
      multipleObjects*: bool
      classificationConfidenceThreshold*: float
    of PoseDetector:
      mode*: FaceDetectionMode
      enableZCoordinate*: bool
      
  VisionProcessor*[T] = object
    options*: VisionProcessorOptions
    isInitialized*: bool
    impl: pointer  # JNI reference to detector
    
  VisionCallback*[T] = proc(results: seq[T], error: Option[string])
    
  VisionManager* = ref object of Manager
    processors: Table[string, pointer]  # JNI references to processors
    isMLKitAvailable: bool

# Constructor
proc newVisionManager*(context: Context): VisionManager
  ## Creates a new vision manager

# Detector creation
proc createFaceDetector*(m: VisionManager, 
                       options: VisionProcessorOptions): VisionProcessor[Face]
  ## Creates face detector
  ## API 26+: Uses ML Kit FaceDetector
  
proc createBarcodeDetector*(m: VisionManager, 
                          options: VisionProcessorOptions): VisionProcessor[Barcode]
  ## Creates barcode detector
  ## API 26+: Uses ML Kit BarcodeScanner
  
proc createTextRecognizer*(m: VisionManager, 
                         options: VisionProcessorOptions): VisionProcessor[TextBlock]
  ## Creates text recognizer
  ## API 26+: Uses ML Kit TextRecognizer
  
proc createImageLabeler*(m: VisionManager, 
                       options: VisionProcessorOptions): VisionProcessor[ImageLabel]
  ## Creates image labeler
  ## API 26+: Uses ML Kit ImageLabeler
  
proc createObjectDetector*(m: VisionManager, 
                         options: VisionProcessorOptions): VisionProcessor[Object]
  ## Creates object detector
  ## API 26+: Uses ML Kit ObjectDetector
  
proc createPoseDetector*(m: VisionManager, 
                       options: VisionProcessorOptions): VisionProcessor[Pose]
  ## Creates pose detector
  ## API 26+: Uses ML Kit PoseDetector

# Image processing
proc processImage*[T](m: VisionManager, 
                    processor: VisionProcessor[T],
                    bitmap: Bitmap,
                    callback: VisionCallback[T]): bool
  ## Processes image
  ## API 26+: Uses appropriate ML Kit processor
  
proc processImageAsync*[T](m: VisionManager,
                         processor: VisionProcessor[T],
                         bitmap: Bitmap,
                         callback: VisionCallback[T]): string
  ## Processes image asynchronously
  ## Returns task ID
  ## API 26+: Uses appropriate ML Kit processor
  
proc processFromCamera*[T](m: VisionManager,
                         processor: VisionProcessor[T],
                         cameraId: string,
                         callback: VisionCallback[T]): string
  ## Processes frames from camera
  ## Returns task ID
  ## API 26+: Uses appropriate ML Kit processor with CameraX
  ## Requires CAMERA permission
  
proc stopProcessing*(m: VisionManager, taskId: string): bool
  ## Stops processing task
  ## API 26+: Stops camera preview or cancels task

# Utility functions
proc isMLKitAvailable*(m: VisionManager): bool
  ## Checks if ML Kit is available
  
proc rotateImage*(m: VisionManager, bitmap: Bitmap, degrees: float): Option[Bitmap]
  ## Rotates image
  ## API 26+: Uses Matrix.postRotate
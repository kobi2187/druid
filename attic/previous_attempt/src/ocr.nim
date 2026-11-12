# ocr.nim - Optical Character Recognition

import android, options

type
  OcrLanguage* = enum
    Latin, Chinese, Japanese, Korean, Devanagari, Other
    
  TextElement* = object
    text*: string
    confidence*: float
    boundingBox*: tuple[left, top, right, bottom: int]
    
  TextLine* = object
    text*: string
    elements*: seq[TextElement]
    boundingBox*: tuple[left, top, right, bottom: int]
    
  TextBlock* = object
    text*: string
    lines*: seq[TextLine]
    boundingBox*: tuple[left, top, right, bottom: int]
    
  OcrResult* = object
    text*: string
    blocks*: seq[TextBlock]
    
  OcrDetectionMode* = enum
    Simple, Accurate
    
  OcrCallback* = proc(result: OcrResult)
  OcrErrorCallback* = proc(error: string)
    
  OcrManager* = ref object of Manager
    detector: pointer  # JNI reference
    callbacks: Table[string, OcrCallback]
    errorCallbacks: Table[string, OcrErrorCallback]
    isMLKitAvailable: bool

# Constructor
proc newOcrManager*(context: Context): OcrManager
  ## Creates a new OCR manager
  ## API 26+: Tries ML Kit first, falls back to Tesseract

# OCR detection
proc detectFromImage*(m: OcrManager,
                    bitmap: Bitmap,
                    languages: set[OcrLanguage] = {Latin},
                    mode: OcrDetectionMode = Accurate,
                    callback: OcrCallback,
                    errorCallback: Option[OcrErrorCallback] = none(OcrErrorCallback)): string
  ## Detects text in image
  ## Returns detection ID
  ## API 26+: Uses ML Kit or Tesseract
  
proc detectFromImagePath*(m: OcrManager,
                        imagePath: string,
                        languages: set[OcrLanguage] = {Latin},
                        mode: OcrDetectionMode = Accurate,
                        callback: OcrCallback,
                        errorCallback: Option[OcrErrorCallback] = none(OcrErrorCallback)): string
  ## Detects text in image file
  ## Returns detection ID
  ## API 26+: Uses ML Kit or Tesseract
  
proc detectFromCamera*(m: OcrManager,
                     cameraId: string,
                     languages: set[OcrLanguage] = {Latin},
                     mode: OcrDetectionMode = Simple,
                     callback: OcrCallback,
                     errorCallback: Option[OcrErrorCallback] = none(OcrErrorCallback)): string
  ## Starts OCR from camera
  ## Returns detection ID
  ## API 26+: Uses ML Kit or Tesseract with Camera
  ## Requires CAMERA permission
  
proc stopCameraDetection*(m: OcrManager, detectionId: string): bool
  ## Stops camera OCR detection
  ## API 26+: Stops camera preview and detection

# Utility functions
proc isMLKitAvailable*(m: OcrManager): bool
  ## Checks if ML Kit is available
  
proc cleanLanguageData*(m: OcrManager, language: OcrLanguage): bool
  ## Cleans up language data to free space
  ## Only applicable for Tesseract
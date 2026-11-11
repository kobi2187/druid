# barcode.nim - Barcode scanning utilities

import android, options

type
  BarcodeFormat* = enum
    QRCode, DataMatrix, PDF417, Aztec,
    UPC_A, UPC_E, EAN_8, EAN_13,
    Code_39, Code_93, Code_128, ITF,
    Codabar
    
  BarcodeValueType* = enum
    Text, URL, SMS, Phone, Email, WiFi,
    GeoPoint, ContactInfo, CalendarEvent,
    ISBN, Product
    
  BarcodeValue* = object
    case valueType*: BarcodeValueType
    of Text:
      text*: string
    of URL:
      url*: string
    of SMS:
      smsNumber*: string
      smsMessage*: string
    of Phone:
      phoneNumber*: string
    of Email:
      emailAddress*: string
      emailSubject*: Option[string]
      emailBody*: Option[string]
    of WiFi:
      ssid*: string
      password*: string
      encryptionType*: string
    of GeoPoint:
      latitude*: float
      longitude*: float
    of ContactInfo:
      contactName*: string
      contactOrganization*: Option[string]
      contactTitle*: Option[string]
      contactPhones*: seq[string]
      contactEmails*: seq[string]
      contactUrls*: seq[string]
      contactAddresses*: seq[string]
    of CalendarEvent:
      eventSummary*: string
      eventStart*: Time
      eventEnd*: Time
      eventLocation*: Option[string]
      eventDescription*: Option[string]
      eventOrganizer*: Option[string]
    of ISBN:
      isbn*: string
    of Product:
      productCode*: string
      
  Barcode* = object
    format*: BarcodeFormat
    value*: BarcodeValue
    rawValue*: string
    rawBytes*: seq[byte]
    cornerPoints*: seq[tuple[x: int, y: int]]
    
  BarcodeDetectorSource* = enum
    Image, Camera, Preview
    
  BarcodeDetectionOptions* = object
    formats*: set[BarcodeFormat]  # Empty means all formats
    multiple*: bool  # Detect multiple barcodes
    
  BarcodeDetectionCallback* = proc(barcodes: seq[Barcode])
  BarcodeDetectionErrorCallback* = proc(error: string)
    
  BarcodeManager* = ref object of Manager
    detector: pointer  # JNI reference to ML Kit or ZXing
    callbacks: Table[string, BarcodeDetectionCallback]
    errorCallbacks: Table[string, BarcodeDetectionErrorCallback]
    isMLKitAvailable: bool  # Whether ML Kit is available

# Constructor
proc newBarcodeManager*(context: Context): BarcodeManager
  ## Creates a new barcode manager
  ## API 26+: Tries ML Kit first, falls back to ZXing

# Barcode detection
proc detectFromImage*(m: BarcodeManager,
                    bitmap: Bitmap,
                    options: BarcodeDetectionOptions,
                    callback: BarcodeDetectionCallback,
                    errorCallback: Option[BarcodeDetectionErrorCallback] = none(BarcodeDetectionErrorCallback)): string
  ## Detects barcodes in image
  ## Returns detection ID
  ## API 26+: Uses ML Kit or ZXing
  
proc detectFromImagePath*(m: BarcodeManager,
                        imagePath: string,
                        options: BarcodeDetectionOptions,
                        callback: BarcodeDetectionCallback,
                        errorCallback: Option[BarcodeDetectionErrorCallback] = none(BarcodeDetectionErrorCallback)): string
  ## Detects barcodes in image file
  ## Returns detection ID
  ## API 26+: Uses ML Kit or ZXing
  
proc startLiveDetection*(m: BarcodeManager,
                       cameraId: string,
                       options: BarcodeDetectionOptions,
                       callback: BarcodeDetectionCallback,
                       errorCallback: Option[BarcodeDetectionErrorCallback] = none(BarcodeDetectionErrorCallback)): string
  ## Starts live barcode detection
  ## Returns detection ID
  ## API 26+: Uses ML Kit or ZXing with Camera
  ## Requires CAMERA permission
  
proc stopLiveDetection*(m: BarcodeManager, detectionId: string): bool
  ## Stops live barcode detection
  ## API 26+: Stops camera preview and detection

# Barcode generation
proc generateQRCode*(m: BarcodeManager, 
                   content: string,
                   size: int,
                   margin: int = 4,
                   errorCorrectionLevel: string = "M"): Option[Bitmap]
  ## Generates QR code
  ## API 26+: Uses ZXing
  
proc generateBarcode*(m: BarcodeManager,
                    content: string,
                    format: BarcodeFormat,
                    width: int,
                    height: int): Option[Bitmap]
  ## Generates barcode
  ## API 26+: Uses ZXing

# Utility functions
proc isMLKitAvailable*(m: BarcodeManager): bool
  ## Checks if ML Kit is available
  
proc parseRawValue*(m: BarcodeManager, 
                  format: BarcodeFormat,
                  rawValue: string): Option[BarcodeValue]
  ## Parses raw barcode value to structured value
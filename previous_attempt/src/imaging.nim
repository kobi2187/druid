# imaging.nim - Image processing utilities

import android, options

type
  ImageFormat* = enum
    JPEG, PNG, WEBP, HEIF
    
  ImageSource* = enum
    File, Uri, Resource, Bitmap, Drawable
    
  ImageSize* = object
    width*: int
    height*: int
    
  ScaleType* = enum
    FitXY, FitCenter, CenterCrop, CenterInside
    
  Bitmap* = object
    width*: int
    height*: int
    config*: string  # ARGB_8888, RGB_565, etc.
    hasAlpha*: bool
    density*: int
    generationId*: int
    impl: pointer  # JNI reference
    
  BitmapCompressFormat* = enum
    CompressJPEG, CompressPNG, CompressWEBP
    
  ImageDecodeOptions* = object
    inSampleSize*: int       # Power of 2, reduces image size
    inJustDecodeBounds*: bool # Only query dimensions
    inPreferredConfig*: string # ARGB_8888, RGB_565, etc.
    
  ImageLoadCallback* = proc(bitmap: Option[Bitmap], error: Option[string])
    
  ImagingManager* = ref object of Manager
    bitmapCache: Table[string, tuple[bitmap: Bitmap, lastUsed: Time]]
    loadCallbacks: Table[string, ImageLoadCallback]
    maxCacheSize: int  # In bytes

# Constructor
proc newImagingManager*(context: Context, maxCacheSize: int = 20 * 1024 * 1024): ImagingManager
  ## Creates a new imaging manager with optional cache size in bytes

# Image loading
proc loadImage*(m: ImagingManager, 
              source: ImageSource,
              path: string,
              options: Option[ImageDecodeOptions] = none(ImageDecodeOptions),
              callback: Option[ImageLoadCallback] = none(ImageLoadCallback)): string
  ## Loads image asynchronously
  ## Returns request ID
  ## API 26+: Uses BitmapFactory
  
proc loadImageSync*(m: ImagingManager,
                  source: ImageSource,
                  path: string,
                  options: Option[ImageDecodeOptions] = none(ImageDecodeOptions)): Option[Bitmap]
  ## Loads image synchronously
  ## API 26+: Uses BitmapFactory
  
proc cancelLoad*(m: ImagingManager, requestId: string): bool
  ## Cancels image load request

# Image information
proc getImageSize*(m: ImagingManager, 
                 source: ImageSource,
                 path: string): Option[ImageSize]
  ## Gets image dimensions without loading full image
  ## API 26+: Uses BitmapFactory.Options with inJustDecodeBounds
  
proc getImageFormat*(m: ImagingManager, 
                   source: ImageSource,
                   path: string): Option[ImageFormat]
  ## Gets image format
  ## API 26+: Uses BitmapFactory and signature detection

# Bitmap operations
proc createBitmap*(m: ImagingManager, width: int, height: int, hasAlpha: bool = true): Option[Bitmap]
  ## Creates empty bitmap
  ## API 26+: Uses Bitmap.createBitmap
  
proc createBitmapFromImage*(m: ImagingManager, 
                          source: ImageSource,
                          path: string,
                          width: int, 
                          height: int,
                          scaleType: ScaleType = FitCenter): Option[Bitmap]
  ## Creates bitmap from image with scaling
  ## API 26+: Uses BitmapFactory and Matrix
  
proc recycleBitmap*(m: ImagingManager, bitmap: Bitmap): bool
  ## Recycles bitmap to free native memory
  ## API 26+: Uses Bitmap.recycle
  
proc compressBitmap*(m: ImagingManager, 
                   bitmap: Bitmap, 
                   format: BitmapCompressFormat,
                   quality: int): Option[seq[byte]]
  ## Compresses bitmap to bytes
  ## API 26+: Uses Bitmap.compress

# Image manipulation
proc scaleBitmap*(m: ImagingManager, 
                bitmap: Bitmap, 
                width: int, 
                height: int,
                scaleType: ScaleType = FitCenter): Option[Bitmap]
  ## Scales bitmap
  ## API 26+: Uses Bitmap.createScaledBitmap or Matrix
  
proc rotateBitmap*(m: ImagingManager, 
                 bitmap: Bitmap, 
                 degrees: float): Option[Bitmap]
  ## Rotates bitmap
  ## API 26+: Uses Matrix.postRotate
  
proc cropBitmap*(m: ImagingManager, 
               bitmap: Bitmap, 
               x: int, y: int, 
               width: int, height: int): Option[Bitmap]
  ## Crops bitmap
  ## API 26+: Uses Bitmap.createBitmap with x,y,width,height
  
proc applyFilter*(m: ImagingManager, 
                bitmap: Bitmap, 
                filterType: string,
                args: Table[string, float]): Option[Bitmap]
  ## Applies image filter
  ## API 26+: Uses ColorMatrixColorFilter or other filters
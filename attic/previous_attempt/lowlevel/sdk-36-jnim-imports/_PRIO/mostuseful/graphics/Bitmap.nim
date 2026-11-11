import jnim

jclass android.graphics.Bitmap* of JVMObject:
  proc setDefaultDensity*(density: jint) {.`static`.}
  proc getNativeInstance*(): jlong
  proc getDensity*(): jint
  proc setDensity*(density: jint)
  proc reconfigure*(width: jint, height: jint, config: Config)
  proc setWidth*(width: jint)
  proc setHeight*(height: jint)
  proc setConfig*(config: Config)
  proc recycle*()
  proc isRecycled*(): jboolean
  proc getGenerationId*(): jint
  proc copyPixelsToBuffer*(dst: Buffer)
  proc copyPixelsFromBuffer*(src: Buffer)
  proc copy*(config: Config, isMutable: jboolean): Bitmap
  proc createAshmemBitmap*(): Bitmap
  proc asShared*(): Bitmap
  proc getSharedMemory*(): SharedMemory
  proc wrapHardwareBuffer*(hardwareBuffer: HardwareBuffer, colorSpace: ColorSpace): Bitmap {.`static`.}
  proc createScaledBitmap*(src: Bitmap, dstWidth: jint, dstHeight: jint, filter: jboolean): Bitmap {.`static`.}
  proc createBitmap*(src: Bitmap): Bitmap {.`static`.}
  proc createBitmap*(source: Bitmap, x: jint, y: jint, width: jint, height: jint): Bitmap {.`static`.}
  proc createBitmap*(source: Bitmap, x: jint, y: jint, width: jint, height: jint, m: Matrix, filter: jboolean): Bitmap {.`static`.}
  proc createBitmap*(width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(display: DisplayMetrics, width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(width: jint, height: jint, config: Config, hasAlpha: jboolean): Bitmap {.`static`.}
  proc createBitmap*(width: jint, height: jint, config: Config, hasAlpha: jboolean, colorSpace: ColorSpace): Bitmap {.`static`.}
  proc createBitmap*(display: DisplayMetrics, width: jint, height: jint, config: Config, hasAlpha: jboolean): Bitmap {.`static`.}
  proc createBitmap*(display: DisplayMetrics, width: jint, height: jint, config: Config, hasAlpha: jboolean, colorSpace: ColorSpace): Bitmap {.`static`.}
  proc createBitmap*(colors: seq[jint], offset: jint, stride: jint, width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(display: DisplayMetrics, colors: seq[jint], offset: jint, stride: jint, width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(colors: seq[jint], width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(display: DisplayMetrics, colors: seq[jint], width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc createBitmap*(source: Picture): Bitmap {.`static`.}
  proc createBitmap*(source: Picture, width: jint, height: jint, config: Config): Bitmap {.`static`.}
  proc getNinePatchChunk*(): seq[jbyte]
  proc getOpticalInsets*(outInsets: Rect)
  proc getNinePatchInsets*(): NinePatch.InsetStruct
  proc dumpAll*(format: string) {.`static`.}
  proc compress*(format: CompressFormat, quality: jint, stream: OutputStream): jboolean
  proc isMutable*(): jboolean
  proc isPremultiplied*(): jboolean
  proc setPremultiplied*(premultiplied: jboolean)
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getScaledWidth*(canvas: Canvas): jint
  proc getScaledHeight*(canvas: Canvas): jint
  proc getScaledWidth*(metrics: DisplayMetrics): jint
  proc getScaledHeight*(metrics: DisplayMetrics): jint
  proc getScaledWidth*(targetDensity: jint): jint
  proc getScaledHeight*(targetDensity: jint): jint
  proc scaleFromDensity*(size: jint, sdensity: jint, tdensity: jint): jint {.`static`.}
  proc getRowBytes*(): jint
  proc getByteCount*(): jint
  proc getAllocationByteCount*(): jint
  proc getConfig*(): Config
  proc hasAlpha*(): jboolean
  proc setHasAlpha*(hasAlpha: jboolean)
  proc hasMipMap*(): jboolean
  proc setHasMipMap*(hasMipMap: jboolean)
  proc getColorSpace*(): ColorSpace
  proc setColorSpace*(colorSpace: ColorSpace)
  proc hasGainmap*(): jboolean
  proc getGainmap*(): Gainmap
  proc setGainmap*(gainmap: Gainmap)
  proc eraseColor*(c: jint)
  proc eraseColor*(color: jlong)
  proc getPixel*(x: jint, y: jint): jint
  proc getColor*(x: jint, y: jint): Color
  proc getPixels*(pixels: seq[jint], offset: jint, stride: jint, x: jint, y: jint, width: jint, height: jint)
  proc setPixel*(x: jint, y: jint, color: jint)
  proc setPixels*(pixels: seq[jint], offset: jint, stride: jint, x: jint, y: jint, width: jint, height: jint)
  proc describeContents*(): jint
  proc writeToParcel*(p: Parcel, flags: jint)
  proc extractAlpha*(): Bitmap
  proc extractAlpha*(paint: Paint, offsetXY: seq[jint]): Bitmap
  proc sameAs*(other: Bitmap): jboolean
  proc prepareToDraw*()
  proc getHardwareBuffer*(): HardwareBuffer
  DENSITY_NONE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Bitmap] {.`static`.}


import jnim

jclass android.media.ImageReader* of JVMObject:
  proc newInstance*(width: jint, height: jint, format: jint, maxImages: jint): ImageReader {.`static`.}
  proc newInstance*(width: jint, height: jint, format: jint, maxImages: jint, usage: jlong): ImageReader {.`static`.}
  proc newInstance*(width: jint, height: jint, format: jint, maxImages: jint, parent: MultiResolutionImageReader): ImageReader {.`static`.}
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getImageFormat*(): jint
  proc getHardwareBufferFormat*(): jint
  proc getDataSpace*(): jint
  proc getMaxImages*(): jint
  proc getUsage*(): jlong
  proc getSurface*(): Surface
  proc acquireLatestImage*(): Image
  proc acquireNextImageNoThrowISE*(): Image
  proc acquireNextImage*(): Image
  proc setOnImageAvailableListener*(listener: OnImageAvailableListener, handler: Handler)
  proc setOnImageAvailableListenerWithExecutor*(listener: OnImageAvailableListener, executor: Executor)
  proc close*()
  proc discardFreeBuffers*()
  proc detachImage*(image: Image)
  proc initializeImagePlanes*(numPlanes: jint, buffer: GraphicBuffer, fenceFd: jint, format: jint, timestamp: jlong, transform: jint, scalingMode: jint, crop: Rect): seq[ImagePlane] {.`static`.}
  proc unlockGraphicBuffer*(buffer: GraphicBuffer) {.`static`.}

jclass android.media.ImageReader.Builder* of JVMObject:
  proc setMaxImages*(maxImages: jint): Builder
  proc setUsage*(usage: jlong): Builder
  proc setImageFormat*(imageFormat: jint): Builder
  proc setDefaultHardwareBufferFormat*(hardwareBufferFormat: jint): Builder
  proc setDefaultDataSpace*(dataSpace: jint): Builder
  proc build*(): ImageReader

jclass android.media.ImageReader.ImagePlane* of JVMObject:
  proc getBuffer*(): ByteBuffer
  proc getPixelStride*(): jint
  proc getRowStride*(): jint


jclass android.media.Builder* of JVMObject:
  proc setMaxImages*(maxImages: jint): Builder
  proc setUsage*(usage: jlong): Builder
  proc setImageFormat*(imageFormat: jint): Builder
  proc setDefaultHardwareBufferFormat*(hardwareBufferFormat: jint): Builder
  proc setDefaultDataSpace*(dataSpace: jint): Builder
  proc build*(): ImageReader

jclass android.media.ImagePlane* of Plane:
  proc getBuffer*(): ByteBuffer
  proc getPixelStride*(): jint
  proc getRowStride*(): jint


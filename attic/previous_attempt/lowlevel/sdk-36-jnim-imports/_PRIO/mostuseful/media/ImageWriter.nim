import jnim

jclass android.media.ImageWriter* of JVMObject:
  proc newInstance*(surface: Surface, maxImages: jint): ImageWriter {.`static`.}
  proc newInstance*(surface: Surface, maxImages: jint, format: jint, width: jint, height: jint): ImageWriter {.`static`.}
  proc newInstance*(surface: Surface, maxImages: jint, format: jint): ImageWriter {.`static`.}
  proc getMaxImages*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc dequeueInputImage*(): Image
  proc queueInputImage*(image: Image)
  proc getFormat*(): jint
  proc getUsage*(): jlong
  proc getHardwareBufferFormat*(): jint
  proc getDataSpace*(): jint
  proc setOnImageReleasedListener*(listener: OnImageReleasedListener, handler: Handler)
  proc close*()

jclass android.media.ImageWriter.Builder* of JVMObject:
  proc setWidthAndHeight*(width: jint, height: jint): Builder
  proc setMaxImages*(maxImages: jint): Builder
  proc setImageFormat*(imageFormat: jint): Builder
  proc setHardwareBufferFormat*(hardwareBufferFormat: jint): Builder
  proc setDataSpace*(dataSpace: jint): Builder
  proc setUsage*(usage: jlong): Builder
  proc build*(): ImageWriter


jclass android.media.Builder* of JVMObject:
  proc setWidthAndHeight*(width: jint, height: jint): Builder
  proc setMaxImages*(maxImages: jint): Builder
  proc setImageFormat*(imageFormat: jint): Builder
  proc setHardwareBufferFormat*(hardwareBufferFormat: jint): Builder
  proc setDataSpace*(dataSpace: jint): Builder
  proc setUsage*(usage: jlong): Builder
  proc build*(): ImageWriter


import jnim

jclass android.media.Image* of JVMObject:
  proc getFormat*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getTimestamp*(): jlong
  proc getTransform*(): jint
  proc getScalingMode*(): jint
  proc getFence*(): SyncFence
  proc getPlaneCount*(): jint
  proc getHardwareBuffer*(): HardwareBuffer
  proc setTimestamp*(timestamp: jlong)
  proc setFence*(fence: SyncFence)
  proc getDataSpace*(): jint
  proc setDataSpace*(dataSpace: jint)
  proc getCropRect*(): Rect
  proc setCropRect*(cropRect: Rect)
  proc getPlanes*(): seq[Plane]
  proc close*()
  proc isAttachable*(): jboolean

jclass android.media.Image.Plane* of JVMObject:
  proc getRowStride*(): jint
  proc getPixelStride*(): jint
  proc getBuffer*(): ByteBuffer

jclass android.media.Plane* of JVMObject:
  proc getRowStride*(): jint
  proc getPixelStride*(): jint
  proc getBuffer*(): ByteBuffer


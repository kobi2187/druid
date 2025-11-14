import jnim

jclass android.graphics.YuvImage* of JVMObject:
  proc compressToJpeg*(rectangle: Rect, quality: jint, stream: OutputStream): jboolean
  proc compressToJpegR*(sdr: YuvImage, quality: jint, stream: OutputStream): jboolean
  proc compressToJpegR*(sdr: YuvImage, quality: jint, stream: OutputStream, exif: seq[jbyte]): jboolean
  proc getYuvData*(): seq[jbyte]
  proc getYuvFormat*(): jint
  proc getStrides*(): seq[jint]
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getColorSpace*(): ColorSpace


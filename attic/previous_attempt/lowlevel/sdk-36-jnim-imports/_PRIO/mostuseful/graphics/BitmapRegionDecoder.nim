import jnim

jclass android.graphics.BitmapRegionDecoder* of JVMObject:
  proc newInstance*(data: seq[jbyte], offset: jint, length: jint, isShareable: jboolean): BitmapRegionDecoder {.`static`.}
  proc newInstance*(data: seq[jbyte], offset: jint, length: jint): BitmapRegionDecoder {.`static`.}
  proc newInstance*(fd: FileDescriptor, isShareable: jboolean): BitmapRegionDecoder {.`static`.}
  proc newInstance*(pfd: ParcelFileDescriptor): BitmapRegionDecoder {.`static`.}
  proc newInstance*(is: InputStream, isShareable: jboolean): BitmapRegionDecoder {.`static`.}
  proc newInstance*(is: InputStream): BitmapRegionDecoder {.`static`.}
  proc newInstance*(pathName: string, isShareable: jboolean): BitmapRegionDecoder {.`static`.}
  proc newInstance*(pathName: string): BitmapRegionDecoder {.`static`.}
  proc decodeRegion*(rect: Rect, options: BitmapFactory.Options): Bitmap
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc recycle*()
  proc isRecycled*(): jboolean


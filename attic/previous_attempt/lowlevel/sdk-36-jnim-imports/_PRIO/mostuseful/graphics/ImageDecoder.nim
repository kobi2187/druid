import jnim

jclass android.graphics.ImageDecoder* of JVMObject:
  proc isMimeTypeSupported*(mimeType: string): jboolean {.`static`.}
  proc createSource*(res: Resources, resId: jint): Source {.`static`.}
  proc createSource*(cr: ContentResolver, uri: Uri): Source {.`static`.}
  proc createSource*(cr: ContentResolver, uri: Uri, res: Resources): Source {.`static`.}
  proc createSource*(assets: AssetManager, fileName: string): Source {.`static`.}
  proc createSource*(data: seq[jbyte], offset: jint, length: jint): Source {.`static`.}
  proc createSource*(data: seq[jbyte]): Source {.`static`.}
  proc createSource*(buffer: ByteBuffer): Source {.`static`.}
  proc createSource*(res: Resources, is: InputStream): Source {.`static`.}
  proc createSource*(res: Resources, is: InputStream, density: jint): Source {.`static`.}
  proc createSource*(file: File): Source {.`static`.}
  proc createSource*(callable: Callable[AssetFileDescriptor]): Source {.`static`.}
  proc setTargetSize*(width: jint, height: jint)
  proc setTargetSampleSize*(sampleSize: jint)
  proc setAllocator*(allocator: jint)
  proc getAllocator*(): jint
  proc setUnpremultipliedRequired*(unpremultipliedRequired: jboolean)
  proc isUnpremultipliedRequired*(): jboolean
  proc setPostProcessor*(postProcessor: PostProcessor)
  proc getPostProcessor*(): PostProcessor
  proc setOnPartialImageListener*(listener: OnPartialImageListener)
  proc getOnPartialImageListener*(): OnPartialImageListener
  proc setCrop*(subset: Rect)
  proc getCrop*(): Rect
  proc setOutPaddingRect*(outPadding: Rect)
  proc setMutableRequired*(mutable: jboolean)
  proc isMutableRequired*(): jboolean
  proc setMemorySizePolicy*(policy: jint)
  proc getMemorySizePolicy*(): jint
  proc setDecodeAsAlphaMaskEnabled*(enabled: jboolean)
  proc isDecodeAsAlphaMaskEnabled*(): jboolean
  proc setTargetColorSpace*(colorSpace: ColorSpace)
  proc close*()
  proc decodeHeader*(src: Source): ImageInfo {.`static`.}
  proc decodeDrawable*(src: Source, listener: OnHeaderDecodedListener): Drawable {.`static`.}
  proc decodeDrawable*(src: Source): Drawable {.`static`.}
  proc decodeBitmap*(src: Source, listener: OnHeaderDecodedListener): Bitmap {.`static`.}
  proc decodeBitmap*(src: Source): Bitmap {.`static`.}
  ALLOCATOR_DEFAULT*: jint {.`static`.}
  ALLOCATOR_SOFTWARE*: jint {.`static`.}
  ALLOCATOR_SHARED_MEMORY*: jint {.`static`.}
  ALLOCATOR_HARDWARE*: jint {.`static`.}
  MEMORY_POLICY_LOW_RAM*: jint {.`static`.}
  MEMORY_POLICY_DEFAULT*: jint {.`static`.}

jclass android.graphics.ImageDecoder.AssetInputStreamSource* of JVMObject:
  proc getResources*(): Resources
  proc getDensity*(): jint
  proc createImageDecoder*(preferAnimation: jboolean): ImageDecoder
  proc toString*(): string

jclass android.graphics.ImageDecoder.ImageInfo* of JVMObject:
  proc getSize*(): Size
  proc getMimeType*(): string
  proc isAnimated*(): jboolean
  proc getColorSpace*(): ColorSpace

jclass android.graphics.ImageDecoder.OnHeaderDecodedListener* of JVMObject:
  proc onHeaderDecoded*(decoder: ImageDecoder, info: ImageInfo, source: Source)

jclass android.graphics.ImageDecoder.DecodeException* of JVMObject:
  proc getError*(): jint
  proc getSource*(): Source


jclass android.graphics.AssetInputStreamSource* of Source:
  proc getResources*(): Resources
  proc getDensity*(): jint
  proc createImageDecoder*(preferAnimation: jboolean): ImageDecoder
  proc toString*(): string

jclass android.graphics.ImageInfo* of JVMObject:
  proc getSize*(): Size
  proc getMimeType*(): string
  proc isAnimated*(): jboolean
  proc getColorSpace*(): ColorSpace

jclass android.graphics.OnHeaderDecodedListener* of JVMObject:
  proc onHeaderDecoded*(decoder: ImageDecoder, info: ImageInfo, source: Source)

jclass android.graphics.DecodeException* of IOException:
  proc getError*(): jint
  proc getSource*(): Source
  SOURCE_EXCEPTION*: jint {.`static`.}
  SOURCE_INCOMPLETE*: jint {.`static`.}
  SOURCE_MALFORMED_DATA*: jint {.`static`.}


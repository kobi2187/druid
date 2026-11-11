import jnim

jclass android.media.ThumbnailUtils* of JVMObject:
  proc createAudioThumbnail*(filePath: string, kind: jint): Bitmap {.`static`.}
  proc createAudioThumbnail*(file: File, size: Size, signal: CancellationSignal): Bitmap {.`static`.}
  proc createImageThumbnail*(filePath: string, kind: jint): Bitmap {.`static`.}
  proc createImageThumbnail*(file: File, size: Size, signal: CancellationSignal): Bitmap {.`static`.}
  proc createVideoThumbnail*(filePath: string, kind: jint): Bitmap {.`static`.}
  proc createVideoThumbnail*(file: File, size: Size, signal: CancellationSignal): Bitmap {.`static`.}
  proc extractThumbnail*(source: Bitmap, width: jint, height: jint): Bitmap {.`static`.}
  proc extractThumbnail*(source: Bitmap, width: jint, height: jint, options: jint): Bitmap {.`static`.}
  TARGET_SIZE_MICRO_THUMBNAIL*: jint {.`static`.}
  OPTIONS_RECYCLE_INPUT*: jint {.`static`.}


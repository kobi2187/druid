import jnim

jclass android.media.MediaMetadataRetriever* of JVMObject:
  proc setDataSource*(path: string)
  proc setDataSource*(uri: string, headers: Map[string, string])
  proc setDataSource*(fd: FileDescriptor, offset: jlong, length: jlong)
  proc setDataSource*(fd: FileDescriptor)
  proc setDataSource*(context: Context, uri: Uri)
  proc setDataSource*(dataSource: MediaDataSource)
  proc extractMetadata*(keyCode: jint): string
  proc getFrameAtTime*(timeUs: jlong, option: jint): Bitmap
  proc getFrameAtTime*(timeUs: jlong, option: jint, params: BitmapParams): Bitmap
  proc getScaledFrameAtTime*(timeUs: jlong, option: jint, dstWidth: jint, dstHeight: jint): Bitmap
  proc getScaledFrameAtTime*(timeUs: jlong, option: jint, dstWidth: jint, dstHeight: jint, params: BitmapParams): Bitmap
  proc getFrameAtTime*(timeUs: jlong): Bitmap
  proc getFrameAtTime*(): Bitmap
  proc getFrameAtIndex*(frameIndex: jint, params: BitmapParams): Bitmap
  proc getFrameAtIndex*(frameIndex: jint): Bitmap
  proc getFramesAtIndex*(frameIndex: jint, numFrames: jint, params: BitmapParams): List[Bitmap]
  proc getFramesAtIndex*(frameIndex: jint, numFrames: jint): List[Bitmap]
  proc getImageAtIndex*(imageIndex: jint, params: BitmapParams): Bitmap
  proc getThumbnailImageAtIndex*(imageIndex: jint, params: BitmapParams, targetSize: jint, maxPixels: jint): Bitmap
  proc getImageAtIndex*(imageIndex: jint): Bitmap
  proc getPrimaryImage*(params: BitmapParams): Bitmap
  proc getPrimaryImage*(): Bitmap
  proc getEmbeddedPicture*(): seq[jbyte]
  proc close*()
  proc release*()
  OPTION_PREVIOUS_SYNC*: jint {.`static`.}
  OPTION_NEXT_SYNC*: jint {.`static`.}
  OPTION_CLOSEST_SYNC*: jint {.`static`.}
  OPTION_CLOSEST*: jint {.`static`.}
  METADATA_KEY_CD_TRACK_NUMBER*: jint {.`static`.}
  METADATA_KEY_ALBUM*: jint {.`static`.}
  METADATA_KEY_ARTIST*: jint {.`static`.}
  METADATA_KEY_AUTHOR*: jint {.`static`.}
  METADATA_KEY_COMPOSER*: jint {.`static`.}
  METADATA_KEY_DATE*: jint {.`static`.}
  METADATA_KEY_GENRE*: jint {.`static`.}
  METADATA_KEY_TITLE*: jint {.`static`.}
  METADATA_KEY_YEAR*: jint {.`static`.}
  METADATA_KEY_DURATION*: jint {.`static`.}
  METADATA_KEY_NUM_TRACKS*: jint {.`static`.}
  METADATA_KEY_WRITER*: jint {.`static`.}
  METADATA_KEY_MIMETYPE*: jint {.`static`.}
  METADATA_KEY_ALBUMARTIST*: jint {.`static`.}
  METADATA_KEY_DISC_NUMBER*: jint {.`static`.}
  METADATA_KEY_COMPILATION*: jint {.`static`.}
  METADATA_KEY_HAS_AUDIO*: jint {.`static`.}
  METADATA_KEY_HAS_VIDEO*: jint {.`static`.}
  METADATA_KEY_VIDEO_WIDTH*: jint {.`static`.}
  METADATA_KEY_VIDEO_HEIGHT*: jint {.`static`.}
  METADATA_KEY_BITRATE*: jint {.`static`.}
  METADATA_KEY_TIMED_TEXT_LANGUAGES*: jint {.`static`.}
  METADATA_KEY_IS_DRM*: jint {.`static`.}
  METADATA_KEY_LOCATION*: jint {.`static`.}
  METADATA_KEY_VIDEO_ROTATION*: jint {.`static`.}
  METADATA_KEY_CAPTURE_FRAMERATE*: jint {.`static`.}
  METADATA_KEY_HAS_IMAGE*: jint {.`static`.}
  METADATA_KEY_IMAGE_COUNT*: jint {.`static`.}
  METADATA_KEY_IMAGE_PRIMARY*: jint {.`static`.}
  METADATA_KEY_IMAGE_WIDTH*: jint {.`static`.}
  METADATA_KEY_IMAGE_HEIGHT*: jint {.`static`.}
  METADATA_KEY_IMAGE_ROTATION*: jint {.`static`.}
  METADATA_KEY_VIDEO_FRAME_COUNT*: jint {.`static`.}
  METADATA_KEY_EXIF_OFFSET*: jint {.`static`.}
  METADATA_KEY_EXIF_LENGTH*: jint {.`static`.}
  METADATA_KEY_COLOR_STANDARD*: jint {.`static`.}
  METADATA_KEY_COLOR_TRANSFER*: jint {.`static`.}
  METADATA_KEY_COLOR_RANGE*: jint {.`static`.}
  METADATA_KEY_SAMPLERATE*: jint {.`static`.}
  METADATA_KEY_BITS_PER_SAMPLE*: jint {.`static`.}
  METADATA_KEY_VIDEO_CODEC_MIME_TYPE*: jint {.`static`.}
  METADATA_KEY_XMP_OFFSET*: jint {.`static`.}
  METADATA_KEY_XMP_LENGTH*: jint {.`static`.}

jclass android.media.MediaMetadataRetriever.BitmapParams* of JVMObject:
  proc setPreferredConfig*(config: Bitmap.Config)
  proc getPreferredConfig*(): Bitmap.Config
  proc getActualConfig*(): Bitmap.Config

jclass android.media.BitmapParams* of JVMObject:
  proc setPreferredConfig*(config: Bitmap.Config)
  proc getPreferredConfig*(): Bitmap.Config
  proc getActualConfig*(): Bitmap.Config


import jnim

jclass android.media.CameraProfile* of JVMObject:
  proc getJpegEncodingQualityParameter*(quality: jint): jint {.`static`.}
  proc getJpegEncodingQualityParameter*(cameraId: jint, quality: jint): jint {.`static`.}
  QUALITY_LOW*: jint {.`static`.}
  QUALITY_MEDIUM*: jint {.`static`.}
  QUALITY_HIGH*: jint {.`static`.}


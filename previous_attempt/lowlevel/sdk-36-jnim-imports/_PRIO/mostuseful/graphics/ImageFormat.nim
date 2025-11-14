import jnim

jclass android.graphics.ImageFormat* of JVMObject:
  proc getBitsPerPixel*(format: jint): jint {.`static`.}
  proc isPublicFormat*(format: jint): jboolean {.`static`.}
  UNKNOWN*: jint {.`static`.}
  RGB_565*: jint {.`static`.}
  YV12*: jint {.`static`.}
  Y8*: jint {.`static`.}
  Y16*: jint {.`static`.}
  YCBCR_P010*: jint {.`static`.}
  YCBCR_P210*: jint {.`static`.}
  NV16*: jint {.`static`.}
  NV21*: jint {.`static`.}
  YUY2*: jint {.`static`.}
  JPEG*: jint {.`static`.}
  DEPTH_JPEG*: jint {.`static`.}
  JPEG_R*: jint {.`static`.}
  YUV_420_888*: jint {.`static`.}
  YUV_422_888*: jint {.`static`.}
  YUV_444_888*: jint {.`static`.}
  FLEX_RGB_888*: jint {.`static`.}
  FLEX_RGBA_8888*: jint {.`static`.}
  RAW_SENSOR*: jint {.`static`.}
  RAW_PRIVATE*: jint {.`static`.}
  RAW10*: jint {.`static`.}
  RAW12*: jint {.`static`.}
  DEPTH16*: jint {.`static`.}
  DEPTH_POINT_CLOUD*: jint {.`static`.}
  RAW_DEPTH*: jint {.`static`.}
  RAW_DEPTH10*: jint {.`static`.}
  PRIVATE*: jint {.`static`.}
  HEIC*: jint {.`static`.}
  HEIC_ULTRAHDR*: jint {.`static`.}


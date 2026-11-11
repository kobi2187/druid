import jnim

jclass android.graphics.PixelFormat* of JVMObject:
  proc getPixelFormatInfo*(format: jint, info: PixelFormat) {.`static`.}
  proc formatHasAlpha*(format: jint): jboolean {.`static`.}
  proc isPublicFormat*(format: jint): jboolean {.`static`.}
  proc formatToString*(format: jint): string {.`static`.}
  UNKNOWN*: jint {.`static`.}
  TRANSLUCENT*: jint {.`static`.}
  TRANSPARENT*: jint {.`static`.}
  OPAQUE*: jint {.`static`.}
  RGBA_8888*: jint {.`static`.}
  RGBX_8888*: jint {.`static`.}
  RGB_888*: jint {.`static`.}
  RGB_565*: jint {.`static`.}
  RGBA_5551*: jint {.`static`.}
  RGBA_4444*: jint {.`static`.}
  A_8*: jint {.`static`.}
  L_8*: jint {.`static`.}
  LA_88*: jint {.`static`.}
  RGB_332*: jint {.`static`.}
  YCbCr_422_SP*: jint {.`static`.}
  YCbCr_420_SP*: jint {.`static`.}
  YCbCr_422_I*: jint {.`static`.}
  RGBA_F16*: jint {.`static`.}
  RGBA_1010102*: jint {.`static`.}
  HSV_888*: jint {.`static`.}
  R_8*: jint {.`static`.}
  JPEG*: jint {.`static`.}
  bytesPerPixel*: jint
  bitsPerPixel*: jint


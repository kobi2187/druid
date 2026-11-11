import jnim

jclass android.hardware.HardwareBuffer* of JVMObject:
  proc create*(width: jint, height: jint, format: jint, layers: jint, usage: jlong): HardwareBuffer {.`static`.}
  proc isSupported*(width: jint, height: jint, format: jint, layers: jint, usage: jlong): jboolean {.`static`.}
  proc createFromGraphicBuffer*(graphicBuffer: GraphicBuffer): HardwareBuffer {.`static`.}
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getFormat*(): jint
  proc getLayers*(): jint
  proc getUsage*(): jlong
  proc getId*(): jlong
  proc close*()
  proc isClosed*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  RGBA_8888*: jint {.`static`.}
  RGBX_8888*: jint {.`static`.}
  RGB_888*: jint {.`static`.}
  RGB_565*: jint {.`static`.}
  RGBA_FP16*: jint {.`static`.}
  RGBA_1010102*: jint {.`static`.}
  BLOB*: jint {.`static`.}
  YCBCR_420_888*: jint {.`static`.}
  D_16*: jint {.`static`.}
  D_24*: jint {.`static`.}
  DS_24UI8*: jint {.`static`.}
  D_FP32*: jint {.`static`.}
  DS_FP32UI8*: jint {.`static`.}
  S_UI8*: jint {.`static`.}
  YCBCR_P010*: jint {.`static`.}
  YCBCR_P210*: jint {.`static`.}
  R_8*: jint {.`static`.}
  R_16*: jint {.`static`.}
  RG_1616*: jint {.`static`.}
  RGBA_10101010*: jint {.`static`.}
  USAGE_CPU_READ_RARELY*: jlong {.`static`.}
  USAGE_CPU_READ_OFTEN*: jlong {.`static`.}
  USAGE_CPU_WRITE_RARELY*: jlong {.`static`.}
  USAGE_CPU_WRITE_OFTEN*: jlong {.`static`.}
  USAGE_GPU_SAMPLED_IMAGE*: jlong {.`static`.}
  USAGE_GPU_COLOR_OUTPUT*: jlong {.`static`.}
  USAGE_COMPOSER_OVERLAY*: jlong {.`static`.}
  USAGE_PROTECTED_CONTENT*: jlong {.`static`.}
  USAGE_VIDEO_ENCODE*: jlong {.`static`.}
  USAGE_SENSOR_DIRECT_DATA*: jlong {.`static`.}
  USAGE_GPU_DATA_BUFFER*: jlong {.`static`.}
  USAGE_GPU_CUBE_MAP*: jlong {.`static`.}
  USAGE_GPU_MIPMAP_COMPLETE*: jlong {.`static`.}
  USAGE_FRONT_BUFFER*: jlong {.`static`.}
  CREATOR*: Parcelable.Creator[HardwareBuffer] {.`static`.}


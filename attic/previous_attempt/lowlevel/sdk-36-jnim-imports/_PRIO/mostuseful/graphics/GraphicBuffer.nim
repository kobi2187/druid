import jnim

jclass android.graphics.GraphicBuffer* of JVMObject:
  proc create*(width: jint, height: jint, format: jint, usage: jint): GraphicBuffer {.`static`.}
  proc createFromHardwareBuffer*(buffer: HardwareBuffer): GraphicBuffer {.`static`.}
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getFormat*(): jint
  proc getUsage*(): jint
  proc lockCanvas*(): Canvas
  proc lockCanvas*(dirty: Rect): Canvas
  proc unlockCanvasAndPost*(canvas: Canvas)
  proc destroy*()
  proc isDestroyed*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  USAGE_SW_READ_NEVER*: jint {.`static`.}
  USAGE_SW_READ_RARELY*: jint {.`static`.}
  USAGE_SW_READ_OFTEN*: jint {.`static`.}
  USAGE_SW_READ_MASK*: jint {.`static`.}
  USAGE_SW_WRITE_NEVER*: jint {.`static`.}
  USAGE_SW_WRITE_RARELY*: jint {.`static`.}
  USAGE_SW_WRITE_OFTEN*: jint {.`static`.}
  USAGE_SW_WRITE_MASK*: jint {.`static`.}
  USAGE_SOFTWARE_MASK*: jint {.`static`.}
  USAGE_PROTECTED*: jint {.`static`.}
  USAGE_HW_TEXTURE*: jint {.`static`.}
  USAGE_HW_RENDER*: jint {.`static`.}
  USAGE_HW_2D*: jint {.`static`.}
  USAGE_HW_COMPOSER*: jint {.`static`.}
  USAGE_HW_VIDEO_ENCODER*: jint {.`static`.}
  USAGE_HW_MASK*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[GraphicBuffer] {.`static`.}


import jnim

jclass android.accessibilityservice.MagnificationConfig* of JVMObject:
  proc getMode*(): jint
  proc isActivated*(): jboolean
  proc getScale*(): jfloat
  proc getCenterX*(): jfloat
  proc getCenterY*(): jfloat
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  MAGNIFICATION_MODE_DEFAULT*: jint {.`static`.}
  MAGNIFICATION_MODE_FULLSCREEN*: jint {.`static`.}
  MAGNIFICATION_MODE_WINDOW*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[MagnificationConfig] {.`static`.}

jclass android.accessibilityservice.MagnificationConfig.Builder* of JVMObject:
  proc setMode*(mode: jint): MagnificationConfig.Builder
  proc setActivated*(activated: jboolean): MagnificationConfig.Builder
  proc setScale*(scale: jfloat): MagnificationConfig.Builder
  proc setCenterX*(centerX: jfloat): MagnificationConfig.Builder
  proc setCenterY*(centerY: jfloat): MagnificationConfig.Builder
  proc build*(): MagnificationConfig

jclass android.accessibilityservice.Builder* of JVMObject:
  proc setMode*(mode: jint): MagnificationConfig.Builder
  proc setActivated*(activated: jboolean): MagnificationConfig.Builder
  proc setScale*(scale: jfloat): MagnificationConfig.Builder
  proc setCenterX*(centerX: jfloat): MagnificationConfig.Builder
  proc setCenterY*(centerY: jfloat): MagnificationConfig.Builder
  proc build*(): MagnificationConfig


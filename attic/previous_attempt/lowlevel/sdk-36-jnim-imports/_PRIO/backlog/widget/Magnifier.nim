import jnim

jclass android.widget.Magnifier* of JVMObject:
  proc show*(sourceCenterX: jfloat, sourceCenterY: jfloat)
  proc show*(sourceCenterX: jfloat, sourceCenterY: jfloat, magnifierCenterX: jfloat, magnifierCenterY: jfloat)
  proc dismiss*()
  proc update*()
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getSourceWidth*(): jint
  proc getSourceHeight*(): jint
  proc setZoom*(zoom: jfloat)
  proc getZoom*(): jfloat
  proc getElevation*(): jfloat
  proc getCornerRadius*(): jfloat
  proc getDefaultHorizontalSourceToMagnifierOffset*(): jint
  proc getDefaultVerticalSourceToMagnifierOffset*(): jint
  proc getOverlay*(): Drawable
  proc isClippingEnabled*(): jboolean
  proc getPosition*(): Point
  proc getSourcePosition*(): Point
  proc setOnOperationCompleteCallback*(callback: Callback)
  proc getContent*(): Bitmap
  proc getOriginalContent*(): Bitmap
  proc getMagnifierDefaultSize*(): PointF {.`static`.}
  SOURCE_BOUND_MAX_IN_SURFACE*: jint {.`static`.}
  SOURCE_BOUND_MAX_VISIBLE*: jint {.`static`.}

jclass android.widget.Magnifier.Builder* of JVMObject:
  proc setSize*(width: jint, height: jint): Builder
  proc setInitialZoom*(zoom: jfloat): Builder
  proc setElevation*(elevation: jfloat): Builder
  proc setCornerRadius*(cornerRadius: jfloat): Builder
  proc setOverlay*(overlay: Drawable): Builder
  proc setDefaultSourceToMagnifierOffset*(horizontalOffset: jint, verticalOffset: jint): Builder
  proc setClippingEnabled*(clip: jboolean): Builder
  proc setSourceBounds*(left: jint, top: jint, right: jint, bottom: jint): Builder
  proc build*(): Magnifier

jclass android.widget.Builder* of JVMObject:
  proc setSize*(width: jint, height: jint): Builder
  proc setInitialZoom*(zoom: jfloat): Builder
  proc setElevation*(elevation: jfloat): Builder
  proc setCornerRadius*(cornerRadius: jfloat): Builder
  proc setOverlay*(overlay: Drawable): Builder
  proc setDefaultSourceToMagnifierOffset*(horizontalOffset: jint, verticalOffset: jint): Builder
  proc setClippingEnabled*(clip: jboolean): Builder
  proc setSourceBounds*(left: jint, top: jint, right: jint, bottom: jint): Builder
  proc build*(): Magnifier


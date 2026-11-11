import jnim

jclass android.view.SyncRtSurfaceTransactionApplier* of JVMObject:
  proc scheduleApply*(params: SurfaceParams)
  proc applyParams*(t: Transaction, params: SurfaceParams, tmpFloat9: seq[jfloat]) {.`static`.}
  proc create*(targetView: View, callback: Consumer[SyncRtSurfaceTransactionApplier]) {.`static`.}
  FLAG_ALL*: jint {.`static`.}
  FLAG_ALPHA*: jint {.`static`.}
  FLAG_MATRIX*: jint {.`static`.}
  FLAG_WINDOW_CROP*: jint {.`static`.}
  FLAG_LAYER*: jint {.`static`.}
  FLAG_CORNER_RADIUS*: jint {.`static`.}
  FLAG_BACKGROUND_BLUR_RADIUS*: jint {.`static`.}
  FLAG_VISIBILITY*: jint {.`static`.}
  FLAG_TRANSACTION*: jint {.`static`.}
  FLAG_EARLY_WAKEUP_START*: jint {.`static`.}
  FLAG_EARLY_WAKEUP_END*: jint {.`static`.}
  FLAG_OPAQUE*: jint {.`static`.}

jclass android.view.SurfaceParams* of JVMObject:
  surface*: SurfaceControl
  alpha*: jfloat
  cornerRadius*: jfloat
  backgroundBlurRadius*: jint
  matrix*: Matrix
  windowCrop*: Rect
  layer*: jint
  visible*: jboolean
  mergeTransaction*: Transaction
  opaque*: jboolean

jclass android.view.SurfaceParams.Builder* of JVMObject:
  proc withAlpha*(alpha: jfloat): Builder
  proc withMatrix*(matrix: Matrix): Builder
  proc withWindowCrop*(windowCrop: Rect): Builder
  proc withLayer*(layer: jint): Builder
  proc withCornerRadius*(radius: jfloat): Builder
  proc withBackgroundBlur*(radius: jint): Builder
  proc withVisibility*(visible: jboolean): Builder
  proc withMergeTransaction*(mergeTransaction: Transaction): Builder
  proc withEarlyWakeupStart*(): Builder
  proc withEarlyWakeupEnd*(): Builder
  proc withOpaque*(opaque: jboolean): Builder
  proc build*(): SurfaceParams

jclass android.view.Builder* of JVMObject:
  proc withAlpha*(alpha: jfloat): Builder
  proc withMatrix*(matrix: Matrix): Builder
  proc withWindowCrop*(windowCrop: Rect): Builder
  proc withLayer*(layer: jint): Builder
  proc withCornerRadius*(radius: jfloat): Builder
  proc withBackgroundBlur*(radius: jint): Builder
  proc withVisibility*(visible: jboolean): Builder
  proc withMergeTransaction*(mergeTransaction: Transaction): Builder
  proc withEarlyWakeupStart*(): Builder
  proc withEarlyWakeupEnd*(): Builder
  proc withOpaque*(opaque: jboolean): Builder
  proc build*(): SurfaceParams


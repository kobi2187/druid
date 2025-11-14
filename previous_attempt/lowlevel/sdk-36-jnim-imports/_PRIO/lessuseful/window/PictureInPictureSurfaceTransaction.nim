import jnim

jclass android.window.PictureInPictureSurfaceTransaction* of JVMObject:
  proc getMatrix*(): Matrix
  proc hasCornerRadiusSet*(): jboolean
  proc hasShadowRadiusSet*(): jboolean
  proc setShouldDisableCanAffectSystemUiFlags*(shouldDisable: jboolean)
  proc getShouldDisableCanAffectSystemUiFlags*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc apply*(surfaceTransaction: PictureInPictureSurfaceTransaction, surfaceControl: SurfaceControl, tx: SurfaceControl.Transaction) {.`static`.}
  mAlpha*: jfloat
  mPosition*: PointF
  mFloat9*: jfloat
  mRotation*: jfloat
  mCornerRadius*: jfloat
  mShadowRadius*: jfloat
  CREATOR*: Creator[PictureInPictureSurfaceTransaction] {.`static`.}

jclass android.window.PictureInPictureSurfaceTransaction.Builder* of JVMObject:
  proc setAlpha*(alpha: jfloat): Builder
  proc setPosition*(x: jfloat, y: jfloat): Builder
  proc setTransform*(float9: seq[jfloat], rotation: jfloat): Builder
  proc setCornerRadius*(cornerRadius: jfloat): Builder
  proc setShadowRadius*(shadowRadius: jfloat): Builder
  proc setWindowCrop*(windowCrop: Rect): Builder
  proc build*(): PictureInPictureSurfaceTransaction

jclass android.window.Builder* of JVMObject:
  proc setAlpha*(alpha: jfloat): Builder
  proc setPosition*(x: jfloat, y: jfloat): Builder
  proc setTransform*(float9: seq[jfloat], rotation: jfloat): Builder
  proc setCornerRadius*(cornerRadius: jfloat): Builder
  proc setShadowRadius*(shadowRadius: jfloat): Builder
  proc setWindowCrop*(windowCrop: Rect): Builder
  proc build*(): PictureInPictureSurfaceTransaction


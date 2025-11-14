import jnim

jclass android.view.InsetsAnimationControlImpl* of JVMObject:
  proc hasZeroInsetsIme*(): jboolean
  proc getDurationMs*(): jlong
  proc getInsetsInterpolator*(): Interpolator
  proc setReadyDispatched*(dispatched: jboolean)
  proc getHiddenStateInsets*(): Insets
  proc getShownStateInsets*(): Insets
  proc getCurrentInsets*(): Insets
  proc getCurrentAlpha*(): jfloat
  proc getTypes*(): jint
  proc getControllingTypes*(): jint
  proc notifyControlRevoked*(types: jint)
  proc updateSurfacePosition*(controls: SparseArray[InsetsSourceControl])
  proc willUpdateSurface*(): jboolean
  proc getAnimationType*(): jint
  proc getSurfaceParamsApplier*(): SurfaceParamsApplier
  proc getStatsToken*(): ImeTracker.Token
  proc setInsetsAndAlpha*(insets: Insets, alpha: jfloat, fraction: jfloat)
  proc applyChangeInsets*(outState: InsetsState): jboolean
  proc finish*(shown: jboolean)
  proc getCurrentFraction*(): jfloat
  proc cancel*()
  proc isFinished*(): jboolean
  proc isCancelled*(): jboolean
  proc getAnimation*(): WindowInsetsAnimation
  proc updateLayoutInsetsDuringAnimation*(layoutInsetsDuringAnimation: jint)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)


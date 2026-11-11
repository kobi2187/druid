import jnim

jclass android.view.InsetsResizeAnimationRunner* of JVMObject:
  proc getTypes*(): jint
  proc getControllingTypes*(): jint
  proc getAnimation*(): WindowInsetsAnimation
  proc getAnimationType*(): jint
  proc getSurfaceParamsApplier*(): SurfaceParamsApplier
  proc getStatsToken*(): ImeTracker.Token
  proc cancel*()
  proc isCancelled*(): jboolean
  proc onReady*(controller: WindowInsetsAnimationController, types: jint)
  proc applyChangeInsets*(outState: InsetsState): jboolean
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc getHiddenStateInsets*(): Insets
  proc getShownStateInsets*(): Insets
  proc getCurrentInsets*(): Insets
  proc getCurrentFraction*(): jfloat
  proc getCurrentAlpha*(): jfloat
  proc setInsetsAndAlpha*(insets: Insets, alpha: jfloat, fraction: jfloat)
  proc finish*(shown: jboolean)
  proc isFinished*(): jboolean
  proc notifyControlRevoked*(types: jint)
  proc updateSurfacePosition*(controls: SparseArray[InsetsSourceControl])
  proc willUpdateSurface*(): jboolean
  proc hasZeroInsetsIme*(): jboolean
  proc getDurationMs*(): jlong
  proc getInsetsInterpolator*(): Interpolator
  proc setReadyDispatched*(dispatched: jboolean)
  proc onFinished*(controller: WindowInsetsAnimationController)
  proc onCancelled*(controller: WindowInsetsAnimationController)
  proc updateLayoutInsetsDuringAnimation*(layoutInsetsDuringAnimation: jint)


import jnim

jclass android.view.WindowInsetsAnimation* of JVMObject:
  proc getTypeMask*(): jint
  proc getFraction*(): jfloat
  proc getInterpolatedFraction*(): jfloat
  proc getInterpolator*(): Interpolator
  proc getDurationMillis*(): jlong
  proc setFraction*(fraction: jfloat)
  proc getAlpha*(): jfloat
  proc setAlpha*(alpha: jfloat)

jclass android.view.WindowInsetsAnimation.Bounds* of JVMObject:
  proc getLowerBound*(): Insets
  proc getUpperBound*(): Insets
  proc inset*(insets: Insets): Bounds
  proc toString*(): string

jclass android.view.WindowInsetsAnimation.Callback* of JVMObject:
  proc getDispatchMode*(): jint
  proc onPrepare*(animation: WindowInsetsAnimation)
  proc onStart*(animation: WindowInsetsAnimation, bounds: Bounds): Bounds
  proc onProgress*(insets: WindowInsets, runningAnimations: List[WindowInsetsAnimation]): WindowInsets
  proc onEnd*(animation: WindowInsetsAnimation)

jclass android.view.Bounds* of JVMObject:
  proc getLowerBound*(): Insets
  proc getUpperBound*(): Insets
  proc inset*(insets: Insets): Bounds
  proc toString*(): string

jclass android.view.Callback* of JVMObject:
  proc getDispatchMode*(): jint
  proc onPrepare*(animation: WindowInsetsAnimation)
  proc onStart*(animation: WindowInsetsAnimation, bounds: Bounds): Bounds
  proc onProgress*(insets: WindowInsets, runningAnimations: List[WindowInsetsAnimation]): WindowInsets
  proc onEnd*(animation: WindowInsetsAnimation)
  DISPATCH_MODE_STOP*: jint {.`static`.}
  DISPATCH_MODE_CONTINUE_ON_SUBTREE*: jint {.`static`.}


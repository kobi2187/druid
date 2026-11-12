import jnim

jclass android.view.PendingInsetsController* of JVMObject:
  proc show*(types: jint)
  proc hide*(types: jint)
  proc setSystemBarsAppearance*(appearance: jint, mask: jint)
  proc setSystemBarsAppearanceFromResource*(appearance: jint, mask: jint)
  proc getSystemBarsAppearance*(): jint
  proc setImeCaptionBarInsetsHeight*(height: jint)
  proc setSystemBarsBehavior*(behavior: jint)
  proc getSystemBarsBehavior*(): jint
  proc setAnimationsDisabled*(disable: jboolean)
  proc getState*(): InsetsState
  proc getRequestedVisibleTypes*(): jint
  proc addOnControllableInsetsChangedListener*(listener: OnControllableInsetsChangedListener)
  proc removeOnControllableInsetsChangedListener*(listener: OnControllableInsetsChangedListener)
  proc replayAndAttach*(controller: InsetsController)
  proc detach*()
  proc setSystemDrivenInsetsAnimationLoggingListener*(listener: WindowInsetsAnimationControlListener)
  proc controlWindowInsetsAnimation*(types: jint, durationMillis: jlong, interpolator: Interpolator, cancellationSignal: CancellationSignal, listener: WindowInsetsAnimationControlListener)


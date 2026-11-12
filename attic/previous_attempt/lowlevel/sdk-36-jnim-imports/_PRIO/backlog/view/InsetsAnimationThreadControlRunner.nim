import jnim

jclass android.view.InsetsAnimationThreadControlRunner* of JVMObject:
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc getStatsToken*(): ImeTracker.Token
  proc getTypes*(): jint
  proc getControllingTypes*(): jint
  proc notifyControlRevoked*(types: jint)
  proc updateSurfacePosition*(controls: SparseArray[InsetsSourceControl])
  proc willUpdateSurface*(): jboolean
  proc cancel*()
  proc getAnimation*(): WindowInsetsAnimation
  proc getAnimationType*(): jint
  proc getSurfaceParamsApplier*(): SurfaceParamsApplier
  proc updateLayoutInsetsDuringAnimation*(layoutInsetsDuringAnimation: jint)


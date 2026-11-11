import jnim

jclass android.window.WindowContextController* of JVMObject:
  proc attachToDisplayArea*(type: jint, displayId: jint, options: Bundle)
  proc attachToWindowToken*(windowToken: IBinder)
  proc detachIfNeeded*()
  proc reparentToDisplayArea*(type: jint, displayId: jint, options: Bundle)
  proc getWindowTokenClientController*(): WindowTokenClientController
  mAttachedToDisplayArea*: jint


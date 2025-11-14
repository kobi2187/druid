import jnim

jclass android.view.HandlerActionQueue* of JVMObject:
  proc post*(action: Runnable)
  proc postDelayed*(action: Runnable, delayMillis: jlong)
  proc removeCallbacks*(action: Runnable)
  proc executeActions*(handler: Handler)
  proc size*(): jint
  proc getRunnable*(index: jint): Runnable
  proc getDelay*(index: jint): jlong


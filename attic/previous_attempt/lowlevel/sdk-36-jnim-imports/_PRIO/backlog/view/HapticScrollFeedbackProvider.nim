import jnim

jclass android.view.HapticScrollFeedbackProvider* of JVMObject:
  proc onScrollProgress*(inputDeviceId: jint, source: jint, axis: jint, deltaInPixels: jint)
  proc onScrollLimit*(inputDeviceId: jint, source: jint, axis: jint, isStart: jboolean)
  proc onSnapToItem*(inputDeviceId: jint, source: jint, axis: jint)


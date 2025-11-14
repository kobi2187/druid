import jnim

jclass android.view.CompositionSamplingListener* of JVMObject:
  proc destroy*()
  proc onSampleCollected*(medianLuma: jfloat)
  proc register*(listener: CompositionSamplingListener, displayId: jint, stopLayer: SurfaceControl, samplingArea: Rect) {.`static`.}
  proc unregister*(listener: CompositionSamplingListener) {.`static`.}


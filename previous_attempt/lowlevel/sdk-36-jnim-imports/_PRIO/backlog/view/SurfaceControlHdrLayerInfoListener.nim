import jnim

jclass android.view.SurfaceControlHdrLayerInfoListener* of JVMObject:
  proc onHdrInfoChanged*(displayToken: IBinder, numberOfHdrLayers: jint, maxW: jint, maxH: jint, flags: jint, maxDesiredHdrSdrRatio: jfloat)
  proc register*(displayToken: IBinder)
  proc unregister*(displayToken: IBinder)
  proc unregisterAll*()


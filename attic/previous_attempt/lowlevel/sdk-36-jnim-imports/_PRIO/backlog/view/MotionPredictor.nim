import jnim

jclass android.view.MotionPredictor* of JVMObject:
  proc record*(event: MotionEvent)
  proc predict*(predictionTimeNanos: jlong): MotionEvent
  proc isPredictionAvailable*(deviceId: jint, source: jint): jboolean


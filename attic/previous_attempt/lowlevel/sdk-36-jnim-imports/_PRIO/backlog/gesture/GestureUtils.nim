import jnim

jclass android.gesture.GestureUtils* of JVMObject:
  proc spatialSampling*(gesture: Gesture, bitmapSize: jint): seq[jfloat] {.`static`.}
  proc spatialSampling*(gesture: Gesture, bitmapSize: jint, keepAspectRatio: jboolean): seq[jfloat] {.`static`.}
  proc temporalSampling*(stroke: GestureStroke, numPoints: jint): seq[jfloat] {.`static`.}
  proc computeOrientedBoundingBox*(originalPoints: ArrayList[GesturePoint]): OrientedBoundingBox {.`static`.}
  proc computeOrientedBoundingBox*(originalPoints: seq[jfloat]): OrientedBoundingBox {.`static`.}


import jnim

jclass android.gesture.GestureStroke* of JVMObject:
  proc clone*(): JObject
  proc getPath*(): Path
  proc toPath*(width: jfloat, height: jfloat, numSample: jint): Path
  proc clearPath*()
  proc computeOrientedBoundingBox*(): OrientedBoundingBox
  boundingBox*: RectF
  length*: jfloat
  points*: jfloat


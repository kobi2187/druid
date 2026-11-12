import jnim

jclass android.transition.PathMotion* of JVMObject:
  proc getPath*(startX: jfloat, startY: jfloat, endX: jfloat, endY: jfloat): Path


import jnim

jclass android.animation.PointFEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: PointF, endValue: PointF): PointF


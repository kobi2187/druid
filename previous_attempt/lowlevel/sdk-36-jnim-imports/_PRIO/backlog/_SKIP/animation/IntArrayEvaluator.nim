import jnim

jclass android.animation.IntArrayEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: seq[jint], endValue: seq[jint]): seq[jint]


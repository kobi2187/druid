import jnim

jclass android.animation.FloatArrayEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: seq[jfloat], endValue: seq[jfloat]): seq[jfloat]


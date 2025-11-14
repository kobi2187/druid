import jnim

jclass android.animation.TypeEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: T, endValue: T): T


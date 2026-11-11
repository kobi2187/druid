import jnim

jclass android.animation.RectEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: Rect, endValue: Rect): Rect


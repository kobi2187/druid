import jnim

jclass android.util.Spline* of JVMObject:
  proc interpolate*(x: jfloat): jfloat
  proc createSpline*(x: seq[jfloat], y: seq[jfloat]): Spline {.`static`.}
  proc createMonotoneCubicSpline*(x: seq[jfloat], y: seq[jfloat]): Spline {.`static`.}
  proc createLinearSpline*(x: seq[jfloat], y: seq[jfloat]): Spline {.`static`.}

jclass android.util.Spline.MonotoneCubicSpline* of JVMObject:
  proc interpolate*(x: jfloat): jfloat
  proc toString*(): string

jclass android.util.Spline.LinearSpline* of JVMObject:
  proc interpolate*(x: jfloat): jfloat
  proc toString*(): string

jclass android.util.MonotoneCubicSpline* of Spline:
  proc interpolate*(x: jfloat): jfloat
  proc toString*(): string

jclass android.util.LinearSpline* of Spline:
  proc interpolate*(x: jfloat): jfloat
  proc toString*(): string


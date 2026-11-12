import jnim

jclass android.transition.TransitionUtils* of JVMObject:
  proc mergeTransitions*(transitions: Transition): Transition {.`static`.}
  proc copyViewImage*(sceneRoot: ViewGroup, view: View, parent: View): View {.`static`.}
  proc createDrawableBitmap*(drawable: Drawable, hostView: View): Bitmap {.`static`.}
  proc createViewBitmap*(view: View, matrix: Matrix, bounds: RectF, sceneRoot: ViewGroup): Bitmap {.`static`.}

jclass android.transition.TransitionUtils.MatrixEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: Matrix, endValue: Matrix): Matrix

jclass android.transition.MatrixEvaluator* of JVMObject:
  proc evaluate*(fraction: jfloat, startValue: Matrix, endValue: Matrix): Matrix


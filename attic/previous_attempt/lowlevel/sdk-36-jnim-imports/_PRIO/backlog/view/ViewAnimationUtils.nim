import jnim

jclass android.view.ViewAnimationUtils* of JVMObject:
  proc createCircularReveal*(view: View, centerX: jint, centerY: jint, startRadius: jfloat, endRadius: jfloat): Animator {.`static`.}


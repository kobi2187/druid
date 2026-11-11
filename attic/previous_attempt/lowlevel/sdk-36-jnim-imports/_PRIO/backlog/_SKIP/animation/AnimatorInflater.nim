import jnim

jclass android.animation.AnimatorInflater* of JVMObject:
  proc loadAnimator*(context: Context, id: jint): Animator {.`static`.}
  proc loadAnimator*(resources: Resources, theme: Theme, id: jint): Animator {.`static`.}
  proc loadAnimator*(resources: Resources, theme: Theme, id: jint, pathErrorScale: jfloat): Animator {.`static`.}
  proc loadStateListAnimator*(context: Context, id: jint): StateListAnimator {.`static`.}


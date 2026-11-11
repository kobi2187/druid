import jnim

jclass android.animation.AnimatorListenerAdapter* of JVMObject:
  proc onAnimationCancel*(animation: Animator)
  proc onAnimationEnd*(animation: Animator)
  proc onAnimationRepeat*(animation: Animator)
  proc onAnimationStart*(animation: Animator)
  proc onAnimationPause*(animation: Animator)
  proc onAnimationResume*(animation: Animator)


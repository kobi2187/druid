import jnim

jclass android.view.ViewPropertyAnimator* of JVMObject:
  proc setDuration*(duration: jlong): ViewPropertyAnimator
  proc getDuration*(): jlong
  proc getStartDelay*(): jlong
  proc setStartDelay*(startDelay: jlong): ViewPropertyAnimator
  proc setInterpolator*(interpolator: TimeInterpolator): ViewPropertyAnimator
  proc getInterpolator*(): TimeInterpolator
  proc setListener*(listener: Animator.AnimatorListener): ViewPropertyAnimator
  proc setUpdateListener*(listener: ValueAnimator.AnimatorUpdateListener): ViewPropertyAnimator
  proc start*()
  proc cancel*()
  proc x*(value: jfloat): ViewPropertyAnimator
  proc xBy*(value: jfloat): ViewPropertyAnimator
  proc y*(value: jfloat): ViewPropertyAnimator
  proc yBy*(value: jfloat): ViewPropertyAnimator
  proc z*(value: jfloat): ViewPropertyAnimator
  proc zBy*(value: jfloat): ViewPropertyAnimator
  proc rotation*(value: jfloat): ViewPropertyAnimator
  proc rotationBy*(value: jfloat): ViewPropertyAnimator
  proc rotationX*(value: jfloat): ViewPropertyAnimator
  proc rotationXBy*(value: jfloat): ViewPropertyAnimator
  proc rotationY*(value: jfloat): ViewPropertyAnimator
  proc rotationYBy*(value: jfloat): ViewPropertyAnimator
  proc translationX*(value: jfloat): ViewPropertyAnimator
  proc translationXBy*(value: jfloat): ViewPropertyAnimator
  proc translationY*(value: jfloat): ViewPropertyAnimator
  proc translationYBy*(value: jfloat): ViewPropertyAnimator
  proc translationZ*(value: jfloat): ViewPropertyAnimator
  proc translationZBy*(value: jfloat): ViewPropertyAnimator
  proc scaleX*(value: jfloat): ViewPropertyAnimator
  proc scaleXBy*(value: jfloat): ViewPropertyAnimator
  proc scaleY*(value: jfloat): ViewPropertyAnimator
  proc scaleYBy*(value: jfloat): ViewPropertyAnimator
  proc alpha*(value: jfloat): ViewPropertyAnimator
  proc alphaBy*(value: jfloat): ViewPropertyAnimator
  proc withLayer*(): ViewPropertyAnimator
  proc withStartAction*(runnable: Runnable): ViewPropertyAnimator
  proc withEndAction*(runnable: Runnable): ViewPropertyAnimator


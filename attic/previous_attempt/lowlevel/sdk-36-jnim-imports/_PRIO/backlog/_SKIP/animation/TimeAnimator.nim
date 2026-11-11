import jnim

jclass android.animation.TimeAnimator* of ValueAnimator:
  proc start*()
  proc setCurrentPlayTime*(playTime: jlong)
  proc setTimeListener*(listener: TimeListener)


import jnim

jclass android.view.RenderNodeAnimator* of RenderNodeAnimator:
  proc onAlphaAnimationStart*(finalAlpha: jfloat)
  proc invalidateParent*(forceRedraw: jboolean)
  proc setTarget*(view: View)


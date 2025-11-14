import jnim

jclass android.view.ViewAnimationHostBridge* of AnimatorListenerAdapter:
  proc registerAnimatingRenderNode*(renderNode: RenderNode, animator: Animator)
  proc registerVectorDrawableAnimator*(animator: NativeVectorDrawableAnimator)
  proc isAttached*(): jboolean
  proc onAnimationStart*(animation: Animator)
  proc onAnimationEnd*(animation: Animator)


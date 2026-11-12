import jnim

jclass android.widget.ViewFlipper* of ViewAnimator:
  proc setFlipInterval*(milliseconds: jint)
  proc getFlipInterval*(): jint
  proc startFlipping*()
  proc stopFlipping*()
  proc getAccessibilityClassName*(): CharSequence
  proc isFlipping*(): jboolean
  proc setAutoStart*(autoStart: jboolean)
  proc isAutoStart*(): jboolean


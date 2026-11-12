import jnim

jclass android.widget.AdapterViewFlipper* of AdapterViewAnimator:
  proc setAdapter*(adapter: Adapter)
  proc getFlipInterval*(): jint
  proc setFlipInterval*(flipInterval: jint)
  proc startFlipping*()
  proc stopFlipping*()
  proc showNext*()
  proc showPrevious*()
  proc isFlipping*(): jboolean
  proc setAutoStart*(autoStart: jboolean)
  proc isAutoStart*(): jboolean
  proc fyiWillBeAdvancedByHostKThx*()
  proc getAccessibilityClassName*(): CharSequence


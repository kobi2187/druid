import jnim

jclass android.view.InsetsSourceConsumer* of JVMObject:
  proc setControl*(control: InsetsSourceControl, showTypes: seq[jint], hideTypes: seq[jint], cancelTypes: seq[jint], transientTypes: seq[jint]): jboolean
  proc getControl*(): InsetsSourceControl
  proc onAnimationStateChanged*(running: jboolean): jboolean
  proc onWindowFocusGained*(hasViewFocus: jboolean)
  proc onWindowFocusLost*()
  proc applyLocalVisibilityOverride*(): jboolean
  proc requestShow*(fromController: jboolean, statsToken: ImeTracker.Token): jint
  proc onPerceptible*(perceptible: jboolean)
  proc removeSurface*()
  proc updateSource*(newSource: InsetsSource, animationType: jint)


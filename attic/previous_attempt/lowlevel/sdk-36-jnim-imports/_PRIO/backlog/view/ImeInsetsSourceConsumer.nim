import jnim

jclass android.view.ImeInsetsSourceConsumer* of InsetsSourceConsumer:
  proc onAnimationStateChanged*(running: jboolean): jboolean
  proc onWindowFocusGained*(hasViewFocus: jboolean)
  proc onWindowFocusLost*()
  proc applyLocalVisibilityOverride*(): jboolean
  proc requestShow*(fromIme: jboolean, statsToken: ImeTracker.Token): jint
  proc removeSurface*()
  proc setControl*(control: InsetsSourceControl, showTypes: seq[jint], hideTypes: seq[jint], cancelTypes: seq[jint], transientTypes: seq[jint]): jboolean
  proc onPerceptible*(perceptible: jboolean)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc onShowRequested*()


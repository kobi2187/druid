import jnim

jclass android.transition.VisibilityPropagation* of TransitionPropagation:
  proc captureValues*(values: TransitionValues)
  proc getPropagationProperties*(): seq[string]
  proc getViewVisibility*(values: TransitionValues): jint
  proc getViewX*(values: TransitionValues): jint
  proc getViewY*(values: TransitionValues): jint


import jnim

jclass android.app.MediaRouteButton* of View:
  proc getRouteTypes*(): jint
  proc setRouteTypes*(types: jint)
  proc setExtendedSettingsClickListener*(listener: OnClickListener)
  proc showDialog*()
  proc setContentDescription*(contentDescription: CharSequence)
  proc performClick*(): jboolean
  proc jumpDrawablesToCurrentState*()
  proc setVisibility*(visibility: jint)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()


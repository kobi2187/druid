import jnim

jclass android.app.MediaRouteActionProvider* of ActionProvider:
  proc setRouteTypes*(types: jint)
  proc setExtendedSettingsClickListener*(listener: View.OnClickListener)
  proc onCreateActionView*(): View
  proc onCreateActionView*(item: MenuItem): View
  proc onPerformDefaultAction*(): jboolean
  proc overridesItemVisibility*(): jboolean
  proc isVisible*(): jboolean


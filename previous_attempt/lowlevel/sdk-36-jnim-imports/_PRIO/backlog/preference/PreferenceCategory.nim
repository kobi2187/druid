import jnim

jclass android.preference.PreferenceCategory* of PreferenceGroup:
  proc isEnabled*(): jboolean
  proc shouldDisableDependents*(): jboolean


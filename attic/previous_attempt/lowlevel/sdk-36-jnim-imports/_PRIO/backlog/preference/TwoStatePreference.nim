import jnim

jclass android.preference.TwoStatePreference* of Preference:
  proc setChecked*(checked: jboolean)
  proc isChecked*(): jboolean
  proc shouldDisableDependents*(): jboolean
  proc setSummaryOn*(summary: CharSequence)
  proc setSummaryOn*(summaryResId: jint)
  proc getSummaryOn*(): CharSequence
  proc setSummaryOff*(summary: CharSequence)
  proc setSummaryOff*(summaryResId: jint)
  proc getSummaryOff*(): CharSequence
  proc getDisableDependentsState*(): jboolean
  proc setDisableDependentsState*(disableDependentsState: jboolean)


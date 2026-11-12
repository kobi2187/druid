import jnim

jclass android.preference.PreferenceGroup* of Preference:
  proc setOrderingAsAdded*(orderingAsAdded: jboolean)
  proc isOrderingAsAdded*(): jboolean
  proc addItemFromInflater*(preference: Preference)
  proc getPreferenceCount*(): jint
  proc getPreference*(index: jint): Preference
  proc addPreference*(preference: Preference): jboolean
  proc removePreference*(preference: Preference): jboolean
  proc removeAll*()
  proc findPreference*(key: CharSequence): Preference
  proc notifyDependencyChange*(disableDependents: jboolean)


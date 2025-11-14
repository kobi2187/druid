import jnim

jclass android.preference.RingtonePreference* of Preference:
  proc getRingtoneType*(): jint
  proc setRingtoneType*(type: jint)
  proc getShowDefault*(): jboolean
  proc setShowDefault*(showDefault: jboolean)
  proc getShowSilent*(): jboolean
  proc setShowSilent*(showSilent: jboolean)
  proc onActivityResult*(requestCode: jint, resultCode: jint, data: Intent): jboolean


import jnim

jclass android.preference.EditTextPreference* of DialogPreference:
  proc setText*(text: string)
  proc getText*(): string
  proc shouldDisableDependents*(): jboolean
  proc getEditText*(): EditText


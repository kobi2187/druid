import jnim

jclass android.preference.MultiCheckPreference* of DialogPreference:
  proc setEntries*(entries: seq[CharSequence])
  proc setEntries*(entriesResId: jint)
  proc getEntries*(): seq[CharSequence]
  proc setEntryValues*(entryValues: seq[string])
  proc setEntryValues*(entryValuesResId: jint)
  proc getEntryValues*(): seq[string]
  proc getValue*(index: jint): jboolean
  proc setValue*(index: jint, state: jboolean)
  proc setValues*(values: seq[jboolean])
  proc getSummary*(): CharSequence
  proc setSummary*(summary: CharSequence)
  proc getValues*(): seq[jboolean]
  proc findIndexOfValue*(value: string): jint


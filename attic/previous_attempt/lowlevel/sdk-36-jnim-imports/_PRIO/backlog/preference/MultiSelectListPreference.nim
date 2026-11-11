import jnim

jclass android.preference.MultiSelectListPreference* of DialogPreference:
  proc setEntries*(entries: seq[CharSequence])
  proc setEntries*(entriesResId: jint)
  proc getEntries*(): seq[CharSequence]
  proc setEntryValues*(entryValues: seq[CharSequence])
  proc setEntryValues*(entryValuesResId: jint)
  proc getEntryValues*(): seq[CharSequence]
  proc setValues*(values: Set[string])
  proc getValues*(): Set[string]
  proc findIndexOfValue*(value: string): jint


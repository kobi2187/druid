import jnim

jclass android.preference.ListPreference* of DialogPreference:
  proc setEntries*(entries: seq[CharSequence])
  proc setEntries*(entriesResId: jint)
  proc getEntries*(): seq[CharSequence]
  proc setEntryValues*(entryValues: seq[CharSequence])
  proc setEntryValues*(entryValuesResId: jint)
  proc getEntryValues*(): seq[CharSequence]
  proc setValue*(value: string)
  proc getSummary*(): CharSequence
  proc setSummary*(summary: CharSequence)
  proc setValueIndex*(index: jint)
  proc getValue*(): string
  proc getEntry*(): CharSequence
  proc findIndexOfValue*(value: string): jint


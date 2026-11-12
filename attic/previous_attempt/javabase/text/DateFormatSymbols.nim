import jnim

jclass java.text.DateFormatSymbols* of JVMObject:
  proc getAvailableLocales*(): seq[Locale] {.`static`.}
  proc getInstance*(): DateFormatSymbols {.`static`.}
  proc getInstance*(locale: Locale): DateFormatSymbols {.`static`.}
  proc getEras*(): seq[string]
  proc setEras*(newEras: seq[string])
  proc getMonths*(): seq[string]
  proc setMonths*(newMonths: seq[string])
  proc getShortMonths*(): seq[string]
  proc setShortMonths*(newShortMonths: seq[string])
  proc getWeekdays*(): seq[string]
  proc setWeekdays*(newWeekdays: seq[string])
  proc getShortWeekdays*(): seq[string]
  proc setShortWeekdays*(newShortWeekdays: seq[string])
  proc getAmPmStrings*(): seq[string]
  proc setAmPmStrings*(newAmpms: seq[string])
  proc getZoneStrings*(): seq[seq[string]]
  proc setZoneStrings*(newZoneStrings: seq[seq[string]])
  proc getLocalPatternChars*(): string
  proc setLocalPatternChars*(newLocalPatternChars: string)
  proc clone*(): JObject
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean


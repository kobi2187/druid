import jnim

jclass android.os.LocaleList* of JVMObject:
  proc get*(index: jint): Locale
  proc isEmpty*(): jboolean
  proc size*(): jint
  proc indexOf*(locale: Locale): jint
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, parcelableFlags: jint)
  proc toLanguageTags*(): string
  proc getIntersection*(other: LocaleList): seq[Locale]
  proc getEmptyLocaleList*(): LocaleList {.`static`.}
  proc forLanguageTags*(list: string): LocaleList {.`static`.}
  proc isPseudoLocale*(locale: Locale): jboolean {.`static`.}
  proc isPseudoLocale*(locale: ULocale): jboolean {.`static`.}
  proc matchesLanguageAndScript*(supported: Locale, desired: Locale): jboolean {.`static`.}
  proc getFirstMatch*(supportedLocales: seq[string]): Locale
  proc getFirstMatchIndex*(supportedLocales: seq[string]): jint
  proc getFirstMatchWithEnglishSupported*(supportedLocales: seq[string]): Locale
  proc getFirstMatchIndexWithEnglishSupported*(supportedLocales: Collection[string]): jint
  proc getFirstMatchIndexWithEnglishSupported*(supportedLocales: seq[string]): jint
  proc isPseudoLocalesOnly*(supportedLocales: seq[string]): jboolean {.`static`.}
  proc getDefault*(): LocaleList {.`static`.}
  proc getAdjustedDefault*(): LocaleList {.`static`.}
  proc setDefault*(locales: LocaleList) {.`static`.}
  proc setDefault*(locales: LocaleList, localeIndex: jint) {.`static`.}
  CREATOR*: Parcelable.Creator[LocaleList] {.`static`.}


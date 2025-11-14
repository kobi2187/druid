import jnim

jclass android.app.LocaleConfig* of JVMObject:
  proc fromContextIgnoringOverride*(context: Context): LocaleConfig {.`static`.}
  proc getSupportedLocales*(): LocaleList
  proc getDefaultLocale*(): Locale
  proc getStatus*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc isSameLocaleConfig*(other: LocaleConfig): jboolean
  proc containsLocale*(locale: Locale): jboolean
  TAG_LOCALE_CONFIG*: string {.`static`.}
  TAG_LOCALE*: string {.`static`.}
  STATUS_SUCCESS*: jint {.`static`.}
  STATUS_NOT_SPECIFIED*: jint {.`static`.}
  STATUS_PARSING_FAILED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[LocaleConfig] {.`static`.}


import jnim

jclass android.text.FontConfig* of JVMObject:
  proc getFontFamilies*(): List[FontFamily]
  proc getAliases*(): List[Alias]
  proc getNamedFamilyLists*(): List[NamedFamilyList]
  proc getLocaleFallbackCustomizations*(): List[Customization.LocaleFallback]
  proc getLastModifiedTimeMillis*(): jlong
  proc getConfigVersion*(): jint
  proc getFamilies*(): seq[FontFamily]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc resolveScript*(locale: Locale): string {.`static`.}
  CREATOR*: Creator[FontConfig] {.`static`.}

jclass android.text.FontConfig.Font* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getFile*(): File
  proc getOriginalFile*(): File
  proc getStyle*(): FontStyle
  proc getFontVariationSettings*(): string
  proc getFontFamilyName*(): string
  proc getTtcIndex*(): jint
  proc getPostScriptName*(): string
  proc getVarTypeAxes*(): jint
  proc getAxes*(): seq[FontVariationAxis]
  proc getWeight*(): jint
  proc isItalic*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.text.FontConfig.Alias* of JVMObject:
  proc getName*(): string
  proc getOriginal*(): string
  proc getWeight*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.text.FontConfig.FontFamily* of JVMObject:
  proc getFontList*(): List[Font]
  proc getName*(): string
  proc getLocaleList*(): LocaleList
  proc getVariant*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getFonts*(): seq[Font]
  proc getLanguages*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.text.FontConfig.NamedFamilyList* of JVMObject:
  proc getFamilies*(): List[FontFamily]
  proc getName*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.text.Font* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getFile*(): File
  proc getOriginalFile*(): File
  proc getStyle*(): FontStyle
  proc getFontVariationSettings*(): string
  proc getFontFamilyName*(): string
  proc getTtcIndex*(): jint
  proc getPostScriptName*(): string
  proc getVarTypeAxes*(): jint
  proc getAxes*(): seq[FontVariationAxis]
  proc getWeight*(): jint
  proc isItalic*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  VAR_TYPE_AXES_NONE*: jint {.`static`.}
  VAR_TYPE_AXES_WGHT*: jint {.`static`.}
  VAR_TYPE_AXES_ITAL*: jint {.`static`.}
  CREATOR*: Creator[Font] {.`static`.}

jclass android.text.Alias* of JVMObject:
  proc getName*(): string
  proc getOriginal*(): string
  proc getWeight*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[Alias] {.`static`.}

jclass android.text.FontFamily* of JVMObject:
  proc getFontList*(): List[Font]
  proc getName*(): string
  proc getLocaleList*(): LocaleList
  proc getVariant*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getFonts*(): seq[Font]
  proc getLanguages*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  VARIANT_DEFAULT*: jint {.`static`.}
  VARIANT_COMPACT*: jint {.`static`.}
  VARIANT_ELEGANT*: jint {.`static`.}
  CREATOR*: Creator[FontFamily] {.`static`.}

jclass android.text.NamedFamilyList* of JVMObject:
  proc getFamilies*(): List[FontFamily]
  proc getName*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[NamedFamilyList] {.`static`.}

jclass android.text.Customization.LocaleFallback* of JVMObject:
  proc getLocale*(): Locale
  proc getOperation*(): jint
  proc getFamily*(): FontFamily
  proc getScript*(): string
  proc toString*(): string

jclass android.text.LocaleFallback* of JVMObject:
  proc getLocale*(): Locale
  proc getOperation*(): jint
  proc getFamily*(): FontFamily
  proc getScript*(): string
  proc toString*(): string
  OPERATION_PREPEND*: jint {.`static`.}
  OPERATION_APPEND*: jint {.`static`.}
  OPERATION_REPLACE*: jint {.`static`.}


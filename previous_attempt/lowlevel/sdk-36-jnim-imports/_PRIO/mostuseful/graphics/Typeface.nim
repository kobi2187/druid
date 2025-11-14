import jnim

jclass android.graphics.Typeface* of JVMObject:
  proc clearTypefaceCachesForTestingPurpose*() {.`static`.}
  proc getSystemFontMapSharedMemory*(): SharedMemory {.`static`.}
  proc getWeight*(): jint
  proc isVariationInstance*(): jboolean
  proc getStyle*(): jint
  proc isBold*(): jboolean
  proc isItalic*(): jboolean
  proc getDerivedFrom*(): Typeface
  proc getSystemFontFamilyName*(): string
  proc createFromResources*(entry: FamilyResourceEntry, mgr: AssetManager, path: string): Typeface {.`static`.}
  proc findFromCache*(mgr: AssetManager, path: string): Typeface {.`static`.}
  proc create*(familyName: string, style: jint): Typeface {.`static`.}
  proc create*(family: Typeface, style: jint): Typeface {.`static`.}
  proc create*(family: Typeface, weight: jint, italic: jboolean): Typeface {.`static`.}
  proc createFromTypefaceWithVariation*(family: Typeface, axes: List[FontVariationAxis]): Typeface {.`static`.}
  proc defaultFromStyle*(style: jint): Typeface {.`static`.}
  proc createFromAsset*(mgr: AssetManager, path: string): Typeface {.`static`.}
  proc createFromFile*(file: File): Typeface {.`static`.}
  proc createFromFile*(path: string): Typeface {.`static`.}
  proc releaseNativeObjectForTest*()
  proc initSystemDefaultTypefaces*(fallbacks: Map[string, seq[FontFamily]], aliases: List[FontConfig.Alias], outSystemFontMap: Map[string, Typeface]) {.`static`.}
  proc serializeFontMap*(fontMap: Map[string, Typeface]): SharedMemory {.`static`.}
  proc deserializeFontMap*(buffer: ByteBuffer, output:Map[string, Typeface]): seq[jlong] {.`static`.}
  proc getSystemFontMap*(): Map[string, Typeface] {.`static`.}
  proc setSystemFontMap*(sharedMemory: SharedMemory) {.`static`.}
  proc setSystemFontMap*(systemFontMap: Map[string, Typeface]) {.`static`.}
  proc changeDefaultFontForTest*(defaults: List[Typeface], genericFamilies: List[Typeface]): Pair[List[Typeface], List[Typeface]] {.`static`.}
  proc init*() {.`static`.}
  proc destroySystemFontMap*() {.`static`.}
  proc loadPreinstalledSystemFontMap*() {.`static`.}
  proc loadNativeSystemFonts*() {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc isSupportedAxes*(axis: jint): jboolean
  ENABLE_LAZY_TYPEFACE_INITIALIZATION*: jboolean {.`static`.}
  DEFAULT*: Typeface {.`static`.}
  DEFAULT_BOLD*: Typeface {.`static`.}
  SANS_SERIF*: Typeface {.`static`.}
  SERIF*: Typeface {.`static`.}
  MONOSPACE*: Typeface {.`static`.}
  native_instance*: jlong
  NORMAL*: jint {.`static`.}
  BOLD*: jint {.`static`.}
  ITALIC*: jint {.`static`.}
  BOLD_ITALIC*: jint {.`static`.}
  STYLE_MASK*: jint {.`static`.}
  RESOLVE_BY_FONT_TABLE*: jint {.`static`.}
  DEFAULT_FAMILY*: string {.`static`.}

jclass android.graphics.Typeface.Builder* of JVMObject:
  proc setWeight*(weight: jint): Builder
  proc setItalic*(italic: jboolean): Builder
  proc setTtcIndex*(ttcIndex: jint): Builder
  proc setFontVariationSettings*(variationSettings: string): Builder
  proc setFontVariationSettings*(axes: seq[FontVariationAxis]): Builder
  proc setFallback*(familyName: string): Builder
  proc build*(): Typeface

jclass android.graphics.Typeface.CustomFallbackBuilder* of JVMObject:
  proc getMaxCustomFallbackCount*(): jint {.`static`.}
  proc setSystemFallback*(familyName: string): CustomFallbackBuilder
  proc setStyle*(style: FontStyle): CustomFallbackBuilder
  proc addCustomFallback*(family: FontFamily): CustomFallbackBuilder
  proc build*(): Typeface

jclass android.graphics.Builder* of JVMObject:
  proc setWeight*(weight: jint): Builder
  proc setItalic*(italic: jboolean): Builder
  proc setTtcIndex*(ttcIndex: jint): Builder
  proc setFontVariationSettings*(variationSettings: string): Builder
  proc setFontVariationSettings*(axes: seq[FontVariationAxis]): Builder
  proc setFallback*(familyName: string): Builder
  proc build*(): Typeface
  NORMAL_WEIGHT*: jint {.`static`.}
  BOLD_WEIGHT*: jint {.`static`.}

jclass android.graphics.CustomFallbackBuilder* of JVMObject:
  proc getMaxCustomFallbackCount*(): jint {.`static`.}
  proc setSystemFallback*(familyName: string): CustomFallbackBuilder
  proc setStyle*(style: FontStyle): CustomFallbackBuilder
  proc addCustomFallback*(family: FontFamily): CustomFallbackBuilder
  proc build*(): Typeface


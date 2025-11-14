import jnim

jclass android.graphics.FontListParser* of JVMObject:
  proc parse*(in: InputStream): FontConfig {.`static`.}
  proc parse*(fontsXmlPath: string, systemFontDir: string, oemCustomizationXmlPath: string, productFontDir: string, updatableFontMap: Map[string, File], lastModifiedDate: jlong, configVersion: jint): FontConfig {.`static`.}
  proc readFamilies*(parser: XmlPullParser, fontDir: string, customization: FontCustomizationParser.Result, updatableFontMap: Map[string, File], lastModifiedDate: jlong, configVersion: jint, allowNonExistingFile: jboolean): FontConfig {.`static`.}
  proc readFamily*(parser: XmlPullParser, fontDir: string, updatableFontMap: Map[string, File], allowNonExistingFile: jboolean): FontConfig.FontFamily {.`static`.}
  proc readNamedFamily*(parser: XmlPullParser, fontDir: string, updatableFontMap: Map[string, File], allowNonExistingFile: jboolean): FontConfig.NamedFamilyList {.`static`.}
  proc readNamedFamilyList*(parser: XmlPullParser, fontDir: string, updatableFontMap: Map[string, File], allowNonExistingFile: jboolean): FontConfig.NamedFamilyList {.`static`.}
  proc readAlias*(parser: XmlPullParser): FontConfig.Alias {.`static`.}
  proc skip*(parser: XmlPullParser) {.`static`.}
  ATTR_SUPPORTED_AXES*: string {.`static`.}
  ATTR_INDEX*: string {.`static`.}
  ATTR_WEIGHT*: string {.`static`.}
  ATTR_POSTSCRIPT_NAME*: string {.`static`.}
  ATTR_STYLE*: string {.`static`.}
  ATTR_FALLBACK_FOR*: string {.`static`.}
  STYLE_ITALIC*: string {.`static`.}
  STYLE_NORMAL*: string {.`static`.}
  TAG_AXIS*: string {.`static`.}
  ATTR_TAG*: string {.`static`.}
  ATTR_STYLEVALUE*: string {.`static`.}


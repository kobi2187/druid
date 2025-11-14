import jnim

jclass java.util.HexFormat* of JVMObject:
  proc of*(): HexFormat {.`static`.}
  proc ofDelimiter*(delimiter: string): HexFormat {.`static`.}
  proc withDelimiter*(delimiter: string): HexFormat
  proc withPrefix*(prefix: string): HexFormat
  proc withSuffix*(suffix: string): HexFormat
  proc withUpperCase*(): HexFormat
  proc withLowerCase*(): HexFormat
  proc delimiter*(): string
  proc prefix*(): string
  proc suffix*(): string
  proc isUpperCase*(): jboolean
  proc formatHex*(bytes: seq[jbyte]): string
  proc formatHex*(bytes: seq[jbyte], fromIndex: jint, toIndex: jint): string
  proc formatHex*(output:A, bytes: seq[jbyte]): A
  proc formatHex*(output:A, bytes: seq[jbyte], fromIndex: jint, toIndex: jint): A
  proc parseHex*(string: CharSequence): seq[jbyte]
  proc parseHex*(string: CharSequence, fromIndex: jint, toIndex: jint): seq[jbyte]
  proc parseHex*(chars: seq[jchar], fromIndex: jint, toIndex: jint): seq[jbyte]
  proc toLowHexDigit*(value: jint): jchar
  proc toHighHexDigit*(value: jint): jchar
  proc toHexDigits*(output:A, value: jbyte): A
  proc toHexDigits*(value: jbyte): string
  proc toHexDigits*(value: jchar): string
  proc toHexDigits*(value: jshort): string
  proc toHexDigits*(value: jint): string
  proc toHexDigits*(value: jlong): string
  proc toHexDigits*(value: jlong, digits: jint): string
  proc isHexDigit*(ch: jint): jboolean {.`static`.}
  proc fromHexDigit*(ch: jint): jint {.`static`.}
  proc fromHexDigits*(string: CharSequence): jint {.`static`.}
  proc fromHexDigits*(string: CharSequence, fromIndex: jint, toIndex: jint): jint {.`static`.}
  proc fromHexDigitsToLong*(string: CharSequence): jlong {.`static`.}
  proc fromHexDigitsToLong*(string: CharSequence, fromIndex: jint, toIndex: jint): jlong {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string


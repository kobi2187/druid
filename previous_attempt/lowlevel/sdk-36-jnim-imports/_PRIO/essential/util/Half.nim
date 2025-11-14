import jnim

jclass android.util.Half* of Number:
  proc halfValue*(): jshort
  proc byteValue*(): jbyte
  proc shortValue*(): jshort
  proc intValue*(): jint
  proc longValue*(): jlong
  proc floatValue*(): jfloat
  proc doubleValue*(): jdouble
  proc isNaN*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc compareTo*(h: Half): jint
  proc hashCode*(h: jshort): jint {.`static`.}
  proc compare*(x: jshort, y: jshort): jint {.`static`.}
  proc halfToShortBits*(h: jshort): jshort {.`static`.}
  proc halfToIntBits*(h: jshort): jint {.`static`.}
  proc halfToRawIntBits*(h: jshort): jint {.`static`.}
  proc intBitsToHalf*(bits: jint): jshort {.`static`.}
  proc copySign*(magnitude: jshort, sign: jshort): jshort {.`static`.}
  proc abs*(h: jshort): jshort {.`static`.}
  proc round*(h: jshort): jshort {.`static`.}
  proc ceil*(h: jshort): jshort {.`static`.}
  proc floor*(h: jshort): jshort {.`static`.}
  proc trunc*(h: jshort): jshort {.`static`.}
  proc min*(x: jshort, y: jshort): jshort {.`static`.}
  proc max*(x: jshort, y: jshort): jshort {.`static`.}
  proc less*(x: jshort, y: jshort): jboolean {.`static`.}
  proc lessEquals*(x: jshort, y: jshort): jboolean {.`static`.}
  proc greater*(x: jshort, y: jshort): jboolean {.`static`.}
  proc greaterEquals*(x: jshort, y: jshort): jboolean {.`static`.}
  proc equals*(x: jshort, y: jshort): jboolean {.`static`.}
  proc getSign*(h: jshort): jint {.`static`.}
  proc getExponent*(h: jshort): jint {.`static`.}
  proc getSignificand*(h: jshort): jint {.`static`.}
  proc isInfinite*(h: jshort): jboolean {.`static`.}
  proc isNaN*(h: jshort): jboolean {.`static`.}
  proc isNormalized*(h: jshort): jboolean {.`static`.}
  proc toFloat*(h: jshort): jfloat {.`static`.}
  proc toHalf*(f: jfloat): jshort {.`static`.}
  proc valueOf*(h: jshort): Half {.`static`.}
  proc valueOf*(f: jfloat): Half {.`static`.}
  proc valueOf*(s: string): Half {.`static`.}
  proc parseHalf*(s: string): jshort {.`static`.}
  proc toString*(h: jshort): string {.`static`.}
  proc toHexString*(h: jshort): string {.`static`.}
  SIZE*: jint {.`static`.}
  EPSILON*: jshort {.`static`.}
  MAX_EXPONENT*: jint {.`static`.}
  MIN_EXPONENT*: jint {.`static`.}
  LOWEST_VALUE*: jshort {.`static`.}
  MAX_VALUE*: jshort {.`static`.}
  MIN_NORMAL*: jshort {.`static`.}
  MIN_VALUE*: jshort {.`static`.}
  NaN*: jshort {.`static`.}
  NEGATIVE_INFINITY*: jshort {.`static`.}
  NEGATIVE_ZERO*: jshort {.`static`.}
  POSITIVE_INFINITY*: jshort {.`static`.}
  POSITIVE_ZERO*: jshort {.`static`.}


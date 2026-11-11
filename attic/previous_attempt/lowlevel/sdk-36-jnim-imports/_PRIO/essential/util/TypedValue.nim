import jnim

jclass android.util.TypedValue* of JVMObject:
  proc getFloat*(): jfloat
  proc isColorType*(): jboolean
  proc complexToFloat*(complex: jint): jfloat {.`static`.}
  proc complexToDimension*(data: jint, metrics: DisplayMetrics): jfloat {.`static`.}
  proc complexToDimensionPixelOffset*(data: jint, metrics: DisplayMetrics): jint {.`static`.}
  proc complexToDimensionPixelSize*(data: jint, metrics: DisplayMetrics): jint {.`static`.}
  proc complexToDimensionNoisy*(data: jint, metrics: DisplayMetrics): jfloat {.`static`.}
  proc getComplexUnit*(): jint
  proc getUnitFromComplexDimension*(complexDimension: jint): jint {.`static`.}
  proc applyDimension*(unit: jint, value: jfloat, metrics: DisplayMetrics): jfloat {.`static`.}
  proc deriveDimension*(unitToConvertTo: jint, pixelValue: jfloat, metrics: DisplayMetrics): jfloat {.`static`.}
  proc convertPixelsToDimension*(unitToConvertTo: jint, pixelValue: jfloat, metrics: DisplayMetrics): jfloat {.`static`.}
  proc convertDimensionToPixels*(unitToConvertFrom: jint, value: jfloat, metrics: DisplayMetrics): jfloat {.`static`.}
  proc getDimension*(metrics: DisplayMetrics): jfloat
  proc intToComplex*(value: jint): jint {.`static`.}
  proc floatToComplex*(value: jfloat): jint {.`static`.}
  proc createComplexDimension*(value: jint, units: jint): jint {.`static`.}
  proc createComplexDimension*(value: jfloat, units: jint): jint {.`static`.}
  proc complexToFraction*(data: jint, base: jfloat, pbase: jfloat): jfloat {.`static`.}
  proc getFraction*(base: jfloat, pbase: jfloat): jfloat
  proc coerceToString*(): CharSequence
  proc coerceToString*(type: jint, data: jint): string {.`static`.}
  proc setTo*(other: TypedValue)
  proc toString*(): string
  TYPE_NULL*: jint {.`static`.}
  TYPE_REFERENCE*: jint {.`static`.}
  TYPE_ATTRIBUTE*: jint {.`static`.}
  TYPE_STRING*: jint {.`static`.}
  TYPE_FLOAT*: jint {.`static`.}
  TYPE_DIMENSION*: jint {.`static`.}
  TYPE_FRACTION*: jint {.`static`.}
  TYPE_FIRST_INT*: jint {.`static`.}
  TYPE_INT_DEC*: jint {.`static`.}
  TYPE_INT_HEX*: jint {.`static`.}
  TYPE_INT_BOOLEAN*: jint {.`static`.}
  TYPE_FIRST_COLOR_INT*: jint {.`static`.}
  TYPE_INT_COLOR_ARGB8*: jint {.`static`.}
  TYPE_INT_COLOR_RGB8*: jint {.`static`.}
  TYPE_INT_COLOR_ARGB4*: jint {.`static`.}
  TYPE_INT_COLOR_RGB4*: jint {.`static`.}
  TYPE_LAST_COLOR_INT*: jint {.`static`.}
  TYPE_LAST_INT*: jint {.`static`.}
  COMPLEX_UNIT_SHIFT*: jint {.`static`.}
  COMPLEX_UNIT_MASK*: jint {.`static`.}
  COMPLEX_UNIT_PX*: jint {.`static`.}
  COMPLEX_UNIT_DIP*: jint {.`static`.}
  COMPLEX_UNIT_SP*: jint {.`static`.}
  COMPLEX_UNIT_PT*: jint {.`static`.}
  COMPLEX_UNIT_IN*: jint {.`static`.}
  COMPLEX_UNIT_MM*: jint {.`static`.}
  COMPLEX_UNIT_FRACTION*: jint {.`static`.}
  COMPLEX_UNIT_FRACTION_PARENT*: jint {.`static`.}
  COMPLEX_RADIX_SHIFT*: jint {.`static`.}
  COMPLEX_RADIX_MASK*: jint {.`static`.}
  COMPLEX_RADIX_23p0*: jint {.`static`.}
  COMPLEX_RADIX_16p7*: jint {.`static`.}
  COMPLEX_RADIX_8p15*: jint {.`static`.}
  COMPLEX_RADIX_0p23*: jint {.`static`.}
  COMPLEX_MANTISSA_SHIFT*: jint {.`static`.}
  COMPLEX_MANTISSA_MASK*: jint {.`static`.}
  DATA_NULL_UNDEFINED*: jint {.`static`.}
  DATA_NULL_EMPTY*: jint {.`static`.}
  DENSITY_DEFAULT*: jint {.`static`.}
  DENSITY_NONE*: jint {.`static`.}
  typ*: jint
  string*: CharSequence
  data*: jint
  assetCookie*: jint
  resourceId*: jint
  changingConfigurations*: jint
  density*: jint
  sourceResourceId*: jint
  usesFeatureFlags*: jboolean


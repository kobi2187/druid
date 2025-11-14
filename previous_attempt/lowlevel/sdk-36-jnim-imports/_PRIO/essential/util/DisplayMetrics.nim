import jnim

jclass android.util.DisplayMetrics* of JVMObject:
  proc setTo*(o: DisplayMetrics)
  proc setToDefaults*()
  proc equals*(o: JObject): jboolean
  proc equals*(other: DisplayMetrics): jboolean
  proc equalsPhysical*(other: DisplayMetrics): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  DENSITY_LOW*: jint {.`static`.}
  DENSITY_140*: jint {.`static`.}
  DENSITY_MEDIUM*: jint {.`static`.}
  DENSITY_180*: jint {.`static`.}
  DENSITY_200*: jint {.`static`.}
  DENSITY_TV*: jint {.`static`.}
  DENSITY_220*: jint {.`static`.}
  DENSITY_HIGH*: jint {.`static`.}
  DENSITY_260*: jint {.`static`.}
  DENSITY_280*: jint {.`static`.}
  DENSITY_300*: jint {.`static`.}
  DENSITY_XHIGH*: jint {.`static`.}
  DENSITY_340*: jint {.`static`.}
  DENSITY_360*: jint {.`static`.}
  DENSITY_390*: jint {.`static`.}
  DENSITY_400*: jint {.`static`.}
  DENSITY_420*: jint {.`static`.}
  DENSITY_440*: jint {.`static`.}
  DENSITY_450*: jint {.`static`.}
  DENSITY_XXHIGH*: jint {.`static`.}
  DENSITY_520*: jint {.`static`.}
  DENSITY_560*: jint {.`static`.}
  DENSITY_600*: jint {.`static`.}
  DENSITY_XXXHIGH*: jint {.`static`.}
  DENSITY_DEFAULT*: jint {.`static`.}
  DENSITY_DEFAULT_SCALE*: jfloat {.`static`.}
  DENSITY_DEVICE*: jint {.`static`.}
  DENSITY_DEVICE_STABLE*: jint {.`static`.}
  widthPixels*: jint
  heightPixels*: jint
  density*: jfloat
  densityDpi*: jint
  scaledDensity*: jfloat
  fontScaleConverter*: FontScaleConverter
  xdpi*: jfloat
  ydpi*: jfloat
  noncompatWidthPixels*: jint
  noncompatHeightPixels*: jint
  noncompatDensity*: jfloat
  noncompatDensityDpi*: jint
  noncompatScaledDensity*: jfloat
  noncompatXdpi*: jfloat
  noncompatYdpi*: jfloat


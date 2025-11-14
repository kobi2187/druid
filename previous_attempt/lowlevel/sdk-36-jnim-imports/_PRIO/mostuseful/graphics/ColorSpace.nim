import jnim

jclass android.graphics.ColorSpace* of JVMObject:
  proc getName*(): string
  proc getId*(): jint
  proc getModel*(): Model
  proc getComponentCount*(): jint
  proc isWideGamut*(): jboolean
  proc isSrgb*(): jboolean
  proc getMinValue*(component: jint): jfloat
  proc getMaxValue*(component: jint): jfloat
  proc toXyz*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc toXyz*(v: seq[jfloat]): seq[jfloat]
  proc fromXyz*(x: jfloat, y: jfloat, z: jfloat): seq[jfloat]
  proc fromXyz*(v: seq[jfloat]): seq[jfloat]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc connect*(source: ColorSpace, destination: ColorSpace): Connector {.`static`.}
  proc connect*(source: ColorSpace, destination: ColorSpace, intent: RenderIntent): Connector {.`static`.}
  proc connect*(source: ColorSpace): Connector {.`static`.}
  proc connect*(source: ColorSpace, intent: RenderIntent): Connector {.`static`.}
  proc adapt*(colorSpace: ColorSpace, whitePoint: seq[jfloat]): ColorSpace {.`static`.}
  proc adapt*(colorSpace: ColorSpace, whitePoint: seq[jfloat], adaptation: Adaptation): ColorSpace {.`static`.}
  proc getFromDataSpace*(dataSpace: jint): ColorSpace {.`static`.}
  proc getDataSpace*(): jint
  proc get*(name: Named): ColorSpace {.`static`.}
  proc match*(toXYZD50: seq[jfloat], function: Rgb.TransferParameters): ColorSpace {.`static`.}
  proc cctToXyz*(cct: jint): seq[jfloat] {.`static`.}
  proc chromaticAdaptation*(adaptation: Adaptation, srcWhitePoint: seq[jfloat], dstWhitePoint: seq[jfloat]): seq[jfloat] {.`static`.}
  ILLUMINANT_A*: jfloat {.`static`.}
  ILLUMINANT_B*: jfloat {.`static`.}
  ILLUMINANT_C*: jfloat {.`static`.}
  ILLUMINANT_D50*: jfloat {.`static`.}
  ILLUMINANT_D55*: jfloat {.`static`.}
  ILLUMINANT_D60*: jfloat {.`static`.}
  ILLUMINANT_D65*: jfloat {.`static`.}
  ILLUMINANT_D75*: jfloat {.`static`.}
  ILLUMINANT_E*: jfloat {.`static`.}
  MIN_ID*: jint {.`static`.}
  MAX_ID*: jint {.`static`.}

jclass android.graphics.ColorSpace.Rgb* of JVMObject:
  proc getWhitePoint*(whitePoint: seq[jfloat]): seq[jfloat]
  proc getWhitePoint*(): seq[jfloat]
  proc getPrimaries*(primaries: seq[jfloat]): seq[jfloat]
  proc getPrimaries*(): seq[jfloat]
  proc getTransform*(transform: seq[jfloat]): seq[jfloat]
  proc getTransform*(): seq[jfloat]
  proc getInverseTransform*(inverseTransform: seq[jfloat]): seq[jfloat]
  proc getInverseTransform*(): seq[jfloat]
  proc getOetf*(): DoubleUnaryOperator
  proc getEotf*(): DoubleUnaryOperator
  proc getTransferParameters*(): TransferParameters
  proc isSrgb*(): jboolean
  proc isWideGamut*(): jboolean
  proc getMinValue*(component: jint): jfloat
  proc getMaxValue*(component: jint): jfloat
  proc toLinear*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc toLinear*(v: seq[jfloat]): seq[jfloat]
  proc fromLinear*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc fromLinear*(v: seq[jfloat]): seq[jfloat]
  proc toXyz*(v: seq[jfloat]): seq[jfloat]
  proc fromXyz*(v: seq[jfloat]): seq[jfloat]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.graphics.ColorSpace.Connector* of JVMObject:
  proc getSource*(): ColorSpace
  proc getDestination*(): ColorSpace
  proc getRenderIntent*(): RenderIntent
  proc transform*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc transform*(v: seq[jfloat]): seq[jfloat]

jclass android.graphics.Rgb* of ColorSpace:
  proc getWhitePoint*(whitePoint: seq[jfloat]): seq[jfloat]
  proc getWhitePoint*(): seq[jfloat]
  proc getPrimaries*(primaries: seq[jfloat]): seq[jfloat]
  proc getPrimaries*(): seq[jfloat]
  proc getTransform*(transform: seq[jfloat]): seq[jfloat]
  proc getTransform*(): seq[jfloat]
  proc getInverseTransform*(inverseTransform: seq[jfloat]): seq[jfloat]
  proc getInverseTransform*(): seq[jfloat]
  proc getOetf*(): DoubleUnaryOperator
  proc getEotf*(): DoubleUnaryOperator
  proc getTransferParameters*(): TransferParameters
  proc isSrgb*(): jboolean
  proc isWideGamut*(): jboolean
  proc getMinValue*(component: jint): jfloat
  proc getMaxValue*(component: jint): jfloat
  proc toLinear*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc toLinear*(v: seq[jfloat]): seq[jfloat]
  proc fromLinear*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc fromLinear*(v: seq[jfloat]): seq[jfloat]
  proc toXyz*(v: seq[jfloat]): seq[jfloat]
  proc fromXyz*(v: seq[jfloat]): seq[jfloat]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.graphics.Rgb.TransferParameters* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.graphics.TransferParameters* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  a*: jdouble
  b*: jdouble
  c*: jdouble
  d*: jdouble
  e*: jdouble
  f*: jdouble
  g*: jdouble

jclass android.graphics.Connector* of JVMObject:
  proc getSource*(): ColorSpace
  proc getDestination*(): ColorSpace
  proc getRenderIntent*(): RenderIntent
  proc transform*(r: jfloat, g: jfloat, b: jfloat): seq[jfloat]
  proc transform*(v: seq[jfloat]): seq[jfloat]


import jnim

jclass android.graphics.Color* of JVMObject:
  proc getColorSpace*(): ColorSpace
  proc getModel*(): ColorSpace.Model
  proc isWideGamut*(): jboolean
  proc isSrgb*(): jboolean
  proc getComponentCount*(): jint
  proc pack*(): jlong
  proc convert*(colorSpace: ColorSpace): Color
  proc toArgb*(): jint
  proc red*(): jfloat
  proc green*(): jfloat
  proc blue*(): jfloat
  proc alpha*(): jfloat
  proc getComponents*(): seq[jfloat]
  proc getComponents*(components: seq[jfloat]): seq[jfloat]
  proc getComponent*(component: jint): jfloat
  proc luminance*(): jfloat
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc colorSpace*(color: jlong): ColorSpace {.`static`.}
  proc red*(color: jlong): jfloat {.`static`.}
  proc green*(color: jlong): jfloat {.`static`.}
  proc blue*(color: jlong): jfloat {.`static`.}
  proc alpha*(color: jlong): jfloat {.`static`.}
  proc isSrgb*(color: jlong): jboolean {.`static`.}
  proc isWideGamut*(color: jlong): jboolean {.`static`.}
  proc isInColorSpace*(color: jlong, colorSpace: ColorSpace): jboolean {.`static`.}
  proc toArgb*(color: jlong): jint {.`static`.}
  proc valueOf*(color: jint): Color {.`static`.}
  proc valueOf*(color: jlong): Color {.`static`.}
  proc valueOf*(r: jfloat, g: jfloat, b: jfloat): Color {.`static`.}
  proc valueOf*(r: jfloat, g: jfloat, b: jfloat, a: jfloat): Color {.`static`.}
  proc valueOf*(r: jfloat, g: jfloat, b: jfloat, a: jfloat, colorSpace: ColorSpace): Color {.`static`.}
  proc valueOf*(components: seq[jfloat], colorSpace: ColorSpace): Color {.`static`.}
  proc pack*(color: jint): jlong {.`static`.}
  proc pack*(red: jfloat, green: jfloat, blue: jfloat): jlong {.`static`.}
  proc pack*(red: jfloat, green: jfloat, blue: jfloat, alpha: jfloat): jlong {.`static`.}
  proc pack*(red: jfloat, green: jfloat, blue: jfloat, alpha: jfloat, colorSpace: ColorSpace): jlong {.`static`.}
  proc convert*(color: jint, colorSpace: ColorSpace): jlong {.`static`.}
  proc convert*(color: jlong, colorSpace: ColorSpace): jlong {.`static`.}
  proc convert*(r: jfloat, g: jfloat, b: jfloat, a: jfloat, source: ColorSpace, destination: ColorSpace): jlong {.`static`.}
  proc convert*(color: jlong, connector: ColorSpace.Connector): jlong {.`static`.}
  proc convert*(r: jfloat, g: jfloat, b: jfloat, a: jfloat, connector: ColorSpace.Connector): jlong {.`static`.}
  proc luminance*(color: jlong): jfloat {.`static`.}
  proc alpha*(color: jint): jint {.`static`.}
  proc red*(color: jint): jint {.`static`.}
  proc green*(color: jint): jint {.`static`.}
  proc blue*(color: jint): jint {.`static`.}
  proc rgb*(red: jint, green: jint, blue: jint): jint {.`static`.}
  proc rgb*(red: jfloat, green: jfloat, blue: jfloat): jint {.`static`.}
  proc argb*(alpha: jint, red: jint, green: jint, blue: jint): jint {.`static`.}
  proc argb*(alpha: jfloat, red: jfloat, green: jfloat, blue: jfloat): jint {.`static`.}
  proc luminance*(color: jint): jfloat {.`static`.}
  proc parseColor*(colorString: string): jint {.`static`.}
  proc RGBToHSV*(red: jint, green: jint, blue: jint, hsv: seq[jfloat]) {.`static`.}
  proc colorToHSV*(color: jint, hsv: seq[jfloat]) {.`static`.}
  proc HSVToColor*(hsv: seq[jfloat]): jint {.`static`.}
  proc HSVToColor*(alpha: jint, hsv: seq[jfloat]): jint {.`static`.}
  BLACK*: jint {.`static`.}
  DKGRAY*: jint {.`static`.}
  GRAY*: jint {.`static`.}
  LTGRAY*: jint {.`static`.}
  WHITE*: jint {.`static`.}
  RED*: jint {.`static`.}
  GREEN*: jint {.`static`.}
  BLUE*: jint {.`static`.}
  YELLOW*: jint {.`static`.}
  CYAN*: jint {.`static`.}
  MAGENTA*: jint {.`static`.}
  TRANSPARENT*: jint {.`static`.}


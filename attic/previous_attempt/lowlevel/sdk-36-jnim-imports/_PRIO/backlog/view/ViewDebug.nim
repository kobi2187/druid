import jnim

jclass android.view.ViewDebug* of JVMObject:
  proc getViewInstanceCount*(): jlong {.`static`.}
  proc getViewRootImplCount*(): jlong {.`static`.}
  proc trace*(view: View, type: RecyclerTraceType, parameters: jint) {.`static`.}
  proc startRecyclerTracing*(prefix: string, view: View) {.`static`.}
  proc stopRecyclerTracing*() {.`static`.}
  proc trace*(view: View, type: HierarchyTraceType) {.`static`.}
  proc startHierarchyTracing*(prefix: string, view: View) {.`static`.}
  proc stopHierarchyTracing*() {.`static`.}
  proc findView*(root: View, parameter: string): View {.`static`.}
  proc profileViewAndChildren*(view: View, output:BufferedWriter) {.`static`.}
  proc captureLayers*(root: View, clientStream: DataOutputStream) {.`static`.}
  proc outputDisplayList*(root: View, target: View) {.`static`.}
  proc startRenderingCommandsCapture*(tree: View, executor: Executor, callback: Function[Picture, Boolean]): AutoCloseable {.`static`.}
  proc startRenderingCommandsCapture*(tree: View, executor: Executor, callback: Callable[OutputStream]): AutoCloseable {.`static`.}
  proc capture*(root: View, clientStream: OutputStream, captureView: View) {.`static`.}
  proc dump*(root: View, skipChildren: jboolean, includeProperties: jboolean, clientStream: OutputStream) {.`static`.}
  proc dumpv2*(view: View, output:ByteArrayOutputStream) {.`static`.}
  proc dumpTheme*(view: View, clientStream: OutputStream) {.`static`.}
  proc intToString*(clazz: Class[?], field: string, integer: jint): string {.`static`.}
  proc flagsToString*(clazz: Class[?], field: string, flags: jint): string {.`static`.}
  proc dumpCapturedView*(tag: string, view: JObject) {.`static`.}
  proc invokeViewMethod*(targetView: View, methodName: string, params: ByteBuffer): seq[jbyte] {.`static`.}
  proc setLayoutParameter*(view: View, param: string, value: jint) {.`static`.}
  proc deserializeMethodParameters*(args: seq[JObject], argTypes: Class[?], in: ByteBuffer) {.`static`.}
  proc serializeReturnValue*(type: Class[?], value: JObject): seq[jbyte] {.`static`.}
  TRACE_HIERARCHY*: jboolean {.`static`.}
  TRACE_RECYCLER*: jboolean {.`static`.}
  DEBUG_DRAG*: jboolean {.`static`.}
  DEBUG_POSITIONING*: jboolean {.`static`.}
  REMOTE_COMMAND_DUMP_ENCODED*: string {.`static`.}

jclass android.view.ViewDebug.HierarchyHandler* of JVMObject:
  proc dumpViewHierarchyWithProperties*(output:BufferedWriter, level: jint)
  proc findHierarchyView*(className: string, hashCode: jint): View

jclass android.view.ViewDebug.SoftwareCanvasProvider* of JVMObject:
  proc getCanvas*(view: View, width: jint, height: jint): Canvas
  proc createBitmap*(): Bitmap

jclass android.view.ViewDebug.HardwareCanvasProvider* of JVMObject:
  proc getCanvas*(view: View, width: jint, height: jint): Canvas
  proc createBitmap*(): Bitmap

jclass android.view.HierarchyHandler* of JVMObject:
  proc dumpViewHierarchyWithProperties*(output:BufferedWriter, level: jint)
  proc findHierarchyView*(className: string, hashCode: jint): View

jclass android.view.SoftwareCanvasProvider* of JVMObject:
  proc getCanvas*(view: View, width: jint, height: jint): Canvas
  proc createBitmap*(): Bitmap

jclass android.view.HardwareCanvasProvider* of JVMObject:
  proc getCanvas*(view: View, width: jint, height: jint): Canvas
  proc createBitmap*(): Bitmap


jclass android.view.ViewMethodInvocationSerializationException* of Exception:


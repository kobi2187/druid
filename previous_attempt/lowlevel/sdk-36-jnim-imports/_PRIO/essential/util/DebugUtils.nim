import jnim

jclass android.util.DebugUtils* of JVMObject:
  proc isObjectSelected*(object: JObject): jboolean {.`static`.}
  proc buildShortClassTag*(cls: JObject, output:StringBuilder) {.`static`.}
  proc printSizeValue*(pw: PrintWriter, number: jlong) {.`static`.}
  proc sizeValueToString*(number: jlong, outBuilder: StringBuilder): string {.`static`.}
  proc valueToString*(clazz: Class[?], prefix: string, value: jint): string {.`static`.}
  proc flagsToString*(clazz: Class[?], prefix: string, flags: jlong): string {.`static`.}
  proc constantToString*(clazz: Class[?], prefix: string, value: jint): string {.`static`.}
  proc callersWithin*(cls: Class[?], offset: jint): List[string] {.`static`.}


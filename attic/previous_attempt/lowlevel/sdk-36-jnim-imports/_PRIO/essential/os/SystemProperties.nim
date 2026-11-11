import jnim

jclass android.os.SystemProperties* of JVMObject:
  proc get*(key: string): string {.`static`.}
  proc get*(key: string, def: string): string {.`static`.}
  proc getInt*(key: string, def: jint): jint {.`static`.}
  proc getLong*(key: string, def: jlong): jlong {.`static`.}
  proc getBoolean*(key: string, def: jboolean): jboolean {.`static`.}
  proc set*(key: string, val: string) {.`static`.}
  proc addChangeCallback*(callback: Runnable) {.`static`.}
  proc removeChangeCallback*(callback: Runnable) {.`static`.}
  proc clearChangeCallbacksForTest*() {.`static`.}
  proc reportSyspropChanged*() {.`static`.}
  proc digestOf*(keys: string): string {.`static`.}
  proc find*(name: string): Handle {.`static`.}
  PROP_NAME_MAX*: jint {.`static`.}
  PROP_VALUE_MAX*: jint {.`static`.}

jclass android.os.SystemProperties.Handle* of JVMObject:
  proc get*(): string
  proc getInt*(def: jint): jint
  proc getLong*(def: jlong): jlong
  proc getBoolean*(def: jboolean): jboolean

jclass android.os.Handle* of JVMObject:
  proc get*(): string
  proc getInt*(def: jint): jint
  proc getLong*(def: jlong): jlong
  proc getBoolean*(def: jboolean): jboolean


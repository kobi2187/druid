import jnim

jclass android.util.PluralsMessageFormatter* of JVMObject:
  proc format*(resources: Resources, arguments: Map[string, JObject], messageId: jint): string {.`static`.}


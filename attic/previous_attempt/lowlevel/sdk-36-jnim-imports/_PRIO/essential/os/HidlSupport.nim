import jnim

jclass android.os.HidlSupport* of JVMObject:
  proc deepEquals*(lft: JObject, rgt: JObject): jboolean {.`static`.}
  proc deepHashCode*(o: JObject): jint {.`static`.}
  proc interfacesEqual*(lft: IHwInterface, rgt: JObject): jboolean {.`static`.}
  proc getPidIfSharable*(): jint {.`static`.}
  proc isHidlSupported*(): jboolean {.`static`.}

jclass android.os.Mutable* of JVMObject:
  value*: E


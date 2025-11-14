import jnim

jclass android.compat.Compatibility* of JVMObject:
  proc reportUnconditionalChange*(changeId: jlong) {.`static`.}
  proc isChangeEnabled*(changeId: jlong): jboolean {.`static`.}
  proc setBehaviorChangeDelegate*(callbacks: BehaviorChangeDelegate) {.`static`.}
  proc clearBehaviorChangeDelegate*() {.`static`.}
  proc getBehaviorChangeDelegate*(): BehaviorChangeDelegate {.`static`.}
  proc setOverrides*(overrides: ChangeConfig) {.`static`.}
  proc clearOverrides*() {.`static`.}

jclass android.compat.Compatibility.ChangeConfig* of JVMObject:
  proc isEmpty*(): jboolean
  proc getEnabledChangesArray*(): seq[jlong]
  proc getDisabledChangesArray*(): seq[jlong]
  proc getEnabledSet*(): Set[Long]
  proc getDisabledSet*(): Set[Long]
  proc isForceEnabled*(changeId: jlong): jboolean
  proc isForceDisabled*(changeId: jlong): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string


jclass android.compat.ChangeConfig* of JVMObject:
  proc isEmpty*(): jboolean
  proc getEnabledChangesArray*(): seq[jlong]
  proc getDisabledChangesArray*(): seq[jlong]
  proc getEnabledSet*(): Set[Long]
  proc getDisabledSet*(): Set[Long]
  proc isForceEnabled*(changeId: jlong): jboolean
  proc isForceDisabled*(changeId: jlong): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string


import jnim

jclass android.timezone.TzDataSetVersion* of JVMObject:
  proc currentFormatMajorVersion*(): jint {.`static`.}
  proc currentFormatMinorVersion*(): jint {.`static`.}
  proc isCompatibleWithThisDevice*(tzDataSetVersion: TzDataSetVersion): jboolean {.`static`.}
  proc read*(): TzDataSetVersion {.`static`.}
  proc getFormatMajorVersion*(): jint
  proc getFormatMinorVersion*(): jint
  proc getRulesVersion*(): string
  proc getRevision*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.timezone.TzDataSetException* of Exception:


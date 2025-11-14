import jnim

jclass android.media.DrmInitData* of JVMObject:
  proc get*(schemeUuid: UUID): SchemeInitData
  proc getSchemeInitDataCount*(): jint
  proc getSchemeInitDataAt*(index: jint): SchemeInitData

jclass android.media.DrmInitData.SchemeInitData* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.SchemeInitData* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  UUID_NIL*: UUID {.`static`.}
  uuid*: UUID
  mimeType*: string
  data*: jbyte


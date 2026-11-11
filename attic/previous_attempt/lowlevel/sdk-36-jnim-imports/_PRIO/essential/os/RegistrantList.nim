import jnim

jclass android.os.RegistrantList* of JVMObject:
  proc add*(h: Handler, what: jint, obj: JObject)
  proc addUnique*(h: Handler, what: jint, obj: JObject)
  proc add*(r: Registrant)
  proc removeCleared*()
  proc removeAll*()
  proc size*(): jint
  proc get*(index: jint): JObject
  proc notifyRegistrants*()
  proc notifyException*(exception: Throwable)
  proc notifyResult*(result: JObject)
  proc notifyRegistrants*(ar: AsyncResult)
  proc remove*(h: Handler)


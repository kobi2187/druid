import jnim

jclass android.os.Registrant* of JVMObject:
  proc clear*()
  proc notifyRegistrant*()
  proc notifyResult*(result: JObject)
  proc notifyException*(exception: Throwable)
  proc notifyRegistrant*(ar: AsyncResult)
  proc messageForRegistrant*(): Message
  proc getHandler*(): Handler


import jnim

jclass android.os.AsyncResult* of JVMObject:
  proc forMessage*(m: Message, r: JObject, ex: Throwable): AsyncResult {.`static`.}
  proc forMessage*(m: Message): AsyncResult {.`static`.}
  userObj*: JObject
  exception*: Throwable
  result*: JObject


import jnim

jclass android.telephony.BinderCacheManager* of JVMObject:
  proc listenOnBinder*(runnableKey: JObject, deadRunnable: Runnable): T
  proc getBinder*(): T
  proc removeRunnable*(runnableKey: JObject): T


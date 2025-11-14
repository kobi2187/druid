import jnim

jclass android.os.Handler* of JVMObject:
  proc handleMessage*(msg: Message)
  proc dispatchMessage*(msg: Message)
  proc createAsync*(looper: Looper): Handler {.`static`.}
  proc createAsync*(looper: Looper, callback: Callback): Handler {.`static`.}
  proc getMain*(): Handler {.`static`.}
  proc mainIfNull*(handler: Handler): Handler {.`static`.}
  proc getTraceName*(message: Message): string
  proc getMessageName*(message: Message): string
  proc obtainMessage*(): Message
  proc obtainMessage*(what: jint): Message
  proc obtainMessage*(what: jint, obj: JObject): Message
  proc obtainMessage*(what: jint, arg1: jint, arg2: jint): Message
  proc obtainMessage*(what: jint, arg1: jint, arg2: jint, obj: JObject): Message
  proc post*(r: Runnable): jboolean
  proc postAtTime*(r: Runnable, uptimeMillis: jlong): jboolean
  proc postAtTime*(r: Runnable, token: JObject, uptimeMillis: jlong): jboolean
  proc postDelayed*(r: Runnable, delayMillis: jlong): jboolean
  proc postDelayed*(r: Runnable, what: jint, delayMillis: jlong): jboolean
  proc postDelayed*(r: Runnable, token: JObject, delayMillis: jlong): jboolean
  proc postAtFrontOfQueue*(r: Runnable): jboolean
  proc runWithScissors*(r: Runnable, timeout: jlong): jboolean
  proc removeCallbacks*(r: Runnable)
  proc removeCallbacks*(r: Runnable, token: JObject)
  proc sendMessage*(msg: Message): jboolean
  proc sendEmptyMessage*(what: jint): jboolean
  proc sendEmptyMessageDelayed*(what: jint, delayMillis: jlong): jboolean
  proc sendEmptyMessageAtTime*(what: jint, uptimeMillis: jlong): jboolean
  proc sendMessageDelayed*(msg: Message, delayMillis: jlong): jboolean
  proc sendMessageAtTime*(msg: Message, uptimeMillis: jlong): jboolean
  proc sendMessageAtFrontOfQueue*(msg: Message): jboolean
  proc executeOrSendMessage*(msg: Message): jboolean
  proc removeMessages*(what: jint)
  proc removeMessages*(what: jint, object: JObject)
  proc removeEqualMessages*(what: jint, object: JObject)
  proc removeCallbacksAndMessages*(token: JObject)
  proc removeCallbacksAndEqualMessages*(token: JObject)
  proc hasMessages*(what: jint): jboolean
  proc hasMessagesOrCallbacks*(): jboolean
  proc hasMessages*(what: jint, object: JObject): jboolean
  proc hasEqualMessages*(what: jint, object: JObject): jboolean
  proc hasCallbacks*(r: Runnable): jboolean
  proc getLooper*(): Looper
  proc dump*(pw: Printer, prefix: string)
  proc dumpMine*(pw: Printer, prefix: string)
  proc toString*(): string


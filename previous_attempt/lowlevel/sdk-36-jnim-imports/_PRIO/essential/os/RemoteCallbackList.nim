import jnim

jclass android.os.RemoteCallbackList* of JVMObject:
  proc getFrozenCalleePolicy*(): jint
  proc getMaxQueueSize*(): jint
  proc getExecutor*(): Executor
  proc register*(callbackInterface: E): jboolean
  proc register*(callbackInterface: E, cookie: JObject): jboolean
  proc unregister*(callbackInterface: E): jboolean
  proc kill*()
  proc onCallbackDied*(callbackInterface: E)
  proc onCallbackDied*(callbackInterface: E, cookie: JObject)
  proc beginBroadcast*(): jint
  proc getBroadcastItem*(index: jint): E
  proc getBroadcastCookie*(index: jint): JObject
  proc finishBroadcast*()
  proc broadcast*(callback: Consumer[E])
  proc broadcastForEachCookie*(callback: Consumer[C])
  proc broadcast*(callback: BiConsumer[E, C])
  proc getRegisteredCallbackCount*(): jint
  proc getRegisteredCallbackItem*(index: jint): E
  proc getRegisteredCallbackCookie*(index: jint): JObject
  proc dump*(pw: PrintWriter, prefix: string)
  FROZEN_CALLEE_POLICY_UNSET*: jint {.`static`.}
  FROZEN_CALLEE_POLICY_ENQUEUE_ALL*: jint {.`static`.}
  FROZEN_CALLEE_POLICY_ENQUEUE_MOST_RECENT*: jint {.`static`.}
  FROZEN_CALLEE_POLICY_DROP*: jint {.`static`.}

jclass android.os.RemoteCallbackList.Builder* of JVMObject:
  proc setMaxQueueSize*(maxQueueSize: jint): Builder
  proc setInterfaceDiedCallback*(callback: InterfaceDiedCallback[E]): Builder
  proc setExecutor*(executor: Executor): Builder
  proc build*(): RemoteCallbackList[E]

jclass android.os.Builder* of JVMObject:
  proc setMaxQueueSize*(maxQueueSize: jint): Builder
  proc setInterfaceDiedCallback*(callback: InterfaceDiedCallback[E]): Builder
  proc setExecutor*(executor: Executor): Builder
  proc build*(): RemoteCallbackList[E]


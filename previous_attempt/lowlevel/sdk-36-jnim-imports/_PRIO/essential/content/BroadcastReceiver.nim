import jnim

jclass android.content.BroadcastReceiver* of JVMObject:
  proc onReceive*(context: Context, intent: Intent)
  proc goAsync*(): PendingResult
  proc peekService*(myContext: Context, service: Intent): IBinder
  proc setResultCode*(code: jint)
  proc getResultCode*(): jint
  proc setResultData*(data: string)
  proc getResultData*(): string
  proc setResultExtras*(extras: Bundle)
  proc getResultExtras*(makeMap: jboolean): Bundle
  proc setResult*(code: jint, data: string, extras: Bundle)
  proc getAbortBroadcast*(): jboolean
  proc abortBroadcast*()
  proc clearAbortBroadcast*()
  proc isOrderedBroadcast*(): jboolean
  proc isInitialStickyBroadcast*(): jboolean
  proc setOrderedHint*(isOrdered: jboolean)
  proc setPendingResult*(result: PendingResult)
  proc getPendingResult*(): PendingResult
  proc getSendingUser*(): UserHandle
  proc getSendingUserId*(): jint
  proc getSentFromUid*(): jint
  proc getSentFromPackage*(): string
  proc setDebugUnregister*(debug: jboolean)
  proc getDebugUnregister*(): jboolean

jclass android.content.BroadcastReceiver.PendingResult* of JVMObject:
  proc guessAssumeDelivered*(type: jint, ordered: jboolean): jboolean {.`static`.}
  proc setResultCode*(code: jint)
  proc getResultCode*(): jint
  proc setResultData*(data: string)
  proc getResultData*(): string
  proc setResultExtras*(extras: Bundle)
  proc getResultExtras*(makeMap: jboolean): Bundle
  proc setResult*(code: jint, data: string, extras: Bundle)
  proc getAbortBroadcast*(): jboolean
  proc abortBroadcast*()
  proc clearAbortBroadcast*()
  proc finish*()
  proc setExtrasClassLoader*(cl: ClassLoader)
  proc sendFinished*(am: IActivityManager)
  proc getSendingUserId*(): jint
  proc getSentFromUid*(): jint
  proc getSentFromPackage*(): string

jclass android.content.PendingResult* of JVMObject:
  proc guessAssumeDelivered*(type: jint, ordered: jboolean): jboolean {.`static`.}
  proc setResultCode*(code: jint)
  proc getResultCode*(): jint
  proc setResultData*(data: string)
  proc getResultData*(): string
  proc setResultExtras*(extras: Bundle)
  proc getResultExtras*(makeMap: jboolean): Bundle
  proc setResult*(code: jint, data: string, extras: Bundle)
  proc getAbortBroadcast*(): jboolean
  proc abortBroadcast*()
  proc clearAbortBroadcast*()
  proc finish*()
  proc setExtrasClassLoader*(cl: ClassLoader)
  proc sendFinished*(am: IActivityManager)
  proc getSendingUserId*(): jint
  proc getSentFromUid*(): jint
  proc getSentFromPackage*(): string
  TYPE_COMPONENT*: jint {.`static`.}
  TYPE_REGISTERED*: jint {.`static`.}
  TYPE_UNREGISTERED*: jint {.`static`.}


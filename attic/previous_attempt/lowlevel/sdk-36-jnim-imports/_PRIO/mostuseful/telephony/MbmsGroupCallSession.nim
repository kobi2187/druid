import jnim

jclass android.telephony.MbmsGroupCallSession* of JVMObject:
  proc create*(context: Context, subscriptionId: jint, executor: Executor, callback: MbmsGroupCallSessionCallback): MbmsGroupCallSession {.`static`.}
  proc create*(context: Context, executor: Executor, callback: MbmsGroupCallSessionCallback): MbmsGroupCallSession {.`static`.}
  proc close*()
  proc startGroupCall*(tmgi: jlong, saiList: List[Integer], frequencyList: List[Integer], executor: Executor, callback: GroupCallCallback): GroupCall
  proc onGroupCallStopped*(service: GroupCall)
  MBMS_GROUP_CALL_SERVICE_ACTION*: string {.`static`.}
  MBMS_GROUP_CALL_SERVICE_OVERRIDE_METADATA*: string {.`static`.}


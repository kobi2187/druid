import jnim

jclass android.telephony.VisualVoicemailService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onCellServiceConnected*(task: VisualVoicemailTask, phoneAccountHandle: PhoneAccountHandle)
  proc onSmsReceived*(task: VisualVoicemailTask, sms: VisualVoicemailSms)
  proc onSimRemoved*(task: VisualVoicemailTask, phoneAccountHandle: PhoneAccountHandle)
  proc onStopped*(task: VisualVoicemailTask)
  proc setSmsFilterSettings*(context: Context, phoneAccountHandle: PhoneAccountHandle, settings: VisualVoicemailSmsFilterSettings) {.`static`.}
  proc sendVisualVoicemailSms*(context: Context, phoneAccountHandle: PhoneAccountHandle, number: string, port: jshort, text: string, sentIntent: PendingIntent) {.`static`.}
  SERVICE_INTERFACE*: string {.`static`.}
  MSG_ON_CELL_SERVICE_CONNECTED*: jint {.`static`.}
  MSG_ON_SMS_RECEIVED*: jint {.`static`.}
  MSG_ON_SIM_REMOVED*: jint {.`static`.}
  MSG_TASK_ENDED*: jint {.`static`.}
  MSG_TASK_STOPPED*: jint {.`static`.}
  DATA_PHONE_ACCOUNT_HANDLE*: string {.`static`.}
  DATA_SMS*: string {.`static`.}

jclass android.telephony.VisualVoicemailService.VisualVoicemailTask* of JVMObject:
  proc finish*()
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.telephony.VisualVoicemailTask* of JVMObject:
  proc finish*()
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint


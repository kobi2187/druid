import jnim

jclass android.telephony.SmsMessage* of JVMObject:
  proc setSubId*(subId: jint)
  proc getSubId*(): jint
  proc createFromPdu*(pdu: seq[jbyte]): SmsMessage {.`static`.}
  proc createFromPdu*(pdu: seq[jbyte], format: string): SmsMessage {.`static`.}
  proc createFromEfRecord*(index: jint, data: seq[jbyte]): SmsMessage {.`static`.}
  proc createFromEfRecord*(index: jint, data: seq[jbyte], subId: jint): SmsMessage {.`static`.}
  proc createFromNativeSmsSubmitPdu*(data: seq[jbyte], isCdma: jboolean): SmsMessage {.`static`.}
  proc getTPLayerLengthForPDU*(pdu: string): jint {.`static`.}
  proc calculateLength*(msgBody: CharSequence, use7bitOnly: jboolean): seq[jint] {.`static`.}
  proc calculateLength*(msgBody: CharSequence, use7bitOnly: jboolean, subId: jint): seq[jint] {.`static`.}
  proc fragmentText*(text: string): ArrayList[string] {.`static`.}
  proc fragmentText*(text: string, subId: jint): ArrayList[string] {.`static`.}
  proc calculateLength*(messageBody: string, use7bitOnly: jboolean): seq[jint] {.`static`.}
  proc calculateLength*(messageBody: string, use7bitOnly: jboolean, subId: jint): seq[jint] {.`static`.}
  proc getSubmitPdu*(scAddress: string, destinationAddress: string, message: string, statusReportRequested: jboolean): SubmitPdu {.`static`.}
  proc getSubmitPdu*(scAddress: string, destinationAddress: string, message: string, statusReportRequested: jboolean, subId: jint): SubmitPdu {.`static`.}
  proc getSubmitPdu*(scAddress: string, destinationAddress: string, destinationPort: jshort, data: seq[jbyte], statusReportRequested: jboolean): SubmitPdu {.`static`.}
  proc getSmsPdu*(subId: jint, status: jint, scAddress: string, address: string, message: string, date: jlong): SubmitPdu {.`static`.}
  proc getSubmitPduEncodedMessage*(isTypeGsm: jboolean, destinationAddress: string, message: string, encoding: jint, languageTable: jint, languageShiftTable: jint, refNumber: jint, seqNumber: jint, msgCount: jint): seq[jbyte] {.`static`.}
  proc getServiceCenterAddress*(): string
  proc getOriginatingAddress*(): string
  proc getDisplayOriginatingAddress*(): string
  proc getMessageBody*(): string
  proc getMessageClass*(): MessageClass
  proc getDisplayMessageBody*(): string
  proc getPseudoSubject*(): string
  proc getTimestampMillis*(): jlong
  proc isEmail*(): jboolean
  proc getEmailBody*(): string
  proc getEmailFrom*(): string
  proc getProtocolIdentifier*(): jint
  proc isReplace*(): jboolean
  proc isCphsMwiMessage*(): jboolean
  proc isMWIClearMessage*(): jboolean
  proc isMWISetMessage*(): jboolean
  proc isMwiDontStore*(): jboolean
  proc getUserData*(): seq[jbyte]
  proc getPdu*(): seq[jbyte]
  proc getStatusOnSim*(): jint
  proc getStatusOnIcc*(): jint
  proc getIndexOnSim*(): jint
  proc getIndexOnIcc*(): jint
  proc getStatus*(): jint
  proc isStatusReportMessage*(): jboolean
  proc isReplyPathPresent*(): jboolean
  proc getReceivedEncodingType*(): jint
  proc is3gpp*(): jboolean
  proc hasEmsSupport*(): jboolean {.`static`.}
  proc shouldAppendPageNumberAsPrefix*(): jboolean {.`static`.}
  proc getRecipientAddress*(): string
  ENCODING_UNKNOWN*: jint {.`static`.}
  ENCODING_7BIT*: jint {.`static`.}
  ENCODING_8BIT*: jint {.`static`.}
  ENCODING_16BIT*: jint {.`static`.}
  ENCODING_KSC5601*: jint {.`static`.}
  MAX_USER_DATA_BYTES*: jint {.`static`.}
  MAX_USER_DATA_BYTES_WITH_HEADER*: jint {.`static`.}
  MAX_USER_DATA_SEPTETS*: jint {.`static`.}
  MAX_USER_DATA_SEPTETS_WITH_HEADER*: jint {.`static`.}
  FORMAT_3GPP*: string {.`static`.}
  FORMAT_3GPP2*: string {.`static`.}
  mWrappedSmsMessage*: SmsMessageBase

jclass android.telephony.SmsMessage.SubmitPdu* of JVMObject:
  proc toString*(): string

jclass android.telephony.SubmitPdu* of JVMObject:
  proc toString*(): string
  encodedScAddress*: jbyte
  encodedMessage*: jbyte


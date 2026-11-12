import jnim

jclass android.telephony.VisualVoicemailSms* of JVMObject:
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc getPrefix*(): string
  proc getFields*(): Bundle
  proc getMessageBody*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[VisualVoicemailSms] {.`static`.}

jclass android.telephony.VisualVoicemailSms.Builder* of JVMObject:
  proc build*(): VisualVoicemailSms
  proc setPhoneAccountHandle*(phoneAccountHandle: PhoneAccountHandle): Builder
  proc setPrefix*(prefix: string): Builder
  proc setFields*(fields: Bundle): Builder
  proc setMessageBody*(messageBody: string): Builder

jclass android.telephony.Builder* of JVMObject:
  proc build*(): VisualVoicemailSms
  proc setPhoneAccountHandle*(phoneAccountHandle: PhoneAccountHandle): Builder
  proc setPrefix*(prefix: string): Builder
  proc setFields*(fields: Bundle): Builder
  proc setMessageBody*(messageBody: string): Builder


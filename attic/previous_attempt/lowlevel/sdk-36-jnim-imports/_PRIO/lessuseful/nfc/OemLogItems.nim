import jnim

jclass android.nfc.OemLogItems* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getAction*(): jint
  proc getEvent*(): jint
  proc getCallingPid*(): jint
  proc getCommandApdu*(): seq[jbyte]
  proc getResponseApdu*(): seq[jbyte]
  proc getRfFieldEventTimeMillis*(): Instant
  proc getTag*(): Tag
  proc toString*(): string
  LOG_ACTION_RF_FIELD_STATE_CHANGED*: jint {.`static`.}
  LOG_ACTION_NFC_TOGGLE*: jint {.`static`.}
  LOG_ACTION_HCE_DATA*: jint {.`static`.}
  LOG_ACTION_SCREEN_STATE_CHANGED*: jint {.`static`.}
  LOG_ACTION_TAG_DETECTED*: jint {.`static`.}
  EVENT_UNSET*: jint {.`static`.}
  EVENT_ENABLE*: jint {.`static`.}
  EVENT_DISABLE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[OemLogItems] {.`static`.}

jclass android.nfc.OemLogItems.Builder* of JVMObject:
  proc setAction*(action: jint): OemLogItems.Builder
  proc setCallingEvent*(event: jint): OemLogItems.Builder
  proc setCallingPid*(pid: jint): OemLogItems.Builder
  proc setApduCommand*(apdus: seq[jbyte]): OemLogItems.Builder
  proc setRfFieldOnTime*(time: Instant): OemLogItems.Builder
  proc setApduResponse*(apdus: seq[jbyte]): OemLogItems.Builder
  proc setTag*(tag: Tag): OemLogItems.Builder
  proc build*(): OemLogItems

jclass android.nfc.Builder* of JVMObject:
  proc setAction*(action: jint): OemLogItems.Builder
  proc setCallingEvent*(event: jint): OemLogItems.Builder
  proc setCallingPid*(pid: jint): OemLogItems.Builder
  proc setApduCommand*(apdus: seq[jbyte]): OemLogItems.Builder
  proc setRfFieldOnTime*(time: Instant): OemLogItems.Builder
  proc setApduResponse*(apdus: seq[jbyte]): OemLogItems.Builder
  proc setTag*(tag: Tag): OemLogItems.Builder
  proc build*(): OemLogItems


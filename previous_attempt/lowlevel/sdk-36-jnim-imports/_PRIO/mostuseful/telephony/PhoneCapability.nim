import jnim

jclass android.telephony.PhoneCapability* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getMaxActiveVoiceSubscriptions*(): jint
  proc getMaxActiveDataSubscriptions*(): jint
  proc isNetworkValidationBeforeSwitchSupported*(): jboolean
  proc getLogicalModemList*(): List[ModemInfo]
  proc getDeviceNrCapabilities*(): seq[jint]
  DEFAULT_DSDS_CAPABILITY*: PhoneCapability {.`static`.}
  DEFAULT_SSSS_CAPABILITY*: PhoneCapability {.`static`.}
  DEVICE_NR_CAPABILITY_NSA*: jint {.`static`.}
  DEVICE_NR_CAPABILITY_SA*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PhoneCapability] {.`static`.}

jclass android.telephony.PhoneCapability.Builder* of JVMObject:
  proc setMaxActiveVoiceSubscriptions*(maxActiveVoiceSubscriptions: jint): Builder
  proc setMaxActiveDataSubscriptions*(maxActiveDataSubscriptions: jint): Builder
  proc setNetworkValidationBeforeSwitchSupported*(networkValidationBeforeSwitchSupported: jboolean): Builder
  proc setLogicalModemList*(logicalModemList: List[ModemInfo]): Builder
  proc setDeviceNrCapabilities*(deviceNrCapabilities: seq[jint]): Builder
  proc build*(): PhoneCapability

jclass android.telephony.Builder* of JVMObject:
  proc setMaxActiveVoiceSubscriptions*(maxActiveVoiceSubscriptions: jint): Builder
  proc setMaxActiveDataSubscriptions*(maxActiveDataSubscriptions: jint): Builder
  proc setNetworkValidationBeforeSwitchSupported*(networkValidationBeforeSwitchSupported: jboolean): Builder
  proc setLogicalModemList*(logicalModemList: List[ModemInfo]): Builder
  proc setDeviceNrCapabilities*(deviceNrCapabilities: seq[jint]): Builder
  proc build*(): PhoneCapability


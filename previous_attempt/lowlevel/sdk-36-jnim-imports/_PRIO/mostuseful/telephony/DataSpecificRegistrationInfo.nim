import jnim

jclass android.telephony.DataSpecificRegistrationInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc getLteVopsSupportInfo*(): LteVopsSupportInfo
  proc getVopsSupportInfo*(): VopsSupportInfo
  proc getLteAttachResultType*(): jint
  proc getLteAttachExtraInfo*(): jint
  LTE_ATTACH_TYPE_UNKNOWN*: jint {.`static`.}
  LTE_ATTACH_TYPE_EPS_ONLY*: jint {.`static`.}
  LTE_ATTACH_TYPE_COMBINED*: jint {.`static`.}
  LTE_ATTACH_EXTRA_INFO_NONE*: jint {.`static`.}
  LTE_ATTACH_EXTRA_INFO_CSFB_NOT_PREFERRED*: jint {.`static`.}
  LTE_ATTACH_EXTRA_INFO_SMS_ONLY*: jint {.`static`.}
  maxDataCalls*: jint
  isDcNrRestricted*: jboolean
  isNrAvailable*: jboolean
  isEnDcAvailable*: jboolean
  CREATOR*: Parcelable.Creator[DataSpecificRegistrationInfo] {.`static`.}

jclass android.telephony.DataSpecificRegistrationInfo.Builder* of JVMObject:
  proc setDcNrRestricted*(isDcNrRestricted: jboolean): Builder
  proc setNrAvailable*(isNrAvailable: jboolean): Builder
  proc setEnDcAvailable*(isEnDcAvailable: jboolean): Builder
  proc setVopsSupportInfo*(vops: VopsSupportInfo): Builder
  proc setLteAttachResultType*(lteAttachResultType: jint): Builder
  proc setLteAttachExtraInfo*(lteAttachExtraInfo: jint): Builder
  proc build*(): DataSpecificRegistrationInfo

jclass android.telephony.Builder* of JVMObject:
  proc setDcNrRestricted*(isDcNrRestricted: jboolean): Builder
  proc setNrAvailable*(isNrAvailable: jboolean): Builder
  proc setEnDcAvailable*(isEnDcAvailable: jboolean): Builder
  proc setVopsSupportInfo*(vops: VopsSupportInfo): Builder
  proc setLteAttachResultType*(lteAttachResultType: jint): Builder
  proc setLteAttachExtraInfo*(lteAttachExtraInfo: jint): Builder
  proc build*(): DataSpecificRegistrationInfo


import jnim

jclass android.os.VibrationAttributes* of JVMObject:
  proc createForUsage*(usage: jint): VibrationAttributes {.`static`.}
  proc getUsageClass*(): jint
  proc getUsage*(): jint
  proc getOriginalAudioUsage*(): jint
  proc getFlags*(): jint
  proc isFlagSet*(flag: jint): jboolean
  proc getAudioUsage*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc usageToString*(): string
  proc usageToString*(usage: jint): string {.`static`.}
  USAGE_FILTER_MATCH_ALL*: jint {.`static`.}
  USAGE_CLASS_UNKNOWN*: jint {.`static`.}
  USAGE_CLASS_ALARM*: jint {.`static`.}
  USAGE_CLASS_FEEDBACK*: jint {.`static`.}
  USAGE_CLASS_MEDIA*: jint {.`static`.}
  USAGE_CLASS_MASK*: jint {.`static`.}
  USAGE_UNKNOWN*: jint {.`static`.}
  USAGE_ALARM*: jint {.`static`.}
  USAGE_RINGTONE*: jint {.`static`.}
  USAGE_NOTIFICATION*: jint {.`static`.}
  USAGE_COMMUNICATION_REQUEST*: jint {.`static`.}
  USAGE_TOUCH*: jint {.`static`.}
  USAGE_PHYSICAL_EMULATION*: jint {.`static`.}
  USAGE_HARDWARE_FEEDBACK*: jint {.`static`.}
  USAGE_ACCESSIBILITY*: jint {.`static`.}
  USAGE_IME_FEEDBACK*: jint {.`static`.}
  USAGE_MEDIA*: jint {.`static`.}
  FLAG_BYPASS_INTERRUPTION_POLICY*: jint {.`static`.}
  FLAG_BYPASS_USER_VIBRATION_INTENSITY_OFF*: jint {.`static`.}
  FLAG_INVALIDATE_SETTINGS_CACHE*: jint {.`static`.}
  FLAG_PIPELINED_EFFECT*: jint {.`static`.}
  FLAG_ALL_SUPPORTED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VibrationAttributes] {.`static`.}

jclass android.os.VibrationAttributes.Builder* of JVMObject:
  proc build*(): VibrationAttributes
  proc setUsage*(usage: jint): Builder
  proc setFlags*(flags: jint, mask: jint): Builder
  proc setFlags*(flags: jint): Builder

jclass android.os.Builder* of JVMObject:
  proc build*(): VibrationAttributes
  proc setUsage*(usage: jint): Builder
  proc setFlags*(flags: jint, mask: jint): Builder
  proc setFlags*(flags: jint): Builder


import jnim

jclass android.app.AutomaticZenRule* of JVMObject:
  proc getOwner*(): ComponentName
  proc getConfigurationActivity*(): ComponentName
  proc getConditionId*(): Uri
  proc getInterruptionFilter*(): jint
  proc getName*(): string
  proc isEnabled*(): jboolean
  proc getZenPolicy*(): ZenPolicy
  proc getDeviceEffects*(): ZenDeviceEffects
  proc getCreationTime*(): jlong
  proc setConditionId*(conditionId: Uri)
  proc setInterruptionFilter*(interruptionFilter: jint)
  proc setName*(name: string)
  proc setEnabled*(enabled: jboolean)
  proc setZenPolicy*(zenPolicy: ZenPolicy)
  proc setDeviceEffects*(deviceEffects: ZenDeviceEffects)
  proc setOwner*(owner: ComponentName)
  proc setConfigurationActivity*(componentName: ComponentName)
  proc setPackageName*(pkgName: string)
  proc getPackageName*(): string
  proc getType*(): jint
  proc setType*(type: jint)
  proc getTriggerDescription*(): string
  proc setTriggerDescription*(triggerDescription: string)
  proc getIconResId*(): jint
  proc setIconResId*(iconResId: jint)
  proc isManualInvocationAllowed*(): jboolean
  proc setManualInvocationAllowed*(allowManualInvocation: jboolean)
  proc validate*()
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc fieldsToString*(bitmask: jint): string {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_OTHER*: jint {.`static`.}
  TYPE_SCHEDULE_TIME*: jint {.`static`.}
  TYPE_SCHEDULE_CALENDAR*: jint {.`static`.}
  TYPE_BEDTIME*: jint {.`static`.}
  TYPE_DRIVING*: jint {.`static`.}
  TYPE_IMMERSIVE*: jint {.`static`.}
  TYPE_THEATER*: jint {.`static`.}
  TYPE_MANAGED*: jint {.`static`.}
  FIELD_NAME*: jint {.`static`.}
  FIELD_INTERRUPTION_FILTER*: jint {.`static`.}
  FIELD_ICON*: jint {.`static`.}
  MAX_STRING_LENGTH*: jint {.`static`.}
  MAX_DESC_LENGTH*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AutomaticZenRule] {.`static`.}

jclass android.app.AutomaticZenRule.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc setOwner*(owner: ComponentName): Builder
  proc setConditionId*(conditionId: Uri): Builder
  proc setInterruptionFilter*(interruptionFilter: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc setConfigurationActivity*(configurationActivity: ComponentName): Builder
  proc setZenPolicy*(policy: ZenPolicy): Builder
  proc setDeviceEffects*(deviceEffects: ZenDeviceEffects): Builder
  proc setType*(type: jint): Builder
  proc setTriggerDescription*(description: string): Builder
  proc setIconResId*(iconResId: jint): Builder
  proc setManualInvocationAllowed*(allowManualInvocation: jboolean): Builder
  proc setCreationTime*(creationTime: jlong): Builder
  proc setPackage*(pkg: string): Builder
  proc build*(): AutomaticZenRule

jclass android.app.AutomaticZenRule.AzrWithId* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc setOwner*(owner: ComponentName): Builder
  proc setConditionId*(conditionId: Uri): Builder
  proc setInterruptionFilter*(interruptionFilter: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc setConfigurationActivity*(configurationActivity: ComponentName): Builder
  proc setZenPolicy*(policy: ZenPolicy): Builder
  proc setDeviceEffects*(deviceEffects: ZenDeviceEffects): Builder
  proc setType*(type: jint): Builder
  proc setTriggerDescription*(description: string): Builder
  proc setIconResId*(iconResId: jint): Builder
  proc setManualInvocationAllowed*(allowManualInvocation: jboolean): Builder
  proc setCreationTime*(creationTime: jlong): Builder
  proc setPackage*(pkg: string): Builder
  proc build*(): AutomaticZenRule

jclass android.app.AzrWithId* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  mId*: string
  mRule*: AutomaticZenRule
  CREATOR*: Creator[AzrWithId] {.`static`.}


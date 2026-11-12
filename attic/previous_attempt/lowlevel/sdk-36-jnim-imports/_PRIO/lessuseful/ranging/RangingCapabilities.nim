import jnim

jclass android.ranging.RangingCapabilities* of JVMObject:
  proc getTechnologyAvailability*(): Map[Integer, Integer]
  proc getUwbCapabilities*(): UwbRangingCapabilities
  proc getRttRangingCapabilities*(): RttRangingCapabilities
  proc getCsCapabilities*(): BleCsRangingCapabilities
  proc getBleRssiCapabilities*(): BleRssiRangingCapabilities
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  NOT_SUPPORTED*: jint {.`static`.}
  DISABLED_USER*: jint {.`static`.}
  DISABLED_REGULATORY*: jint {.`static`.}
  ENABLED*: jint {.`static`.}
  DISABLED_USER_RESTRICTIONS*: jint {.`static`.}
  CREATOR*: Creator[RangingCapabilities] {.`static`.}

jclass android.ranging.RangingCapabilities.Builder* of JVMObject:
  proc addCapabilities*(capabilities: TechnologyCapabilities): Builder
  proc addAvailability*(technology: jint, availability: jint): Builder
  proc build*(): RangingCapabilities


jclass android.ranging.Builder* of JVMObject:
  proc addCapabilities*(capabilities: TechnologyCapabilities): Builder
  proc addAvailability*(technology: jint, availability: jint): Builder
  proc build*(): RangingCapabilities


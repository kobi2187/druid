import jnim

jclass android.content.AutofillOptions* of JVMObject:
  proc isAugmentedAutofillEnabled*(context: Context): jboolean
  proc isAutofillDisabledLocked*(componentName: ComponentName): jboolean
  proc forWhitelistingItself*(): AutofillOptions {.`static`.}
  proc toString*(): string
  proc dumpShort*(pw: PrintWriter)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  loggingLevel*: jint
  compatModeEnabled*: jboolean
  augmentedAutofillEnabled*: jboolean
  whitelistedActivitiesForAugmentedAutofill*: ArraySet[ComponentName]
  appDisabledExpiration*: jlong
  disabledActivities*: ArrayMap[string, Long]
  CREATOR*: Parcelable.Creator[AutofillOptions] {.`static`.}


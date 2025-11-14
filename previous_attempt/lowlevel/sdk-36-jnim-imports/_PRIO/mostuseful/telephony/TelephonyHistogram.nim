import jnim

jclass android.telephony.TelephonyHistogram* of JVMObject:
  proc getCategory*(): jint
  proc getId*(): jint
  proc getMinTime*(): jint
  proc getMaxTime*(): jint
  proc getAverageTime*(): jint
  proc getSampleCount*(): jint
  proc getBucketCount*(): jint
  proc getBucketEndPoints*(): seq[jint]
  proc getBucketCounters*(): seq[jint]
  proc addTimeTaken*(time: jint)
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  TELEPHONY_CATEGORY_RIL*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[TelephonyHistogram] {.`static`.}


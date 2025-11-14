import jnim

jclass android.window.SizeConfigurationBuckets* of JVMObject:
  proc filterDiff*(diff: jint, oldConfig: Configuration, newConfig: Configuration, buckets: SizeConfigurationBuckets): jint {.`static`.}
  proc crossesScreenLayoutSizeThreshold*(firstConfig: Configuration, secondConfig: Configuration): jboolean
  proc areNonSizeLayoutFieldsUnchanged*(oldScreenLayout: jint, newScreenLayout: jint): jboolean {.`static`.}
  proc crossesSizeThreshold*(thresholds: seq[jint], firstDp: jint, secondDp: jint): jboolean {.`static`.}
  proc toString*(): string
  proc getHorizontal*(): seq[jint]
  proc getVertical*(): seq[jint]
  proc getSmallest*(): seq[jint]
  proc getScreenLayoutSize*(): seq[jint]
  proc isScreenLayoutLongSet*(): jboolean
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[SizeConfigurationBuckets] {.`static`.}


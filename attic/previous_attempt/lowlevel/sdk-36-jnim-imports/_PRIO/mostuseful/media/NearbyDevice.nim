import jnim

jclass android.media.NearbyDevice* of JVMObject:
  proc rangeZoneToString*(rangeZone: jint): string {.`static`.}
  proc compareRangeZones*(rangeZone: jint, anotherRangeZone: jint): jint {.`static`.}
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getMediaRoute2Id*(): string
  proc getRangeZone*(): jint
  RANGE_UNKNOWN*: jint {.`static`.}
  RANGE_FAR*: jint {.`static`.}
  RANGE_LONG*: jint {.`static`.}
  RANGE_CLOSE*: jint {.`static`.}
  RANGE_WITHIN_REACH*: jint {.`static`.}
  CREATOR*: Creator[NearbyDevice] {.`static`.}


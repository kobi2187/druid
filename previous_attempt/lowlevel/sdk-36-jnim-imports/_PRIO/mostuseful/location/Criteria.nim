import jnim

jclass android.location.Criteria* of JVMObject:
  proc setHorizontalAccuracy*(accuracy: jint)
  proc getHorizontalAccuracy*(): jint
  proc setVerticalAccuracy*(accuracy: jint)
  proc getVerticalAccuracy*(): jint
  proc setSpeedAccuracy*(accuracy: jint)
  proc getSpeedAccuracy*(): jint
  proc setBearingAccuracy*(accuracy: jint)
  proc getBearingAccuracy*(): jint
  proc setAccuracy*(accuracy: jint)
  proc getAccuracy*(): jint
  proc setPowerRequirement*(powerRequirement: jint)
  proc getPowerRequirement*(): jint
  proc setCostAllowed*(costAllowed: jboolean)
  proc isCostAllowed*(): jboolean
  proc setAltitudeRequired*(altitudeRequired: jboolean)
  proc isAltitudeRequired*(): jboolean
  proc setSpeedRequired*(speedRequired: jboolean)
  proc isSpeedRequired*(): jboolean
  proc setBearingRequired*(bearingRequired: jboolean)
  proc isBearingRequired*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  NO_REQUIREMENT*: jint {.`static`.}
  POWER_LOW*: jint {.`static`.}
  POWER_MEDIUM*: jint {.`static`.}
  POWER_HIGH*: jint {.`static`.}
  ACCURACY_FINE*: jint {.`static`.}
  ACCURACY_COARSE*: jint {.`static`.}
  ACCURACY_LOW*: jint {.`static`.}
  ACCURACY_MEDIUM*: jint {.`static`.}
  ACCURACY_HIGH*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Criteria] {.`static`.}


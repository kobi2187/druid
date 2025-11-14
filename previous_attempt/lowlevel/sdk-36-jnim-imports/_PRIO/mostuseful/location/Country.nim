import jnim

jclass android.location.Country* of JVMObject:
  proc getCountryIso*(): string
  proc getCountryCode*(): string
  proc getSource*(): jint
  proc getTimestamp*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint
  proc equalsIgnoreSource*(country: Country): jboolean
  proc toString*(): string
  COUNTRY_SOURCE_NETWORK*: jint {.`static`.}
  COUNTRY_SOURCE_LOCATION*: jint {.`static`.}
  COUNTRY_SOURCE_SIM*: jint {.`static`.}
  COUNTRY_SOURCE_LOCALE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Country] {.`static`.}


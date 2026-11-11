import jnim

jclass android.telecom.QueryLocationException* of RuntimeException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCode*(): jint
  QUERY_LOCATION_ERROR*: string {.`static`.}
  ERROR_REQUEST_TIME_OUT*: jint {.`static`.}
  ERROR_PREVIOUS_REQUEST_EXISTS*: jint {.`static`.}
  ERROR_NOT_PERMITTED*: jint {.`static`.}
  ERROR_NOT_ALLOWED_FOR_NON_EMERGENCY_CONNECTIONS*: jint {.`static`.}
  ERROR_SERVICE_UNAVAILABLE*: jint {.`static`.}
  ERROR_UNSPECIFIED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[QueryLocationException] {.`static`.}


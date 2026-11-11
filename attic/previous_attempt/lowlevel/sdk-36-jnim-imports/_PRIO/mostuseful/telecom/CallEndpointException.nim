import jnim

jclass android.telecom.CallEndpointException* of RuntimeException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCode*(): jint
  CHANGE_ERROR*: string {.`static`.}
  ERROR_ENDPOINT_DOES_NOT_EXIST*: jint {.`static`.}
  ERROR_REQUEST_TIME_OUT*: jint {.`static`.}
  ERROR_ANOTHER_REQUEST*: jint {.`static`.}
  ERROR_UNSPECIFIED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallEndpointException] {.`static`.}


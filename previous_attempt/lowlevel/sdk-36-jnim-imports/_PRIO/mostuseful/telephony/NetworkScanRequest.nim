import jnim

jclass android.telephony.NetworkScanRequest* of JVMObject:
  proc getScanType*(): jint
  proc getSearchPeriodicity*(): jint
  proc getMaxSearchTime*(): jint
  proc getIncrementalResults*(): jboolean
  proc getIncrementalResultsPeriodicity*(): jint
  proc getSpecifiers*(): seq[RadioAccessSpecifier]
  proc getPlmns*(): ArrayList[string]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  MAX_RADIO_ACCESS_NETWORKS*: jint {.`static`.}
  MAX_BANDS*: jint {.`static`.}
  MAX_CHANNELS*: jint {.`static`.}
  MAX_MCC_MNC_LIST_SIZE*: jint {.`static`.}
  MIN_SEARCH_PERIODICITY_SEC*: jint {.`static`.}
  MAX_SEARCH_PERIODICITY_SEC*: jint {.`static`.}
  MIN_SEARCH_MAX_SEC*: jint {.`static`.}
  MAX_SEARCH_MAX_SEC*: jint {.`static`.}
  MIN_INCREMENTAL_PERIODICITY_SEC*: jint {.`static`.}
  MAX_INCREMENTAL_PERIODICITY_SEC*: jint {.`static`.}
  SCAN_TYPE_ONE_SHOT*: jint {.`static`.}
  SCAN_TYPE_PERIODIC*: jint {.`static`.}
  CREATOR*: Creator[NetworkScanRequest] {.`static`.}


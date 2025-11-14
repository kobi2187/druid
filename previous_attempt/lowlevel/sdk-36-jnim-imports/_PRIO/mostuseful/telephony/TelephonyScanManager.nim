import jnim

jclass android.telephony.TelephonyScanManager* of JVMObject:
  proc requestNetworkScan*(subId: jint, renounceFineLocationAccess: jboolean, request: NetworkScanRequest, executor: Executor, callback: NetworkScanCallback, callingPackage: string, callingFeatureId: string): NetworkScan
  SCAN_RESULT_KEY*: string {.`static`.}
  CALLBACK_SCAN_RESULTS*: jint {.`static`.}
  CALLBACK_SCAN_ERROR*: jint {.`static`.}
  CALLBACK_SCAN_COMPLETE*: jint {.`static`.}
  CALLBACK_RESTRICTED_SCAN_RESULTS*: jint {.`static`.}
  CALLBACK_TELEPHONY_DIED*: jint {.`static`.}
  INVALID_SCAN_ID*: jint {.`static`.}

jclass android.telephony.TelephonyScanManager.NetworkScanCallback* of JVMObject:
  proc onResults*(results: List[CellInfo])
  proc onComplete*()
  proc onError*(error: jint)

jclass android.telephony.NetworkScanCallback* of JVMObject:
  proc onResults*(results: List[CellInfo])
  proc onComplete*()
  proc onError*(error: jint)


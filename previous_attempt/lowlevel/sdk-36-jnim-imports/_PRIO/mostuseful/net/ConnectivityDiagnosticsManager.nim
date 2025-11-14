import jnim

jclass android.net.ConnectivityDiagnosticsManager* of JVMObject:
  proc persistableBundleEquals*(a: PersistableBundle, b: PersistableBundle): jboolean {.`static`.}
  proc registerConnectivityDiagnosticsCallback*(request: NetworkRequest, e: Executor, callback: ConnectivityDiagnosticsCallback)
  proc unregisterConnectivityDiagnosticsCallback*(callback: ConnectivityDiagnosticsCallback)
  sCallbacks*: Map[ConnectivityDiagnosticsCallback, ConnectivityDiagnosticsBinder] {.`static`.}

jclass android.net.ConnectivityDiagnosticsManager.ConnectivityReport* of JVMObject:
  proc getNetwork*(): Network
  proc getReportTimestamp*(): jlong
  proc getLinkProperties*(): LinkProperties
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc getAdditionalInfo*(): PersistableBundle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.net.ConnectivityDiagnosticsManager.DataStallReport* of JVMObject:
  proc getNetwork*(): Network
  proc getReportTimestamp*(): jlong
  proc getDetectionMethod*(): jint
  proc getLinkProperties*(): LinkProperties
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc getStallDetails*(): PersistableBundle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.net.ConnectivityDiagnosticsManager.ConnectivityDiagnosticsBinder* of JVMObject:
  proc onConnectivityReportAvailable*(report: ConnectivityReport)
  proc onDataStallSuspected*(report: DataStallReport)
  proc onNetworkConnectivityReported*(network: Network, hasConnectivity: jboolean)

jclass android.net.ConnectivityDiagnosticsManager.ConnectivityDiagnosticsCallback* of JVMObject:
  proc onConnectivityReportAvailable*(report: ConnectivityReport)
  proc onDataStallSuspected*(report: DataStallReport)
  proc onNetworkConnectivityReported*(network: Network, hasConnectivity: jboolean)

jclass android.net.ConnectivityReport* of JVMObject:
  proc getNetwork*(): Network
  proc getReportTimestamp*(): jlong
  proc getLinkProperties*(): LinkProperties
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc getAdditionalInfo*(): PersistableBundle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  NETWORK_VALIDATION_RESULT_INVALID*: jint {.`static`.}
  NETWORK_VALIDATION_RESULT_VALID*: jint {.`static`.}
  NETWORK_VALIDATION_RESULT_PARTIALLY_VALID*: jint {.`static`.}
  NETWORK_VALIDATION_RESULT_SKIPPED*: jint {.`static`.}
  KEY_NETWORK_VALIDATION_RESULT*: string {.`static`.}
  NETWORK_PROBE_DNS*: jint {.`static`.}
  NETWORK_PROBE_HTTP*: jint {.`static`.}
  NETWORK_PROBE_HTTPS*: jint {.`static`.}
  NETWORK_PROBE_FALLBACK*: jint {.`static`.}
  NETWORK_PROBE_PRIVATE_DNS*: jint {.`static`.}
  KEY_NETWORK_PROBES_SUCCEEDED_BITMASK*: string {.`static`.}
  KEY_NETWORK_PROBES_ATTEMPTED_BITMASK*: string {.`static`.}
  CREATOR*: Creator[ConnectivityReport] {.`static`.}

jclass android.net.DataStallReport* of JVMObject:
  proc getNetwork*(): Network
  proc getReportTimestamp*(): jlong
  proc getDetectionMethod*(): jint
  proc getLinkProperties*(): LinkProperties
  proc getNetworkCapabilities*(): NetworkCapabilities
  proc getStallDetails*(): PersistableBundle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  DETECTION_METHOD_DNS_EVENTS*: jint {.`static`.}
  DETECTION_METHOD_TCP_METRICS*: jint {.`static`.}
  KEY_TCP_METRICS_COLLECTION_PERIOD_MILLIS*: string {.`static`.}
  KEY_TCP_PACKET_FAIL_RATE*: string {.`static`.}
  KEY_DNS_CONSECUTIVE_TIMEOUTS*: string {.`static`.}
  CREATOR*: Creator[DataStallReport] {.`static`.}

jclass android.net.ConnectivityDiagnosticsBinder* of Stub:
  proc onConnectivityReportAvailable*(report: ConnectivityReport)
  proc onDataStallSuspected*(report: DataStallReport)
  proc onNetworkConnectivityReported*(network: Network, hasConnectivity: jboolean)

jclass android.net.ConnectivityDiagnosticsCallback* of JVMObject:
  proc onConnectivityReportAvailable*(report: ConnectivityReport)
  proc onDataStallSuspected*(report: DataStallReport)
  proc onNetworkConnectivityReported*(network: Network, hasConnectivity: jboolean)


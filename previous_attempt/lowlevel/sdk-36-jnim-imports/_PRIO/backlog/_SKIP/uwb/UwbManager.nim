import jnim

jclass android.uwb.UwbManager* of JVMObject:
  proc registerAdapterStateCallback*(executor: Executor, callback: AdapterStateCallback)
  proc unregisterAdapterStateCallback*(callback: AdapterStateCallback)
  proc registerUwbVendorUciCallback*(executor: Executor, callback: UwbVendorUciCallback)
  proc unregisterUwbVendorUciCallback*(callback: UwbVendorUciCallback)
  proc registerUwbOemExtensionCallback*(executor: Executor, callback: UwbOemExtensionCallback)
  proc unregisterUwbOemExtensionCallback*(callback: UwbOemExtensionCallback)
  proc getSpecificationInfo*(): PersistableBundle
  proc getSpecificationInfo*(chipId: string): PersistableBundle
  proc queryUwbsTimestampMicros*(): jlong
  proc elapsedRealtimeResolutionNanos*(): jlong
  proc elapsedRealtimeResolutionNanos*(chipId: string): jlong
  proc openRangingSession*(parameters: PersistableBundle, executor: Executor, callbacks: RangingSession.Callback): CancellationSignal
  proc openRangingSession*(parameters: PersistableBundle, executor: Executor, callbacks: RangingSession.Callback, chipId: string): CancellationSignal
  proc getAdapterState*(): jint
  proc isUwbEnabled*(): jboolean
  proc setUwbEnabled*(enabled: jboolean)
  proc isUwbHwIdleTurnOffEnabled*(): jboolean
  proc isUwbHwEnableRequested*(): jboolean
  proc requestUwbHwEnabled*(enabled: jboolean)
  proc getChipInfos*(): List[PersistableBundle]
  proc getDefaultChipId*(): string
  proc addServiceProfile*(parameters: PersistableBundle): PersistableBundle
  proc removeServiceProfile*(parameters: PersistableBundle): jint
  proc getAllServiceProfiles*(): PersistableBundle
  proc getAdfProvisioningAuthorities*(serviceProfileBundle: PersistableBundle): PersistableBundle
  proc getAdfCertificateInfo*(serviceProfileBundle: PersistableBundle): PersistableBundle
  proc provisionProfileAdfByScript*(serviceProfileBundle: PersistableBundle, executor: Executor, callback: AdfProvisionStateCallback)
  proc removeProfileAdf*(serviceProfileBundle: PersistableBundle): jint
  proc sendVendorUciMessage*(gid: jint, oid: jint, payload: seq[jbyte]): jint
  proc sendVendorUciMessage*(mt: jint, gid: jint, oid: jint, payload: seq[jbyte]): jint
  proc getUwbActivityEnergyInfoAsync*(executor: Executor, listener: Consumer[UwbActivityEnergyInfo])
  VENDOR_SET_SESSION_CONFIGURATION_SUCCESS*: jint {.`static`.}
  VENDOR_SET_SESSION_CONFIGURATION_FAILURE*: jint {.`static`.}
  REMOVE_SERVICE_PROFILE_SUCCESS*: jint {.`static`.}
  REMOVE_SERVICE_PROFILE_ERROR_UNKNOWN_SERVICE*: jint {.`static`.}
  REMOVE_SERVICE_PROFILE_ERROR_INTERNAL*: jint {.`static`.}
  REMOVE_PROFILE_ADF_SUCCESS*: jint {.`static`.}
  REMOVE_PROFILE_ADF_ERROR_UNKNOWN_SERVICE*: jint {.`static`.}
  REMOVE_PROFILE_ADF_ERROR_INTERNAL*: jint {.`static`.}
  SEND_VENDOR_UCI_SUCCESS*: jint {.`static`.}
  SEND_VENDOR_UCI_ERROR_HW*: jint {.`static`.}
  SEND_VENDOR_UCI_ERROR_OFF*: jint {.`static`.}
  SEND_VENDOR_UCI_ERROR_INVALID_ARGS*: jint {.`static`.}
  SEND_VENDOR_UCI_ERROR_INVALID_GID*: jint {.`static`.}
  MESSAGE_TYPE_COMMAND*: jint {.`static`.}
  MESSAGE_TYPE_TEST_1*: jint {.`static`.}
  MESSAGE_TYPE_TEST_2*: jint {.`static`.}

jclass android.uwb.UwbManager.AdfProvisionStateCallback* of JVMObject:
  proc onProfileAdfsProvisioned*(params: PersistableBundle)
  proc onProfileAdfsProvisionFailed*(reason: jint, params: PersistableBundle)


jclass android.uwb.AdfProvisionStateCallback* of JVMObject:
  proc onProfileAdfsProvisioned*(params: PersistableBundle)
  proc onProfileAdfsProvisionFailed*(reason: jint, params: PersistableBundle)
  REASON_INVALID_OID*: jint {.`static`.}
  REASON_SE_FAILURE*: jint {.`static`.}
  REASON_UNKNOWN*: jint {.`static`.}



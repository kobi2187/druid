import jnim

jclass android.os.UpdateEngine* of JVMObject:
  proc bind*(callback: UpdateEngineCallback, handler: Handler): jboolean
  proc bind*(callback: UpdateEngineCallback): jboolean
  proc applyPayload*(url: string, offset: jlong, size: jlong, headerKeyValuePairs: seq[string])
  proc applyPayload*(assetFd: AssetFileDescriptor, headerKeyValuePairs: seq[string])
  proc cancel*()
  proc suspend*()
  proc resume*()
  proc resetStatus*()
  proc setShouldSwitchSlotOnReboot*(payloadMetadataFilename: string)
  proc resetShouldSwitchSlotOnReboot*()
  proc unbind*(): jboolean
  proc verifyPayloadMetadata*(payloadMetadataFilename: string): jboolean
  proc allocateSpace*(payloadMetadataFilename: string, headerKeyValuePairs: seq[string]): AllocateSpaceResult
  proc cleanupAppliedPayload*(): jint
  proc triggerPostinstall*(partition: string)

jclass android.os.UpdateEngine.AllocateSpaceResult* of JVMObject:
  proc getErrorCode*(): jint
  proc getFreeSpaceRequired*(): jlong

jclass android.os.ErrorCodeConstants* of JVMObject:
  SUCCESS*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  FILESYSTEM_COPIER_ERROR*: jint {.`static`.}
  POST_INSTALL_RUNNER_ERROR*: jint {.`static`.}
  PAYLOAD_MISMATCHED_TYPE_ERROR*: jint {.`static`.}
  INSTALL_DEVICE_OPEN_ERROR*: jint {.`static`.}
  KERNEL_DEVICE_OPEN_ERROR*: jint {.`static`.}
  DOWNLOAD_TRANSFER_ERROR*: jint {.`static`.}
  PAYLOAD_HASH_MISMATCH_ERROR*: jint {.`static`.}
  PAYLOAD_SIZE_MISMATCH_ERROR*: jint {.`static`.}
  DOWNLOAD_PAYLOAD_VERIFICATION_ERROR*: jint {.`static`.}
  PAYLOAD_TIMESTAMP_ERROR*: jint {.`static`.}
  UPDATED_BUT_NOT_ACTIVE*: jint {.`static`.}
  NOT_ENOUGH_SPACE*: jint {.`static`.}
  DEVICE_CORRUPTED*: jint {.`static`.}

jclass android.os.UpdateStatusConstants* of JVMObject:
  IDLE*: jint {.`static`.}
  CHECKING_FOR_UPDATE*: jint {.`static`.}
  UPDATE_AVAILABLE*: jint {.`static`.}
  DOWNLOADING*: jint {.`static`.}
  VERIFYING*: jint {.`static`.}
  FINALIZING*: jint {.`static`.}
  UPDATED_NEED_REBOOT*: jint {.`static`.}
  REPORTING_ERROR_EVENT*: jint {.`static`.}
  ATTEMPTING_ROLLBACK*: jint {.`static`.}
  DISABLED*: jint {.`static`.}

jclass android.os.AllocateSpaceResult* of JVMObject:
  proc getErrorCode*(): jint
  proc getFreeSpaceRequired*(): jlong


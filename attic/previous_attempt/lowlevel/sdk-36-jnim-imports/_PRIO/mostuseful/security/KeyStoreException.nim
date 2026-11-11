import jnim

jclass android.security.KeyStoreException* of Exception:
  proc getErrorCode*(): jint
  proc getNumericErrorCode*(): jint
  proc isTransientFailure*(): jboolean
  proc requiresUserAuthentication*(): jboolean
  proc isSystemError*(): jboolean
  proc getRetryPolicy*(): jint
  proc toString*(): string
  proc hasFailureInfoForError*(internalErrorCode: jint): jboolean {.`static`.}
  ERROR_OTHER*: jint {.`static`.}
  ERROR_USER_AUTHENTICATION_REQUIRED*: jint {.`static`.}
  ERROR_KEYSTORE_UNINITIALIZED*: jint {.`static`.}
  ERROR_INTERNAL_SYSTEM_ERROR*: jint {.`static`.}
  ERROR_PERMISSION_DENIED*: jint {.`static`.}
  ERROR_KEY_DOES_NOT_EXIST*: jint {.`static`.}
  ERROR_KEY_CORRUPTED*: jint {.`static`.}
  ERROR_ID_ATTESTATION_FAILURE*: jint {.`static`.}
  ERROR_ATTESTATION_CHALLENGE_TOO_LARGE*: jint {.`static`.}
  ERROR_KEYMINT_FAILURE*: jint {.`static`.}
  ERROR_KEYSTORE_FAILURE*: jint {.`static`.}
  ERROR_UNIMPLEMENTED*: jint {.`static`.}
  ERROR_INCORRECT_USAGE*: jint {.`static`.}
  ERROR_KEY_NOT_TEMPORALLY_VALID*: jint {.`static`.}
  ERROR_KEY_OPERATION_EXPIRED*: jint {.`static`.}
  ERROR_ATTESTATION_KEYS_UNAVAILABLE*: jint {.`static`.}
  ERROR_DEVICE_REQUIRES_UPGRADE_FOR_ATTESTATION*: jint {.`static`.}
  RETRY_NEVER*: jint {.`static`.}
  RETRY_WITH_EXPONENTIAL_BACKOFF*: jint {.`static`.}
  RETRY_WHEN_CONNECTIVITY_AVAILABLE*: jint {.`static`.}
  RETRY_AFTER_NEXT_REBOOT*: jint {.`static`.}
  RKP_SUCCESS*: jint {.`static`.}
  RKP_TEMPORARILY_UNAVAILABLE*: jint {.`static`.}
  RKP_SERVER_REFUSED_ISSUANCE*: jint {.`static`.}
  RKP_FETCHING_PENDING_CONNECTIVITY*: jint {.`static`.}
  RKP_FETCHING_PENDING_SOFTWARE_REBOOT*: jint {.`static`.}


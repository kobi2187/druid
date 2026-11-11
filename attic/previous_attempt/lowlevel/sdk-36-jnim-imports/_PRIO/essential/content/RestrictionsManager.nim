import jnim

jclass android.content.RestrictionsManager* of JVMObject:
  proc getApplicationRestrictions*(): Bundle
  proc getApplicationRestrictionsPerAdmin*(): List[Bundle]
  proc hasRestrictionsProvider*(): jboolean
  proc requestPermission*(requestType: string, requestId: string, request: PersistableBundle)
  proc createLocalApprovalIntent*(): Intent
  proc notifyPermissionResponse*(packageName: string, response: PersistableBundle)
  proc getManifestRestrictions*(packageName: string): List[RestrictionEntry]
  proc convertRestrictionsToBundle*(entries: List[RestrictionEntry]): Bundle {.`static`.}
  ACTION_PERMISSION_RESPONSE_RECEIVED*: string {.`static`.}
  ACTION_REQUEST_PERMISSION*: string {.`static`.}
  ACTION_REQUEST_LOCAL_APPROVAL*: string {.`static`.}
  EXTRA_PACKAGE_NAME*: string {.`static`.}
  EXTRA_REQUEST_TYPE*: string {.`static`.}
  EXTRA_REQUEST_ID*: string {.`static`.}
  EXTRA_REQUEST_BUNDLE*: string {.`static`.}
  EXTRA_RESPONSE_BUNDLE*: string {.`static`.}
  REQUEST_TYPE_APPROVAL*: string {.`static`.}
  REQUEST_KEY_ID*: string {.`static`.}
  REQUEST_KEY_DATA*: string {.`static`.}
  REQUEST_KEY_TITLE*: string {.`static`.}
  REQUEST_KEY_MESSAGE*: string {.`static`.}
  REQUEST_KEY_ICON*: string {.`static`.}
  REQUEST_KEY_APPROVE_LABEL*: string {.`static`.}
  REQUEST_KEY_DENY_LABEL*: string {.`static`.}
  REQUEST_KEY_NEW_REQUEST*: string {.`static`.}
  RESPONSE_KEY_RESULT*: string {.`static`.}
  RESULT_APPROVED*: jint {.`static`.}
  RESULT_DENIED*: jint {.`static`.}
  RESULT_NO_RESPONSE*: jint {.`static`.}
  RESULT_UNKNOWN_REQUEST*: jint {.`static`.}
  RESULT_ERROR*: jint {.`static`.}
  RESULT_ERROR_BAD_REQUEST*: jint {.`static`.}
  RESULT_ERROR_NETWORK*: jint {.`static`.}
  RESULT_ERROR_INTERNAL*: jint {.`static`.}
  RESPONSE_KEY_ERROR_CODE*: string {.`static`.}
  RESPONSE_KEY_MESSAGE*: string {.`static`.}
  RESPONSE_KEY_RESPONSE_TIMESTAMP*: string {.`static`.}
  META_DATA_APP_RESTRICTIONS*: string {.`static`.}


import jnim

jclass android.companion.CompanionDeviceManager* of JVMObject:
  proc associate*(request: AssociationRequest, callback: Callback, handler: Handler)
  proc associate*(request: AssociationRequest, executor: Executor, callback: Callback)
  proc buildAssociationCancellationIntent*(): IntentSender
  proc enableSystemDataSyncForTypes*(associationId: jint, flags: jint)
  proc disableSystemDataSyncForTypes*(associationId: jint, flags: jint)
  proc enablePermissionsSync*(associationId: jint)
  proc disablePermissionsSync*(associationId: jint)
  proc getPermissionSyncRequest*(associationId: jint): PermissionSyncRequest
  proc getAssociations*(): List[string]
  proc getMyAssociations*(): List[AssociationInfo]
  proc disassociate*(deviceMacAddress: string)
  proc disassociate*(associationId: jint)
  proc requestNotificationAccess*(component: ComponentName)
  proc hasNotificationAccess*(component: ComponentName): jboolean
  proc isDeviceAssociatedForWifiConnection*(packageName: string, macAddress: MacAddress, user: UserHandle): jboolean
  proc getAllAssociations*(): List[AssociationInfo]
  proc getAllAssociations*(userId: jint): List[AssociationInfo]
  proc addOnAssociationsChangedListener*(executor: Executor, listener: OnAssociationsChangedListener)
  proc addOnAssociationsChangedListener*(executor: Executor, listener: OnAssociationsChangedListener, userId: jint)
  proc removeOnAssociationsChangedListener*(listener: OnAssociationsChangedListener)
  proc addOnTransportsChangedListener*(executor: Executor, listener: Consumer[List[AssociationInfo]])
  proc removeOnTransportsChangedListener*(listener: Consumer[List[AssociationInfo]])
  proc sendMessage*(messageType: jint, data: seq[jbyte], associationIds: seq[jint])
  proc addOnMessageReceivedListener*(executor: Executor, messageType: jint, listener: BiConsumer[Integer, seq[jbyte]])
  proc removeOnMessageReceivedListener*(messageType: jint, listener: BiConsumer[Integer, seq[jbyte]])
  proc canPairWithoutPrompt*(packageName: string, deviceMacAddress: string, user: UserHandle): jboolean
  proc removeBond*(associationId: jint): jboolean
  proc startObservingDevicePresence*(deviceAddress: string)
  proc stopObservingDevicePresence*(deviceAddress: string)
  proc startObservingDevicePresence*(request: ObservingDevicePresenceRequest)
  proc stopObservingDevicePresence*(request: ObservingDevicePresenceRequest)
  proc dispatchMessage*(messageId: jint, associationId: jint, message: seq[jbyte])
  proc attachSystemDataTransport*(associationId: jint, in: InputStream, output:OutputStream)
  proc attachSystemDataTransport*(associationId: jint, in: InputStream, output:OutputStream, flags: jint)
  proc detachSystemDataTransport*(associationId: jint)
  proc associate*(packageName: string, macAddress: MacAddress, certificate: seq[jbyte])
  proc notifyDeviceAppeared*(associationId: jint)
  proc notifyDeviceDisappeared*(associationId: jint)
  proc buildPermissionTransferUserConsentIntent*(associationId: jint): IntentSender
  proc isPermissionTransferUserConsented*(associationId: jint): jboolean
  proc startSystemDataTransfer*(associationId: jint)
  proc startSystemDataTransfer*(associationId: jint, executor: Executor, result: OutcomeReceiver[Void, CompanionException])
  proc isCompanionApplicationBound*(): jboolean
  proc enableSecureTransport*(enabled: jboolean)
  proc setDeviceId*(associationId: jint, deviceId: DeviceId)
  RESULT_OK*: jint {.`static`.}
  RESULT_CANCELED*: jint {.`static`.}
  RESULT_USER_REJECTED*: jint {.`static`.}
  RESULT_DISCOVERY_TIMEOUT*: jint {.`static`.}
  RESULT_INTERNAL_ERROR*: jint {.`static`.}
  RESULT_SECURITY_ERROR*: jint {.`static`.}
  REASON_USER_REJECTED*: string {.`static`.}
  REASON_DISCOVERY_TIMEOUT*: string {.`static`.}
  REASON_INTERNAL_ERROR*: string {.`static`.}
  REASON_CANCELED*: string {.`static`.}
  FLAG_CALL_METADATA*: jint {.`static`.}
  EXTRA_DEVICE*: string {.`static`.}
  EXTRA_ASSOCIATION*: string {.`static`.}
  MESSAGE_REQUEST_PING*: jint {.`static`.}
  MESSAGE_ONEWAY_PING*: jint {.`static`.}
  MESSAGE_REQUEST_REMOTE_AUTHENTICATION*: jint {.`static`.}
  MESSAGE_REQUEST_CONTEXT_SYNC*: jint {.`static`.}
  MESSAGE_REQUEST_PERMISSION_RESTORE*: jint {.`static`.}
  MESSAGE_ONEWAY_FROM_WEARABLE*: jint {.`static`.}
  MESSAGE_ONEWAY_TO_WEARABLE*: jint {.`static`.}
  TRANSPORT_FLAG_EXTEND_PATCH_DIFF*: jint {.`static`.}

jclass android.companion.CompanionDeviceManager.Callback* of JVMObject:
  proc onDeviceFound*(intentSender: IntentSender)
  proc onAssociationPending*(intentSender: IntentSender)
  proc onAssociationCreated*(associationInfo: AssociationInfo)
  proc onFailure*(error: CharSequence)
  proc onFailure*(errorCode: jint, error: CharSequence)

jclass android.companion.Callback* of JVMObject:
  proc onDeviceFound*(intentSender: IntentSender)
  proc onAssociationPending*(intentSender: IntentSender)
  proc onAssociationCreated*(associationInfo: AssociationInfo)
  proc onFailure*(error: CharSequence)
  proc onFailure*(errorCode: jint, error: CharSequence)


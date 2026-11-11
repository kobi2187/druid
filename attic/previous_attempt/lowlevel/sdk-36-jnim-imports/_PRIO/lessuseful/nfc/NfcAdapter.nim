import jnim

jclass android.nfc.NfcAdapter* of JVMObject:
  proc getNdefNfceeService*(): IT4tNdefNfcee {.`static`.}
  proc getSupportedOffHostSecureElements*(): List[string]
  proc getNfcAdapter*(context: Context): NfcAdapter {.`static`.}
  proc getDefaultAdapter*(context: Context): NfcAdapter {.`static`.}
  proc getDefaultAdapter*(): NfcAdapter {.`static`.}
  proc getContext*(): Context
  proc getService*(): INfcAdapter {.`static`.}
  proc getTagService*(): INfcTag {.`static`.}
  proc getCardEmulationService*(): INfcCardEmulation {.`static`.}
  proc getNfcFCardEmulationService*(): INfcFCardEmulation {.`static`.}
  proc getNfcDtaInterface*(): INfcDta
  proc attemptDeadServiceRecovery*(e: RemoteException) {.`static`.}
  proc isEnabled*(): jboolean
  proc getAdapterState*(): jint
  proc enable*(): jboolean
  proc disable*(): jboolean
  proc disable*(persist: jboolean): jboolean
  proc pausePolling*(timeoutInMs: jint)
  proc isReaderModeAnnotationSupported*(): jboolean
  proc isObserveModeSupported*(): jboolean
  proc isObserveModeEnabled*(): jboolean
  proc setObserveModeEnabled*(enabled: jboolean): jboolean
  proc resumePolling*()
  proc setBeamPushUris*(uris: seq[Uri], activity: Activity)
  proc setBeamPushUrisCallback*(callback: CreateBeamUrisCallback, activity: Activity)
  proc setNdefPushMessage*(message: NdefMessage, activity: Activity, activities: Activity)
  proc setNdefPushMessage*(message: NdefMessage, activity: Activity, flags: jint)
  proc setNdefPushMessageCallback*(callback: CreateNdefMessageCallback, activity: Activity, activities: Activity)
  proc setOnNdefPushCompleteCallback*(callback: OnNdefPushCompleteCallback, activity: Activity, activities: Activity)
  proc enableForegroundDispatch*(activity: Activity, intent: PendingIntent, filters: seq[IntentFilter], techLists: seq[seq[string]])
  proc disableForegroundDispatch*(activity: Activity)
  proc enableReaderMode*(activity: Activity, callback: ReaderCallback, flags: jint, extras: Bundle)
  proc disableReaderMode*(activity: Activity)
  proc setReaderModePollingEnabled*(enable: jboolean)
  proc setDiscoveryTechnology*(activity: Activity, pollTechnology: jint, listenTechnology: jint)
  proc resetDiscoveryTechnology*(activity: Activity)
  proc invokeBeam*(activity: Activity): jboolean
  proc enableForegroundNdefPush*(activity: Activity, message: NdefMessage)
  proc disableForegroundNdefPush*(activity: Activity)
  proc enableSecureNfc*(enable: jboolean): jboolean
  proc isSecureNfcSupported*(): jboolean
  proc getNfcAntennaInfo*(): NfcAntennaInfo
  proc isSecureNfcEnabled*(): jboolean
  proc enableReaderOption*(enable: jboolean): jboolean
  proc isReaderOptionSupported*(): jboolean
  proc isReaderOptionEnabled*(): jboolean
  proc enableNdefPush*(): jboolean
  proc disableNdefPush*(): jboolean
  proc isNdefPushEnabled*(): jboolean
  proc ignore*(tag: Tag, debounceMs: jint, tagRemovedListener: OnTagRemovedListener, handler: Handler): jboolean
  proc dispatch*(tag: Tag)
  proc addNfcUnlockHandler*(unlockHandler: NfcUnlockHandler, tagTechnologies: seq[string]): jboolean
  proc removeNfcUnlockHandler*(unlockHandler: NfcUnlockHandler): jboolean
  proc getNfcAdapterExtrasInterface*(): INfcAdapterExtras
  proc enforceResumed*(activity: Activity)
  proc getSdkVersion*(): jint
  proc setControllerAlwaysOn*(value: jboolean): jboolean
  proc isControllerAlwaysOn*(): jboolean
  proc isControllerAlwaysOnSupported*(): jboolean
  proc registerControllerAlwaysOnListener*(executor: Executor, listener: ControllerAlwaysOnListener)
  proc unregisterControllerAlwaysOnListener*(listener: ControllerAlwaysOnListener)
  proc setTagIntentAppPreferenceForUser*(userId: jint, pkg: string, allow: jboolean): jint
  proc getTagIntentAppPreferenceForUser*(userId: jint): Map[string, Boolean]
  proc isTagIntentAppPreferenceSupported*(): jboolean
  proc notifyPollingLoop*(pollingFrame: PollingFrame)
  proc notifyTestHceData*(technology: jint, data: seq[jbyte])
  proc callService*(call: ServiceCall) {.`static`.}
  proc callServiceReturn*(call: ServiceCallReturn[T], defaultReturn: T): T {.`static`.}
  proc notifyHceDeactivated*()
  proc setWlcEnabled*(enable: jboolean): jboolean
  proc isWlcEnabled*(): jboolean
  proc registerWlcStateListener*(executor: Executor, listener: WlcStateListener)
  proc unregisterWlcStateListener*(listener: WlcStateListener)
  proc getWlcListenerDeviceInfo*(): WlcListenerDeviceInfo
  proc sendVendorNciMessage*(mt: jint, gid: jint, oid: jint, payload: seq[jbyte]): jint
  proc registerNfcVendorNciCallback*(executor: Executor, callback: NfcVendorNciCallback)
  proc unregisterNfcVendorNciCallback*(callback: NfcVendorNciCallback)
  proc indicateDataMigration*(inProgress: jboolean)
  proc getNfcOemExtension*(): NfcOemExtension
  proc isTagIntentAllowed*(): jboolean
  ACTION_NDEF_DISCOVERED*: string {.`static`.}
  ACTION_TECH_DISCOVERED*: string {.`static`.}
  ACTION_TAG_DISCOVERED*: string {.`static`.}
  ACTION_TRANSACTION_DETECTED*: string {.`static`.}
  ACTION_PREFERRED_PAYMENT_CHANGED*: string {.`static`.}
  ACTION_TAG_LEFT_FIELD*: string {.`static`.}
  EXTRA_TAG*: string {.`static`.}
  EXTRA_NDEF_MESSAGES*: string {.`static`.}
  EXTRA_ID*: string {.`static`.}
  ACTION_ADAPTER_STATE_CHANGED*: string {.`static`.}
  EXTRA_ADAPTER_STATE*: string {.`static`.}
  EXTRA_AID*: string {.`static`.}
  EXTRA_DATA*: string {.`static`.}
  EXTRA_SECURE_ELEMENT_NAME*: string {.`static`.}
  EXTRA_PREFERRED_PAYMENT_CHANGED_REASON*: string {.`static`.}
  EXTRA_READER_TECH_A_POLLING_LOOP_ANNOTATION*: string {.`static`.}
  PREFERRED_PAYMENT_LOADED*: jint {.`static`.}
  PREFERRED_PAYMENT_CHANGED*: jint {.`static`.}
  PREFERRED_PAYMENT_UPDATED*: jint {.`static`.}
  STATE_OFF*: jint {.`static`.}
  STATE_TURNING_ON*: jint {.`static`.}
  STATE_ON*: jint {.`static`.}
  STATE_TURNING_OFF*: jint {.`static`.}
  FLAG_READER_NFC_A*: jint {.`static`.}
  FLAG_READER_NFC_B*: jint {.`static`.}
  FLAG_READER_NFC_F*: jint {.`static`.}
  FLAG_READER_NFC_V*: jint {.`static`.}
  FLAG_READER_NFC_BARCODE*: jint {.`static`.}
  FLAG_READER_SKIP_NDEF_CHECK*: jint {.`static`.}
  FLAG_READER_NO_PLATFORM_SOUNDS*: jint {.`static`.}
  EXTRA_READER_PRESENCE_CHECK_DELAY*: string {.`static`.}
  FLAG_LISTEN_NFC_PASSIVE_A*: jint {.`static`.}
  FLAG_LISTEN_NFC_PASSIVE_B*: jint {.`static`.}
  FLAG_LISTEN_NFC_PASSIVE_F*: jint {.`static`.}
  FLAG_LISTEN_DISABLE*: jint {.`static`.}
  FLAG_READER_DISABLE*: jint {.`static`.}
  FLAG_LISTEN_KEEP*: jint {.`static`.}
  FLAG_READER_KEEP*: jint {.`static`.}
  FLAG_USE_ALL_TECH*: jint {.`static`.}
  FLAG_SET_DEFAULT_TECH*: jint {.`static`.}
  FLAG_NDEF_PUSH_NO_CONFIRM*: jint {.`static`.}
  ACTION_HANDOVER_TRANSFER_STARTED*: string {.`static`.}
  ACTION_HANDOVER_TRANSFER_DONE*: string {.`static`.}
  EXTRA_HANDOVER_TRANSFER_STATUS*: string {.`static`.}
  HANDOVER_TRANSFER_STATUS_SUCCESS*: jint {.`static`.}
  HANDOVER_TRANSFER_STATUS_FAILURE*: jint {.`static`.}
  EXTRA_HANDOVER_TRANSFER_URI*: string {.`static`.}
  ACTION_REQUIRE_UNLOCK_FOR_NFC*: string {.`static`.}
  ACTION_SHOW_NFC_RESOLVER*: string {.`static`.}
  EXTRA_RESOLVE_INFOS*: string {.`static`.}
  TAG_INTENT_APP_PREF_RESULT_SUCCESS*: jint {.`static`.}
  TAG_INTENT_APP_PREF_RESULT_PACKAGE_NOT_FOUND*: jint {.`static`.}
  TAG_INTENT_APP_PREF_RESULT_UNAVAILABLE*: jint {.`static`.}
  CONTROLLER_ALWAYS_ON_MODE_DEFAULT*: jint {.`static`.}
  CONTROLLER_ALWAYS_ON_DISABLE*: jint {.`static`.}
  SEND_VENDOR_NCI_STATUS_SUCCESS*: jint {.`static`.}
  SEND_VENDOR_NCI_STATUS_REJECTED*: jint {.`static`.}
  SEND_VENDOR_NCI_STATUS_MESSAGE_CORRUPTED*: jint {.`static`.}
  SEND_VENDOR_NCI_STATUS_FAILED*: jint {.`static`.}
  MESSAGE_TYPE_COMMAND*: jint {.`static`.}
  ACTION_CHANGE_TAG_INTENT_PREFERENCE*: string {.`static`.}

jclass android.nfc.NfcAdapter.ReaderCallback* of JVMObject:
  proc onTagDiscovered*(tag: Tag)

jclass android.nfc.NfcAdapter.OnNdefPushCompleteCallback* of JVMObject:
  proc onNdefPushComplete*(event: NfcEvent)

jclass android.nfc.NfcAdapter.CreateNdefMessageCallback* of JVMObject:
  proc createNdefMessage*(event: NfcEvent): NdefMessage

jclass android.nfc.NfcAdapter.CreateBeamUrisCallback* of JVMObject:
  proc createBeamUris*(event: NfcEvent): seq[Uri]

jclass android.nfc.NfcAdapter.NfcUnlockHandler* of JVMObject:
  proc onUnlockAttempted*(tag: Tag): jboolean

jclass android.nfc.ReaderCallback* of JVMObject:
  proc onTagDiscovered*(tag: Tag)


jclass android.nfc.OnNdefPushCompleteCallback* of JVMObject:
  proc onNdefPushComplete*(event: NfcEvent)

jclass android.nfc.CreateNdefMessageCallback* of JVMObject:
  proc createNdefMessage*(event: NfcEvent): NdefMessage

jclass android.nfc.CreateBeamUrisCallback* of JVMObject:
  proc createBeamUris*(event: NfcEvent): seq[Uri]


jclass android.nfc.NfcUnlockHandler* of JVMObject:
  proc onUnlockAttempted*(tag: Tag): jboolean




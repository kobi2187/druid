import jnim

jclass android.bluetooth.BluetoothDevice* of JVMObject:
  proc setAttributionSource*(attributionSource: AttributionSource)
  proc prepareToEnterProcess*(attributionSource: AttributionSource)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getAddress*(): string
  proc getAddressType*(): jint
  proc getAnonymizedAddress*(): string
  proc getIdentityAddress*(): string
  proc getIdentityAddressWithType*(): BluetoothAddress
  proc getName*(): string
  proc getType*(): jint
  proc getAlias*(): string
  proc setAlias*(alias: string): jint
  proc getBatteryLevel*(): jint
  proc createBond*(): jboolean
  proc createBond*(transport: jint): jboolean
  proc createBondOutOfBand*(transport: jint, remoteP192Data: OobData, remoteP256Data: OobData): jboolean
  proc isBondingInitiatedLocally*(): jboolean
  proc cancelBondProcess*(): jboolean
  proc removeBond*(): jboolean
  proc disableBluetoothGetBondStateCache*()
  proc invalidateBluetoothGetBondStateCache*() {.`static`.}
  proc getBondState*(): jint
  proc canBondWithoutDialog*(): jboolean
  proc getPackageNameOfBondingApplication*(): string
  proc connect*(): jint
  proc disconnect*(): jint
  proc isConnected*(): jboolean
  proc getConnectionHandle*(transport: jint): jint
  proc isEncrypted*(): jboolean
  proc getBluetoothClass*(): BluetoothClass
  proc getUuids*(): seq[ParcelUuid]
  proc fetchUuidsWithSdp*(): jboolean
  proc fetchUuidsWithSdp*(transport: jint): jboolean
  proc sdpSearch*(uuid: ParcelUuid): jboolean
  proc setPin*(pin: seq[jbyte]): jboolean
  proc setPin*(pin: string): jboolean
  proc setPairingConfirmation*(confirm: jboolean): jboolean
  proc getPhonebookAccessPermission*(): jint
  proc setSilenceMode*(silence: jboolean): jboolean
  proc isInSilenceMode*(): jboolean
  proc setPhonebookAccessPermission*(value: jint): jboolean
  proc getMessageAccessPermission*(): jint
  proc setMessageAccessPermission*(value: jint): jboolean
  proc getSimAccessPermission*(): jint
  proc setSimAccessPermission*(value: jint): jboolean
  proc createRfcommSocket*(channel: jint): BluetoothSocket
  proc createL2capSocket*(channel: jint): BluetoothSocket
  proc createInsecureL2capSocket*(channel: jint): BluetoothSocket
  proc createRfcommSocketToServiceRecord*(uuid: UUID): BluetoothSocket
  proc createInsecureRfcommSocketToServiceRecord*(uuid: UUID): BluetoothSocket
  proc createInsecureRfcommSocket*(port: jint): BluetoothSocket
  proc createScoSocket*(): BluetoothSocket
  proc convertPinToBytes*(pin: string): seq[jbyte] {.`static`.}
  proc connectGatt*(context: Context, autoConnect: jboolean, callback: BluetoothGattCallback): BluetoothGatt
  proc connectGatt*(context: Context, autoConnect: jboolean, callback: BluetoothGattCallback, transport: jint): BluetoothGatt
  proc connectGatt*(context: Context, autoConnect: jboolean, callback: BluetoothGattCallback, transport: jint, phy: jint): BluetoothGatt
  proc connectGatt*(context: Context, autoConnect: jboolean, callback: BluetoothGattCallback, transport: jint, phy: jint, handler: Handler): BluetoothGatt
  proc connectGatt*(context: Context, autoConnect: jboolean, callback: BluetoothGattCallback, transport: jint, opportunistic: jboolean, phy: jint, handler: Handler): BluetoothGatt
  proc createL2capChannel*(psm: jint): BluetoothSocket
  proc createInsecureL2capChannel*(psm: jint): BluetoothSocket
  proc createUsingSocketSettings*(settings: BluetoothSocketSettings): BluetoothSocket
  proc setMetadata*(key: jint, value: seq[jbyte]): jboolean
  proc getMetadata*(key: jint): seq[jbyte]
  proc getMaxMetadataKey*(): jint {.`static`.}
  proc isRequestAudioPolicyAsSinkSupported*(): jint
  proc requestAudioPolicyAsSink*(policies: BluetoothSinkAudioPolicy): jint
  proc getRequestedAudioPolicyAsSink*(): BluetoothSinkAudioPolicy
  proc setLowLatencyAudioAllowed*(allowed: jboolean): jboolean
  proc setActiveAudioDevicePolicy*(activeAudioDevicePolicy: jint): jint
  proc getActiveAudioDevicePolicy*(): jint
  proc setMicrophonePreferredForCalls*(enabled: jboolean): jint
  proc isMicrophonePreferredForCalls*(): jboolean
  proc getKeyMissingCount*(): jint
  CONNECTION_STATE_DISCONNECTED*: jint {.`static`.}
  CONNECTION_STATE_CONNECTED*: jint {.`static`.}
  CONNECTION_STATE_ENCRYPTED_BREDR*: jint {.`static`.}
  CONNECTION_STATE_ENCRYPTED_LE*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  ACTION_FOUND*: string {.`static`.}
  ACTION_CLASS_CHANGED*: string {.`static`.}
  ACTION_ACL_CONNECTED*: string {.`static`.}
  ACTION_ACL_DISCONNECT_REQUESTED*: string {.`static`.}
  ACTION_ACL_DISCONNECTED*: string {.`static`.}
  ACTION_NAME_CHANGED*: string {.`static`.}
  ACTION_ALIAS_CHANGED*: string {.`static`.}
  ACTION_BOND_STATE_CHANGED*: string {.`static`.}
  ACTION_BATTERY_LEVEL_CHANGED*: string {.`static`.}
  ACTION_SWITCH_BUFFER_SIZE*: string {.`static`.}
  ACTION_KEY_MISSING*: string {.`static`.}
  ACTION_ENCRYPTION_CHANGE*: string {.`static`.}
  EXTRA_BATTERY_LEVEL*: string {.`static`.}
  BATTERY_LEVEL_UNKNOWN*: jint {.`static`.}
  BATTERY_LEVEL_BLUETOOTH_OFF*: jint {.`static`.}
  EXTRA_DEVICE*: string {.`static`.}
  EXTRA_NAME*: string {.`static`.}
  EXTRA_RSSI*: string {.`static`.}
  EXTRA_IS_COORDINATED_SET_MEMBER*: string {.`static`.}
  EXTRA_CLASS*: string {.`static`.}
  EXTRA_BOND_STATE*: string {.`static`.}
  EXTRA_PREVIOUS_BOND_STATE*: string {.`static`.}
  EXTRA_LOW_LATENCY_BUFFER_SIZE*: string {.`static`.}
  BOND_NONE*: jint {.`static`.}
  BOND_BONDING*: jint {.`static`.}
  BOND_BONDED*: jint {.`static`.}
  EXTRA_UNBOND_REASON*: string {.`static`.}
  EXTRA_REASON*: string {.`static`.}
  EXTRA_PAIRING_VARIANT*: string {.`static`.}
  EXTRA_PAIRING_KEY*: string {.`static`.}
  EXTRA_PAIRING_INITIATOR*: string {.`static`.}
  EXTRA_KEY_SIZE*: string {.`static`.}
  EXTRA_ENCRYPTION_ALGORITHM*: string {.`static`.}
  ENCRYPTION_ALGORITHM_NONE*: jint {.`static`.}
  ENCRYPTION_ALGORITHM_E0*: jint {.`static`.}
  ENCRYPTION_ALGORITHM_AES*: jint {.`static`.}
  EXTRA_ENCRYPTION_STATUS*: string {.`static`.}
  EXTRA_ENCRYPTION_ENABLED*: string {.`static`.}
  EXTRA_PAIRING_INITIATOR_FOREGROUND*: jint {.`static`.}
  EXTRA_PAIRING_INITIATOR_BACKGROUND*: jint {.`static`.}
  DEVICE_TYPE_UNKNOWN*: jint {.`static`.}
  DEVICE_TYPE_CLASSIC*: jint {.`static`.}
  DEVICE_TYPE_LE*: jint {.`static`.}
  DEVICE_TYPE_DUAL*: jint {.`static`.}
  ACTION_SDP_RECORD*: string {.`static`.}
  METADATA_MAX_LENGTH*: jint {.`static`.}
  METADATA_MANUFACTURER_NAME*: jint {.`static`.}
  METADATA_MODEL_NAME*: jint {.`static`.}
  METADATA_MODEL_YEAR*: jint {.`static`.}
  METADATA_SOFTWARE_VERSION*: jint {.`static`.}
  METADATA_HARDWARE_VERSION*: jint {.`static`.}
  METADATA_COMPANION_APP*: jint {.`static`.}
  METADATA_MAIN_ICON*: jint {.`static`.}
  METADATA_IS_UNTETHERED_HEADSET*: jint {.`static`.}
  METADATA_UNTETHERED_LEFT_ICON*: jint {.`static`.}
  METADATA_UNTETHERED_RIGHT_ICON*: jint {.`static`.}
  METADATA_UNTETHERED_CASE_ICON*: jint {.`static`.}
  METADATA_UNTETHERED_LEFT_BATTERY*: jint {.`static`.}
  METADATA_UNTETHERED_RIGHT_BATTERY*: jint {.`static`.}
  METADATA_UNTETHERED_CASE_BATTERY*: jint {.`static`.}
  METADATA_UNTETHERED_LEFT_CHARGING*: jint {.`static`.}
  METADATA_UNTETHERED_RIGHT_CHARGING*: jint {.`static`.}
  METADATA_UNTETHERED_CASE_CHARGING*: jint {.`static`.}
  METADATA_ENHANCED_SETTINGS_UI_URI*: jint {.`static`.}
  COMPANION_TYPE_PRIMARY*: string {.`static`.}
  COMPANION_TYPE_SECONDARY*: string {.`static`.}
  COMPANION_TYPE_NONE*: string {.`static`.}
  METADATA_DEVICE_TYPE*: jint {.`static`.}
  METADATA_MAIN_BATTERY*: jint {.`static`.}
  METADATA_MAIN_CHARGING*: jint {.`static`.}
  METADATA_MAIN_LOW_BATTERY_THRESHOLD*: jint {.`static`.}
  METADATA_UNTETHERED_LEFT_LOW_BATTERY_THRESHOLD*: jint {.`static`.}
  METADATA_UNTETHERED_RIGHT_LOW_BATTERY_THRESHOLD*: jint {.`static`.}
  METADATA_UNTETHERED_CASE_LOW_BATTERY_THRESHOLD*: jint {.`static`.}
  METADATA_SPATIAL_AUDIO*: jint {.`static`.}
  METADATA_FAST_PAIR_CUSTOMIZED_FIELDS*: jint {.`static`.}
  METADATA_LE_AUDIO*: jint {.`static`.}
  METADATA_GMCS_CCCD*: jint {.`static`.}
  METADATA_GTBS_CCCD*: jint {.`static`.}
  METADATA_EXCLUSIVE_MANAGER*: jint {.`static`.}
  METADATA_HEAD_UNIT_MANUFACTURER_NAME*: jint {.`static`.}
  METADATA_HEAD_UNIT_MODEL_NAME*: jint {.`static`.}
  METADATA_HEAD_UNIT_BUILD*: jint {.`static`.}
  METADATA_HEAD_UNIT_SOFTWARE_VERSION*: jint {.`static`.}
  DEVICE_TYPE_DEFAULT*: string {.`static`.}
  DEVICE_TYPE_WATCH*: string {.`static`.}
  DEVICE_TYPE_UNTETHERED_HEADSET*: string {.`static`.}
  DEVICE_TYPE_STYLUS*: string {.`static`.}
  DEVICE_TYPE_SPEAKER*: string {.`static`.}
  DEVICE_TYPE_HEADSET*: string {.`static`.}
  DEVICE_TYPE_CARKIT*: string {.`static`.}
  DEVICE_TYPE_HEARING_AID*: string {.`static`.}
  ACTION_UUID*: string {.`static`.}
  ACTION_MAS_INSTANCE*: string {.`static`.}
  ACTION_NAME_FAILED*: string {.`static`.}
  ACTION_PAIRING_REQUEST*: string {.`static`.}
  ACTION_PAIRING_CANCEL*: string {.`static`.}
  ACTION_CONNECTION_ACCESS_REQUEST*: string {.`static`.}
  ACTION_CONNECTION_ACCESS_REPLY*: string {.`static`.}
  ACTION_CONNECTION_ACCESS_CANCEL*: string {.`static`.}
  ACTION_SILENCE_MODE_CHANGED*: string {.`static`.}
  EXTRA_ACCESS_REQUEST_TYPE*: string {.`static`.}
  REQUEST_TYPE_PROFILE_CONNECTION*: jint {.`static`.}
  REQUEST_TYPE_PHONEBOOK_ACCESS*: jint {.`static`.}
  REQUEST_TYPE_MESSAGE_ACCESS*: jint {.`static`.}
  REQUEST_TYPE_SIM_ACCESS*: jint {.`static`.}
  EXTRA_PACKAGE_NAME*: string {.`static`.}
  EXTRA_CLASS_NAME*: string {.`static`.}
  EXTRA_CONNECTION_ACCESS_RESULT*: string {.`static`.}
  CONNECTION_ACCESS_YES*: jint {.`static`.}
  CONNECTION_ACCESS_NO*: jint {.`static`.}
  EXTRA_ALWAYS_ALLOWED*: string {.`static`.}
  BOND_SUCCESS*: jint {.`static`.}
  UNBOND_REASON_AUTH_FAILED*: jint {.`static`.}
  UNBOND_REASON_AUTH_REJECTED*: jint {.`static`.}
  UNBOND_REASON_AUTH_CANCELED*: jint {.`static`.}
  UNBOND_REASON_REMOTE_DEVICE_DOWN*: jint {.`static`.}
  UNBOND_REASON_DISCOVERY_IN_PROGRESS*: jint {.`static`.}
  UNBOND_REASON_AUTH_TIMEOUT*: jint {.`static`.}
  UNBOND_REASON_REPEATED_ATTEMPTS*: jint {.`static`.}
  UNBOND_REASON_REMOTE_AUTH_CANCELED*: jint {.`static`.}
  UNBOND_REASON_REMOVED*: jint {.`static`.}
  PAIRING_VARIANT_PIN*: jint {.`static`.}
  PAIRING_VARIANT_PASSKEY*: jint {.`static`.}
  PAIRING_VARIANT_PASSKEY_CONFIRMATION*: jint {.`static`.}
  PAIRING_VARIANT_CONSENT*: jint {.`static`.}
  PAIRING_VARIANT_DISPLAY_PASSKEY*: jint {.`static`.}
  PAIRING_VARIANT_DISPLAY_PIN*: jint {.`static`.}
  PAIRING_VARIANT_OOB_CONSENT*: jint {.`static`.}
  PAIRING_VARIANT_PIN_16_DIGITS*: jint {.`static`.}
  EXTRA_UUID*: string {.`static`.}
  EXTRA_SDP_RECORD*: string {.`static`.}
  EXTRA_SDP_SEARCH_STATUS*: string {.`static`.}
  ACCESS_UNKNOWN*: jint {.`static`.}
  ACCESS_ALLOWED*: jint {.`static`.}
  ACCESS_REJECTED*: jint {.`static`.}
  TRANSPORT_AUTO*: jint {.`static`.}
  TRANSPORT_BREDR*: jint {.`static`.}
  TRANSPORT_LE*: jint {.`static`.}
  PHY_LE_1M*: jint {.`static`.}
  PHY_LE_2M*: jint {.`static`.}
  PHY_LE_CODED*: jint {.`static`.}
  PHY_LE_1M_MASK*: jint {.`static`.}
  PHY_LE_2M_MASK*: jint {.`static`.}
  PHY_LE_CODED_MASK*: jint {.`static`.}
  PHY_OPTION_NO_PREFERRED*: jint {.`static`.}
  PHY_OPTION_S2*: jint {.`static`.}
  PHY_OPTION_S8*: jint {.`static`.}
  EXTRA_MAS_INSTANCE*: string {.`static`.}
  EXTRA_TRANSPORT*: string {.`static`.}
  ADDRESS_TYPE_PUBLIC*: jint {.`static`.}
  ADDRESS_TYPE_RANDOM*: jint {.`static`.}
  ADDRESS_TYPE_UNKNOWN*: jint {.`static`.}
  ADDRESS_TYPE_ANONYMOUS*: jint {.`static`.}
  ACTIVE_AUDIO_DEVICE_POLICY_DEFAULT*: jint {.`static`.}
  ACTIVE_AUDIO_DEVICE_POLICY_ALL_PROFILES_ACTIVE_UPON_CONNECTION*: jint {.`static`.}
  ACTIVE_AUDIO_DEVICE_POLICY_ALL_PROFILES_INACTIVE_UPON_CONNECTION*: jint {.`static`.}
  CREATOR*: Creator[BluetoothDevice] {.`static`.}

jclass android.bluetooth.BluetoothDevice.BluetoothAddress* of JVMObject:
  proc getAddress*(): string
  proc getAddressType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.bluetooth.BluetoothAddress* of JVMObject:
  proc getAddress*(): string
  proc getAddressType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[BluetoothAddress] {.`static`.}


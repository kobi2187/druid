import jnim

jclass android.bluetooth.BluetoothSocketSettings* of JVMObject:
  proc getSocketType*(): jint
  proc getL2capPsm*(): jint
  proc getRfcommServiceName*(): string
  proc getRfcommUuid*(): UUID
  proc isEncryptionRequired*(): jboolean
  proc isAuthenticationRequired*(): jboolean
  proc getDataPath*(): jint
  proc getSocketName*(): string
  proc getHubId*(): jlong
  proc getEndpointId*(): jlong
  proc getRequestedMaximumPacketSize*(): jint
  proc toString*(): string
  DATA_PATH_NO_OFFLOAD*: jint {.`static`.}
  DATA_PATH_HARDWARE_OFFLOAD*: jint {.`static`.}

jclass android.bluetooth.BluetoothSocketSettings.Builder* of JVMObject:
  proc setSocketType*(socketType: jint): Builder
  proc setL2capPsm*(l2capPsm: jint): Builder
  proc setEncryptionRequired*(encryptionRequired: jboolean): Builder
  proc setAuthenticationRequired*(authenticationRequired: jboolean): Builder
  proc setRfcommServiceName*(rfcommServiceName: string): Builder
  proc setRfcommUuid*(rfcommUuid: UUID): Builder
  proc setDataPath*(dataPath: jint): Builder
  proc setSocketName*(socketName: string): Builder
  proc setHubId*(hubId: jlong): Builder
  proc setEndpointId*(endpointId: jlong): Builder
  proc setRequestedMaximumPacketSize*(maximumPacketSize: jint): Builder
  proc build*(): BluetoothSocketSettings

jclass android.bluetooth.Builder* of JVMObject:
  proc setSocketType*(socketType: jint): Builder
  proc setL2capPsm*(l2capPsm: jint): Builder
  proc setEncryptionRequired*(encryptionRequired: jboolean): Builder
  proc setAuthenticationRequired*(authenticationRequired: jboolean): Builder
  proc setRfcommServiceName*(rfcommServiceName: string): Builder
  proc setRfcommUuid*(rfcommUuid: UUID): Builder
  proc setDataPath*(dataPath: jint): Builder
  proc setSocketName*(socketName: string): Builder
  proc setHubId*(hubId: jlong): Builder
  proc setEndpointId*(endpointId: jlong): Builder
  proc setRequestedMaximumPacketSize*(maximumPacketSize: jint): Builder
  proc build*(): BluetoothSocketSettings


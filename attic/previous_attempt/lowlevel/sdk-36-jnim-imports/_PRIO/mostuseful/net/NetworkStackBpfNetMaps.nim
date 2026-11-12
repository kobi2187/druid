import jnim

jclass android.net.NetworkStackBpfNetMaps* of JVMObject:
  proc getInstance*(): NetworkStackBpfNetMaps {.`static`.}
  proc isChainEnabled*(chain: jint): jboolean
  proc getUidRule*(chain: jint, uid: jint): jint
  proc isUidNetworkingBlocked*(uid: jint, isNetworkMetered: jboolean): jboolean
  proc getDataSaverEnabled*(): jboolean

jclass android.net.NetworkStackBpfNetMaps.Dependencies* of JVMObject:
  proc getConfigurationMap*(): IBpfMap[S32, U32]
  proc getUidOwnerMap*(): IBpfMap[S32, UidOwnerValue]
  proc getDataSaverEnabledMap*(): IBpfMap[S32, U8]

jclass android.net.Dependencies* of JVMObject:
  proc getConfigurationMap*(): IBpfMap[S32, U32]
  proc getUidOwnerMap*(): IBpfMap[S32, UidOwnerValue]
  proc getDataSaverEnabledMap*(): IBpfMap[S32, U8]


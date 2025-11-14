import jnim

jclass android.net.BpfNetMapsUtils* of JVMObject:
  proc getMatchByFirewallChain*(chain: jint): jlong {.`static`.}
  proc isFirewallAllowList*(chain: jint): jboolean {.`static`.}
  proc matchToString*(matchMask: jlong): string {.`static`.}
  proc throwIfPreT*(msg: string) {.`static`.}
  proc isChainEnabled*(configurationMap: IBpfMap[S32, U32], chain: jint): jboolean {.`static`.}
  proc getUidRule*(uidOwnerMap: IBpfMap[S32, UidOwnerValue], chain: jint, uid: jint): jint {.`static`.}
  proc getUidNetworkingBlockedReasons*(uid: jint, configurationMap: IBpfMap[S32, U32], uidOwnerMap: IBpfMap[S32, UidOwnerValue], dataSaverEnabledMap: IBpfMap[S32, U8]): jint {.`static`.}
  proc isUidNetworkingBlocked*(uid: jint, isNetworkMetered: jboolean, configurationMap: IBpfMap[S32, U32], uidOwnerMap: IBpfMap[S32, UidOwnerValue], dataSaverEnabledMap: IBpfMap[S32, U8]): jboolean {.`static`.}
  proc getDataSaverEnabled*(dataSaverEnabledMap: IBpfMap[S32, U8]): jboolean {.`static`.}


import jnim

jclass android.telephony.LocationAccessPolicy* of JVMObject:
  proc checkLocationPermission*(context: Context, query: LocationPermissionQuery): LocationPermissionResult {.`static`.}
  proc isLocationModeEnabled*(context: Context, userId: jint): jboolean {.`static`.}
  proc getLocationBypassPackages*(context: Context): seq[string] {.`static`.}
  MAX_SDK_FOR_ANY_ENFORCEMENT*: jint {.`static`.}

jclass android.telephony.LocationPermissionQuery* of JVMObject:
  callingPackage*: string
  callingFeatureId*: string
  callingUid*: jint
  callingPid*: jint
  minSdkVersionForCoarse*: jint
  minSdkVersionForFine*: jint
  logAsInfo*: jboolean
  method*: string

jclass android.telephony.LocationPermissionQuery.Builder* of JVMObject:
  proc setCallingPackage*(callingPackage: string): Builder
  proc setCallingFeatureId*(callingFeatureId: string): Builder
  proc setCallingUid*(callingUid: jint): Builder
  proc setCallingPid*(callingPid: jint): Builder
  proc setMinSdkVersionForCoarse*(minSdkVersionForCoarse: jint): Builder
  proc setMinSdkVersionForFine*(minSdkVersionForFine: jint): Builder
  proc setMinSdkVersionForEnforcement*(minSdkVersionForEnforcement: jint): Builder
  proc setMethod*(method: string): Builder
  proc setLogAsInfo*(logAsInfo: jboolean): Builder
  proc build*(): LocationPermissionQuery

jclass android.telephony.Builder* of JVMObject:
  proc setCallingPackage*(callingPackage: string): Builder
  proc setCallingFeatureId*(callingFeatureId: string): Builder
  proc setCallingUid*(callingUid: jint): Builder
  proc setCallingPid*(callingPid: jint): Builder
  proc setMinSdkVersionForCoarse*(minSdkVersionForCoarse: jint): Builder
  proc setMinSdkVersionForFine*(minSdkVersionForFine: jint): Builder
  proc setMinSdkVersionForEnforcement*(minSdkVersionForEnforcement: jint): Builder
  proc setMethod*(method: string): Builder
  proc setLogAsInfo*(logAsInfo: jboolean): Builder
  proc build*(): LocationPermissionQuery


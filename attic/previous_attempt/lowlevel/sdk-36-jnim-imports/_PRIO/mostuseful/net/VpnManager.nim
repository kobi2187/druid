import jnim

jclass android.net.VpnManager* of JVMObject:
  proc provisionVpnProfile*(profile: PlatformVpnProfile): Intent
  proc deleteProvisionedVpnProfile*()
  proc startProvisionedVpnProfileSession*(): string
  proc startProvisionedVpnProfile*()
  proc stopProvisionedVpnProfile*()
  proc getVpnConfig*(userId: jint): VpnConfig
  proc getProvisionedVpnProfileState*(): VpnProfileState
  proc factoryReset*()
  proc prepareVpn*(oldPackage: string, newPackage: string, userId: jint): jboolean
  proc setVpnPackageAuthorization*(packageName: string, userId: jint, vpnType: jint)
  proc isAlwaysOnVpnPackageSupportedForUser*(userId: jint, vpnPackage: string): jboolean
  proc setAlwaysOnVpnPackageForUser*(userId: jint, vpnPackage: string, lockdownEnabled: jboolean, lockdownAllowlist: List[string]): jboolean
  proc getAlwaysOnVpnPackageForUser*(userId: jint): string
  proc isVpnLockdownEnabled*(userId: jint): jboolean
  proc setAppExclusionList*(userId: jint, vpnPackage: string, excludedApps: List[string]): jboolean
  proc getAppExclusionList*(userId: jint, vpnPackage: string): List[string]
  proc getVpnLockdownAllowlist*(userId: jint): List[string]
  proc getLegacyVpnInfo*(userId: jint): LegacyVpnInfo
  proc startLegacyVpn*(profile: VpnProfile)
  proc updateLockdownVpn*(): jboolean
  proc getFromVpnProfileStore*(name: string): seq[jbyte]
  proc putIntoVpnProfileStore*(name: string, blob: seq[jbyte]): jboolean
  proc removeFromVpnProfileStore*(name: string): jboolean
  proc listFromVpnProfileStore*(prefix: string): seq[string]
  TYPE_VPN_NONE*: jint {.`static`.}
  TYPE_VPN_SERVICE*: jint {.`static`.}
  TYPE_VPN_PLATFORM*: jint {.`static`.}
  TYPE_VPN_LEGACY*: jint {.`static`.}
  TYPE_VPN_OEM*: jint {.`static`.}
  TYPE_VPN_OEM_SERVICE*: jint {.`static`.}
  TYPE_VPN_OEM_LEGACY*: jint {.`static`.}
  NOTIFICATION_CHANNEL_VPN*: string {.`static`.}
  ACTION_VPN_MANAGER_EVENT*: string {.`static`.}
  CATEGORY_EVENT_IKE_ERROR*: string {.`static`.}
  CATEGORY_EVENT_NETWORK_ERROR*: string {.`static`.}
  CATEGORY_EVENT_DEACTIVATED_BY_USER*: string {.`static`.}
  CATEGORY_EVENT_ALWAYS_ON_STATE_CHANGED*: string {.`static`.}
  EXTRA_VPN_PROFILE_STATE*: string {.`static`.}
  EXTRA_SESSION_KEY*: string {.`static`.}
  EXTRA_UNDERLYING_NETWORK*: string {.`static`.}
  EXTRA_UNDERLYING_NETWORK_CAPABILITIES*: string {.`static`.}
  EXTRA_UNDERLYING_LINK_PROPERTIES*: string {.`static`.}
  EXTRA_TIMESTAMP_MILLIS*: string {.`static`.}
  EXTRA_ERROR_CLASS*: string {.`static`.}
  EXTRA_ERROR_CODE*: string {.`static`.}
  ERROR_CLASS_NOT_RECOVERABLE*: jint {.`static`.}
  ERROR_CLASS_RECOVERABLE*: jint {.`static`.}
  ERROR_CODE_NETWORK_UNKNOWN_HOST*: jint {.`static`.}
  ERROR_CODE_NETWORK_PROTOCOL_TIMEOUT*: jint {.`static`.}
  ERROR_CODE_NETWORK_LOST*: jint {.`static`.}
  ERROR_CODE_NETWORK_IO*: jint {.`static`.}


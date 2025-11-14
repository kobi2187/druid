import jnim

jclass android.net.PlatformVpnProfile* of JVMObject:
  proc getType*(): jint
  proc areLocalRoutesExcluded*(): jboolean
  proc isInternetValidationRequired*(): jboolean
  proc getTypeString*(): string
  proc toVpnProfile*(): VpnProfile
  proc fromVpnProfile*(profile: VpnProfile): PlatformVpnProfile {.`static`.}
  TYPE_IKEV2_IPSEC_USER_PASS*: jint {.`static`.}
  TYPE_IKEV2_IPSEC_PSK*: jint {.`static`.}
  TYPE_IKEV2_IPSEC_RSA*: jint {.`static`.}
  MAX_MTU_DEFAULT*: jint {.`static`.}


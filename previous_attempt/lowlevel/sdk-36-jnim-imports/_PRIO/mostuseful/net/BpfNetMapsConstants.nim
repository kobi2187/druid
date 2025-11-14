import jnim

jclass android.net.BpfNetMapsConstants* of JVMObject:
  CONFIGURATION_MAP_PATH*: string {.`static`.}
  UID_OWNER_MAP_PATH*: string {.`static`.}
  UID_PERMISSION_MAP_PATH*: string {.`static`.}
  COOKIE_TAG_MAP_PATH*: string {.`static`.}
  DATA_SAVER_ENABLED_MAP_PATH*: string {.`static`.}
  INGRESS_DISCARD_MAP_PATH*: string {.`static`.}
  LOCAL_NET_ACCESS_MAP_PATH*: string {.`static`.}
  LOCAL_NET_BLOCKED_UID_MAP_PATH*: string {.`static`.}
  UID_RULES_CONFIGURATION_KEY*: Struct.S32 {.`static`.}
  CURRENT_STATS_MAP_CONFIGURATION_KEY*: Struct.S32 {.`static`.}
  DATA_SAVER_ENABLED_KEY*: Struct.S32 {.`static`.}
  DATA_SAVER_DISABLED*: jshort {.`static`.}
  DATA_SAVER_ENABLED*: jshort {.`static`.}
  NO_MATCH*: jlong {.`static`.}
  HAPPY_BOX_MATCH*: jlong {.`static`.}
  PENALTY_BOX_USER_MATCH*: jlong {.`static`.}
  DOZABLE_MATCH*: jlong {.`static`.}
  STANDBY_MATCH*: jlong {.`static`.}
  POWERSAVE_MATCH*: jlong {.`static`.}
  RESTRICTED_MATCH*: jlong {.`static`.}
  LOW_POWER_STANDBY_MATCH*: jlong {.`static`.}
  IIF_MATCH*: jlong {.`static`.}
  LOCKDOWN_VPN_MATCH*: jlong {.`static`.}
  OEM_DENY_1_MATCH*: jlong {.`static`.}
  OEM_DENY_2_MATCH*: jlong {.`static`.}
  OEM_DENY_3_MATCH*: jlong {.`static`.}
  BACKGROUND_MATCH*: jlong {.`static`.}
  PENALTY_BOX_ADMIN_MATCH*: jlong {.`static`.}
  MATCH_LIST*: List[Pair<Long, String>] {.`static`.}
  ALLOW_CHAINS*: List[Integer] {.`static`.}
  DENY_CHAINS*: List[Integer] {.`static`.}
  METERED_ALLOW_CHAINS*: List[Integer] {.`static`.}
  METERED_DENY_CHAINS*: List[Integer] {.`static`.}


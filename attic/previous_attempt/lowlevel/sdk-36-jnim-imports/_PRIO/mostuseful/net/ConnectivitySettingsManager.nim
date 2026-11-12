import jnim

jclass android.net.ConnectivitySettingsManager* of JVMObject:
  proc getMobileDataActivityTimeout*(context: Context, def: Duration): Duration {.`static`.}
  proc setMobileDataActivityTimeout*(context: Context, timeout: Duration) {.`static`.}
  proc getWifiDataActivityTimeout*(context: Context, def: Duration): Duration {.`static`.}
  proc setWifiDataActivityTimeout*(context: Context, timeout: Duration) {.`static`.}
  proc getDnsResolverSampleValidityDuration*(context: Context, def: Duration): Duration {.`static`.}
  proc setDnsResolverSampleValidityDuration*(context: Context, duration: Duration) {.`static`.}
  proc getDnsResolverSuccessThresholdPercent*(context: Context, def: jint): jint {.`static`.}
  proc setDnsResolverSuccessThresholdPercent*(context: Context, percent: jint) {.`static`.}
  proc getDnsResolverSampleRanges*(context: Context): Range[Integer] {.`static`.}
  proc setDnsResolverSampleRanges*(context: Context, range: Range[Integer]) {.`static`.}
  proc getNetworkSwitchNotificationMaximumDailyCount*(context: Context, def: jint): jint {.`static`.}
  proc setNetworkSwitchNotificationMaximumDailyCount*(context: Context, count: jint) {.`static`.}
  proc getNetworkSwitchNotificationRateDuration*(context: Context, def: Duration): Duration {.`static`.}
  proc setNetworkSwitchNotificationRateDuration*(context: Context, duration: Duration) {.`static`.}
  proc getCaptivePortalHttpUrl*(context: Context): string {.`static`.}
  proc setCaptivePortalHttpUrl*(context: Context, url: string) {.`static`.}
  proc getCaptivePortalMode*(context: Context, def: jint): jint {.`static`.}
  proc setCaptivePortalMode*(context: Context, mode: jint) {.`static`.}
  proc getGlobalProxy*(context: Context): ProxyInfo {.`static`.}
  proc setGlobalProxy*(context: Context, proxyInfo: ProxyInfo) {.`static`.}
  proc clearGlobalProxy*(context: Context) {.`static`.}
  proc getPrivateDnsMode*(context: Context): jint {.`static`.}
  proc setPrivateDnsMode*(context: Context, mode: jint) {.`static`.}
  proc getPrivateDnsHostname*(context: Context): string {.`static`.}
  proc setPrivateDnsHostname*(context: Context, specifier: string) {.`static`.}
  proc getPrivateDnsDefaultMode*(context: Context): string {.`static`.}
  proc setPrivateDnsDefaultMode*(context: Context, mode: jint) {.`static`.}
  proc getConnectivityKeepPendingIntentDuration*(context: Context, def: Duration): Duration {.`static`.}
  proc setConnectivityKeepPendingIntentDuration*(context: Context, duration: Duration) {.`static`.}
  proc getMobileDataAlwaysOn*(context: Context, def: jboolean): jboolean {.`static`.}
  proc setMobileDataAlwaysOn*(context: Context, enable: jboolean) {.`static`.}
  proc getWifiAlwaysRequested*(context: Context, def: jboolean): jboolean {.`static`.}
  proc setWifiAlwaysRequested*(context: Context, enable: jboolean) {.`static`.}
  proc getNetworkAvoidBadWifi*(context: Context): jint {.`static`.}
  proc setNetworkAvoidBadWifi*(context: Context, value: jint) {.`static`.}
  proc getNetworkMeteredMultipathPreference*(context: Context): string {.`static`.}
  proc setNetworkMeteredMultipathPreference*(context: Context, preference: string) {.`static`.}
  proc getMobileDataPreferredUids*(context: Context): Set[Integer] {.`static`.}
  proc setMobileDataPreferredUids*(context: Context, uidList: Set[Integer]) {.`static`.}
  proc getUidsAllowedOnRestrictedNetworks*(context: Context): Set[Integer] {.`static`.}
  proc setUidsAllowedOnRestrictedNetworks*(context: Context, uidList: Set[Integer]) {.`static`.}
  proc getIngressRateLimitInBytesPerSecond*(context: Context): jlong {.`static`.}
  proc setIngressRateLimitInBytesPerSecond*(context: Context, rateLimitInBytesPerSec: jlong) {.`static`.}
  DATA_ACTIVITY_TIMEOUT_MOBILE*: string {.`static`.}
  DATA_ACTIVITY_TIMEOUT_WIFI*: string {.`static`.}
  DNS_RESOLVER_SAMPLE_VALIDITY_SECONDS*: string {.`static`.}
  DNS_RESOLVER_SUCCESS_THRESHOLD_PERCENT*: string {.`static`.}
  DNS_RESOLVER_MIN_SAMPLES*: string {.`static`.}
  DNS_RESOLVER_MAX_SAMPLES*: string {.`static`.}
  NETWORK_SWITCH_NOTIFICATION_DAILY_LIMIT*: string {.`static`.}
  NETWORK_SWITCH_NOTIFICATION_RATE_LIMIT_MILLIS*: string {.`static`.}
  CAPTIVE_PORTAL_HTTP_URL*: string {.`static`.}
  CAPTIVE_PORTAL_MODE*: string {.`static`.}
  CAPTIVE_PORTAL_MODE_IGNORE*: jint {.`static`.}
  CAPTIVE_PORTAL_MODE_PROMPT*: jint {.`static`.}
  CAPTIVE_PORTAL_MODE_AVOID*: jint {.`static`.}
  GLOBAL_HTTP_PROXY_HOST*: string {.`static`.}
  GLOBAL_HTTP_PROXY_PORT*: string {.`static`.}
  GLOBAL_HTTP_PROXY_EXCLUSION_LIST*: string {.`static`.}
  GLOBAL_HTTP_PROXY_PAC*: string {.`static`.}
  PRIVATE_DNS_MODE*: string {.`static`.}
  PRIVATE_DNS_SPECIFIER*: string {.`static`.}
  PRIVATE_DNS_DEFAULT_MODE*: string {.`static`.}
  CONNECTIVITY_RELEASE_PENDING_INTENT_DELAY_MS*: string {.`static`.}
  MOBILE_DATA_ALWAYS_ON*: string {.`static`.}
  WIFI_ALWAYS_REQUESTED*: string {.`static`.}
  NETWORK_AVOID_BAD_WIFI*: string {.`static`.}
  NETWORK_AVOID_BAD_WIFI_IGNORE*: jint {.`static`.}
  NETWORK_AVOID_BAD_WIFI_PROMPT*: jint {.`static`.}
  NETWORK_AVOID_BAD_WIFI_AVOID*: jint {.`static`.}
  NETWORK_METERED_MULTIPATH_PREFERENCE*: string {.`static`.}
  MOBILE_DATA_PREFERRED_UIDS*: string {.`static`.}
  PRIVATE_DNS_MODE_OFF*: jint {.`static`.}
  PRIVATE_DNS_MODE_OPPORTUNISTIC*: jint {.`static`.}
  PRIVATE_DNS_MODE_PROVIDER_HOSTNAME*: jint {.`static`.}
  UIDS_ALLOWED_ON_RESTRICTED_NETWORKS*: string {.`static`.}
  INGRESS_RATE_LIMIT_BYTES_PER_SECOND*: string {.`static`.}


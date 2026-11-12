import jnim

jclass android.util.NtpTrustedTime* of JVMObject:
  proc getInstance*(context: Context): NtpTrustedTime {.`static`.}
  proc setServerConfigForTests*(ntpConfig: NtpConfig)
  proc forceRefresh*(): jboolean
  proc forceRefresh*(network: Network): jboolean
  proc getNtpConfigInternal*(): NtpConfig
  proc getDefaultNetwork*(): Network
  proc isNetworkConnected*(network: Network): jboolean
  proc queryNtpServer*(network: Network, ntpServerUri: URI, timeout: Duration): TimeResult
  proc hasCache*(): jboolean
  proc getCacheAge*(): jlong
  proc currentTimeMillis*(): jlong
  proc getCachedNtpTime*(): jlong
  proc getCachedNtpTimeReference*(): jlong
  proc getCachedTimeResult*(): TimeResult
  proc setCachedTimeResult*(timeResult: TimeResult)
  proc clearCachedTimeResult*()
  proc parseNtpUriStrict*(ntpServerUriString: string): URI {.`static`.}
  proc parseNtpServerSetting*(ntpServerSetting: string): List[URI] {.`static`.}
  proc dump*(pw: PrintWriter)
  NTP_SETTING_SERVER_NAME_DELIMITER*: string {.`static`.}

jclass android.util.NtpTrustedTime.NtpConfig* of JVMObject:
  proc getServerUris*(): List[URI]
  proc getTimeout*(): Duration
  proc toString*(): string

jclass android.util.NtpTrustedTime.TimeResult* of JVMObject:
  proc getTimeMillis*(): jlong
  proc getElapsedRealtimeMillis*(): jlong
  proc getUncertaintyMillis*(): jint
  proc currentTimeMillis*(): jlong
  proc getAgeMillis*(): jlong
  proc getAgeMillis*(currentElapsedRealtimeMillis: jlong): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.util.NtpConfig* of JVMObject:
  proc getServerUris*(): List[URI]
  proc getTimeout*(): Duration
  proc toString*(): string

jclass android.util.TimeResult* of JVMObject:
  proc getTimeMillis*(): jlong
  proc getElapsedRealtimeMillis*(): jlong
  proc getUncertaintyMillis*(): jint
  proc currentTimeMillis*(): jlong
  proc getAgeMillis*(): jlong
  proc getAgeMillis*(currentElapsedRealtimeMillis: jlong): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string


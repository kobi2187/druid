import jnim

jclass android.app.StatsManager* of JVMObject:
  proc addConfig*(configKey: jlong, config: seq[jbyte])
  proc addConfiguration*(configKey: jlong, config: seq[jbyte]): jboolean
  proc removeConfig*(configKey: jlong)
  proc removeConfiguration*(configKey: jlong): jboolean
  proc setBroadcastSubscriber*(pendingIntent: PendingIntent, configKey: jlong, subscriberId: jlong)
  proc setBroadcastSubscriber*(configKey: jlong, subscriberId: jlong, pendingIntent: PendingIntent): jboolean
  proc setFetchReportsOperation*(pendingIntent: PendingIntent, configKey: jlong)
  proc setActiveConfigsChangedOperation*(pendingIntent: PendingIntent): seq[jlong]
  proc setRestrictedMetricsChangedOperation*(configKey: jlong, configPackage: string, pendingIntent: PendingIntent): seq[jlong]
  proc query*(configKey: jlong, configPackage: string, query: StatsQuery, executor: Executor, outcomeReceiver: OutcomeReceiver[StatsCursor, StatsQueryException])
  proc setDataFetchOperation*(configKey: jlong, pendingIntent: PendingIntent): jboolean
  proc getReports*(configKey: jlong): seq[jbyte]
  proc getData*(configKey: jlong): seq[jbyte]
  proc getStatsMetadata*(): seq[jbyte]
  proc getMetadata*(): seq[jbyte]
  proc getRegisteredExperimentIds*(): seq[jlong]
  proc setPullAtomCallback*(atomTag: jint, metadata: PullAtomMetadata, executor: Executor, callback: StatsPullAtomCallback)
  proc clearPullAtomCallback*(atomTag: jint)
  EXTRA_STATS_CONFIG_UID*: string {.`static`.}
  EXTRA_STATS_CONFIG_KEY*: string {.`static`.}
  EXTRA_STATS_SUBSCRIPTION_ID*: string {.`static`.}
  EXTRA_STATS_SUBSCRIPTION_RULE_ID*: string {.`static`.}
  EXTRA_STATS_BROADCAST_SUBSCRIBER_COOKIES*: string {.`static`.}
  EXTRA_STATS_DIMENSIONS_VALUE*: string {.`static`.}
  EXTRA_STATS_ACTIVE_CONFIG_KEYS*: string {.`static`.}
  EXTRA_STATS_RESTRICTED_METRIC_IDS*: string {.`static`.}
  ACTION_STATSD_STARTED*: string {.`static`.}
  PULL_SUCCESS*: jint {.`static`.}
  PULL_SKIP*: jint {.`static`.}
  DEFAULT_COOL_DOWN_MILLIS*: jlong {.`static`.}
  DEFAULT_TIMEOUT_MILLIS*: jlong {.`static`.}

jclass android.app.StatsManager.PullAtomMetadata* of JVMObject:
  proc getCoolDownMillis*(): jlong
  proc getTimeoutMillis*(): jlong
  proc getAdditiveFields*(): seq[jint]

jclass android.app.PullAtomMetadata* of JVMObject:
  proc getCoolDownMillis*(): jlong
  proc getTimeoutMillis*(): jlong
  proc getAdditiveFields*(): seq[jint]

jclass android.app.PullAtomMetadata.Builder* of JVMObject:
  proc setCoolDownMillis*(coolDownMillis: jlong): Builder
  proc setTimeoutMillis*(timeoutMillis: jlong): Builder
  proc setAdditiveFields*(additiveFields: seq[jint]): Builder
  proc build*(): PullAtomMetadata

jclass android.app.Builder* of JVMObject:
  proc setCoolDownMillis*(coolDownMillis: jlong): Builder
  proc setTimeoutMillis*(timeoutMillis: jlong): Builder
  proc setAdditiveFields*(additiveFields: seq[jint]): Builder
  proc build*(): PullAtomMetadata


jclass android.app.StatsUnavailableException* of AndroidException:

jclass android.app.StatsQueryException* of AndroidException:


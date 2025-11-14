import jnim

jclass android.app.BroadcastOptions* of ComponentOptions:
  proc makeBasic*(): BroadcastOptions {.`static`.}
  proc makeWithDeferUntilActive*(deferUntilActive: jboolean): BroadcastOptions {.`static`.}
  proc setTemporaryAppWhitelistDuration*(duration: jlong)
  proc setTemporaryAppAllowlist*(duration: jlong, type: jint, reasonCode: jint, reason: string)
  proc getTemporaryAppAllowlistDuration*(): jlong
  proc getTemporaryAppAllowlistType*(): jint
  proc getTemporaryAppAllowlistReasonCode*(): jint
  proc getTemporaryAppAllowlistReason*(): string
  proc setMinManifestReceiverApiLevel*(apiLevel: jint)
  proc getMinManifestReceiverApiLevel*(): jint
  proc setMaxManifestReceiverApiLevel*(apiLevel: jint)
  proc getMaxManifestReceiverApiLevel*(): jint
  proc setDontSendToRestrictedApps*(dontSendToRestrictedApps: jboolean)
  proc isDontSendToRestrictedApps*(): jboolean
  proc setBackgroundActivityStartsAllowed*(allowBackgroundActivityStarts: jboolean)
  proc allowsBackgroundActivityStarts*(): jboolean
  proc setRequireAllOfPermissions*(requiredPermissions: seq[string])
  proc setRequireNoneOfPermissions*(excludedPermissions: seq[string])
  proc setRequireCompatChange*(changeId: jlong, enabled: jboolean)
  proc clearRequireCompatChange*()
  proc setAlarmBroadcast*(senderIsAlarm: jboolean)
  proc isAlarmBroadcast*(): jboolean
  proc setShareIdentityEnabled*(shareIdentityEnabled: jboolean): BroadcastOptions
  proc isShareIdentityEnabled*(): jboolean
  proc isPushMessagingBroadcast*(): jboolean
  proc isPushMessagingOverQuotaBroadcast*(): jboolean
  proc getRequireCompatChangeId*(): jlong
  proc testRequireCompatChange*(uid: jint): jboolean
  proc recordResponseEventWhileInBackground*(id: jlong)
  proc getIdForResponseEvent*(): jlong
  proc setDeferralPolicy*(deferralPolicy: jint): BroadcastOptions
  proc getDeferralPolicy*(): jint
  proc clearDeferralPolicy*()
  proc setDeliveryGroupPolicy*(policy: jint): BroadcastOptions
  proc getDeliveryGroupPolicy*(): jint
  proc clearDeliveryGroupPolicy*()
  proc setDeliveryGroupMatchingKey*(namespace: string, key: string): BroadcastOptions
  proc getDeliveryGroupMatchingKey*(): string
  proc getDeliveryGroupMatchingNamespaceFragment*(): string
  proc getDeliveryGroupMatchingKeyFragment*(): string
  proc clearDeliveryGroupMatchingKey*()
  proc setDeliveryGroupMatchingFilter*(matchingFilter: IntentFilter): BroadcastOptions
  proc getDeliveryGroupMatchingFilter*(): IntentFilter
  proc clearDeliveryGroupMatchingFilter*()
  proc setDeliveryGroupExtrasMerger*(extrasMerger: BundleMerger): BroadcastOptions
  proc getDeliveryGroupExtrasMerger*(): BundleMerger
  proc clearDeliveryGroupExtrasMerger*()
  proc setInteractive*(interactive: jboolean): BroadcastOptions
  proc isInteractive*(): jboolean
  proc setPendingIntentBackgroundActivityLaunchAllowed*(allowed: jboolean)
  proc isPendingIntentBackgroundActivityLaunchAllowed*(): jboolean
  proc setPendingIntentBackgroundActivityStartMode*(state: jint): BroadcastOptions
  proc getPendingIntentBackgroundActivityStartMode*(): jint
  proc setDebugLogEnabled*(enabled: jboolean): BroadcastOptions
  proc isDebugLogEnabled*(): jboolean
  proc toBundle*(): Bundle
  proc fromBundle*(options: Bundle): BroadcastOptions {.`static`.}
  proc fromBundleNullable*(options: Bundle): BroadcastOptions {.`static`.}
  CHANGE_INVALID*: jlong {.`static`.}
  CHANGE_ALWAYS_ENABLED*: jlong {.`static`.}
  CHANGE_ALWAYS_DISABLED*: jlong {.`static`.}
  KEY_REQUIRE_ALL_OF_PERMISSIONS*: string {.`static`.}
  KEY_REQUIRE_NONE_OF_PERMISSIONS*: string {.`static`.}
  TEMPORARY_WHITELIST_TYPE_FOREGROUND_SERVICE_ALLOWED*: jint {.`static`.}
  TEMPORARY_WHITELIST_TYPE_FOREGROUND_SERVICE_NOT_ALLOWED*: jint {.`static`.}
  DELIVERY_GROUP_POLICY_ALL*: jint {.`static`.}
  DELIVERY_GROUP_POLICY_MOST_RECENT*: jint {.`static`.}
  DELIVERY_GROUP_POLICY_MERGED*: jint {.`static`.}
  DEFERRAL_POLICY_DEFAULT*: jint {.`static`.}
  DEFERRAL_POLICY_NONE*: jint {.`static`.}
  DEFERRAL_POLICY_UNTIL_ACTIVE*: jint {.`static`.}


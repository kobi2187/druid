import jnim

jclass android.net.NetworkScorerAppData* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getRecommendationServicePackageName*(): string
  proc getRecommendationServiceComponent*(): ComponentName
  proc getEnableUseOpenWifiActivity*(): ComponentName
  proc getRecommendationServiceLabel*(): string
  proc getNetworkAvailableNotificationChannelId*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  packageUid*: jint
  CREATOR*: Creator[NetworkScorerAppData] {.`static`.}


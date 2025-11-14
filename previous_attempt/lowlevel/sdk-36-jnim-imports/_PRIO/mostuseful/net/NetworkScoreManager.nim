import jnim

jclass android.net.NetworkScoreManager* of JVMObject:
  proc getActiveScorerPackage*(): string
  proc getActiveScorer*(): NetworkScorerAppData
  proc getAllValidScorers*(): List[NetworkScorerAppData]
  proc updateScores*(networks: seq[ScoredNetwork]): jboolean
  proc clearScores*(): jboolean
  proc setActiveScorer*(packageName: string): jboolean
  proc disableScoring*()
  proc requestScores*(networks: seq[NetworkKey]): jboolean
  proc requestScores*(networks: Collection[NetworkKey]): jboolean
  proc registerNetworkScoreCache*(networkType: jint, scoreCache: INetworkScoreCache)
  proc registerNetworkScoreCache*(networkType: jint, scoreCache: INetworkScoreCache, filterType: jint)
  proc unregisterNetworkScoreCache*(networkType: jint, scoreCache: INetworkScoreCache)
  proc registerNetworkScoreCallback*(networkType: jint, filterType: jint, executor: Executor, callback: NetworkScoreCallback)
  proc isCallerActiveScorer*(callingUid: jint): jboolean
  ACTION_CHANGE_ACTIVE*: string {.`static`.}
  EXTRA_PACKAGE_NAME*: string {.`static`.}
  ACTION_SCORE_NETWORKS*: string {.`static`.}
  EXTRA_NETWORKS_TO_SCORE*: string {.`static`.}
  ACTION_CUSTOM_ENABLE*: string {.`static`.}
  RECOMMENDATION_SERVICE_LABEL_META_DATA*: string {.`static`.}
  USE_OPEN_WIFI_PACKAGE_META_DATA*: string {.`static`.}
  NETWORK_AVAILABLE_NOTIFICATION_CHANNEL_ID_META_DATA*: string {.`static`.}
  ACTION_SCORER_CHANGED*: string {.`static`.}
  ACTION_RECOMMEND_NETWORKS*: string {.`static`.}
  EXTRA_NEW_SCORER*: string {.`static`.}
  SCORE_FILTER_NONE*: jint {.`static`.}
  SCORE_FILTER_CURRENT_NETWORK*: jint {.`static`.}
  SCORE_FILTER_SCAN_RESULTS*: jint {.`static`.}
  RECOMMENDATIONS_ENABLED_FORCED_OFF*: jint {.`static`.}
  RECOMMENDATIONS_ENABLED_OFF*: jint {.`static`.}
  RECOMMENDATIONS_ENABLED_ON*: jint {.`static`.}

jclass android.net.NetworkScoreManager.NetworkScoreCallback* of JVMObject:
  proc onScoresUpdated*(networks: Collection[ScoredNetwork])
  proc onScoresInvalidated*()

jclass android.net.NetworkScoreCallback* of JVMObject:
  proc onScoresUpdated*(networks: Collection[ScoredNetwork])
  proc onScoresInvalidated*()


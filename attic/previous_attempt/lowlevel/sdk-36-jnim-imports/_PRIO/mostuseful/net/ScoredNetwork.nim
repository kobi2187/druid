import jnim

jclass android.net.ScoredNetwork* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc hasRankingScore*(): jboolean
  proc calculateRankingScore*(rssi: jint): jint
  proc calculateBadge*(rssi: jint): jint
  ATTRIBUTES_KEY_BADGING_CURVE*: string {.`static`.}
  ATTRIBUTES_KEY_HAS_CAPTIVE_PORTAL*: string {.`static`.}
  ATTRIBUTES_KEY_RANKING_SCORE_OFFSET*: string {.`static`.}
  networkKey*: NetworkKey
  rssiCurve*: RssiCurve
  meteredHint*: jboolean
  attributes*: Bundle
  CREATOR*: Parcelable.Creator[ScoredNetwork] {.`static`.}


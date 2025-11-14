import jnim

jclass android.net.NetworkStatsCollection* of JVMObject:
  proc clear*()
  proc reset*()
  proc getStartMillis*(): jlong
  proc getFirstAtomicBucketMillis*(): jlong
  proc getEndMillis*(): jlong
  proc getTotalBytes*(): jlong
  proc isDirty*(): jboolean
  proc clearDirty*()
  proc isEmpty*(): jboolean
  proc roundUp*(time: jlong): jlong
  proc roundDown*(time: jlong): jlong
  proc getRelevantUids*(accessLevel: jint): seq[jint]
  proc getRelevantUids*(accessLevel: jint, callerUid: jint): seq[jint]
  proc getHistory*(template: NetworkTemplate, augmentPlan: SubscriptionPlan, uid: jint, set: jint, tag: jint, fields: jint, start: jlong, end: jlong, accessLevel: jint, callerUid: jint): NetworkStatsHistory
  proc getSummary*(template: NetworkTemplate, start: jlong, end: jlong, accessLevel: jint, callerUid: jint): NetworkStats
  proc recordData*(ident: NetworkIdentitySet, uid: jint, set: jint, tag: jint, start: jlong, end: jlong, entry: NetworkStats.Entry)
  proc recordHistory*(key: Key, history: NetworkStatsHistory)
  proc recordCollection*(another: NetworkStatsCollection)
  proc read*(in: InputStream)
  proc write*(output:OutputStream)
  proc readLegacyNetwork*(file: File)
  proc readLegacyUid*(file: File, onlyTags: jboolean)
  proc removeUids*(uids: seq[jint])
  proc removeHistoryBefore*(cutoffMillis: jlong)
  proc dump*(pw: IndentingPrintWriter)
  proc dumpDebug*(proto: ProtoOutputStream, tag: jlong)
  proc dumpCheckin*(pw: PrintWriter, start: jlong, end: jlong)
  proc getEntries*(): Map[Key, NetworkStatsHistory]
  proc compareStats*(migrated: NetworkStatsCollection, legacy: NetworkStatsCollection, allowKeyChange: jboolean): string {.`static`.}

jclass android.net.NetworkStatsCollection.Builder* of JVMObject:
  proc addEntry*(key: Key, history: NetworkStatsHistory): NetworkStatsCollection.Builder
  proc build*(): NetworkStatsCollection

jclass android.net.NetworkStatsCollection.Key* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc compare*(left: Key, right: Key): jint {.`static`.}

jclass android.net.Builder* of JVMObject:
  proc addEntry*(key: Key, history: NetworkStatsHistory): NetworkStatsCollection.Builder
  proc build*(): NetworkStatsCollection

jclass android.net.Key* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc compare*(left: Key, right: Key): jint {.`static`.}
  ident*: NetworkIdentitySet
  uid*: jint
  set*: jint
  tag*: jint


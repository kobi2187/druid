import jnim

jclass android.metrics.LogMaker* of JVMObject:
  proc setCategory*(category: jint): LogMaker
  proc clearCategory*(): LogMaker
  proc setType*(type: jint): LogMaker
  proc clearType*(): LogMaker
  proc setSubtype*(subtype: jint): LogMaker
  proc clearSubtype*(): LogMaker
  proc setLatency*(milliseconds: jlong): LogMaker
  proc setTimestamp*(timestamp: jlong): LogMaker
  proc clearTimestamp*(): LogMaker
  proc setPackageName*(packageName: string): LogMaker
  proc setComponentName*(component: ComponentName): LogMaker
  proc clearPackageName*(): LogMaker
  proc setProcessId*(pid: jint): LogMaker
  proc clearProcessId*(): LogMaker
  proc setUid*(uid: jint): LogMaker
  proc clearUid*(): LogMaker
  proc setCounterName*(name: string): LogMaker
  proc setCounterBucket*(bucket: jint): LogMaker
  proc setCounterBucket*(bucket: jlong): LogMaker
  proc setCounterValue*(value: jint): LogMaker
  proc addTaggedData*(tag: jint, value: JObject): LogMaker
  proc clearTaggedData*(tag: jint): LogMaker
  proc isValidValue*(value: JObject): jboolean
  proc getTaggedData*(tag: jint): JObject
  proc getCategory*(): jint
  proc getType*(): jint
  proc getSubtype*(): jint
  proc getTimestamp*(): jlong
  proc getPackageName*(): string
  proc getProcessId*(): jint
  proc getUid*(): jint
  proc getCounterName*(): string
  proc getCounterBucket*(): jlong
  proc isLongCounterBucket*(): jboolean
  proc getCounterValue*(): jint
  proc serialize*(): seq[JObject]
  proc deserialize*(items: seq[JObject])
  proc isSubsetOf*(that: LogMaker): jboolean
  proc getEntries*(): SparseArray[JObject]
  MAX_SERIALIZED_SIZE*: jint {.`static`.}


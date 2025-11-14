import jnim

jclass android.app.ApplicationExitInfo* of JVMObject:
  proc getPid*(): jint
  proc getRealUid*(): jint
  proc getPackageUid*(): jint
  proc getDefiningUid*(): jint
  proc getProcessName*(): string
  proc getReason*(): jint
  proc getStatus*(): jint
  proc getImportance*(): jint
  proc getPss*(): jlong
  proc getRss*(): jlong
  proc getTimestamp*(): jlong
  proc getDescription*(): string
  proc getUserHandle*(): UserHandle
  proc getProcessStateSummary*(): seq[jbyte]
  proc getTraceInputStream*(): InputStream
  proc getTraceFile*(): File
  proc getSubReason*(): jint
  proc getConnectionGroup*(): jint
  proc getPackageName*(): string
  proc getPackageList*(): seq[string]
  proc setPid*(pid: jint)
  proc setRealUid*(uid: jint)
  proc setPackageUid*(uid: jint)
  proc setDefiningUid*(uid: jint)
  proc setProcessName*(processName: string)
  proc setReason*(reason: jint)
  proc setStatus*(status: jint)
  proc setImportance*(importance: jint)
  proc setPss*(pss: jlong)
  proc setRss*(rss: jlong)
  proc setTimestamp*(timestamp: jlong)
  proc setDescription*(description: string)
  proc setSubReason*(subReason: jint)
  proc setConnectionGroup*(connectionGroup: jint)
  proc setPackageName*(packageName: string)
  proc setPackageList*(packageList: seq[string])
  proc setProcessStateSummary*(state: seq[jbyte])
  proc setTraceFile*(traceFile: File)
  proc setAppTraceRetriever*(retriever: IAppTraceRetriever)
  proc setNativeTombstoneRetriever*(retriever: IParcelFileDescriptorRetriever)
  proc isLoggedInStatsd*(): jboolean
  proc setLoggedInStatsd*(loggedInStatsd: jboolean)
  proc hasForegroundServices*(): jboolean
  proc setHasForegroundServices*(hasForegroundServices: jboolean)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string, seqSuffix: string, sdf: SimpleDateFormat)
  proc toString*(): string
  proc reasonCodeToString*(reason: jint): string {.`static`.}
  proc subreasonToString*(subreason: jint): string {.`static`.}
  proc writeToProto*(proto: ProtoOutputStream, fieldId: jlong)
  proc readFromProto*(proto: ProtoInputStream, fieldId: jlong)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  REASON_UNKNOWN*: jint {.`static`.}
  REASON_EXIT_SELF*: jint {.`static`.}
  REASON_SIGNALED*: jint {.`static`.}
  REASON_LOW_MEMORY*: jint {.`static`.}
  REASON_CRASH*: jint {.`static`.}
  REASON_CRASH_NATIVE*: jint {.`static`.}
  REASON_ANR*: jint {.`static`.}
  REASON_INITIALIZATION_FAILURE*: jint {.`static`.}
  REASON_PERMISSION_CHANGE*: jint {.`static`.}
  REASON_EXCESSIVE_RESOURCE_USAGE*: jint {.`static`.}
  REASON_USER_REQUESTED*: jint {.`static`.}
  REASON_USER_STOPPED*: jint {.`static`.}
  REASON_DEPENDENCY_DIED*: jint {.`static`.}
  REASON_OTHER*: jint {.`static`.}
  REASON_FREEZER*: jint {.`static`.}
  REASON_PACKAGE_STATE_CHANGE*: jint {.`static`.}
  REASON_PACKAGE_UPDATED*: jint {.`static`.}
  SUBREASON_UNKNOWN*: jint {.`static`.}
  SUBREASON_WAIT_FOR_DEBUGGER*: jint {.`static`.}
  SUBREASON_TOO_MANY_CACHED*: jint {.`static`.}
  SUBREASON_TOO_MANY_EMPTY*: jint {.`static`.}
  SUBREASON_TRIM_EMPTY*: jint {.`static`.}
  SUBREASON_LARGE_CACHED*: jint {.`static`.}
  SUBREASON_MEMORY_PRESSURE*: jint {.`static`.}
  SUBREASON_EXCESSIVE_CPU*: jint {.`static`.}
  SUBREASON_SYSTEM_UPDATE_DONE*: jint {.`static`.}
  SUBREASON_KILL_ALL_FG*: jint {.`static`.}
  SUBREASON_KILL_ALL_BG_EXCEPT*: jint {.`static`.}
  SUBREASON_KILL_UID*: jint {.`static`.}
  SUBREASON_KILL_PID*: jint {.`static`.}
  SUBREASON_INVALID_START*: jint {.`static`.}
  SUBREASON_INVALID_STATE*: jint {.`static`.}
  SUBREASON_IMPERCEPTIBLE*: jint {.`static`.}
  SUBREASON_REMOVE_LRU*: jint {.`static`.}
  SUBREASON_ISOLATED_NOT_NEEDED*: jint {.`static`.}
  SUBREASON_CACHED_IDLE_FORCED_APP_STANDBY*: jint {.`static`.}
  SUBREASON_FREEZER_BINDER_IOCTL*: jint {.`static`.}
  SUBREASON_FREEZER_BINDER_TRANSACTION*: jint {.`static`.}
  SUBREASON_FORCE_STOP*: jint {.`static`.}
  SUBREASON_REMOVE_TASK*: jint {.`static`.}
  SUBREASON_STOP_APP*: jint {.`static`.}
  SUBREASON_KILL_BACKGROUND*: jint {.`static`.}
  SUBREASON_PACKAGE_UPDATE*: jint {.`static`.}
  SUBREASON_UNDELIVERED_BROADCAST*: jint {.`static`.}
  SUBREASON_SDK_SANDBOX_DIED*: jint {.`static`.}
  SUBREASON_SDK_SANDBOX_NOT_NEEDED*: jint {.`static`.}
  SUBREASON_EXCESSIVE_BINDER_OBJECTS*: jint {.`static`.}
  SUBREASON_OOM_KILL*: jint {.`static`.}
  SUBREASON_FREEZER_BINDER_ASYNC_FULL*: jint {.`static`.}
  SUBREASON_EXCESSIVE_OUTGOING_BROADCASTS_WHILE_CACHED*: jint {.`static`.}
  CREATOR*: Creator[ApplicationExitInfo] {.`static`.}


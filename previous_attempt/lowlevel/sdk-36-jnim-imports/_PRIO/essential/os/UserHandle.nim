import jnim

jclass android.os.UserHandle* of JVMObject:
  proc isSameUser*(uid1: jint, uid2: jint): jboolean {.`static`.}
  proc isSameApp*(uid1: jint, uid2: jint): jboolean {.`static`.}
  proc isIsolated*(uid: jint): jboolean {.`static`.}
  proc isApp*(uid: jint): jboolean {.`static`.}
  proc isCore*(uid: jint): jboolean {.`static`.}
  proc isSharedAppGid*(uid: jint): jboolean {.`static`.}
  proc getUserHandleForUid*(uid: jint): UserHandle {.`static`.}
  proc getUserId*(uid: jint): jint {.`static`.}
  proc getCallingUserId*(): jint {.`static`.}
  proc getCallingAppId*(): jint {.`static`.}
  proc fromUserHandles*(users: List[UserHandle]): seq[jint] {.`static`.}
  proc toUserHandles*(userIds: seq[jint]): List[UserHandle] {.`static`.}
  proc of*(userId: jint): UserHandle {.`static`.}
  proc getUserHandleFromExtraCache*(userId: jint): UserHandle {.`static`.}
  proc getUid*(userId: jint, appId: jint): jint {.`static`.}
  proc getUid*(appId: jint): jint
  proc getAppId*(uid: jint): jint {.`static`.}
  proc getUserGid*(userId: jint): jint {.`static`.}
  proc getSharedAppGid*(uid: jint): jint {.`static`.}
  proc getSharedAppGid*(userId: jint, appId: jint): jint {.`static`.}
  proc getAppIdFromSharedAppGid*(gid: jint): jint {.`static`.}
  proc getCacheAppGid*(uid: jint): jint {.`static`.}
  proc getCacheAppGid*(userId: jint, appId: jint): jint {.`static`.}
  proc formatUid*(sb: StringBuilder, uid: jint) {.`static`.}
  proc formatUid*(uid: jint): string {.`static`.}
  proc formatUid*(pw: PrintWriter, uid: jint) {.`static`.}
  proc parseUserArg*(arg: string): jint {.`static`.}
  proc myUserId*(): jint {.`static`.}
  proc isOwner*(): jboolean
  proc isSystem*(): jboolean
  proc getIdentifier*(): jint
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writeToParcel*(h: UserHandle, output:Parcel) {.`static`.}
  proc readFromParcel*(in: Parcel): UserHandle {.`static`.}
  PER_USER_RANGE*: jint {.`static`.}
  USER_ALL*: jint {.`static`.}
  ALL*: UserHandle {.`static`.}
  USER_CURRENT*: jint {.`static`.}
  CURRENT*: UserHandle {.`static`.}
  USER_CURRENT_OR_SELF*: jint {.`static`.}
  CURRENT_OR_SELF*: UserHandle {.`static`.}
  USER_NULL*: jint {.`static`.}
  USER_OWNER*: jint {.`static`.}
  OWNER*: UserHandle {.`static`.}
  USER_SYSTEM*: jint {.`static`.}
  USER_SERIAL_SYSTEM*: jint {.`static`.}
  SYSTEM*: UserHandle {.`static`.}
  MU_ENABLED*: jboolean {.`static`.}
  MIN_SECONDARY_USER_ID*: jint {.`static`.}
  MAX_SECONDARY_USER_ID*: jint {.`static`.}
  sExtraUserHandleCache*: SparseArray[UserHandle] {.`static`.}
  MAX_EXTRA_USER_HANDLE_CACHE_SIZE*: jint {.`static`.}
  ERR_GID*: jint {.`static`.}
  AID_ROOT*: jint {.`static`.}
  AID_APP_START*: jint {.`static`.}
  AID_APP_END*: jint {.`static`.}
  AID_SHARED_GID_START*: jint {.`static`.}
  AID_CACHE_GID_START*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[UserHandle] {.`static`.}


import jnim

jclass android.view.ContentRecordingSession* of JVMObject:
  proc createDisplaySession*(displayToMirror: jint): ContentRecordingSession {.`static`.}
  proc createTaskSession*(taskWindowContainerToken: IBinder): ContentRecordingSession {.`static`.}
  proc createTaskSession*(taskWindowContainerToken: IBinder, taskId: jint): ContentRecordingSession {.`static`.}
  proc isValid*(session: ContentRecordingSession): jboolean {.`static`.}
  proc isProjectionOnSameDisplay*(session: ContentRecordingSession, incomingSession: ContentRecordingSession): jboolean {.`static`.}
  proc recordContentToString*(value: jint): string {.`static`.}
  proc targetUidToString*(value: jint): string {.`static`.}
  proc getTaskId*(): jint
  proc getVirtualDisplayId*(): jint
  proc getContentToRecord*(): jint
  proc getDisplayToRecord*(): jint
  proc getTokenToRecord*(): IBinder
  proc isWaitingForConsent*(): jboolean
  proc getTargetUid*(): jint
  proc setTaskId*(value: jint): ContentRecordingSession
  proc setVirtualDisplayId*(value: jint): ContentRecordingSession
  proc setContentToRecord*(value: jint): ContentRecordingSession
  proc setDisplayToRecord*(value: jint): ContentRecordingSession
  proc setTokenToRecord*(value: IBinder): ContentRecordingSession
  proc setWaitingForConsent*(value: jboolean): ContentRecordingSession
  proc setTargetUid*(value: jint): ContentRecordingSession
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  RECORD_CONTENT_DISPLAY*: jint {.`static`.}
  RECORD_CONTENT_TASK*: jint {.`static`.}
  TARGET_UID_FULL_SCREEN*: jint {.`static`.}
  TARGET_UID_UNKNOWN*: jint {.`static`.}
  TASK_ID_UNKNOWN*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ContentRecordingSession] {.`static`.}

jclass android.view.ContentRecordingSession.Builder* of JVMObject:
  proc setTaskId*(value: jint): Builder
  proc setVirtualDisplayId*(value: jint): Builder
  proc setContentToRecord*(value: jint): Builder
  proc setDisplayToRecord*(value: jint): Builder
  proc setTokenToRecord*(value: IBinder): Builder
  proc setWaitingForConsent*(value: jboolean): Builder
  proc setTargetUid*(value: jint): Builder
  proc build*(): ContentRecordingSession

jclass android.view.Builder* of JVMObject:
  proc setTaskId*(value: jint): Builder
  proc setVirtualDisplayId*(value: jint): Builder
  proc setContentToRecord*(value: jint): Builder
  proc setDisplayToRecord*(value: jint): Builder
  proc setTokenToRecord*(value: IBinder): Builder
  proc setWaitingForConsent*(value: jboolean): Builder
  proc setTargetUid*(value: jint): Builder
  proc build*(): ContentRecordingSession


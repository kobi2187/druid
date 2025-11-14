import jnim

jclass android.content.ClipDescription* of JVMObject:
  proc compareMimeTypes*(concreteType: string, desiredType: string): jboolean {.`static`.}
  proc setTimestamp*(timeStamp: jlong)
  proc getTimestamp*(): jlong
  proc getLabel*(): CharSequence
  proc hasMimeType*(mimeType: string): jboolean
  proc hasMimeType*(targetMimeTypes: seq[string]): jboolean
  proc filterMimeTypes*(mimeType: string): seq[string]
  proc getMimeTypeCount*(): jint
  proc getMimeType*(index: jint): string
  proc getExtras*(): PersistableBundle
  proc setExtras*(extras: PersistableBundle)
  proc validate*()
  proc isStyledText*(): jboolean
  proc setClassificationStatus*(status: jint)
  proc getConfidenceScore*(entity: string): jfloat
  proc getClassificationStatus*(): jint
  proc setConfidenceScores*(confidences: Map[string, Float])
  proc toString*(): string
  proc toShortString*(b: StringBuilder, redactContent: jboolean): jboolean
  proc toShortStringTypesOnly*(b: StringBuilder): jboolean
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  MIMETYPE_TEXT_PLAIN*: string {.`static`.}
  MIMETYPE_TEXT_HTML*: string {.`static`.}
  MIMETYPE_TEXT_URILIST*: string {.`static`.}
  MIMETYPE_TEXT_INTENT*: string {.`static`.}
  MIMETYPE_APPLICATION_ACTIVITY*: string {.`static`.}
  MIMETYPE_APPLICATION_SHORTCUT*: string {.`static`.}
  MIMETYPE_APPLICATION_TASK*: string {.`static`.}
  MIMETYPE_UNKNOWN*: string {.`static`.}
  EXTRA_PENDING_INTENT*: string {.`static`.}
  EXTRA_ACTIVITY_OPTIONS*: string {.`static`.}
  EXTRA_LOGGING_INSTANCE_ID*: string {.`static`.}
  EXTRA_HIDE_DRAG_SOURCE_TASK_ID*: string {.`static`.}
  EXTRA_IS_SENSITIVE*: string {.`static`.}
  EXTRA_IS_REMOTE_DEVICE*: string {.`static`.}
  CLASSIFICATION_NOT_COMPLETE*: jint {.`static`.}
  CLASSIFICATION_NOT_PERFORMED*: jint {.`static`.}
  CLASSIFICATION_COMPLETE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ClipDescription] {.`static`.}


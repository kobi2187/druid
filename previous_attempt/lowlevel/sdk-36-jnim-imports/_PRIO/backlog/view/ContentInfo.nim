import jnim

jclass android.view.ContentInfo* of JVMObject:
  proc releasePermissions*()
  proc toString*(): string
  proc getClip*(): ClipData
  proc getSource*(): jint
  proc getFlags*(): jint
  proc getLinkUri*(): Uri
  proc getExtras*(): Bundle
  proc partition*(itemPredicate: Predicate[ClipData.Item]): Pair[ContentInfo, ContentInfo]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  SOURCE_APP*: jint {.`static`.}
  SOURCE_CLIPBOARD*: jint {.`static`.}
  SOURCE_INPUT_METHOD*: jint {.`static`.}
  SOURCE_DRAG_AND_DROP*: jint {.`static`.}
  SOURCE_AUTOFILL*: jint {.`static`.}
  SOURCE_PROCESS_TEXT*: jint {.`static`.}
  FLAG_CONVERT_TO_PLAIN_TEXT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ContentInfo] {.`static`.}

jclass android.view.ContentInfo.Builder* of JVMObject:
  proc setClip*(clip: ClipData): Builder
  proc setSource*(source: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setLinkUri*(linkUri: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setInputContentInfo*(inputContentInfo: InputContentInfo): Builder
  proc setDragAndDropPermissions*(permissions: DragAndDropPermissions): Builder
  proc build*(): ContentInfo

jclass android.view.Builder* of JVMObject:
  proc setClip*(clip: ClipData): Builder
  proc setSource*(source: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setLinkUri*(linkUri: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setInputContentInfo*(inputContentInfo: InputContentInfo): Builder
  proc setDragAndDropPermissions*(permissions: DragAndDropPermissions): Builder
  proc build*(): ContentInfo


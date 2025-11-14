import jnim

jclass android.os.DropBoxManager* of JVMObject:
  proc addText*(tag: string, data: string)
  proc addData*(tag: string, data: seq[jbyte], flags: jint)
  proc addFile*(tag: string, file: File, flags: jint)
  proc isTagEnabled*(tag: string): jboolean
  proc getNextEntry*(tag: string, msec: jlong): Entry
  IS_EMPTY*: jint {.`static`.}
  IS_TEXT*: jint {.`static`.}
  IS_GZIPPED*: jint {.`static`.}
  ACTION_DROPBOX_ENTRY_ADDED*: string {.`static`.}
  EXTRA_TAG*: string {.`static`.}
  EXTRA_TIME*: string {.`static`.}
  EXTRA_DROPPED_COUNT*: string {.`static`.}

jclass android.os.DropBoxManager.Entry* of JVMObject:
  proc close*()
  proc getTag*(): string
  proc getTimeMillis*(): jlong
  proc getFlags*(): jint
  proc getText*(maxBytes: jint): string
  proc getInputStream*(): InputStream
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.os.Entry* of JVMObject:
  proc close*()
  proc getTag*(): string
  proc getTimeMillis*(): jlong
  proc getFlags*(): jint
  proc getText*(maxBytes: jint): string
  proc getInputStream*(): InputStream
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Entry] {.`static`.}


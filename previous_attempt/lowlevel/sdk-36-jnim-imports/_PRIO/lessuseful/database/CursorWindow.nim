import jnim

jclass android.database.CursorWindow* of SQLiteClosable:
  proc getName*(): string
  proc clear*()
  proc getStartPosition*(): jint
  proc setStartPosition*(pos: jint)
  proc getNumRows*(): jint
  proc setNumColumns*(columnNum: jint): jboolean
  proc allocRow*(): jboolean
  proc freeLastRow*()
  proc isNull*(row: jint, column: jint): jboolean
  proc isBlob*(row: jint, column: jint): jboolean
  proc isLong*(row: jint, column: jint): jboolean
  proc isFloat*(row: jint, column: jint): jboolean
  proc isString*(row: jint, column: jint): jboolean
  proc getType*(row: jint, column: jint): jint
  proc getBlob*(row: jint, column: jint): seq[jbyte]
  proc getString*(row: jint, column: jint): string
  proc copyStringToBuffer*(row: jint, column: jint, buffer: CharArrayBuffer)
  proc getLong*(row: jint, column: jint): jlong
  proc getDouble*(row: jint, column: jint): jdouble
  proc getShort*(row: jint, column: jint): jshort
  proc getInt*(row: jint, column: jint): jint
  proc getFloat*(row: jint, column: jint): jfloat
  proc putBlob*(value: seq[jbyte], row: jint, column: jint): jboolean
  proc putString*(value: string, row: jint, column: jint): jboolean
  proc putLong*(value: jlong, row: jint, column: jint): jboolean
  proc putDouble*(value: jdouble, row: jint, column: jint): jboolean
  proc putNull*(row: jint, column: jint): jboolean
  proc newFromParcel*(p: Parcel): CursorWindow {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  mWindowPtr*: jlong
  CREATOR*: Parcelable.Creator[CursorWindow] {.`static`.}


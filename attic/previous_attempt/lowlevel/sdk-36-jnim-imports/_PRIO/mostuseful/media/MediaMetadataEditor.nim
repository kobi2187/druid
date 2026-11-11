import jnim

jclass android.media.MediaMetadataEditor* of JVMObject:
  proc apply*()
  proc clear*()
  proc addEditableKey*(key: jint)
  proc removeEditableKeys*()
  proc getEditableKeys*(): seq[jint]
  proc putString*(key: jint, value: string): MediaMetadataEditor
  proc putLong*(key: jint, value: jlong): MediaMetadataEditor
  proc putBitmap*(key: jint, bitmap: Bitmap): MediaMetadataEditor
  proc putObject*(key: jint, value: JObject): MediaMetadataEditor
  proc getLong*(key: jint, defaultValue: jlong): jlong
  proc getString*(key: jint, defaultValue: string): string
  proc getBitmap*(key: jint, defaultValue: Bitmap): Bitmap
  proc getObject*(key: jint, defaultValue: JObject): JObject
  BITMAP_KEY_ARTWORK*: jint {.`static`.}
  RATING_KEY_BY_OTHERS*: jint {.`static`.}
  RATING_KEY_BY_USER*: jint {.`static`.}
  KEY_EDITABLE_MASK*: jint {.`static`.}


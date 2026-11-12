import jnim

jclass android.media.MediaMetadata* of JVMObject:
  proc containsKey*(key: string): jboolean
  proc getText*(key: string): CharSequence
  proc getString*(key: string): string
  proc getLong*(key: string): jlong
  proc getRating*(key: string): Rating
  proc getBitmap*(key: string): Bitmap
  proc getBitmapDimensionLimit*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc size*(): jint
  proc keySet*(): Set[string]
  proc getDescription*(): MediaDescription
  proc getKeyFromMetadataEditorKey*(editorKey: jint): string {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  METADATA_KEY_TITLE*: string {.`static`.}
  METADATA_KEY_ARTIST*: string {.`static`.}
  METADATA_KEY_DURATION*: string {.`static`.}
  METADATA_KEY_ALBUM*: string {.`static`.}
  METADATA_KEY_AUTHOR*: string {.`static`.}
  METADATA_KEY_WRITER*: string {.`static`.}
  METADATA_KEY_COMPOSER*: string {.`static`.}
  METADATA_KEY_COMPILATION*: string {.`static`.}
  METADATA_KEY_DATE*: string {.`static`.}
  METADATA_KEY_YEAR*: string {.`static`.}
  METADATA_KEY_GENRE*: string {.`static`.}
  METADATA_KEY_TRACK_NUMBER*: string {.`static`.}
  METADATA_KEY_NUM_TRACKS*: string {.`static`.}
  METADATA_KEY_DISC_NUMBER*: string {.`static`.}
  METADATA_KEY_ALBUM_ARTIST*: string {.`static`.}
  METADATA_KEY_ART*: string {.`static`.}
  METADATA_KEY_ART_URI*: string {.`static`.}
  METADATA_KEY_ALBUM_ART*: string {.`static`.}
  METADATA_KEY_ALBUM_ART_URI*: string {.`static`.}
  METADATA_KEY_USER_RATING*: string {.`static`.}
  METADATA_KEY_RATING*: string {.`static`.}
  METADATA_KEY_DISPLAY_TITLE*: string {.`static`.}
  METADATA_KEY_DISPLAY_SUBTITLE*: string {.`static`.}
  METADATA_KEY_DISPLAY_DESCRIPTION*: string {.`static`.}
  METADATA_KEY_DISPLAY_ICON*: string {.`static`.}
  METADATA_KEY_DISPLAY_ICON_URI*: string {.`static`.}
  METADATA_KEY_MEDIA_ID*: string {.`static`.}
  METADATA_KEY_MEDIA_URI*: string {.`static`.}
  METADATA_KEY_BT_FOLDER_TYPE*: string {.`static`.}
  CREATOR*: Parcelable.Creator[MediaMetadata] {.`static`.}

jclass android.media.MediaMetadata.Builder* of JVMObject:
  proc putText*(key: string, value: CharSequence): Builder
  proc putString*(key: string, value: string): Builder
  proc putLong*(key: string, value: jlong): Builder
  proc putRating*(key: string, value: Rating): Builder
  proc putBitmap*(key: string, value: Bitmap): Builder
  proc setBitmapDimensionLimit*(bitmapDimensionLimit: jint): Builder
  proc build*(): MediaMetadata

jclass android.media.Builder* of JVMObject:
  proc putText*(key: string, value: CharSequence): Builder
  proc putString*(key: string, value: string): Builder
  proc putLong*(key: string, value: jlong): Builder
  proc putRating*(key: string, value: Rating): Builder
  proc putBitmap*(key: string, value: Bitmap): Builder
  proc setBitmapDimensionLimit*(bitmapDimensionLimit: jint): Builder
  proc build*(): MediaMetadata


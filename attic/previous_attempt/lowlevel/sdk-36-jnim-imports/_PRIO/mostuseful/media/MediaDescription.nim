import jnim

jclass android.media.MediaDescription* of JVMObject:
  proc getMediaId*(): string
  proc getTitle*(): CharSequence
  proc getSubtitle*(): CharSequence
  proc getDescription*(): CharSequence
  proc getIconBitmap*(): Bitmap
  proc getIconUri*(): Uri
  proc getExtras*(): Bundle
  proc getMediaUri*(): Uri
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  EXTRA_BT_FOLDER_TYPE*: string {.`static`.}
  BT_FOLDER_TYPE_MIXED*: jlong {.`static`.}
  BT_FOLDER_TYPE_TITLES*: jlong {.`static`.}
  BT_FOLDER_TYPE_ALBUMS*: jlong {.`static`.}
  BT_FOLDER_TYPE_ARTISTS*: jlong {.`static`.}
  BT_FOLDER_TYPE_GENRES*: jlong {.`static`.}
  BT_FOLDER_TYPE_PLAYLISTS*: jlong {.`static`.}
  BT_FOLDER_TYPE_YEARS*: jlong {.`static`.}
  CREATOR*: Parcelable.Creator[MediaDescription] {.`static`.}

jclass android.media.MediaDescription.Builder* of JVMObject:
  proc setMediaId*(mediaId: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setDescription*(description: CharSequence): Builder
  proc setIconBitmap*(icon: Bitmap): Builder
  proc setIconUri*(iconUri: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setMediaUri*(mediaUri: Uri): Builder
  proc build*(): MediaDescription

jclass android.media.Builder* of JVMObject:
  proc setMediaId*(mediaId: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setDescription*(description: CharSequence): Builder
  proc setIconBitmap*(icon: Bitmap): Builder
  proc setIconUri*(iconUri: Uri): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setMediaUri*(mediaUri: Uri): Builder
  proc build*(): MediaDescription


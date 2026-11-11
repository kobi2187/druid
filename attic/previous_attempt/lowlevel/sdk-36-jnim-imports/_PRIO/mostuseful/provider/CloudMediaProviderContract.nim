import jnim

jclass android.provider.CloudMediaProviderContract* of JVMObject:
  PROVIDER_INTERFACE*: string {.`static`.}
  MANAGE_CLOUD_MEDIA_PROVIDERS_PERMISSION*: string {.`static`.}
  EXTRA_PAGE_TOKEN*: string {.`static`.}
  EXTRA_MEDIA_COLLECTION_ID*: string {.`static`.}
  EXTRA_SYNC_GENERATION*: string {.`static`.}
  EXTRA_ALBUM_ID*: string {.`static`.}
  EXTRA_PAGE_SIZE*: string {.`static`.}
  EXTRA_SIZE_LIMIT_BYTES*: string {.`static`.}
  EXTRA_PREVIEW_THUMBNAIL*: string {.`static`.}
  EXTRA_SORT_ORDER*: string {.`static`.}
  SORT_ORDER_DESC_DATE_TAKEN*: jint {.`static`.}
  EXTRA_MEDIASTORE_THUMB*: string {.`static`.}
  METHOD_GET_MEDIA_COLLECTION_INFO*: string {.`static`.}
  METHOD_CREATE_SURFACE_CONTROLLER*: string {.`static`.}
  EXTRA_SURFACE_CONTROLLER*: string {.`static`.}
  EXTRA_LOOPING_PLAYBACK_ENABLED*: string {.`static`.}
  EXTRA_SURFACE_CONTROLLER_AUDIO_MUTE_ENABLED*: string {.`static`.}
  EXTRA_SURFACE_STATE_CALLBACK*: string {.`static`.}
  METHOD_GET_ASYNC_CONTENT_PROVIDER*: string {.`static`.}
  METHOD_GET_CAPABILITIES*: string {.`static`.}
  EXTRA_PROVIDER_CAPABILITIES*: string {.`static`.}
  EXTRA_ASYNC_CONTENT_PROVIDER*: string {.`static`.}
  EXTRA_FILE_DESCRIPTOR*: string {.`static`.}
  EXTRA_ERROR_MESSAGE*: string {.`static`.}
  EXTRA_AUTHORITY*: string {.`static`.}
  URI_PATH_MEDIA*: string {.`static`.}
  URI_PATH_DELETED_MEDIA*: string {.`static`.}
  URI_PATH_ALBUM*: string {.`static`.}
  URI_PATH_MEDIA_COLLECTION_INFO*: string {.`static`.}
  URI_PATH_SURFACE_CONTROLLER*: string {.`static`.}
  URI_PATH_MEDIA_CATEGORY*: string {.`static`.}
  URI_PATH_MEDIA_SET*: string {.`static`.}
  URI_PATH_SEARCH_SUGGESTION*: string {.`static`.}
  URI_PATH_SEARCH_MEDIA*: string {.`static`.}
  URI_PATH_MEDIA_IN_MEDIA_SET*: string {.`static`.}
  KEY_PARENT_CATEGORY_ID*: string {.`static`.}
  KEY_MEDIA_CATEGORY_ID*: string {.`static`.}
  KEY_MEDIA_SET_ID*: string {.`static`.}
  KEY_PREFIX_TEXT*: string {.`static`.}
  KEY_SEARCH_TEXT*: string {.`static`.}
  MEDIA_CATEGORY_TYPE_PEOPLE_AND_PETS*: string {.`static`.}
  MEDIA_CATEGORY_TYPE_USER_ALBUMS*: string {.`static`.}
  SEARCH_SUGGESTION_TEXT*: string {.`static`.}
  SEARCH_SUGGESTION_FACE*: string {.`static`.}
  SEARCH_SUGGESTION_LOCATION*: string {.`static`.}
  SEARCH_SUGGESTION_DATE*: string {.`static`.}
  SEARCH_SUGGESTION_ALBUM*: string {.`static`.}
  SEARCH_SUGGESTION_HISTORY*: string {.`static`.}
  SEARCH_SUGGESTION_FAVORITES_ALBUM*: string {.`static`.}
  SEARCH_SUGGESTION_SCREENSHOTS_ALBUM*: string {.`static`.}
  SEARCH_SUGGESTION_VIDEOS_ALBUM*: string {.`static`.}

jclass android.provider.CloudMediaProviderContract.Capabilities* of JVMObject:
  proc isSearchEnabled*(): jboolean
  proc isMediaCategoriesEnabled*(): jboolean
  proc isAlbumsAsCategoryEnabled*(): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.provider.Capabilities* of JVMObject:
  proc isSearchEnabled*(): jboolean
  proc isMediaCategoriesEnabled*(): jboolean
  proc isAlbumsAsCategoryEnabled*(): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Capabilities] {.`static`.}

jclass android.provider.Capabilities.Builder* of JVMObject:
  proc setSearchEnabled*(enabled: jboolean): Builder
  proc setMediaCategoriesEnabled*(enabled: jboolean): Builder
  proc setAlbumsAsCategoryEnabled*(enabled: jboolean): Builder
  proc build*(): Capabilities

jclass android.provider.Builder* of JVMObject:
  proc setSearchEnabled*(enabled: jboolean): Builder
  proc setMediaCategoriesEnabled*(enabled: jboolean): Builder
  proc setAlbumsAsCategoryEnabled*(enabled: jboolean): Builder
  proc build*(): Capabilities

jclass android.provider.MediaColumns* of JVMObject:
  ID*: string {.`static`.}
  DATE_TAKEN_MILLIS*: string {.`static`.}
  SYNC_GENERATION*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  STANDARD_MIME_TYPE_EXTENSION*: string {.`static`.}
  STANDARD_MIME_TYPE_EXTENSION_NONE*: jint {.`static`.}
  STANDARD_MIME_TYPE_EXTENSION_GIF*: jint {.`static`.}
  STANDARD_MIME_TYPE_EXTENSION_MOTION_PHOTO*: jint {.`static`.}
  STANDARD_MIME_TYPE_EXTENSION_ANIMATED_WEBP*: jint {.`static`.}
  SIZE_BYTES*: string {.`static`.}
  MEDIA_STORE_URI*: string {.`static`.}
  DURATION_MILLIS*: string {.`static`.}
  IS_FAVORITE*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  ORIENTATION*: string {.`static`.}
  AUTHORITY*: string {.`static`.}
  DATA*: string {.`static`.}
  OWNER_PACKAGE_NAME*: string {.`static`.}
  USER_ID*: string {.`static`.}
  ALL_PROJECTION*: string {.`static`.}

jclass android.provider.AlbumColumns* of JVMObject:
  ID*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  DATE_TAKEN_MILLIS*: string {.`static`.}
  MEDIA_COVER_ID*: string {.`static`.}
  MEDIA_COUNT*: string {.`static`.}
  AUTHORITY*: string {.`static`.}
  IS_LOCAL*: string {.`static`.}
  ALL_PROJECTION*: string {.`static`.}
  ALBUM_ID_SCREENSHOTS*: string {.`static`.}
  ALBUM_ID_CAMERA*: string {.`static`.}
  ALBUM_ID_VIDEOS*: string {.`static`.}
  ALBUM_ID_DOWNLOADS*: string {.`static`.}
  ALBUM_ID_FAVORITES*: string {.`static`.}

jclass android.provider.MediaCollectionInfo* of JVMObject:
  MEDIA_COLLECTION_ID*: string {.`static`.}
  LAST_MEDIA_SYNC_GENERATION*: string {.`static`.}
  ACCOUNT_NAME*: string {.`static`.}
  ACCOUNT_CONFIGURATION_INTENT*: string {.`static`.}

jclass android.provider.MediaSetColumns* of JVMObject:
  ID*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  MEDIA_COUNT*: string {.`static`.}
  MEDIA_COVER_ID*: string {.`static`.}
  ALL_PROJECTION*: string {.`static`.}

jclass android.provider.MediaCategoryColumns* of JVMObject:
  ID*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  MEDIA_CATEGORY_TYPE*: string {.`static`.}
  MEDIA_COVER_ID1*: string {.`static`.}
  MEDIA_COVER_ID2*: string {.`static`.}
  MEDIA_COVER_ID3*: string {.`static`.}
  MEDIA_COVER_ID4*: string {.`static`.}
  ALL_PROJECTION*: string {.`static`.}

jclass android.provider.SearchSuggestionColumns* of JVMObject:
  MEDIA_SET_ID*: string {.`static`.}
  DISPLAY_TEXT*: string {.`static`.}
  TYP*: string {.`static`.}
  MEDIA_COVER_ID*: string {.`static`.}
  ALL_PROJECTION*: string {.`static`.}


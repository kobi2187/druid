import jnim

jclass android.provider.Contacts* of JVMObject:
  AUTHORITY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  KIND_EMAIL*: jint {.`static`.}
  KIND_POSTAL*: jint {.`static`.}
  KIND_IM*: jint {.`static`.}
  KIND_ORGANIZATION*: jint {.`static`.}
  KIND_PHONE*: jint {.`static`.}

jclass android.provider.Contacts.Settings* of JVMObject:
  proc getSetting*(cr: ContentResolver, account: string, key: string): string {.`static`.}
  proc setSetting*(cr: ContentResolver, account: string, key: string, value: string) {.`static`.}

jclass android.provider.Contacts.People* of JVMObject:
  proc markAsContacted*(resolver: ContentResolver, personId: jlong) {.`static`.}
  proc tryGetMyContactsGroupId*(resolver: ContentResolver): jlong {.`static`.}
  proc addToMyContactsGroup*(resolver: ContentResolver, personId: jlong): Uri {.`static`.}
  proc addToGroup*(resolver: ContentResolver, personId: jlong, groupName: string): Uri {.`static`.}
  proc addToGroup*(resolver: ContentResolver, personId: jlong, groupId: jlong): Uri {.`static`.}
  proc createPersonInMyContactsGroup*(resolver: ContentResolver, values: ContentValues): Uri {.`static`.}
  proc queryGroups*(resolver: ContentResolver, person: jlong): Cursor {.`static`.}
  proc setPhotoData*(cr: ContentResolver, person: Uri, data: seq[jbyte]) {.`static`.}
  proc openContactPhotoInputStream*(cr: ContentResolver, person: Uri): InputStream {.`static`.}
  proc loadContactPhoto*(context: Context, person: Uri, placeholderImageResource: jint, options: BitmapFactory.Options): Bitmap {.`static`.}

jclass android.provider.Contacts.Phones* of JVMObject:
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence, labelArray: seq[CharSequence]): CharSequence {.`static`.}
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence): CharSequence {.`static`.}

jclass android.provider.Contacts.ContactMethods* of JVMObject:
  proc encodePredefinedImProtocol*(protocol: jint): string {.`static`.}
  proc encodeCustomImProtocol*(protocolString: string): string {.`static`.}
  proc decodeImProtocol*(encodedString: string): JObject {.`static`.}
  proc lookupProviderNameFromId*(protocol: jint): string {.`static`.}
  proc getDisplayLabel*(context: Context, kind: jint, type: jint, label: CharSequence): CharSequence {.`static`.}
  proc addPostalLocation*(context: Context, postalId: jlong, latitude: jdouble, longitude: jdouble)

jclass android.provider.Contacts.Presence* of JVMObject:
  proc getPresenceIconResourceId*(status: jint): jint {.`static`.}
  proc setPresenceIcon*(icon: ImageView, serverStatus: jint) {.`static`.}

jclass android.provider.Contacts.Organizations* of JVMObject:
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence): CharSequence {.`static`.}

jclass android.provider.SettingsColumns* of JVMObject:
  _SYNC_ACCOUNT*: string {.`static`.}
  _SYNC_ACCOUNT_TYPE*: string {.`static`.}
  KEY*: string {.`static`.}
  VALUE*: string {.`static`.}

jclass android.provider.Settings* of JVMObject:
  proc getSetting*(cr: ContentResolver, account: string, key: string): string {.`static`.}
  proc setSetting*(cr: ContentResolver, account: string, key: string, value: string) {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  SYNC_EVERYTHING*: string {.`static`.}

jclass android.provider.PeopleColumns* of JVMObject:
  NAME*: string {.`static`.}
  PHONETIC_NAME*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  SORT_STRING*: string {.`static`.}
  NOTES*: string {.`static`.}
  TIMES_CONTACTED*: string {.`static`.}
  LAST_TIME_CONTACTED*: string {.`static`.}
  CUSTOM_RINGTONE*: string {.`static`.}
  SEND_TO_VOICEMAIL*: string {.`static`.}
  STARRED*: string {.`static`.}
  PHOTO_VERSION*: string {.`static`.}

jclass android.provider.People* of JVMObject:
  proc markAsContacted*(resolver: ContentResolver, personId: jlong) {.`static`.}
  proc tryGetMyContactsGroupId*(resolver: ContentResolver): jlong {.`static`.}
  proc addToMyContactsGroup*(resolver: ContentResolver, personId: jlong): Uri {.`static`.}
  proc addToGroup*(resolver: ContentResolver, personId: jlong, groupName: string): Uri {.`static`.}
  proc addToGroup*(resolver: ContentResolver, personId: jlong, groupId: jlong): Uri {.`static`.}
  proc createPersonInMyContactsGroup*(resolver: ContentResolver, values: ContentValues): Uri {.`static`.}
  proc queryGroups*(resolver: ContentResolver, person: jlong): Cursor {.`static`.}
  proc setPhotoData*(cr: ContentResolver, person: Uri, data: seq[jbyte]) {.`static`.}
  proc openContactPhotoInputStream*(cr: ContentResolver, person: Uri): InputStream {.`static`.}
  proc loadContactPhoto*(context: Context, person: Uri, placeholderImageResource: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_FILTER_URI*: Uri {.`static`.}
  DELETED_CONTENT_URI*: Uri {.`static`.}
  WITH_EMAIL_OR_IM_FILTER_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  PRIMARY_PHONE_ID*: string {.`static`.}
  PRIMARY_EMAIL_ID*: string {.`static`.}
  PRIMARY_ORGANIZATION_ID*: string {.`static`.}

jclass android.provider.Phones* of JVMObject:
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.ContactMethods* of JVMObject:
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Extensions* of JVMObject:
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.GroupsColumns* of JVMObject:
  NAME*: string {.`static`.}
  NOTES*: string {.`static`.}
  SHOULD_SYNC*: string {.`static`.}
  SYSTEM_ID*: string {.`static`.}

jclass android.provider.Groups* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DELETED_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  GROUP_ANDROID_STARRED*: string {.`static`.}
  GROUP_MY_CONTACTS*: string {.`static`.}

jclass android.provider.PhonesColumns* of JVMObject:
  TYP*: string {.`static`.}
  TYPE_CUSTOM*: jint {.`static`.}
  TYPE_HOME*: jint {.`static`.}
  TYPE_MOBILE*: jint {.`static`.}
  TYPE_WORK*: jint {.`static`.}
  TYPE_FAX_WORK*: jint {.`static`.}
  TYPE_FAX_HOME*: jint {.`static`.}
  TYPE_PAGER*: jint {.`static`.}
  TYPE_OTHER*: jint {.`static`.}
  LABEL*: string {.`static`.}
  NUMBER*: string {.`static`.}
  NUMBER_KEY*: string {.`static`.}
  ISPRIMARY*: string {.`static`.}

jclass android.provider.Phones* of JVMObject:
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence, labelArray: seq[CharSequence]): CharSequence {.`static`.}
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence): CharSequence {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_FILTER_URL*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.GroupMembership* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  RAW_CONTENT_URI*: Uri {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  GROUP_ID*: string {.`static`.}
  GROUP_SYNC_ID*: string {.`static`.}
  GROUP_SYNC_ACCOUNT*: string {.`static`.}
  GROUP_SYNC_ACCOUNT_TYPE*: string {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.ContactMethodsColumns* of JVMObject:
  KIND*: string {.`static`.}
  TYP*: string {.`static`.}
  TYPE_CUSTOM*: jint {.`static`.}
  TYPE_HOME*: jint {.`static`.}
  TYPE_WORK*: jint {.`static`.}
  TYPE_OTHER*: jint {.`static`.}
  MOBILE_EMAIL_TYPE_INDEX*: jint {.`static`.}
  MOBILE_EMAIL_TYPE_NAME*: string {.`static`.}
  LABEL*: string {.`static`.}
  DATA*: string {.`static`.}
  AUX_DATA*: string {.`static`.}
  ISPRIMARY*: string {.`static`.}

jclass android.provider.ContactMethods* of JVMObject:
  proc encodePredefinedImProtocol*(protocol: jint): string {.`static`.}
  proc encodeCustomImProtocol*(protocolString: string): string {.`static`.}
  proc decodeImProtocol*(encodedString: string): JObject {.`static`.}
  proc lookupProviderNameFromId*(protocol: jint): string {.`static`.}
  proc getDisplayLabel*(context: Context, kind: jint, type: jint, label: CharSequence): CharSequence {.`static`.}
  proc addPostalLocation*(context: Context, postalId: jlong, latitude: jdouble, longitude: jdouble)
  POSTAL_LOCATION_LATITUDE*: string {.`static`.}
  POSTAL_LOCATION_LONGITUDE*: string {.`static`.}
  PROTOCOL_AIM*: jint {.`static`.}
  PROTOCOL_MSN*: jint {.`static`.}
  PROTOCOL_YAHOO*: jint {.`static`.}
  PROTOCOL_SKYPE*: jint {.`static`.}
  PROTOCOL_QQ*: jint {.`static`.}
  PROTOCOL_GOOGLE_TALK*: jint {.`static`.}
  PROTOCOL_ICQ*: jint {.`static`.}
  PROTOCOL_JABBER*: jint {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_EMAIL_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_EMAIL_TYPE*: string {.`static`.}
  CONTENT_POSTAL_TYPE*: string {.`static`.}
  CONTENT_EMAIL_ITEM_TYPE*: string {.`static`.}
  CONTENT_POSTAL_ITEM_TYPE*: string {.`static`.}
  CONTENT_IM_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.PresenceColumns* of JVMObject:
  IM_PROTOCOL*: string {.`static`.}
  IM_HANDLE*: string {.`static`.}
  IM_ACCOUNT*: string {.`static`.}

jclass android.provider.Presence* of JVMObject:
  proc getPresenceIconResourceId*(status: jint): jint {.`static`.}
  proc setPresenceIcon*(icon: ImageView, serverStatus: jint) {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.OrganizationColumns* of JVMObject:
  TYP*: string {.`static`.}
  TYPE_CUSTOM*: jint {.`static`.}
  TYPE_WORK*: jint {.`static`.}
  TYPE_OTHER*: jint {.`static`.}
  LABEL*: string {.`static`.}
  COMPANY*: string {.`static`.}
  TITLE*: string {.`static`.}
  PERSON_ID*: string {.`static`.}
  ISPRIMARY*: string {.`static`.}

jclass android.provider.Organizations* of JVMObject:
  proc getDisplayLabel*(context: Context, type: jint, label: CharSequence): CharSequence {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.PhotosColumns* of JVMObject:
  LOCAL_VERSION*: string {.`static`.}
  PERSON_ID*: string {.`static`.}
  DOWNLOAD_REQUIRED*: string {.`static`.}
  EXISTS_ON_SERVER*: string {.`static`.}
  SYNC_ERROR*: string {.`static`.}
  DATA*: string {.`static`.}

jclass android.provider.Photos* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.ExtensionsColumns* of JVMObject:
  NAME*: string {.`static`.}
  VALUE*: string {.`static`.}

jclass android.provider.Extensions* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  PERSON_ID*: string {.`static`.}

jclass android.provider.Intents* of JVMObject:
  SEARCH_SUGGESTION_CLICKED*: string {.`static`.}
  SEARCH_SUGGESTION_DIAL_NUMBER_CLICKED*: string {.`static`.}
  SEARCH_SUGGESTION_CREATE_CONTACT_CLICKED*: string {.`static`.}
  ATTACH_IMAGE*: string {.`static`.}
  SHOW_OR_CREATE_CONTACT*: string {.`static`.}
  EXTRA_FORCE_CREATE*: string {.`static`.}
  EXTRA_CREATE_DESCRIPTION*: string {.`static`.}
  EXTRA_TARGET_RECT*: string {.`static`.}

jclass android.provider.UI* of JVMObject:
  LIST_DEFAULT*: string {.`static`.}
  LIST_GROUP_ACTION*: string {.`static`.}
  GROUP_NAME_EXTRA_KEY*: string {.`static`.}
  LIST_ALL_CONTACTS_ACTION*: string {.`static`.}
  LIST_CONTACTS_WITH_PHONES_ACTION*: string {.`static`.}
  LIST_STARRED_ACTION*: string {.`static`.}
  LIST_FREQUENT_ACTION*: string {.`static`.}
  LIST_STREQUENT_ACTION*: string {.`static`.}
  TITLE_EXTRA_KEY*: string {.`static`.}
  FILTER_CONTACTS_ACTION*: string {.`static`.}
  FILTER_TEXT_EXTRA_KEY*: string {.`static`.}

jclass android.provider.Insert* of JVMObject:
  ACTION*: string {.`static`.}
  FULL_MODE*: string {.`static`.}
  NAME*: string {.`static`.}
  PHONETIC_NAME*: string {.`static`.}
  COMPANY*: string {.`static`.}
  JOB_TITLE*: string {.`static`.}
  NOTES*: string {.`static`.}
  PHONE*: string {.`static`.}
  PHONE_TYPE*: string {.`static`.}
  PHONE_ISPRIMARY*: string {.`static`.}
  SECONDARY_PHONE*: string {.`static`.}
  SECONDARY_PHONE_TYPE*: string {.`static`.}
  TERTIARY_PHONE*: string {.`static`.}
  TERTIARY_PHONE_TYPE*: string {.`static`.}
  EMAIL*: string {.`static`.}
  EMAIL_TYPE*: string {.`static`.}
  EMAIL_ISPRIMARY*: string {.`static`.}
  SECONDARY_EMAIL*: string {.`static`.}
  SECONDARY_EMAIL_TYPE*: string {.`static`.}
  TERTIARY_EMAIL*: string {.`static`.}
  TERTIARY_EMAIL_TYPE*: string {.`static`.}
  POSTAL*: string {.`static`.}
  POSTAL_TYPE*: string {.`static`.}
  POSTAL_ISPRIMARY*: string {.`static`.}
  IM_HANDLE*: string {.`static`.}
  IM_PROTOCOL*: string {.`static`.}
  IM_ISPRIMARY*: string {.`static`.}


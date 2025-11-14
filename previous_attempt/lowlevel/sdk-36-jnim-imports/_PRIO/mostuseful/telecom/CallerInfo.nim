import jnim

jclass android.telecom.CallerInfo* of JVMObject:
  proc getCallerInfo*(context: Context, contactRef: Uri, cursor: Cursor): CallerInfo {.`static`.}
  proc getCallerInfo*(context: Context, contactRef: Uri): CallerInfo {.`static`.}
  proc getCallerInfo*(context: Context, number: string): CallerInfo {.`static`.}
  proc getCallerInfo*(context: Context, number: string, subId: jint): CallerInfo {.`static`.}
  proc getName*(): string
  proc setName*(name: string)
  proc getPhoneNumber*(): string
  proc setPhoneNumber*(number: string)
  proc getContactId*(): jlong
  proc getContactDisplayPhotoUri*(): Uri
  proc SetContactDisplayPhotoUri*(photoUri: Uri)
  proc isEmergencyNumber*(): jboolean
  proc isVoiceMailNumber*(): jboolean
  proc updateGeoDescription*(context: Context, fallbackNumber: string)
  proc getGeoDescription*(context: Context, number: string): string {.`static`.}
  proc toString*(): string
  USER_TYPE_CURRENT*: jlong {.`static`.}
  USER_TYPE_WORK*: jlong {.`static`.}
  normalizedNumber*: string
  geoDescription*: string
  cnapName*: string
  numberPresentation*: jint
  namePresentation*: jint
  contactExists*: jboolean
  phoneLabel*: string
  numberType*: jint
  numberLabel*: string
  photoResource*: jint
  needUpdate*: jboolean
  contactRefUri*: Uri
  lookupKey*: string
  preferredPhoneAccountComponent*: ComponentName
  preferredPhoneAccountId*: string
  userType*: jlong
  contactRingtoneUri*: Uri
  shouldSendToVoicemail*: jboolean
  cachedPhoto*: Drawable
  cachedPhotoIcon*: Bitmap
  isCachedPhotoCurrent*: jboolean


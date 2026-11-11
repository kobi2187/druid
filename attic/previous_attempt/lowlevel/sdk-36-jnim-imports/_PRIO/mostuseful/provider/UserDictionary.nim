import jnim

jclass android.provider.UserDictionary* of JVMObject:
  AUTHORITY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.UserDictionary.Words* of JVMObject:
  proc addWord*(context: Context, word: string, frequency: jint, localeType: jint) {.`static`.}
  proc addWord*(context: Context, word: string, frequency: jint, shortcut: string, locale: Locale) {.`static`.}

jclass android.provider.Words* of JVMObject:
  proc addWord*(context: Context, word: string, frequency: jint, localeType: jint) {.`static`.}
  proc addWord*(context: Context, word: string, frequency: jint, shortcut: string, locale: Locale) {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  _ID*: string {.`static`.}
  WORD*: string {.`static`.}
  FREQUENCY*: string {.`static`.}
  LOCALE*: string {.`static`.}
  APP_ID*: string {.`static`.}
  SHORTCUT*: string {.`static`.}
  LOCALE_TYPE_ALL*: jint {.`static`.}
  LOCALE_TYPE_CURRENT*: jint {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}


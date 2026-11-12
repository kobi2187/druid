import jnim

jclass android.app.SearchManager* of JVMObject:
  proc startSearch*(initialQuery: string, selectInitialQuery: jboolean, launchActivity: ComponentName, appSearchData: Bundle, globalSearch: jboolean)
  proc startSearch*(initialQuery: string, selectInitialQuery: jboolean, launchActivity: ComponentName, appSearchData: Bundle, globalSearch: jboolean, sourceBounds: Rect)
  proc getGlobalSearchActivities*(): List[ResolveInfo]
  proc getGlobalSearchActivity*(): ComponentName
  proc getWebSearchActivity*(): ComponentName
  proc triggerSearch*(query: string, launchActivity: ComponentName, appSearchData: Bundle)
  proc stopSearch*()
  proc isVisible*(): jboolean
  proc setOnDismissListener*(listener: OnDismissListener)
  proc setOnCancelListener*(listener: OnCancelListener)
  proc onCancel*(dialog: DialogInterface)
  proc onDismiss*(dialog: DialogInterface)
  proc getSearchableInfo*(componentName: ComponentName): SearchableInfo
  proc getSuggestions*(searchable: SearchableInfo, query: string): Cursor
  proc getSuggestions*(searchable: SearchableInfo, query: string, limit: jint): Cursor
  proc getSearchablesInGlobalSearch*(): List[SearchableInfo]
  proc getAssistIntent*(inclContext: jboolean): Intent
  proc launchAssist*(args: Bundle)
  MENU_KEY*: jchar {.`static`.}
  MENU_KEYCODE*: jint {.`static`.}
  QUERY*: string {.`static`.}
  USER_QUERY*: string {.`static`.}
  APP_DATA*: string {.`static`.}
  SEARCH_MODE*: string {.`static`.}
  ACTION_KEY*: string {.`static`.}
  EXTRA_DATA_KEY*: string {.`static`.}
  EXTRA_SELECT_QUERY*: string {.`static`.}
  EXTRA_NEW_SEARCH*: string {.`static`.}
  EXTRA_WEB_SEARCH_PENDINGINTENT*: string {.`static`.}
  CURSOR_EXTRA_KEY_IN_PROGRESS*: string {.`static`.}
  ACTION_MSG*: string {.`static`.}
  FLAG_QUERY_REFINEMENT*: jint {.`static`.}
  SUGGEST_URI_PATH_QUERY*: string {.`static`.}
  SUGGEST_MIME_TYPE*: string {.`static`.}
  SUGGEST_URI_PATH_SHORTCUT*: string {.`static`.}
  SHORTCUT_MIME_TYPE*: string {.`static`.}
  SUGGEST_COLUMN_FORMAT*: string {.`static`.}
  SUGGEST_COLUMN_TEXT_1*: string {.`static`.}
  SUGGEST_COLUMN_TEXT_2*: string {.`static`.}
  SUGGEST_COLUMN_TEXT_2_URL*: string {.`static`.}
  SUGGEST_COLUMN_ICON_1*: string {.`static`.}
  SUGGEST_COLUMN_ICON_2*: string {.`static`.}
  SUGGEST_COLUMN_RESULT_CARD_IMAGE*: string {.`static`.}
  SUGGEST_COLUMN_INTENT_ACTION*: string {.`static`.}
  SUGGEST_COLUMN_INTENT_DATA*: string {.`static`.}
  SUGGEST_COLUMN_INTENT_EXTRA_DATA*: string {.`static`.}
  SUGGEST_COLUMN_INTENT_DATA_ID*: string {.`static`.}
  SUGGEST_COLUMN_QUERY*: string {.`static`.}
  SUGGEST_COLUMN_SHORTCUT_ID*: string {.`static`.}
  SUGGEST_COLUMN_SPINNER_WHILE_REFRESHING*: string {.`static`.}
  SUGGEST_COLUMN_CONTENT_TYPE*: string {.`static`.}
  SUGGEST_COLUMN_IS_LIVE*: string {.`static`.}
  SUGGEST_COLUMN_VIDEO_WIDTH*: string {.`static`.}
  SUGGEST_COLUMN_VIDEO_HEIGHT*: string {.`static`.}
  SUGGEST_COLUMN_AUDIO_CHANNEL_CONFIG*: string {.`static`.}
  SUGGEST_COLUMN_PURCHASE_PRICE*: string {.`static`.}
  SUGGEST_COLUMN_RENTAL_PRICE*: string {.`static`.}
  SUGGEST_COLUMN_RATING_STYLE*: string {.`static`.}
  SUGGEST_COLUMN_RATING_SCORE*: string {.`static`.}
  SUGGEST_COLUMN_PRODUCTION_YEAR*: string {.`static`.}
  SUGGEST_COLUMN_DURATION*: string {.`static`.}
  SUGGEST_COLUMN_FLAGS*: string {.`static`.}
  SUGGEST_COLUMN_LAST_ACCESS_HINT*: string {.`static`.}
  SUGGEST_NEVER_MAKE_SHORTCUT*: string {.`static`.}
  SUGGEST_PARAMETER_LIMIT*: string {.`static`.}
  INTENT_ACTION_GLOBAL_SEARCH*: string {.`static`.}
  INTENT_ACTION_SEARCH_SETTINGS*: string {.`static`.}
  INTENT_ACTION_WEB_SEARCH_SETTINGS*: string {.`static`.}
  INTENT_ACTION_SEARCHABLES_CHANGED*: string {.`static`.}
  INTENT_GLOBAL_SEARCH_ACTIVITY_CHANGED*: string {.`static`.}
  INTENT_ACTION_SEARCH_SETTINGS_CHANGED*: string {.`static`.}
  CONTEXT_IS_VOICE*: string {.`static`.}
  DISABLE_VOICE_SEARCH*: string {.`static`.}

jclass android.app.SearchManager.OnDismissListener* of JVMObject:
  proc onDismiss*()

jclass android.app.SearchManager.OnCancelListener* of JVMObject:
  proc onCancel*()

jclass android.app.OnDismissListener* of JVMObject:
  proc onDismiss*()

jclass android.app.OnCancelListener* of JVMObject:
  proc onCancel*()


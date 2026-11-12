import jnim

jclass android.provider.SearchIndexablesContract* of JVMObject:
  PROVIDER_INTERFACE*: string {.`static`.}
  INDEXABLES_XML_RES*: string {.`static`.}
  INDEXABLES_XML_RES_PATH*: string {.`static`.}
  INDEXABLES_RAW*: string {.`static`.}
  INDEXABLES_RAW_PATH*: string {.`static`.}
  NON_INDEXABLES_KEYS*: string {.`static`.}
  SITE_MAP_PAIRS_KEYS*: string {.`static`.}
  NON_INDEXABLES_KEYS_PATH*: string {.`static`.}
  SITE_MAP_PAIRS_PATH*: string {.`static`.}
  SLICE_URI_PAIRS*: string {.`static`.}
  SLICE_URI_PAIRS_PATH*: string {.`static`.}
  DYNAMIC_INDEXABLES_RAW*: string {.`static`.}
  DYNAMIC_INDEXABLES_RAW_PATH*: string {.`static`.}
  INDEXABLES_XML_RES_COLUMNS*: string {.`static`.}
  COLUMN_INDEX_XML_RES_RANK*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_RESID*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_CLASS_NAME*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_ICON_RESID*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_INTENT_ACTION*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_INTENT_TARGET_PACKAGE*: jint {.`static`.}
  COLUMN_INDEX_XML_RES_INTENT_TARGET_CLASS*: jint {.`static`.}
  INDEXABLES_RAW_COLUMNS*: string {.`static`.}
  SITE_MAP_COLUMNS*: string {.`static`.}
  COLUMN_INDEX_RAW_RANK*: jint {.`static`.}
  COLUMN_INDEX_RAW_TITLE*: jint {.`static`.}
  COLUMN_INDEX_RAW_SUMMARY_ON*: jint {.`static`.}
  COLUMN_INDEX_RAW_SUMMARY_OFF*: jint {.`static`.}
  COLUMN_INDEX_RAW_ENTRIES*: jint {.`static`.}
  COLUMN_INDEX_RAW_KEYWORDS*: jint {.`static`.}
  COLUMN_INDEX_RAW_SCREEN_TITLE*: jint {.`static`.}
  COLUMN_INDEX_RAW_CLASS_NAME*: jint {.`static`.}
  COLUMN_INDEX_RAW_ICON_RESID*: jint {.`static`.}
  COLUMN_INDEX_RAW_INTENT_ACTION*: jint {.`static`.}
  COLUMN_INDEX_RAW_INTENT_TARGET_PACKAGE*: jint {.`static`.}
  COLUMN_INDEX_RAW_INTENT_TARGET_CLASS*: jint {.`static`.}
  COLUMN_INDEX_RAW_KEY*: jint {.`static`.}
  COLUMN_INDEX_RAW_USER_ID*: jint {.`static`.}
  COLUMN_INDEX_RAW_PAYLOAD_TYPE*: jint {.`static`.}
  COLUMN_INDEX_RAW_PAYLOAD*: jint {.`static`.}
  NON_INDEXABLES_KEYS_COLUMNS*: string {.`static`.}
  COLUMN_INDEX_NON_INDEXABLE_KEYS_KEY_VALUE*: jint {.`static`.}
  SLICE_URI_PAIRS_COLUMNS*: string {.`static`.}

jclass android.provider.SliceUriPairColumns* of JVMObject:
  KEY*: string {.`static`.}
  SLICE_URI*: string {.`static`.}

jclass android.provider.XmlResource* of BaseColumns:
  MIME_TYPE*: string {.`static`.}
  COLUMN_XML_RESID*: string {.`static`.}

jclass android.provider.SiteMapColumns* of JVMObject:
  PARENT_CLASS*: string {.`static`.}
  CHILD_CLASS*: string {.`static`.}
  PARENT_TITLE*: string {.`static`.}
  CHILD_TITLE*: string {.`static`.}

jclass android.provider.RawData* of BaseColumns:
  MIME_TYPE*: string {.`static`.}
  COLUMN_TITLE*: string {.`static`.}
  COLUMN_SUMMARY_ON*: string {.`static`.}
  COLUMN_SUMMARY_OFF*: string {.`static`.}
  COLUMN_ENTRIES*: string {.`static`.}
  COLUMN_KEYWORDS*: string {.`static`.}
  COLUMN_SCREEN_TITLE*: string {.`static`.}
  COLUMN_KEY*: string {.`static`.}
  COLUMN_USER_ID*: string {.`static`.}
  PAYLOAD_TYPE*: string {.`static`.}
  PAYLOAD*: string {.`static`.}

jclass android.provider.NonIndexableKey* of BaseColumns:
  MIME_TYPE*: string {.`static`.}
  COLUMN_KEY_VALUE*: string {.`static`.}

jclass android.provider.BaseColumns* of JVMObject:
  COLUMN_RANK*: string {.`static`.}
  COLUMN_CLASS_NAME*: string {.`static`.}
  COLUMN_ICON_RESID*: string {.`static`.}
  COLUMN_INTENT_ACTION*: string {.`static`.}
  COLUMN_INTENT_TARGET_PACKAGE*: string {.`static`.}
  COLUMN_INTENT_TARGET_CLASS*: string {.`static`.}


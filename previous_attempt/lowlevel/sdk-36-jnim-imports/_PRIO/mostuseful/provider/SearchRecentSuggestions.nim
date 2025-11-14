import jnim

jclass android.provider.SearchRecentSuggestions* of JVMObject:
  proc saveRecentQuery*(queryString: string, line2: string)
  proc clearHistory*()
  QUERIES_PROJECTION_1LINE*: string {.`static`.}
  QUERIES_PROJECTION_2LINE*: string {.`static`.}
  QUERIES_PROJECTION_DATE_INDEX*: jint {.`static`.}
  QUERIES_PROJECTION_QUERY_INDEX*: jint {.`static`.}
  QUERIES_PROJECTION_DISPLAY1_INDEX*: jint {.`static`.}
  QUERIES_PROJECTION_DISPLAY2_INDEX*: jint {.`static`.}


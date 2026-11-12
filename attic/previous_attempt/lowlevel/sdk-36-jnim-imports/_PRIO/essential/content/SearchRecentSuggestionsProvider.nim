import jnim

jclass android.content.SearchRecentSuggestionsProvider* of ContentProvider:
  proc delete*(uri: Uri, selection: string, selectionArgs: seq[string]): jint
  proc getType*(uri: Uri): string
  proc insert*(uri: Uri, values: ContentValues): Uri
  proc onCreate*(): jboolean
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc update*(uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint
  DATABASE_MODE_QUERIES*: jint {.`static`.}
  DATABASE_MODE_2LINES*: jint {.`static`.}


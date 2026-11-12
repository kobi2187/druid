import jnim

jclass android.provider.SearchIndexablesProvider* of ContentProvider:
  proc attachInfo*(context: Context, info: ProviderInfo)
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc queryXmlResources*(projection: seq[string]): Cursor
  proc queryRawData*(projection: seq[string]): Cursor
  proc queryNonIndexableKeys*(projection: seq[string]): Cursor
  proc querySiteMapPairs*(): Cursor
  proc querySliceUriPairs*(): Cursor
  proc queryDynamicRawData*(projection: seq[string]): Cursor
  proc getType*(uri: Uri): string
  proc insert*(uri: Uri, values: ContentValues): Uri
  proc delete*(uri: Uri, selection: string, selectionArgs: seq[string]): jint
  proc update*(uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint


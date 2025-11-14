import jnim

jclass android.content.AsyncQueryHandler* of Handler:
  proc startQuery*(token: jint, cookie: JObject, uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], orderBy: string)
  proc cancelOperation*(token: jint)
  proc startInsert*(token: jint, cookie: JObject, uri: Uri, initialValues: ContentValues)
  proc startUpdate*(token: jint, cookie: JObject, uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string])
  proc startDelete*(token: jint, cookie: JObject, uri: Uri, selection: string, selectionArgs: seq[string])
  proc handleMessage*(msg: Message)


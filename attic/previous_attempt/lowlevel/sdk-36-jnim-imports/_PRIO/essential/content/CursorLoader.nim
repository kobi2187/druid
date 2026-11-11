import jnim

jclass android.content.CursorLoader* of AsyncTaskLoader:
  proc loadInBackground*(): Cursor
  proc cancelLoadInBackground*()
  proc deliverResult*(cursor: Cursor)
  proc onCanceled*(cursor: Cursor)
  proc getUri*(): Uri
  proc setUri*(uri: Uri)
  proc getProjection*(): seq[string]
  proc setProjection*(projection: seq[string])
  proc getSelection*(): string
  proc setSelection*(selection: string)
  proc getSelectionArgs*(): seq[string]
  proc setSelectionArgs*(selectionArgs: seq[string])
  proc getSortOrder*(): string
  proc setSortOrder*(sortOrder: string)
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])


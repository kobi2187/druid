import jnim

jclass android.content.ContentInsertHandler* of ContentHandler:
  proc insert*(contentResolver: ContentResolver, in: InputStream)
  proc insert*(contentResolver: ContentResolver, in: string)


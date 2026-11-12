import jnim

jclass android.content.DefaultDataHandler* of JVMObject:
  proc insert*(contentResolver: ContentResolver, in: InputStream)
  proc insert*(contentResolver: ContentResolver, in: string)
  proc startElement*(uri: string, localName: string, name: string, atts: Attributes)
  proc endElement*(uri: string, localName: string, name: string)
  proc characters*(ch: seq[jchar], start: jint, length: jint)
  proc endDocument*()
  proc endPrefixMapping*(prefix: string)
  proc ignorableWhitespace*(ch: seq[jchar], start: jint, length: jint)
  proc processingInstruction*(target: string, data: string)
  proc setDocumentLocator*(locator: Locator)
  proc skippedEntity*(name: string)
  proc startDocument*()
  proc startPrefixMapping*(prefix: string, uri: string)


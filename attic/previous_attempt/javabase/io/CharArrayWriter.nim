import jnim

jclass java.io.CharArrayWriter* of Writer:
  proc write*(c: jint)
  proc write*(c: seq[jchar], off: jint, len: jint)
  proc write*(str: string, off: jint, len: jint)
  proc writeTo*(output:Writer)
  proc append*(csq: CharSequence): CharArrayWriter
  proc append*(csq: CharSequence, start: jint, end: jint): CharArrayWriter
  proc append*(c: jchar): CharArrayWriter
  proc reset*()
  proc toCharArray*(): seq[jchar]
  proc size*(): jint
  proc toString*(): string
  proc flush*()
  proc close*()


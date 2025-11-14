import jnim

jclass java.io.StringWriter* of Writer:
  proc write*(c: jint)
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc write*(str: string)
  proc write*(str: string, off: jint, len: jint)
  proc append*(csq: CharSequence): StringWriter
  proc append*(csq: CharSequence, start: jint, end: jint): StringWriter
  proc append*(c: jchar): StringWriter
  proc toString*(): string
  proc getBuffer*(): StringBuffer
  proc flush*()
  proc close*()


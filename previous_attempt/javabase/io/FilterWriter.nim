import jnim

jclass java.io.FilterWriter* of Writer:
  proc write*(c: jint)
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc write*(str: string, off: jint, len: jint)
  proc flush*()
  proc close*()


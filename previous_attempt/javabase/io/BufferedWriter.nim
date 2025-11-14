import jnim

jclass java.io.BufferedWriter* of Writer:
  proc write*(c: jint)
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc write*(s: string, off: jint, len: jint)
  proc newLine*()
  proc flush*()
  proc close*()


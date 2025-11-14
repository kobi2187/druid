import jnim

jclass android.util.TeeWriter* of Writer:
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc flush*()
  proc close*()


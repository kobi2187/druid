import jnim

jclass android.util.LogWriter* of Writer:
  proc close*()
  proc flush*()
  proc write*(buf: seq[jchar], offset: jint, count: jint)


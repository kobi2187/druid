import jnim

jclass java.io.Writer* of JVMObject:
  proc nullWriter*(): Writer {.`static`.}
  proc write*(c: jint)
  proc write*(cbuf: seq[jchar])
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc write*(str: string)
  proc write*(str: string, off: jint, len: jint)
  proc append*(csq: CharSequence): Writer
  proc append*(csq: CharSequence, start: jint, end: jint): Writer
  proc append*(c: jchar): Writer
  proc flush*()
  proc close*()


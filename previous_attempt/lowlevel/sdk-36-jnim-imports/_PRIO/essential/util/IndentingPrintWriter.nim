import jnim

jclass android.util.IndentingPrintWriter* of PrintWriter:
  proc setIndent*(indent: string): IndentingPrintWriter
  proc setIndent*(indent: jint): IndentingPrintWriter
  proc increaseIndent*(): IndentingPrintWriter
  proc decreaseIndent*(): IndentingPrintWriter
  proc print*(key: string, value: JObject): IndentingPrintWriter
  proc printHexInt*(key: string, value: jint): IndentingPrintWriter
  proc println*()
  proc write*(c: jint)
  proc write*(s: string, off: jint, len: jint)
  proc write*(buf: seq[jchar], offset: jint, count: jint)


import jnim

jclass java.io.ByteArrayOutputStream* of OutputStream:
  proc write*(b: jint)
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc writeBytes*(b: seq[jbyte])
  proc writeTo*(output:OutputStream)
  proc reset*()
  proc toByteArray*(): seq[jbyte]
  proc size*(): jint
  proc toString*(): string
  proc toString*(charsetName: string): string
  proc toString*(charset: Charset): string
  proc toString*(hibyte: jint): string
  proc close*()


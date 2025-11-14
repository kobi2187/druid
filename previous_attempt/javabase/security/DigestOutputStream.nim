import jnim

jclass java.security.DigestOutputStream* of FilterOutputStream:
  proc getMessageDigest*(): MessageDigest
  proc setMessageDigest*(digest: MessageDigest)
  proc write*(b: jint)
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc on*(on: jboolean)
  proc toString*(): string


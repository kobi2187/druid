import jnim

jclass java.security.DigestInputStream* of FilterInputStream:
  proc getMessageDigest*(): MessageDigest
  proc setMessageDigest*(digest: MessageDigest)
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc on*(on: jboolean)
  proc toString*(): string


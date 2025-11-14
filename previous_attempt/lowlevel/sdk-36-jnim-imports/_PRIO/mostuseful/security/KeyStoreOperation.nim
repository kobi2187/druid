import jnim

jclass android.security.KeyStoreOperation* of JVMObject:
  proc getChallenge*(): Long
  proc getParameters*(): seq[KeyParameter]
  proc updateAad*(input: seq[jbyte])
  proc update*(input: seq[jbyte]): seq[jbyte]
  proc finish*(input: seq[jbyte], signature: seq[jbyte]): seq[jbyte]
  proc abort*()


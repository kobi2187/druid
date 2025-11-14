import jnim

jclass android.security.SystemKeyStore* of JVMObject:
  proc getInstance*(): SystemKeyStore {.`static`.}
  proc toHexString*(keyData: seq[jbyte]): string {.`static`.}
  proc generateNewKeyHexString*(numBits: jint, algName: string, keyName: string): string
  proc generateNewKey*(numBits: jint, algName: string, keyName: string): seq[jbyte]
  proc retrieveKeyHexString*(keyName: string): string
  proc retrieveKey*(keyName: string): seq[jbyte]
  proc deleteKey*(keyName: string)


import jnim

jclass java.security.SignedObject* of JVMObject:
  proc getObject*(): JObject
  proc getSignature*(): seq[jbyte]
  proc getAlgorithm*(): string
  proc verify*(verificationKey: PublicKey, verificationEngine: Signature): jboolean


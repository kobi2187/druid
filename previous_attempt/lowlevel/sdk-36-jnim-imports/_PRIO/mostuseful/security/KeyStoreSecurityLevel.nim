import jnim

jclass android.security.KeyStoreSecurityLevel* of JVMObject:
  proc createOperation*(keyDescriptor: KeyDescriptor, args: Collection[KeyParameter]): KeyStoreOperation
  proc generateKey*(descriptor: KeyDescriptor, attestationKey: KeyDescriptor, args: Collection[KeyParameter], flags: jint, entropy: seq[jbyte]): KeyMetadata
  proc importKey*(descriptor: KeyDescriptor, attestationKey: KeyDescriptor, args: Collection[KeyParameter], flags: jint, keyData: seq[jbyte]): KeyMetadata
  proc importWrappedKey*(wrappedKeyDescriptor: KeyDescriptor, wrappingKeyDescriptor: KeyDescriptor, wrappedKey: seq[jbyte], maskingKey: seq[jbyte], args: Collection[KeyParameter], authenticatorSpecs: seq[AuthenticatorSpec]): KeyMetadata


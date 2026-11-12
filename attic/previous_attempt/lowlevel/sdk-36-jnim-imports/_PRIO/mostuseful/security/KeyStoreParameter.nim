import jnim

jclass android.security.KeyStoreParameter* of JVMObject:
  proc getFlags*(): jint
  proc isEncryptionRequired*(): jboolean

jclass android.security.KeyStoreParameter.Builder* of JVMObject:
  proc setEncryptionRequired*(required: jboolean): Builder
  proc build*(): KeyStoreParameter

jclass android.security.Builder* of JVMObject:
  proc setEncryptionRequired*(required: jboolean): Builder
  proc build*(): KeyStoreParameter


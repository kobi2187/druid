import jnim

jclass android.nfc.NfcEvent* of JVMObject:
  proc getNfcAdapter*(): NfcAdapter
  proc getPeerLlcpMajorVersion*(): jint
  proc getPeerLlcpMinorVersion*(): jint
  nfcAdapter*: NfcAdapter
  peerLlcpMajorVersion*: jint
  peerLlcpMinorVersion*: jint


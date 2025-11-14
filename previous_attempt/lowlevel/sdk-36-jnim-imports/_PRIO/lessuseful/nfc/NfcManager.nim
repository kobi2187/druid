import jnim

jclass android.nfc.NfcManager* of JVMObject:
  proc getDefaultAdapter*(): NfcAdapter


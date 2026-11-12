import jnim

jclass android.nfc.RoutingTableSystemCodeEntry* of NfcRoutingTableEntry:
  proc getSystemCode*(): seq[jbyte]


import jnim

jclass android.nfc.NfcFrameworkInitializer* of JVMObject:
  proc setNfcServiceManager*(nfcServiceManager: NfcServiceManager) {.`static`.}
  proc getNfcServiceManager*(): NfcServiceManager {.`static`.}
  proc registerServiceWrappers*() {.`static`.}


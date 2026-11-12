import jnim

jclass android.nfc.NfcVendorNciCallbackListener* of Stub:
  proc register*(executor: Executor, callback: NfcVendorNciCallback)
  proc unregister*(callback: NfcVendorNciCallback)
  proc onVendorResponseReceived*(gid: jint, oid: jint, payload: seq[jbyte])
  proc onVendorNotificationReceived*(gid: jint, oid: jint, payload: seq[jbyte])


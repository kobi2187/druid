import jnim

jclass android.uwb.UwbVendorUciCallbackListener* of Stub:
  proc register*(executor: Executor, callback: UwbVendorUciCallback)
  proc unregister*(callback: UwbVendorUciCallback)
  proc onVendorResponseReceived*(gid: jint, oid: jint, payload: seq[jbyte])
  proc onVendorNotificationReceived*(gid: jint, oid: jint, payload: seq[jbyte])


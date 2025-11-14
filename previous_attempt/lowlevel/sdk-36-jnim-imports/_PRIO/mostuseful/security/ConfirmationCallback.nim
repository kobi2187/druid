import jnim

jclass android.security.ConfirmationCallback* of JVMObject:
  proc onConfirmed*(dataThatWasConfirmed: seq[jbyte])
  proc onDismissed*()
  proc onCanceled*()
  proc onError*(e: Throwable)


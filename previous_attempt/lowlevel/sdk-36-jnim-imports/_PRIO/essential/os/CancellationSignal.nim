import jnim

jclass android.os.CancellationSignal* of JVMObject:
  proc isCanceled*(): jboolean
  proc throwIfCanceled*()
  proc cancel*()
  proc setOnCancelListener*(listener: OnCancelListener)
  proc setRemote*(remote: ICancellationSignal)
  proc createTransport*(): ICancellationSignal {.`static`.}
  proc fromTransport*(transport: ICancellationSignal): CancellationSignal {.`static`.}


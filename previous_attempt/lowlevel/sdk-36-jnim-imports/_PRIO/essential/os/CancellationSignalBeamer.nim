import jnim

jclass android.os.CancellationSignalBeamer.Sender* of JVMObject:
  proc beam*(cs: CancellationSignal): CloseableToken
  proc onCancel*(token: IBinder)
  proc onForget*(token: IBinder)
  proc beamScopeIfNeeded*(gesture: HandwritingGesture): MustClose
  proc beamFromScope*(cs: CancellationSignal): IBinder {.`static`.}

jclass android.os.CancellationSignalBeamer.Receiver* of JVMObject:
  proc unbeam*(token: IBinder): CancellationSignal
  proc forget*(token: IBinder)
  proc cancel*(token: IBinder)
  proc binderDied*(who: IBinder)
  proc binderDied*()

jclass android.os.Sender* of JVMObject:
  proc beam*(cs: CancellationSignal): CloseableToken
  proc onCancel*(token: IBinder)
  proc onForget*(token: IBinder)
  proc beamScopeIfNeeded*(gesture: HandwritingGesture): MustClose
  proc beamFromScope*(cs: CancellationSignal): IBinder {.`static`.}

jclass android.os.MustClose* of AutoCloseable:

jclass android.os.CloseableToken* of IBinder:

jclass android.os.Receiver* of JVMObject:
  proc unbeam*(token: IBinder): CancellationSignal
  proc forget*(token: IBinder)
  proc cancel*(token: IBinder)
  proc binderDied*(who: IBinder)
  proc binderDied*()


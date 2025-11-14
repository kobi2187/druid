import jnim

jclass android.view.ImeBackAnimationController* of JVMObject:
  proc onBackStarted*(backEvent: BackEvent)
  proc onBackProgressed*(backEvent: BackEvent)
  proc onBackCancelled*()
  proc onBackInvoked*()
  proc dump*(prefix: string, writer: PrintWriter)


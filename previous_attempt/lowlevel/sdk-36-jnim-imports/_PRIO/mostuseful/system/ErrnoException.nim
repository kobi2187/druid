import jnim

jclass android.system.ErrnoException* of Exception:
  proc getMessage*(): string
  proc rethrowAsIOException*(): IOException
  proc rethrowAsSocketException*(): SocketException
  errno*: jint


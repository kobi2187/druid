import jnim

jclass android.os.RemoteException* of AndroidException:
  proc rethrowAsRuntimeException*(): RuntimeException
  proc rethrowFromSystemServer*(): RuntimeException


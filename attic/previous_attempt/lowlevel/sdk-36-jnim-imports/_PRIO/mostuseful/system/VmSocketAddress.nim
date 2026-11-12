import jnim

jclass android.system.VmSocketAddress* of SocketAddress:
  proc getSvmPort*(): jint
  proc getSvmCid*(): jint


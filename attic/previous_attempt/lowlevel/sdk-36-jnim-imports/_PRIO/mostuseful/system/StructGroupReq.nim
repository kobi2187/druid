import jnim

jclass android.system.StructGroupReq* of JVMObject:
  proc toString*(): string
  gr_interface*: jint
  gr_group*: InetAddress


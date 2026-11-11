import jnim

jclass java.net.PasswordAuthentication* of JVMObject:
  proc getUserName*(): string
  proc getPassword*(): seq[jchar]


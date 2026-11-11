import jnim

jclass android.system.StructUtsname* of JVMObject:
  proc toString*(): string
  sysname*: string
  nodename*: string
  release*: string
  version*: string
  machine*: string


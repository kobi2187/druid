import jnim

jclass android.system.StructPollfd* of JVMObject:
  proc toString*(): string
  fd*: FileDescriptor
  events*: jshort
  revents*: jshort
  userData*: JObject


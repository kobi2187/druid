import jnim

jclass android.util.EventLogTags* of JVMObject:
  proc get*(name: string): Description
  proc get*(tag: jint): Description

jclass android.util.Description* of JVMObject:
  mTag*: jint
  mName*: string


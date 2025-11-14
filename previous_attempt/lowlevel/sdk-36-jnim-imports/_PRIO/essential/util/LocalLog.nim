import jnim

jclass android.util.LocalLog* of JVMObject:
  proc log*(msg: string)
  proc dump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc dump*(pw: PrintWriter)
  proc dump*(indent: string, pw: PrintWriter)
  proc reverseDump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc reverseDump*(pw: PrintWriter)
  proc clear*()
  proc readOnlyLocalLog*(): ReadOnlyLocalLog

jclass android.util.LocalLog.ReadOnlyLocalLog* of JVMObject:
  proc dump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc dump*(pw: PrintWriter)
  proc reverseDump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc reverseDump*(pw: PrintWriter)

jclass android.util.ReadOnlyLocalLog* of JVMObject:
  proc dump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc dump*(pw: PrintWriter)
  proc reverseDump*(fd: FileDescriptor, pw: PrintWriter, args: seq[string])
  proc reverseDump*(pw: PrintWriter)


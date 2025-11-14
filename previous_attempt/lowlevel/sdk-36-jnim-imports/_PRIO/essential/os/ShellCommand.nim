import jnim

jclass android.os.ShellCommand* of BasicShellCommandHandler:
  proc exec*(target: Binder, in: FileDescriptor, output:FileDescriptor, err: FileDescriptor, args: seq[string], callback: ShellCallback, resultReceiver: ResultReceiver): jint
  proc adoptResultReceiver*(): ResultReceiver
  proc openFileForSystem*(path: string, mode: string): ParcelFileDescriptor
  proc handleDefaultCommands*(cmd: string): jint
  proc peekNextArg*(): string
  proc getShellCallback*(): ShellCallback


import jnim

jclass android.os.IBinder* of JVMObject:
  proc getInterfaceDescriptor*(): string
  proc pingBinder*(): jboolean
  proc isBinderAlive*(): jboolean
  proc queryLocalInterface*(descriptor: string): IInterface
  proc dump*(fd: FileDescriptor, args: seq[string])
  proc dumpAsync*(fd: FileDescriptor, args: seq[string])
  proc shellCommand*(in: FileDescriptor, output:FileDescriptor, err: FileDescriptor, args: seq[string], shellCallback: ShellCallback, resultReceiver: ResultReceiver)
  proc getExtension*(): IBinder
  proc transact*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc linkToDeath*(recipient: DeathRecipient, flags: jint)
  proc unlinkToDeath*(recipient: DeathRecipient, flags: jint): jboolean
  MAX_IPC_SIZE*: jint {.`static`.}

jclass android.os.IBinder.DeathRecipient* of JVMObject:
  proc binderDied*()

jclass android.os.DeathRecipient* of JVMObject:
  proc binderDied*()


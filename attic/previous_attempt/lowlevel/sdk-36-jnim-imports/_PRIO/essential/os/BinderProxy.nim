import jnim

jclass android.os.BinderProxy* of JVMObject:
  proc setTransactListener*(listener: Binder.ProxyTransactListener) {.`static`.}
  proc getSortedInterfaceCounts*(num: jint): seq[InterfaceCount] {.`static`.}
  proc getProxyCount*(): jint {.`static`.}
  proc dumpProxyDebugInfo*() {.`static`.}
  proc pingBinder*(): jboolean
  proc isBinderAlive*(): jboolean
  proc queryLocalInterface*(descriptor: string): IInterface
  proc getExtension*(): IBinder
  proc transact*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc getInterfaceDescriptor*(): string
  proc transactNative*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc linkToDeath*(recipient: DeathRecipient, flags: jint)
  proc unlinkToDeath*(recipient: DeathRecipient, flags: jint): jboolean
  proc addFrozenStateChangeCallback*(executor: Executor, callback: FrozenStateChangeCallback)
  proc removeFrozenStateChangeCallback*(callback: FrozenStateChangeCallback): jboolean
  proc isFrozenStateChangeCallbackSupported*(): jboolean {.`static`.}
  proc dump*(fd: FileDescriptor, args: seq[string])
  proc dumpAsync*(fd: FileDescriptor, args: seq[string])
  proc shellCommand*(in: FileDescriptor, output:FileDescriptor, err: FileDescriptor, args: seq[string], callback: ShellCallback, resultReceiver: ResultReceiver)

jclass android.os.BinderProxy.InterfaceCount* of JVMObject:
  proc toString*(): string

jclass android.os.InterfaceCount* of JVMObject:
  proc toString*(): string


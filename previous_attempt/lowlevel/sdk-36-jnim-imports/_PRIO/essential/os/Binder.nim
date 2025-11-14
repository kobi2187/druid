import jnim

jclass android.os.Binder* of JVMObject:
  proc enableStackTracking*() {.`static`.}
  proc disableStackTracking*() {.`static`.}
  proc isStackTrackingEnabled*(): jboolean {.`static`.}
  proc getTransactionTracker*(): TransactionTracker {.`static`.}
  proc setObserver*(observer: BinderInternal.Observer) {.`static`.}
  proc setWarnOnBlocking*(warnOnBlocking: jboolean) {.`static`.}
  proc allowBlocking*(binder: IBinder): IBinder {.`static`.}
  proc defaultBlocking*(binder: IBinder): IBinder {.`static`.}
  proc copyAllowBlocking*(fromBinder: IBinder, toBinder: IBinder) {.`static`.}
  proc allowBlockingForCurrentThread*() {.`static`.}
  proc defaultBlockingForCurrentThread*() {.`static`.}
  proc getCallingPid*(): jint {.`static`.}
  proc getCallingUid*(): jint {.`static`.}
  proc isDirectlyHandlingTransactionNative*(): jboolean {.`static`.}
  proc isDirectlyHandlingTransaction*(): jboolean {.`static`.}
  proc setIsDirectlyHandlingTransactionOverride*(isInTransaction: jboolean) {.`static`.}
  proc getCallingUidOrThrow*(): jint {.`static`.}
  proc getCallingUidOrWtf*(message: string): jint {.`static`.}
  proc getCallingUserHandle*(): UserHandle {.`static`.}
  proc clearCallingIdentity*(): jlong {.`static`.}
  proc restoreCallingIdentity*(token: jlong) {.`static`.}
  proc withCleanCallingIdentity*(action: ThrowingRunnable) {.`static`.}
  proc withCleanCallingIdentity*(action: ThrowingSupplier[T]): T {.`static`.}
  proc setThreadStrictModePolicy*(policyMask: jint) {.`static`.}
  proc getThreadStrictModePolicy*(): jint {.`static`.}
  proc setCallingWorkSourceUid*(workSource: jint): jlong {.`static`.}
  proc getCallingWorkSourceUid*(): jint {.`static`.}
  proc clearCallingWorkSource*(): jlong {.`static`.}
  proc restoreCallingWorkSource*(token: jlong) {.`static`.}
  proc markVintfStability*()
  proc forceDowngradeToSystemStability*()
  proc flushPendingCommands*() {.`static`.}
  proc joinThreadPool*() {.`static`.}
  proc isProxy*(iface: IInterface): jboolean {.`static`.}
  proc blockUntilThreadAvailable*() {.`static`.}
  proc setTransactionCallback*(callback: IBinderCallback) {.`static`.}
  proc transactionCallback*(pid: jint, code: jint, flags: jint, err: jint) {.`static`.}
  proc attachInterface*(owner: IInterface, descriptor: string)
  proc getInterfaceDescriptor*(): string
  proc pingBinder*(): jboolean
  proc isBinderAlive*(): jboolean
  proc queryLocalInterface*(descriptor: string): IInterface
  proc setDumpDisabled*(msg: string) {.`static`.}
  proc setProxyTransactListener*(listener: ProxyTransactListener) {.`static`.}
  proc getTransactionName*(transactionCode: jint): string
  proc getTransactionTraceName*(transactionCode: jint): string
  proc getMaxTransactionId*(): jint
  proc dump*(fd: FileDescriptor, args: seq[string])
  proc dumpAsync*(fd: FileDescriptor, args: seq[string])
  proc shellCommand*(in: FileDescriptor, output:FileDescriptor, err: FileDescriptor, args: seq[string], callback: ShellCallback, resultReceiver: ResultReceiver)
  proc onShellCommand*(in: FileDescriptor, output:FileDescriptor, err: FileDescriptor, args: seq[string], callback: ShellCallback, resultReceiver: ResultReceiver)
  proc handleShellCommand*(in: ParcelFileDescriptor, output:ParcelFileDescriptor, err: ParcelFileDescriptor, args: seq[string]): jint
  proc getExtension*(): IBinder
  proc setExtension*(extension: IBinder)
  proc transact*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc linkToDeath*(recipient: DeathRecipient, flags: jint)
  proc unlinkToDeath*(recipient: DeathRecipient, flags: jint): jboolean
  proc setWorkSourceProvider*(workSourceProvider: BinderInternal.WorkSourceProvider) {.`static`.}
  proc setHeavyHitterWatcherConfig*(enabled: jboolean, batchSize: jint, threshold: jfloat, listener: BinderCallHeavyHitterListener) {.`static`.}
  CHECK_PARCEL_SIZE*: jboolean {.`static`.}
  LOG_RUNTIME_EXCEPTION*: jboolean {.`static`.}
  UNSET_WORKSOURCE*: jint {.`static`.}

jclass android.os.Binder.PropagateWorkSourceTransactListener* of JVMObject:
  proc onTransactStarted*(binder: IBinder, transactionCode: jint): JObject
  proc onTransactEnded*(session: JObject)


jclass android.os.PropagateWorkSourceTransactListener* of JVMObject:
  proc onTransactStarted*(binder: IBinder, transactionCode: jint): JObject
  proc onTransactEnded*(session: JObject)


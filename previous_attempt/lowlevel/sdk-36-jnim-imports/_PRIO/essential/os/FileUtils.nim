import jnim

jclass android.os.FileUtils* of JVMObject:
  proc setPermissions*(path: File, mode: jint, uid: jint, gid: jint): jint {.`static`.}
  proc setPermissions*(path: string, mode: jint, uid: jint, gid: jint): jint {.`static`.}
  proc setPermissions*(fd: FileDescriptor, mode: jint, uid: jint, gid: jint): jint {.`static`.}
  proc copyPermissions*(from: File, to: File) {.`static`.}
  proc getUid*(path: string): jint {.`static`.}
  proc sync*(stream: FileOutputStream): jboolean {.`static`.}
  proc copyFile*(srcFile: File, destFile: File): jboolean {.`static`.}
  proc copyFileOrThrow*(srcFile: File, destFile: File) {.`static`.}
  proc copyToFile*(inputStream: InputStream, destFile: File): jboolean {.`static`.}
  proc copyToFileOrThrow*(in: InputStream, destFile: File) {.`static`.}
  proc copy*(from: File, to: File): jlong {.`static`.}
  proc copy*(from: File, to: File, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copy*(in: InputStream, output:OutputStream): jlong {.`static`.}
  proc copy*(in: InputStream, output:OutputStream, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copy*(in: FileDescriptor, output:FileDescriptor): jlong {.`static`.}
  proc copy*(in: FileDescriptor, output:FileDescriptor, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copy*(in: FileDescriptor, output:FileDescriptor, count: jlong, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copyInternalSplice*(in: FileDescriptor, output:FileDescriptor, count: jlong, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copyInternalSpliceSocket*(in: FileDescriptor, output:FileDescriptor, count: jlong, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copyInternalSendfile*(in: FileDescriptor, output:FileDescriptor, count: jlong, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copyInternalUserspace*(in: FileDescriptor, output:FileDescriptor, listener: ProgressListener, signal: CancellationSignal, count: jlong): jlong {.`static`.}
  proc copyInternalUserspace*(in: FileDescriptor, output:FileDescriptor, count: jlong, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc copyInternalUserspace*(in: InputStream, output:OutputStream, signal: CancellationSignal, executor: Executor, listener: ProgressListener): jlong {.`static`.}
  proc isFilenameSafe*(file: File): jboolean {.`static`.}
  proc readTextFile*(file: File, max: jint, ellipsis: string): string {.`static`.}
  proc stringToFile*(file: File, string: string) {.`static`.}
  proc bytesToFile*(filename: string, content: seq[jbyte]) {.`static`.}
  proc stringToFile*(filename: string, string: string) {.`static`.}
  proc checksumCrc32*(file: File): jlong {.`static`.}
  proc digest*(file: File, algorithm: string): seq[jbyte] {.`static`.}
  proc digest*(in: InputStream, algorithm: string): seq[jbyte] {.`static`.}
  proc digest*(fd: FileDescriptor, algorithm: string): seq[jbyte] {.`static`.}
  proc deleteOlderFiles*(dir: File, minCount: jint, minAgeMs: jlong): jboolean {.`static`.}
  proc contains*(dirs: seq[File], file: File): jboolean {.`static`.}
  proc contains*(dirs: Collection[File], file: File): jboolean {.`static`.}
  proc contains*(dir: File, file: File): jboolean {.`static`.}
  proc contains*(dirPath: string, filePath: string): jboolean {.`static`.}
  proc deleteContentsAndDir*(dir: File): jboolean {.`static`.}
  proc deleteContents*(dir: File): jboolean {.`static`.}
  proc isValidExtFilename*(name: string): jboolean {.`static`.}
  proc buildValidExtFilename*(name: string): string {.`static`.}
  proc isValidFatFilename*(name: string): jboolean {.`static`.}
  proc buildValidFatFilename*(name: string): string {.`static`.}
  proc trimFilename*(str: string, maxBytes: jint): string {.`static`.}
  proc rewriteAfterRename*(beforeDir: File, afterDir: File, path: string): string {.`static`.}
  proc rewriteAfterRename*(beforeDir: File, afterDir: File, paths: seq[string]): seq[string] {.`static`.}
  proc rewriteAfterRename*(beforeDir: File, afterDir: File, file: File): File {.`static`.}
  proc buildUniqueFile*(parent: File, mimeType: string, displayName: string): File {.`static`.}
  proc buildNonUniqueFile*(parent: File, mimeType: string, displayName: string): File {.`static`.}
  proc buildUniqueFile*(parent: File, displayName: string): File {.`static`.}
  proc splitFileName*(mimeType: string, displayName: string): seq[string] {.`static`.}
  proc listOrEmpty*(dir: File): seq[string] {.`static`.}
  proc listFilesOrEmpty*(dir: File): seq[File] {.`static`.}
  proc listFilesOrEmpty*(dir: File, filter: FilenameFilter): seq[File] {.`static`.}
  proc newFileOrNull*(path: string): File {.`static`.}
  proc createDir*(baseDir: File, name: string): File {.`static`.}
  proc createDir*(dir: File): jboolean {.`static`.}
  proc roundStorageSize*(size: jlong): jlong {.`static`.}
  proc parseSize*(fmtSize: string): jlong {.`static`.}
  proc closeQuietly*(closeable: AutoCloseable) {.`static`.}
  proc closeQuietly*(fd: FileDescriptor) {.`static`.}
  proc translateModeStringToPosix*(mode: string): jint {.`static`.}
  proc translateModePosixToString*(mode: jint): string {.`static`.}
  proc translateModePosixToPfd*(mode: jint): jint {.`static`.}
  proc translateModePfdToPosix*(mode: jint): jint {.`static`.}
  proc translateModeAccessToPosix*(mode: jint): jint {.`static`.}
  proc convertToModernFd*(fd: FileDescriptor): ParcelFileDescriptor {.`static`.}
  S_IRWXU*: jint {.`static`.}
  S_IRUSR*: jint {.`static`.}
  S_IWUSR*: jint {.`static`.}
  S_IXUSR*: jint {.`static`.}
  S_IRWXG*: jint {.`static`.}
  S_IRGRP*: jint {.`static`.}
  S_IWGRP*: jint {.`static`.}
  S_IXGRP*: jint {.`static`.}
  S_IRWXO*: jint {.`static`.}
  S_IROTH*: jint {.`static`.}
  S_IWOTH*: jint {.`static`.}
  S_IXOTH*: jint {.`static`.}

jclass android.os.FileUtils.ProgressListener* of JVMObject:
  proc onProgress*(progress: jlong)

jclass android.os.FileUtils.MemoryPipe* of JVMObject:
  proc createSource*(data: seq[jbyte]): MemoryPipe {.`static`.}
  proc createSink*(data: seq[jbyte]): MemoryPipe {.`static`.}
  proc getFD*(): FileDescriptor
  proc getInternalFD*(): FileDescriptor
  proc run*()
  proc close*()

jclass android.os.ProgressListener* of JVMObject:
  proc onProgress*(progress: jlong)

jclass android.os.MemoryPipe* of Thread:
  proc createSource*(data: seq[jbyte]): MemoryPipe {.`static`.}
  proc createSink*(data: seq[jbyte]): MemoryPipe {.`static`.}
  proc getFD*(): FileDescriptor
  proc getInternalFD*(): FileDescriptor
  proc run*()
  proc close*()


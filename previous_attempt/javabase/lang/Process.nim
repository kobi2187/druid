import jnim

jclass java.lang.Process* of JVMObject:
  proc getOutputStream*(): OutputStream
  proc getInputStream*(): InputStream
  proc getErrorStream*(): InputStream
  proc inputReader*(): BufferedReader
  proc inputReader*(charset: Charset): BufferedReader
  proc errorReader*(): BufferedReader
  proc errorReader*(charset: Charset): BufferedReader
  proc outputWriter*(): BufferedWriter
  proc outputWriter*(charset: Charset): BufferedWriter
  proc waitFor*(): jint
  proc waitFor*(timeout: jlong, unit: TimeUnit): jboolean
  proc waitFor*(duration: Duration): jboolean
  proc exitValue*(): jint
  proc destroy*()
  proc destroyForcibly*(): Process
  proc supportsNormalTermination*(): jboolean
  proc isAlive*(): jboolean
  proc pid*(): jlong
  proc onExit*(): CompletableFuture[Process]
  proc toHandle*(): ProcessHandle
  proc info*(): ProcessHandle.Info
  proc children*(): Stream[ProcessHandle]
  proc descendants*(): Stream[ProcessHandle]


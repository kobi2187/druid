import jnim

jclass java.lang.Throwable* of JVMObject:
  proc getMessage*(): string
  proc getLocalizedMessage*(): string
  proc getCause*(): Throwable
  proc initCause*(cause: Throwable): Throwable
  proc toString*(): string
  proc printStackTrace*()
  proc printStackTrace*(s: PrintStream)
  proc printStackTrace*(s: PrintWriter)
  proc fillInStackTrace*(): Throwable
  proc getStackTrace*(): seq[StackTraceElement]
  proc setStackTrace*(stackTrace: seq[StackTraceElement])
  proc addSuppressed*(exception: Throwable)
  proc getSuppressed*(): seq[Throwable]


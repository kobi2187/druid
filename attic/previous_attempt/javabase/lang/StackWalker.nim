import jnim

jclass java.lang.StackWalker* of JVMObject:
  proc getInstance*(): StackWalker {.`static`.}
  proc getInstance*(option: Option): StackWalker {.`static`.}
  proc getInstance*(options: Set[Option]): StackWalker {.`static`.}
  proc getInstance*(options: Set[Option], estimateDepth: jint): StackWalker {.`static`.}
  proc walk*(function: Function[? super Stream[StackFrame], ? extends T]): T
  proc forEach*(action: Consumer[? super StackFrame])
  proc getCallerClass*(): Class[?]

jclass java.lang.StackWalker.StackFrame* of JVMObject:
  proc getClassName*(): string
  proc getMethodName*(): string
  proc getDeclaringClass*(): Class[?]
  proc getMethodType*(): MethodType
  proc getDescriptor*(): string
  proc getByteCodeIndex*(): jint
  proc getFileName*(): string
  proc getLineNumber*(): jint
  proc isNativeMethod*(): jboolean
  proc toStackTraceElement*(): StackTraceElement

jclass java.lang.StackFrame* of JVMObject:
  proc getClassName*(): string
  proc getMethodName*(): string
  proc getDeclaringClass*(): Class[?]
  proc getMethodType*(): MethodType
  proc getDescriptor*(): string
  proc getByteCodeIndex*(): jint
  proc getFileName*(): string
  proc getLineNumber*(): jint
  proc isNativeMethod*(): jboolean
  proc toStackTraceElement*(): StackTraceElement


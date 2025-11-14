import jnim

jclass java.lang.ClassLoader* of JVMObject:
  proc getName*(): string
  proc loadClass*(name: string): Class[?]
  proc getResource*(name: string): URL
  proc getResources*(name: string): Enumeration[URL]
  proc resources*(name: string): Stream[URL]
  proc isRegisteredAsParallelCapable*(): jboolean
  proc getSystemResource*(name: string): URL {.`static`.}
  proc getSystemResources*(name: string): Enumeration[URL] {.`static`.}
  proc getResourceAsStream*(name: string): InputStream
  proc getSystemResourceAsStream*(name: string): InputStream {.`static`.}
  proc getParent*(): ClassLoader
  proc getUnnamedModule*(): Module
  proc getPlatformClassLoader*(): ClassLoader {.`static`.}
  proc getSystemClassLoader*(): ClassLoader {.`static`.}
  proc getDefinedPackage*(name: string): Package
  proc getDefinedPackages*(): seq[Package]
  proc setDefaultAssertionStatus*(enabled: jboolean)
  proc setPackageAssertionStatus*(packageName: string, enabled: jboolean)
  proc setClassAssertionStatus*(className: string, enabled: jboolean)
  proc clearAssertionStatus*()


import jnim

jclass java.lang.SecurityManager* of JVMObject:
  proc getSecurityContext*(): JObject
  proc checkPermission*(perm: Permission)
  proc checkPermission*(perm: Permission, context: JObject)
  proc checkCreateClassLoader*()
  proc checkAccess*(t: Thread)
  proc checkAccess*(g: ThreadGroup)
  proc checkExit*(status: jint)
  proc checkExec*(cmd: string)
  proc checkLink*(lib: string)
  proc checkRead*(fd: FileDescriptor)
  proc checkRead*(file: string)
  proc checkRead*(file: string, context: JObject)
  proc checkWrite*(fd: FileDescriptor)
  proc checkWrite*(file: string)
  proc checkDelete*(file: string)
  proc checkConnect*(host: string, port: jint)
  proc checkConnect*(host: string, port: jint, context: JObject)
  proc checkListen*(port: jint)
  proc checkAccept*(host: string, port: jint)
  proc checkMulticast*(maddr: InetAddress)
  proc checkMulticast*(maddr: InetAddress, ttl: jbyte)
  proc checkPropertiesAccess*()
  proc checkPropertyAccess*(key: string)
  proc checkPrintJobAccess*()
  proc checkPackageAccess*(pkg: string)
  proc checkPackageDefinition*(pkg: string)
  proc checkSetFactory*()
  proc checkSecurityAccess*(target: string)
  proc getThreadGroup*(): ThreadGroup


import jnim

jclass java.security.AccessController* of JVMObject:
  proc doPrivileged*(action: PrivilegedAction[T]): T {.`static`.}
  proc doPrivilegedWithCombiner*(action: PrivilegedAction[T]): T {.`static`.}
  proc doPrivileged*(action: PrivilegedAction[T], context: AccessControlContext): T {.`static`.}
  proc doPrivileged*(action: PrivilegedAction[T], context: AccessControlContext, perms: Permission): T {.`static`.}
  proc doPrivilegedWithCombiner*(action: PrivilegedAction[T], context: AccessControlContext, perms: Permission): T {.`static`.}
  proc doPrivileged*(action: PrivilegedExceptionAction[T]): T {.`static`.}
  proc doPrivilegedWithCombiner*(action: PrivilegedExceptionAction[T]): T {.`static`.}
  proc doPrivileged*(action: PrivilegedExceptionAction[T], context: AccessControlContext): T {.`static`.}
  proc doPrivileged*(action: PrivilegedExceptionAction[T], context: AccessControlContext, perms: Permission): T {.`static`.}
  proc doPrivilegedWithCombiner*(action: PrivilegedExceptionAction[T], context: AccessControlContext, perms: Permission): T {.`static`.}
  proc getContext*(): AccessControlContext {.`static`.}
  proc checkPermission*(perm: Permission) {.`static`.}


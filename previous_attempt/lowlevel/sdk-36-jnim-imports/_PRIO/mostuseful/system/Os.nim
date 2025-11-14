import jnim

jclass android.system.Os* of JVMObject:
  proc accept*(fd: FileDescriptor, peerAddress: InetSocketAddress): FileDescriptor {.`static`.}
  proc accept*(fd: FileDescriptor, peerAddress: SocketAddress): FileDescriptor {.`static`.}
  proc access*(path: string, mode: jint): jboolean {.`static`.}
  proc android_getaddrinfo*(node: string, hints: StructAddrinfo, netId: jint): seq[InetAddress] {.`static`.}
  proc bind*(fd: FileDescriptor, address: InetAddress, port: jint) {.`static`.}
  proc bind*(fd: FileDescriptor, address: SocketAddress) {.`static`.}
  proc capget*(hdr: StructCapUserHeader): seq[StructCapUserData] {.`static`.}
  proc capset*(hdr: StructCapUserHeader, data: seq[StructCapUserData]) {.`static`.}
  proc chmod*(path: string, mode: jint) {.`static`.}
  proc chown*(path: string, uid: jint, gid: jint) {.`static`.}
  proc close*(fd: FileDescriptor) {.`static`.}
  proc connect*(fd: FileDescriptor, address: InetAddress, port: jint) {.`static`.}
  proc connect*(fd: FileDescriptor, address: SocketAddress) {.`static`.}
  proc dup*(oldFd: FileDescriptor): FileDescriptor {.`static`.}
  proc dup2*(oldFd: FileDescriptor, newFd: jint): FileDescriptor {.`static`.}
  proc environ*(): seq[string] {.`static`.}
  proc execv*(filename: string, argv: seq[string]) {.`static`.}
  proc execve*(filename: string, argv: seq[string], envp: seq[string]) {.`static`.}
  proc fchmod*(fd: FileDescriptor, mode: jint) {.`static`.}
  proc fchown*(fd: FileDescriptor, uid: jint, gid: jint) {.`static`.}
  proc fcntlInt*(fd: FileDescriptor, cmd: jint, arg: jint): jint {.`static`.}
  proc fcntlVoid*(fd: FileDescriptor, cmd: jint): jint {.`static`.}
  proc fdatasync*(fd: FileDescriptor) {.`static`.}
  proc fstat*(fd: FileDescriptor): StructStat {.`static`.}
  proc fstatvfs*(fd: FileDescriptor): StructStatVfs {.`static`.}
  proc fsync*(fd: FileDescriptor) {.`static`.}
  proc ftruncate*(fd: FileDescriptor, length: jlong) {.`static`.}
  proc gai_strerror*(error: jint): string {.`static`.}
  proc getegid*(): jint {.`static`.}
  proc geteuid*(): jint {.`static`.}
  proc getgid*(): jint {.`static`.}
  proc getenv*(name: string): string {.`static`.}
  proc getifaddrs*(): seq[StructIfaddrs] {.`static`.}
  proc getnameinfo*(address: InetAddress, flags: jint): string {.`static`.}
  proc getpeername*(fd: FileDescriptor): SocketAddress {.`static`.}
  proc getpgid*(pid: jint): jint {.`static`.}
  proc getpid*(): jint {.`static`.}
  proc getppid*(): jint {.`static`.}
  proc getpwnam*(name: string): StructPasswd {.`static`.}
  proc getpwuid*(uid: jint): StructPasswd {.`static`.}
  proc getrlimit*(resource: jint): StructRlimit {.`static`.}
  proc getsockname*(fd: FileDescriptor): SocketAddress {.`static`.}
  proc getsockoptByte*(fd: FileDescriptor, level: jint, option: jint): jint {.`static`.}
  proc getsockoptInAddr*(fd: FileDescriptor, level: jint, option: jint): InetAddress {.`static`.}
  proc getsockoptInt*(fd: FileDescriptor, level: jint, option: jint): jint {.`static`.}
  proc getsockoptLinger*(fd: FileDescriptor, level: jint, option: jint): StructLinger {.`static`.}
  proc getsockoptTimeval*(fd: FileDescriptor, level: jint, option: jint): StructTimeval {.`static`.}
  proc getsockoptUcred*(fd: FileDescriptor, level: jint, option: jint): StructUcred {.`static`.}
  proc gettid*(): jint {.`static`.}
  proc getuid*(): jint {.`static`.}
  proc getxattr*(path: string, name: string): seq[jbyte] {.`static`.}
  proc if_indextoname*(index: jint): string {.`static`.}
  proc if_nametoindex*(name: string): jint {.`static`.}
  proc inet_pton*(family: jint, address: string): InetAddress {.`static`.}
  proc ioctlInetAddress*(fd: FileDescriptor, cmd: jint, interfaceName: string): InetAddress {.`static`.}
  proc ioctlInt*(fd: FileDescriptor, cmd: jint): jint {.`static`.}
  proc isatty*(fd: FileDescriptor): jboolean {.`static`.}
  proc kill*(pid: jint, signal: jint) {.`static`.}
  proc lchown*(path: string, uid: jint, gid: jint) {.`static`.}
  proc link*(oldPath: string, newPath: string) {.`static`.}
  proc listen*(fd: FileDescriptor, backlog: jint) {.`static`.}
  proc listxattr*(path: string): seq[string] {.`static`.}
  proc lseek*(fd: FileDescriptor, offset: jlong, whence: jint): jlong {.`static`.}
  proc lstat*(path: string): StructStat {.`static`.}
  proc madvise*(address: jlong, byteCount: jlong, advice: jint) {.`static`.}
  proc memfd_create*(name: string, flags: jint): FileDescriptor {.`static`.}
  proc mincore*(address: jlong, byteCount: jlong, vector: seq[jbyte]) {.`static`.}
  proc mkdir*(path: string, mode: jint) {.`static`.}
  proc mkfifo*(path: string, mode: jint) {.`static`.}
  proc mlock*(address: jlong, byteCount: jlong) {.`static`.}
  proc mmap*(address: jlong, byteCount: jlong, prot: jint, flags: jint, fd: FileDescriptor, offset: jlong): jlong {.`static`.}
  proc msync*(address: jlong, byteCount: jlong, flags: jint) {.`static`.}
  proc munlock*(address: jlong, byteCount: jlong) {.`static`.}
  proc munmap*(address: jlong, byteCount: jlong) {.`static`.}
  proc open*(path: string, flags: jint, mode: jint): FileDescriptor {.`static`.}
  proc pipe*(): seq[FileDescriptor] {.`static`.}
  proc pipe2*(flags: jint): seq[FileDescriptor] {.`static`.}
  proc poll*(fds: seq[StructPollfd], timeoutMs: jint): jint {.`static`.}
  proc posix_fallocate*(fd: FileDescriptor, offset: jlong, length: jlong) {.`static`.}
  proc prctl*(option: jint, arg2: jlong, arg3: jlong, arg4: jlong, arg5: jlong): jint {.`static`.}
  proc pread*(fd: FileDescriptor, buffer: ByteBuffer, offset: jlong): jint {.`static`.}
  proc pread*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint, offset: jlong): jint {.`static`.}
  proc pwrite*(fd: FileDescriptor, buffer: ByteBuffer, offset: jlong): jint {.`static`.}
  proc pwrite*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint, offset: jlong): jint {.`static`.}
  proc read*(fd: FileDescriptor, buffer: ByteBuffer): jint {.`static`.}
  proc read*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint): jint {.`static`.}
  proc readlink*(path: string): string {.`static`.}
  proc realpath*(path: string): string {.`static`.}
  proc readv*(fd: FileDescriptor, buffers: seq[JObject], offsets: seq[jint], byteCounts: seq[jint]): jint {.`static`.}
  proc recvfrom*(fd: FileDescriptor, buffer: ByteBuffer, flags: jint, srcAddress: InetSocketAddress): jint {.`static`.}
  proc recvfrom*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint, flags: jint, srcAddress: InetSocketAddress): jint {.`static`.}
  proc recvmsg*(fd: FileDescriptor, msg: StructMsghdr, flags: jint): jint {.`static`.}
  proc remove*(path: string) {.`static`.}
  proc removexattr*(path: string, name: string) {.`static`.}
  proc rename*(oldPath: string, newPath: string) {.`static`.}
  proc sendfile*(outFd: FileDescriptor, inFd: FileDescriptor, offset: Int64Ref, byteCount: jlong): jlong {.`static`.}
  proc sendmsg*(fd: FileDescriptor, msg: StructMsghdr, flags: jint): jint {.`static`.}
  proc sendto*(fd: FileDescriptor, buffer: ByteBuffer, flags: jint, inetAddress: InetAddress, port: jint): jint {.`static`.}
  proc sendto*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint, flags: jint, inetAddress: InetAddress, port: jint): jint {.`static`.}
  proc sendto*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint, flags: jint, address: SocketAddress): jint {.`static`.}
  proc setegid*(egid: jint) {.`static`.}
  proc setenv*(name: string, value: string, overwrite: jboolean) {.`static`.}
  proc seteuid*(euid: jint) {.`static`.}
  proc setgid*(gid: jint) {.`static`.}
  proc setpgid*(pid: jint, pgid: jint) {.`static`.}
  proc setregid*(rgid: jint, egid: jint) {.`static`.}
  proc setreuid*(ruid: jint, euid: jint) {.`static`.}
  proc setsid*(): jint {.`static`.}
  proc setsockoptByte*(fd: FileDescriptor, level: jint, option: jint, value: jint) {.`static`.}
  proc setsockoptIfreq*(fd: FileDescriptor, level: jint, option: jint, value: string) {.`static`.}
  proc setsockoptInt*(fd: FileDescriptor, level: jint, option: jint, value: jint) {.`static`.}
  proc setsockoptIpMreqn*(fd: FileDescriptor, level: jint, option: jint, value: jint) {.`static`.}
  proc setsockoptGroupReq*(fd: FileDescriptor, level: jint, option: jint, value: StructGroupReq) {.`static`.}
  proc setsockoptLinger*(fd: FileDescriptor, level: jint, option: jint, value: StructLinger) {.`static`.}
  proc setsockoptTimeval*(fd: FileDescriptor, level: jint, option: jint, value: StructTimeval) {.`static`.}
  proc setuid*(uid: jint) {.`static`.}
  proc setxattr*(path: string, name: string, value: seq[jbyte], flags: jint) {.`static`.}
  proc shutdown*(fd: FileDescriptor, how: jint) {.`static`.}
  proc socket*(domain: jint, type: jint, protocol: jint): FileDescriptor {.`static`.}
  proc socketpair*(domain: jint, type: jint, protocol: jint, fd1: FileDescriptor, fd2: FileDescriptor) {.`static`.}
  proc splice*(fdIn: FileDescriptor, offIn: Int64Ref, fdOut: FileDescriptor, offOut: Int64Ref, len: jlong, flags: jint): jlong {.`static`.}
  proc stat*(path: string): StructStat {.`static`.}
  proc statvfs*(path: string): StructStatVfs {.`static`.}
  proc strerror*(errno: jint): string {.`static`.}
  proc strsignal*(signal: jint): string {.`static`.}
  proc symlink*(oldPath: string, newPath: string) {.`static`.}
  proc sysconf*(name: jint): jlong {.`static`.}
  proc tcdrain*(fd: FileDescriptor) {.`static`.}
  proc tcsendbreak*(fd: FileDescriptor, duration: jint) {.`static`.}
  proc umask*(mask: jint): jint {.`static`.}
  proc uname*(): StructUtsname {.`static`.}
  proc unlink*(pathname: string) {.`static`.}
  proc unsetenv*(name: string) {.`static`.}
  proc waitpid*(pid: jint, status: Int32Ref, options: jint): jint {.`static`.}
  proc write*(fd: FileDescriptor, buffer: ByteBuffer): jint {.`static`.}
  proc write*(fd: FileDescriptor, bytes: seq[jbyte], byteOffset: jint, byteCount: jint): jint {.`static`.}
  proc writev*(fd: FileDescriptor, buffers: seq[JObject], offsets: seq[jint], byteCounts: seq[jint]): jint {.`static`.}


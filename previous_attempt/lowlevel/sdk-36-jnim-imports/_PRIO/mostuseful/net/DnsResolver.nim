import jnim

jclass android.net.DnsResolver* of JVMObject:
  proc getInstance*(): DnsResolver {.`static`.}
  proc rawQuery*(network: Network, query: seq[jbyte], flags: jint, executor: Executor, cancellationSignal: CancellationSignal, callback: Callback[seq[? super byte]])
  proc rawQuery*(network: Network, domain: string, nsClass: jint, nsType: jint, flags: jint, executor: Executor, cancellationSignal: CancellationSignal, callback: Callback[seq[? super byte]])
  proc query*(network: Network, domain: string, flags: jint, executor: Executor, cancellationSignal: CancellationSignal, callback: Callback[? super List[InetAddress]])
  proc query*(network: Network, domain: string, nsType: jint, flags: jint, executor: Executor, cancellationSignal: CancellationSignal, callback: Callback[? super List[InetAddress]])
  CLASS_IN*: jint {.`static`.}
  TYPE_A*: jint {.`static`.}
  TYPE_AAAA*: jint {.`static`.}
  TYPE_PTR*: jint {.`static`.}
  TYPE_TXT*: jint {.`static`.}
  TYPE_SRV*: jint {.`static`.}
  TYPE_ANY*: jint {.`static`.}
  FLAG_EMPTY*: jint {.`static`.}
  FLAG_NO_RETRY*: jint {.`static`.}
  FLAG_NO_CACHE_STORE*: jint {.`static`.}
  FLAG_NO_CACHE_LOOKUP*: jint {.`static`.}
  ERROR_PARSE*: jint {.`static`.}
  ERROR_SYSTEM*: jint {.`static`.}


jclass android.net.DnsException* of Exception:
  code*: jint

jclass android.net.DnsResponse* of JVMObject:
  answerbuf*: jbyte
  rcode*: jint


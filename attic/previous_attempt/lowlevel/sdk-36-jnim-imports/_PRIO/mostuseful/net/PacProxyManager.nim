import jnim

jclass android.net.PacProxyManager* of JVMObject:
  proc addPacProxyInstalledListener*(executor: Executor, listener: PacProxyInstalledListener)
  proc removePacProxyInstalledListener*(listener: PacProxyInstalledListener)
  proc setCurrentProxyScriptUrl*(proxy: ProxyInfo)

jclass android.net.PacProxyManager.PacProxyInstalledListenerProxy* of JVMObject:
  proc onPacProxyInstalled*(network: Network, proxy: ProxyInfo)


jclass android.net.PacProxyInstalledListenerProxy* of Stub:
  proc onPacProxyInstalled*(network: Network, proxy: ProxyInfo)


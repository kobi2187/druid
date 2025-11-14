import jnim

jclass android.view.TunnelModeEnabledListener* of JVMObject:
  proc destroy*()
  proc onTunnelModeEnabledChanged*(tunnelModeEnabled: jboolean)
  proc register*(listener: TunnelModeEnabledListener) {.`static`.}
  proc unregister*(listener: TunnelModeEnabledListener) {.`static`.}
  proc dispatchOnTunnelModeEnabledChanged*(listener: TunnelModeEnabledListener, tunnelModeEnabled: jboolean) {.`static`.}


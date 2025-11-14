import jnim

jclass android.net.Ikev2VpnProfile* of PlatformVpnProfile:
  proc hasAeadAlgorithms*(algorithmNames: List[string]): jboolean {.`static`.}
  proc hasNormalModeAlgorithms*(algorithmNames: List[string]): jboolean {.`static`.}
  proc getServerAddr*(): string
  proc getUserIdentity*(): string
  proc getPresharedKey*(): seq[jbyte]
  proc getServerRootCaCert*(): X509Certificate
  proc getUsername*(): string
  proc getPassword*(): string
  proc getRsaPrivateKey*(): PrivateKey
  proc getUserCert*(): X509Certificate
  proc getProxyInfo*(): ProxyInfo
  proc getAllowedAlgorithms*(): List[string]
  proc isBypassable*(): jboolean
  proc isMetered*(): jboolean
  proc getMaxMtu*(): jint
  proc getIkeTunnelConnectionParams*(): IkeTunnelConnectionParams
  proc isRestrictedToTestNetworks*(): jboolean
  proc isAutomaticNattKeepaliveTimerEnabled*(): jboolean
  proc isAutomaticIpVersionSelectionEnabled*(): jboolean
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toVpnProfile*(): VpnProfile
  proc fromVpnProfile*(profile: VpnProfile): Ikev2VpnProfile {.`static`.}
  proc isValidVpnProfile*(profile: VpnProfile): jboolean {.`static`.}
  proc certificateToPemString*(cert: X509Certificate): string {.`static`.}
  proc encodeForIpsecSecret*(secret: seq[jbyte]): string {.`static`.}
  proc toString*(): string
  PREFIX_KEYSTORE_ALIAS*: string {.`static`.}
  PREFIX_INLINE*: string {.`static`.}
  DEFAULT_ALGORITHMS*: List[string] {.`static`.}

jclass android.net.Ikev2VpnProfile.Builder* of JVMObject:
  proc setAuthUsernamePassword*(user: string, pass: string, serverRootCa: X509Certificate): Builder
  proc setAuthDigitalSignature*(userCert: X509Certificate, key: PrivateKey, serverRootCa: X509Certificate): Builder
  proc setAuthPsk*(psk: seq[jbyte]): Builder
  proc setBypassable*(isBypassable: jboolean): Builder
  proc setProxy*(proxy: ProxyInfo): Builder
  proc setMaxMtu*(mtu: jint): Builder
  proc setRequiresInternetValidation*(requiresInternetValidation: jboolean): Builder
  proc setMetered*(isMetered: jboolean): Builder
  proc setAllowedAlgorithms*(algorithmNames: List[string]): Builder
  proc restrictToTestNetworks*(): Builder
  proc setAutomaticNattKeepaliveTimerEnabled*(isEnabled: jboolean): Builder
  proc setAutomaticIpVersionSelectionEnabled*(isEnabled: jboolean): Builder
  proc setLocalRoutesExcluded*(excludeLocalRoutes: jboolean): Builder
  proc build*(): Ikev2VpnProfile

jclass android.net.Builder* of JVMObject:
  proc setAuthUsernamePassword*(user: string, pass: string, serverRootCa: X509Certificate): Builder
  proc setAuthDigitalSignature*(userCert: X509Certificate, key: PrivateKey, serverRootCa: X509Certificate): Builder
  proc setAuthPsk*(psk: seq[jbyte]): Builder
  proc setBypassable*(isBypassable: jboolean): Builder
  proc setProxy*(proxy: ProxyInfo): Builder
  proc setMaxMtu*(mtu: jint): Builder
  proc setRequiresInternetValidation*(requiresInternetValidation: jboolean): Builder
  proc setMetered*(isMetered: jboolean): Builder
  proc setAllowedAlgorithms*(algorithmNames: List[string]): Builder
  proc restrictToTestNetworks*(): Builder
  proc setAutomaticNattKeepaliveTimerEnabled*(isEnabled: jboolean): Builder
  proc setAutomaticIpVersionSelectionEnabled*(isEnabled: jboolean): Builder
  proc setLocalRoutesExcluded*(excludeLocalRoutes: jboolean): Builder
  proc build*(): Ikev2VpnProfile


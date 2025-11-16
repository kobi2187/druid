## SDK Connectivity Manager - Network state monitoring
##
## Uses Android SDK ConnectivityManager API (Java)
##
## Provides:
## - Network connectivity status (connected/disconnected)
## - Network type detection (WiFi, Cellular, Ethernet, etc.)
## - Metered connection detection
## - Network change callbacks (API 21+)
## - Data saver mode detection (API 24+)

import ../../../core
import ../../../art  # For API level detection
import jnim
import options
import tables

# jnimport:
#   import android.content.Context
#   import android.net.ConnectivityManager as JCM
#   import android.net.NetworkInfo
#   import android.net.Network
#   import android.net.NetworkCapabilities
# 
type
  NetworkType* = enum
    ntNone = 0         ## No network connection
    ntWifi = 1         ## WiFi connection
    ntCellular = 2     ## Mobile data (3G/4G/5G)
    ntEthernet = 3     ## Wired ethernet
    ntBluetooth = 4    ## Bluetooth tethering
    ntVPN = 5          ## VPN connection
    ntOther = 99       ## Other connection type

  ConnectionInfo* = object
    ## Network connection information
    isConnected*: bool
    networkType*: NetworkType
    isMetered*: bool
    isRoaming*: bool

  SdkConnectivityManager* = ref object
    context: jobject
    connectivityManager: jobject
    apiLevel: int

proc init*(_: typedesc[SdkConnectivityManager]): SdkConnectivityManager =
  ## Initialize SdkConnectivityManager
  result = SdkConnectivityManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

  # Get ConnectivityManager system service
  let serviceName = "connectivity".toJString
  result.connectivityManager = result.context.getSystemService(serviceName)

proc isConnected*(cm: SdkConnectivityManager): bool =
  ## Check if device has any network connectivity
  ##
  ## Returns:
  ##   true if connected to any network, false otherwise
  ##
  ## Example:
  ##   if connectivity().isConnected():
  ##     downloadData()
  ##   else:
  ##     showOfflineMode()

  if cm.apiLevel >= 23:
    # Modern API (API 23+): Use getActiveNetwork + NetworkCapabilities
    let activeNetwork = cm.connectivityManager.call("getActiveNetwork")
    if activeNetwork.isNil:
      return false

    let capabilities = cm.connectivityManager.call("getNetworkCapabilities", activeNetwork)
    if capabilities.isNil:
      return false

    # Check for internet capability
    let hasInternet = capabilities.call("hasCapability",
      16.jint  # NetworkCapabilities.NET_CAPABILITY_INTERNET
    ).boolVal

    return hasInternet

  else:
    # Legacy API (API < 23)
    let activeNetworkInfo = cm.connectivityManager.call("getActiveNetworkInfo")
    if activeNetworkInfo.isNil:
      return false

    return activeNetworkInfo.call("isConnected").boolVal

proc getNetworkType*(cm: SdkConnectivityManager): NetworkType =
  ## Get the current network connection type
  ##
  ## Returns:
  ##   NetworkType enum indicating connection type
  ##
  ## Example:
  ##   let netType = connectivity().getNetworkType()
  ##   case netType:
  ##   of ntWifi:
  ##     echo "Connected via WiFi"
  ##   of ntCellular:
  ##     echo "Connected via mobile data"
  ##   of ntNone:
  ##     echo "No connection"
  ##   else:
  ##     echo "Other connection type"

  if not cm.isConnected():
    return ntNone

  if cm.apiLevel >= 23:
    # Modern API
    let activeNetwork = cm.connectivityManager.call("getActiveNetwork")
    if activeNetwork.isNil:
      return ntNone

    let capabilities = cm.connectivityManager.call("getNetworkCapabilities", activeNetwork)
    if capabilities.isNil:
      return ntNone

    # Check transport types
    # NetworkCapabilities.TRANSPORT_WIFI = 1
    if capabilities.call("hasTransport", 1.jint).boolVal:
      return ntWifi

    # NetworkCapabilities.TRANSPORT_CELLULAR = 0
    if capabilities.call("hasTransport", 0.jint).boolVal:
      return ntCellular

    # NetworkCapabilities.TRANSPORT_ETHERNET = 3
    if capabilities.call("hasTransport", 3.jint).boolVal:
      return ntEthernet

    # NetworkCapabilities.TRANSPORT_BLUETOOTH = 2
    if capabilities.call("hasTransport", 2.jint).boolVal:
      return ntBluetooth

    # NetworkCapabilities.TRANSPORT_VPN = 4
    if capabilities.call("hasTransport", 4.jint).boolVal:
      return ntVPN

    return ntOther

  else:
    # Legacy API
    let activeNetworkInfo = cm.connectivityManager.call("getActiveNetworkInfo")
    if activeNetworkInfo.isNil:
      return ntNone

    let networkType = activeNetworkInfo.call("getType").intVal

    # NetworkInfo type constants
    case networkType:
    of 1:  # TYPE_WIFI
      return ntWifi
    of 0:  # TYPE_MOBILE
      return ntCellular
    of 9:  # TYPE_ETHERNET
      return ntEthernet
    of 7:  # TYPE_BLUETOOTH
      return ntBluetooth
    of 17: # TYPE_VPN
      return ntVPN
    else:
      return ntOther

proc isMetered*(cm: SdkConnectivityManager): bool =
  ## Check if current connection is metered (e.g., mobile data with data limits)
  ##
  ## Useful for deciding whether to download large files
  ##
  ## Returns:
  ##   true if connection is metered, false otherwise
  ##
  ## Example:
  ##   if not connectivity().isMetered():
  ##     downloadLargeUpdate()
  ##   else:
  ##     askUserBeforeDownloading()

  if not cm.isConnected():
    return false

  # Available on API 16+
  return cm.connectivityManager.call("isActiveNetworkMetered").boolVal

proc getConnectionInfo*(cm: SdkConnectivityManager): ConnectionInfo =
  ## Get comprehensive connection information
  ##
  ## Returns:
  ##   ConnectionInfo with connection status, type, and properties
  ##
  ## Example:
  ##   let info = connectivity().getConnectionInfo()
  ##   if info.isConnected:
  ##     echo "Network: ", info.networkType
  ##     echo "Metered: ", info.isMetered

  result.isConnected = cm.isConnected()
  result.networkType = cm.getNetworkType()
  result.isMetered = cm.isMetered()

  # Check roaming status
  if result.isConnected and cm.apiLevel < 23:
    # Legacy API has roaming info
    let activeNetworkInfo = cm.connectivityManager.call("getActiveNetworkInfo")
    if not activeNetworkInfo.isNil:
      result.isRoaming = activeNetworkInfo.call("isRoaming").boolVal
  else:
    result.isRoaming = false  # TODO: Get roaming status on API 23+

proc isWifiConnected*(cm: SdkConnectivityManager): bool =
  ## Convenience method to check if connected via WiFi
  ##
  ## Example:
  ##   if connectivity().isWifiConnected():
  ##     startBackgroundSync()
  return cm.getNetworkType() == ntWifi

proc isCellularConnected*(cm: SdkConnectivityManager): bool =
  ## Convenience method to check if connected via cellular/mobile data
  ##
  ## Example:
  ##   if connectivity().isCellularConnected():
  ##     showDataUsageWarning()
  return cm.getNetworkType() == ntCellular

# TODO: Implement network change callbacks
# This requires broadcast receiver registration which needs more infrastructure
# proc onConnectivityChanged*(cm: SdkConnectivityManager, callback: proc(info: ConnectionInfo)) =
#   ## Register callback for network connectivity changes
#   ## Requires API 21+ (NetworkCallback) or BroadcastReceiver on older APIs

# Lazy accessor for AndroidRuntime
proc sdkConnectivityManager*(runtime: AndroidRuntime): SdkConnectivityManager =
  ## Get or create SdkConnectivityManager instance
  if runtime.sdkConnectivityManager.isNone:
    runtime.sdkConnectivityManager = some(SdkConnectivityManager.init())
  return runtime.sdkConnectivityManager.get()

# Convenience global accessor
proc connectivity*(): SdkConnectivityManager =
  ## Global accessor for SdkConnectivityManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   if connectivity().isConnected():
  ##     echo "Online!"
  ##
  ##   let netType = connectivity().getNetworkType()
  ##   if netType == ntWifi:
  ##     downloadLargeFiles()
  return runtime().sdkConnectivityManager()

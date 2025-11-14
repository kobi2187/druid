# connectivity.nim - Network connectivity

import android, options, times

type
  NetworkType* = enum
    None, WiFi, Mobile, Ethernet, Bluetooth, VPN
    
  MobileNetworkType* = enum
    Unknown, 
    Net2G,  # GPRS, EDGE, CDMA
    Net3G,  # UMTS, HSDPA
    Net4G,  # LTE
    Net5G   # NR
    
  NetworkState* = enum
    Disconnected, Connecting, Connected, Disconnecting
    
  NetworkCapabilities* = set[enum]
    Internet,        # Internet access
    NotMetered,      # Not metered connection
    NotRoaming,      # Not roaming
    Temporary,       # Temporarily available
    Validated        # Validated for internet
    
  WiFiInfo* = object
    ssid*: string
    bssid*: string
    rssi*: int
    linkSpeed*: int  # Mbps
    frequency*: int  # MHz
    ipAddress*: string
    macAddress*: string
    
  NetworkInfo* = object
    ## Current network information
    type*: NetworkType
    state*: NetworkState
    capabilities*: NetworkCapabilities
    mobileType*: Option[MobileNetworkType]
    wifiInfo*: Option[WiFiInfo]
    
  NetworkRequest* = object
    ## Network request configuration
    requiredType*: Option[NetworkType]
    requiredCapabilities*: NetworkCapabilities
    avoidUnvalidated*: bool
    
  ConnectionStateListener* = proc(connected: bool)
  NetworkChangeListener* = proc(info: NetworkInfo)
  
  ConnectivityManager* = ref object of Manager
    connectionStateListeners: seq[ConnectionStateListener]
    networkChangeListeners: seq[NetworkChangeListener]
    networkCallbacks: Table[string, pointer]  # Stores JNI references to callbacks
    systemService: pointer  # JNI reference

# Constructor
proc newConnectivityManager*(context: Context): ConnectivityManager
  ## Creates a new connectivity manager

# Network state
proc isConnected*(m: ConnectivityManager): bool
  ## Checks if any network is connected
  ## API 29+: Uses NetworkCapabilities
  ## Pre-API 29: Uses getActiveNetworkInfo
  
proc getCurrentNetwork*(m: ConnectivityManager): NetworkInfo
  ## Gets current network information
  ## API 29+: Uses NetworkCapabilities
  ## API 26-28: Uses NetworkInfo and LinkProperties
  ## Pre-API 26: Uses getActiveNetworkInfo

# Network monitoring
proc registerConnectionStateListener*(m: ConnectivityManager, listener: ConnectionStateListener): string
  ## Registers for connection state changes
  ## Returns registration ID
  ## API 26+: Uses NetworkCallback
  ## Pre-API 26: Uses broadcast receiver

proc registerNetworkChangeListener*(m: ConnectivityManager, listener: NetworkChangeListener): string
  ## Registers for detailed network changes
  ## Returns registration ID
  ## API 28+: Uses enhanced NetworkCallback
  ## API 26-27: Uses basic NetworkCallback
  ## Pre-API 26: Uses broadcast receiver
  
proc unregisterNetworkListener*(m: ConnectivityManager, registrationId: string)
  ## Unregisters network listener

# Network requests
proc requestNetwork*(m: ConnectivityManager, request: NetworkRequest): bool
  ## Requests system to connect to specific network type
  ## API 26+: Uses requestNetwork with NetworkRequest
  ## API 29+: Has more restrictions on VPN requests
  ## API 31+: Has more restrictions on WiFi requests

# WiFi specific
proc getWiFiNetworks*(m: ConnectivityManager): seq[WiFiInfo]
  ## Scans for available WiFi networks
  ## API 26+: Uses WifiManager.getScanResults
  ## API 29+: Requires ACCESS_FINE_LOCATION
  ## API 31+: May require NEARBY_WIFI_DEVICES instead
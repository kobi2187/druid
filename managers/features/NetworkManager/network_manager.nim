## NetworkManager - HTTP Networking and WebSocket Support
##
## Provides HTTP client functionality using Android's networking APIs.
##
## Design Philosophy:
##   - Pure Nim HTTP client preferred (faster, no restrictions)
##   - Android APIs for system integration (network state, metering)
##   - Simple, blocking API with future async support
##
## Android Background:
##   - HttpURLConnection: Built-in HTTP client (verbose but reliable)
##   - OkHttp: Modern HTTP client (requires dependency)
##   - ConnectivityManager: Network state monitoring
##   - NetworkStatsManager: Data usage tracking
##
## Druid's Approach:
##   - Nim's `httpclient` module for actual HTTP (faster, cleaner)
##   - Android APIs for network monitoring and restrictions
##   - Simple wrapper that "just works"
##
## Usage:
##   var nm = networkManager()
##
##   # Simple GET request
##   let response = nm.get("https://api.example.com/data")
##   echo response.body
##
##   # POST with JSON
##   let data = """{"key": "value"}"""
##   let response = nm.post("https://api.example.com/submit",
##                          body = data,
##                          contentType = "application/json")
##
##   # Download file
##   nm.downloadFile("https://example.com/file.zip", "/sdcard/file.zip")
##
##   # Check network state
##   if nm.isConnected():
##     echo "Network type: ", nm.getNetworkType()

import jnim
import options
import tables
import ../../../core
import ../../../common

# For actual HTTP requests, we'll use Nim's httpclient
# It's faster and has no Android restrictions
import std/httpclient as nimhttp
import std/json
import std/streams

# JNI bindings for network monitoring
jnimport:
  import android.content.Context
  import android.net.ConnectivityManager as JCM
  import android.net.NetworkInfo
  import android.net.NetworkCapabilities

type
  NetworkType* = enum
    ## Type of network connection
    ntNone = "none"
    ntWifi = "wifi"
    ntCellular = "cellular"
    ntEthernet = "ethernet"
    ntBluetooth = "bluetooth"
    ntVPN = "vpn"
    ntOther = "other"

  HttpMethod* = enum
    ## HTTP request methods
    hmGet = "GET"
    hmPost = "POST"
    hmPut = "PUT"
    hmDelete = "DELETE"
    hmPatch = "PATCH"
    hmHead = "HEAD"
    hmOptions = "OPTIONS"

  HttpResponse* = object
    ## HTTP response
    statusCode*: int
    headers*: HttpHeaders
    body*: string

  DownloadProgress* = object
    ## Download progress info
    bytesDownloaded*: int64
    totalBytes*: int64  # -1 if unknown
    percentComplete*: float  # 0.0 to 1.0

  SdkNetworkManager* = ref object
    ## Manager for network operations
    connectivityManager: JObject
    httpClient: nimhttp.HttpClient
    defaultTimeout: int  # milliseconds
    defaultUserAgent: string

#
# Initialization
#

proc newSdkNetworkManager*(): SdkNetworkManager =
  let ctx = getContext()
  let cm = ctx.call("getSystemService", "connectivity".toJString)

  # Create Nim HTTP client
  let client = nimhttp.newHttpClient(
    userAgent = "Druid/0.2.0 (Nim Android App)",
    timeout = 30000  # 30 second default
  )

  result = SdkNetworkManager(
    connectivityManager: cm,
    httpClient: client,
    defaultTimeout: 30000,
    defaultUserAgent: "Druid/0.2.0 (Nim Android App)"
  )

#
# Network State Queries
#

proc isConnected*(nm: SdkNetworkManager): bool =
  ## Check if device has any network connectivity
  try:
    let activeNetwork = nm.connectivityManager.call("getActiveNetworkInfo")
    if activeNetwork.isNull:
      return false
    return activeNetwork.call("isConnected").boolValue
  except:
    return false

proc getNetworkType*(nm: SdkNetworkManager): NetworkType =
  ## Get current network type
  try:
    let activeNetwork = nm.connectivityManager.call("getActiveNetworkInfo")
    if activeNetwork.isNull:
      return ntNone

    let networkType = activeNetwork.call("getType").intValue

    # Network type constants from ConnectivityManager
    # TYPE_WIFI = 1
    # TYPE_MOBILE = 0
    # TYPE_ETHERNET = 9
    # TYPE_BLUETOOTH = 7
    # TYPE_VPN = 17

    case networkType:
    of 1: return ntWifi
    of 0: return ntCellular
    of 9: return ntEthernet
    of 7: return ntBluetooth
    of 17: return ntVPN
    else: return ntOther
  except:
    return ntNone

proc isWifi*(nm: SdkNetworkManager): bool =
  ## Check if connected via WiFi
  return nm.getNetworkType() == ntWifi

proc isCellular*(nm: SdkNetworkManager): bool =
  ## Check if connected via cellular data
  return nm.getNetworkType() == ntCellular

proc isMetered*(nm: SdkNetworkManager): bool =
  ## Check if current network is metered (costs money per MB)
  ## Apps should avoid large downloads on metered connections
  try:
    return nm.connectivityManager.call("isActiveNetworkMetered").boolValue
  except:
    return false

proc getNetworkInfo*(nm: SdkNetworkManager): string =
  ## Get detailed network information (for debugging)
  try:
    let activeNetwork = nm.connectivityManager.call("getActiveNetworkInfo")
    if activeNetwork.isNull:
      return "No network connection"
    return $activeNetwork.call("toString")
  except:
    return "Error getting network info"

#
# HTTP Request API (Using Nim's httpclient)
#

proc get*(nm: SdkNetworkManager,
          url: string,
          headers: HttpHeaders = nil): HttpResponse =
  ## Perform GET request
  ##
  ## Returns response with status code, headers, and body
  ##
  ## Raises HttpRequestError on network errors

  try:
    let response = nm.httpClient.request(url, httpMethod = HttpGet, headers = headers)

    return HttpResponse(
      statusCode: response.code.int,
      headers: response.headers,
      body: response.bodyStream.readAll()
    )
  except:
    raise newException(IOError, "HTTP GET failed: " & getCurrentExceptionMsg())

proc post*(nm: SdkNetworkManager,
           url: string,
           body: string = "",
           contentType: string = "application/x-www-form-urlencoded",
           headers: HttpHeaders = nil): HttpResponse =
  ## Perform POST request
  ##
  ## Args:
  ##   url: Target URL
  ##   body: Request body
  ##   contentType: Content-Type header value
  ##   headers: Additional headers

  var reqHeaders = if headers != nil: headers else: newHttpHeaders()
  reqHeaders["Content-Type"] = contentType

  try:
    let response = nm.httpClient.request(
      url,
      httpMethod = HttpPost,
      body = body,
      headers = reqHeaders
    )

    return HttpResponse(
      statusCode: response.code.int,
      headers: response.headers,
      body: response.bodyStream.readAll()
    )
  except:
    raise newException(IOError, "HTTP POST failed: " & getCurrentExceptionMsg())

proc put*(nm: SdkNetworkManager,
          url: string,
          body: string = "",
          contentType: string = "application/json",
          headers: HttpHeaders = nil): HttpResponse =
  ## Perform PUT request

  var reqHeaders = if headers != nil: headers else: newHttpHeaders()
  reqHeaders["Content-Type"] = contentType

  try:
    let response = nm.httpClient.request(
      url,
      httpMethod = HttpPut,
      body = body,
      headers = reqHeaders
    )

    return HttpResponse(
      statusCode: response.code.int,
      headers: response.headers,
      body: response.bodyStream.readAll()
    )
  except:
    raise newException(IOError, "HTTP PUT failed: " & getCurrentExceptionMsg())

proc delete*(nm: SdkNetworkManager,
             url: string,
             headers: HttpHeaders = nil): HttpResponse =
  ## Perform DELETE request

  try:
    let response = nm.httpClient.request(url, httpMethod = HttpDelete, headers = headers)

    return HttpResponse(
      statusCode: response.code.int,
      headers: response.headers,
      body: response.bodyStream.readAll()
    )
  except:
    raise newException(IOError, "HTTP DELETE failed: " & getCurrentExceptionMsg())

#
# JSON Convenience API
#

proc getJson*(nm: SdkNetworkManager,
              url: string,
              headers: HttpHeaders = nil): JsonNode =
  ## GET request that parses JSON response
  ##
  ## Raises JsonParsingError if response is not valid JSON

  let response = nm.get(url, headers)
  return parseJson(response.body)

proc postJson*(nm: SdkNetworkManager,
               url: string,
               json: JsonNode,
               headers: HttpHeaders = nil): JsonNode =
  ## POST JSON and parse JSON response

  let body = $json
  let response = nm.post(url, body, "application/json", headers)
  return parseJson(response.body)

proc putJson*(nm: SdkNetworkManager,
              url: string,
              json: JsonNode,
              headers: HttpHeaders = nil): JsonNode =
  ## PUT JSON and parse JSON response

  let body = $json
  let response = nm.put(url, body, "application/json", headers)
  return parseJson(response.body)

#
# File Download
#

proc downloadFile*(nm: SdkNetworkManager,
                  url: string,
                  destPath: string,
                  onProgress: proc(progress: DownloadProgress) = nil) =
  ## Download file to specified path
  ##
  ## Args:
  ##   url: Source URL
  ##   destPath: Destination file path
  ##   onProgress: Optional callback for progress updates

  try:
    # Get response
    let response = nm.httpClient.request(url, httpMethod = HttpGet)

    # Get total size if available
    let totalSize = if response.headers.hasKey("Content-Length"):
      parseBiggestInt(response.headers["Content-Length"])
    else:
      -1

    # Open destination file
    var file = open(destPath, fmWrite)
    defer: file.close()

    # Read and write in chunks
    const chunkSize = 8192
    var buffer = newString(chunkSize)
    var downloaded: int64 = 0

    while true:
      let bytesRead = response.bodyStream.readData(addr buffer[0], chunkSize)
      if bytesRead == 0:
        break

      file.writeBuffer(addr buffer[0], bytesRead)
      downloaded += bytesRead

      # Report progress
      if onProgress != nil:
        let progress = DownloadProgress(
          bytesDownloaded: downloaded,
          totalBytes: totalSize,
          percentComplete: if totalSize > 0: downloaded.float / totalSize.float else: 0.0
        )
        onProgress(progress)

  except:
    raise newException(IOError, "File download failed: " & getCurrentExceptionMsg())

#
# Configuration
#

proc setTimeout*(nm: SdkNetworkManager, timeoutMs: int) =
  ## Set timeout for HTTP requests in milliseconds
  nm.defaultTimeout = timeoutMs
  nm.httpClient.timeout = timeoutMs

proc setUserAgent*(nm: SdkNetworkManager, userAgent: string) =
  ## Set User-Agent header for all requests
  nm.defaultUserAgent = userAgent
  # Note: Would need to recreate client to apply
  # TODO: Make this work with existing client

proc addHeader*(nm: SdkNetworkManager, key: string, value: string) =
  ## Add default header to all requests
  nm.httpClient.headers[key] = value

proc clearHeaders*(nm: SdkNetworkManager) =
  ## Clear all default headers
  nm.httpClient.headers = newHttpHeaders()

#
# Network Callbacks (Future Enhancement)
#
# Android provides NetworkCallback for monitoring network changes
# This requires callback bridge implementation
#

# TODO: Implement network change monitoring
# type NetworkCallback = proc(networkType: NetworkType, isConnected: bool)
#
# proc onNetworkChanged*(nm: SdkNetworkManager, callback: NetworkCallback) =
#   ## Register callback for network state changes
#   ## Requires: ConnectivityManager.NetworkCallback implementation
#   discard

#
# WebSocket Support (Future Enhancement)
#
# WebSocket requires async I/O and bidirectional communication
# Options:
# 1. Use Nim's ws module (pure Nim, fast)
# 2. Use OkHttp WebSocket (requires OkHttp dependency)
# 3. Use Android's built-in WebSocket (API 21+)
#

# TODO: Implement WebSocket
# type
#   WebSocket* = ref object
#     url: string
#     isOpen: bool
#
# proc connectWebSocket*(nm: SdkNetworkManager, url: string): WebSocket =
#   ## Open WebSocket connection
#   discard
#
# proc send*(ws: WebSocket, message: string) =
#   ## Send message over WebSocket
#   discard
#
# proc receive*(ws: WebSocket): string =
#   ## Receive message from WebSocket (blocking)
#   discard
#
# proc close*(ws: WebSocket) =
#   ## Close WebSocket connection
#   discard

#
# Debugging
#

proc debugPrintNetworkInfo*(nm: SdkNetworkManager): string =
  ## Get debug representation of network state
  result = "NetworkManager - Status:\n"
  result &= "  Connected: " & $nm.isConnected() & "\n"
  result &= "  Network Type: " & $nm.getNetworkType() & "\n"
  result &= "  Is WiFi: " & $nm.isWifi() & "\n"
  result &= "  Is Cellular: " & $nm.isCellular() & "\n"
  result &= "  Is Metered: " & $nm.isMetered() & "\n"
  result &= "  Timeout: " & $nm.defaultTimeout & " ms\n"
  result &= "  User-Agent: " & nm.defaultUserAgent & "\n"

#
# Runtime Integration
#

proc sdkNetworkManager*(runtime: AndroidRuntime): SdkNetworkManager =
  ## Get or create the SdkNetworkManager instance
  ## Lazy initialization pattern
  if runtime.sdkNetworkManager.isNone:
    runtime.sdkNetworkManager = some(newSdkNetworkManager())
  return runtime.sdkNetworkManager.get()

# Convenience global accessor
proc networkManager*(): SdkNetworkManager =
  ## Global accessor for SdkNetworkManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   let response = networkManager().get("https://api.example.com/data")
  ##   echo response.body
  return runtime().sdkNetworkManager()

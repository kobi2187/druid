# utils.nim - Utility functions and extensions

import android, options

type
  HashAlgorithm* = enum
    MD5, SHA1, SHA256, SHA384, SHA512
    
  Base64Flags* = enum
    Default, NoPadding, UrlSafe
    
  JsonNodeType* = enum
    Null, Boolean, Number, String, Array, Object
    
  JsonNode* = ref object
    case kind*: JsonNodeType
    of Null:
      discard
    of Boolean:
      boolVal*: bool
    of Number:
      case numKind*: enum
        IntNum, FloatNum
      of IntNum:
        intVal*: int
      of FloatNum:
        floatVal*: float
    of String:
      strVal*: string
    of Array:
      arrayVal*: seq[JsonNode]
    of Object:
      objectVal*: Table[string, JsonNode]
      
  UtilsManager* = ref object of Manager
    pass  # No state needed

# Constructor
proc newUtilsManager*(context: Context): UtilsManager
  ## Creates a new utils manager

# String utils
proc encodeBase64*(m: UtilsManager, 
                 data: seq[byte],
                 flags: set[Base64Flags] = {}): string
  ## Encodes data to Base64
  ## API 26+: Uses Base64
  
proc decodeBase64*(m: UtilsManager, 
                 base64String: string,
                 flags: set[Base64Flags] = {}): seq[byte]
  ## Decodes Base64 to data
  ## API 26+: Uses Base64
  
proc hash*(m: UtilsManager, 
         data: seq[byte],
         algorithm: HashAlgorithm): string
  ## Hashes data with algorithm
  ## API 26+: Uses MessageDigest
  
proc encodeUrl*(m: UtilsManager, url: string): string
  ## URL encodes string
  ## API 26+: Uses URLEncoder.encode
  
proc decodeUrl*(m: UtilsManager, encodedUrl: string): string
  ## URL decodes string
  ## API 26+: Uses URLDecoder.decode

# JSON utils
proc parseJson*(m: UtilsManager, jsonString: string): JsonNode
  ## Parses JSON string
  ## API 26+: Uses JSONObject or JSONArray
  
proc toJson*(m: UtilsManager, node: JsonNode): string
  ## Converts JsonNode to JSON string
  ## API 26+: Uses JSONObject.toString or JSONArray.toString
  
proc prettyJson*(m: UtilsManager, jsonString: string): string
  ## Pretty-prints JSON string
  ## API 26+: Uses JSONObject.toString with indentation

# Device utils
proc getDeviceId*(m: UtilsManager): string
  ## Gets unique device identifier
  ## API 26+: Uses combined values for uniqueness
  ## API 29+: More restricted device identifiers
  ## API 31+: Requires special permissions
  
proc getAppVersionName*(m: UtilsManager): string
  ## Gets app version name
  ## API 26+: Uses PackageManager
  
proc getAppVersionCode*(m: UtilsManager): int
  ## Gets app version code
  ## API 26+: Uses PackageManager

# Network utils
proc isNetworkAvailable*(m: UtilsManager): bool
  ## Checks if network is available
  ## API 26+: Uses ConnectivityManager
  
proc getIPAddress*(m: UtilsManager): Option[string]
  ## Gets device IP address
  ## API 26+: Uses NetworkInterface

# Concurrency utils
proc runOnBackground*(m: UtilsManager, action: proc()): bool
  ## Runs action on background thread
  ## API 26+: Uses ExecutorService
  
proc runOnMainThread*(m: UtilsManager, action: proc()): bool
  ## Runs action on main thread
  ## API 26+: Uses Handler(Looper.getMainLooper())
  
proc runDelayed*(m: UtilsManager, delayMs: int, action: proc()): string
  ## Runs action after delay
  ## Returns handler ID
  ## API 26+: Uses Handler.postDelayed
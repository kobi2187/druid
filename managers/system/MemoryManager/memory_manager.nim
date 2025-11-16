## MemoryManager - Memory Monitoring and Pressure Response
##
## Monitors system memory pressure and coordinates cache eviction.
## Works with ResurrectionManager to intelligently manage memory.
##
## Android Background:
##   - Android aggressively kills apps when memory is low
##   - Apps should respond to onLowMemory() by clearing caches
##   - ActivityManager provides memory info and thresholds
##   - Apps that don't respond to memory pressure get killed first
##
## Druid's Approach:
##   - Monitor available memory and memory class
##   - Register caches that can be cleared under pressure
##   - Automatic cache eviction when memory is low
##   - Integration with ResurrectionManager (temporary state)
##
## Usage:
##   var mm = memoryManager()
##
##   # Query memory status
##   echo "Available: ", mm.getAvailableMemory() div 1024, " KB"
##   echo "Total: ", mm.getTotalMemory() div 1024, " KB"
##   if mm.isLowMemory():
##     echo "WARNING: Low memory!"
##
##   # Register cache for automatic clearing
##   mm.registerCache("images", proc() =
##     imageCache.clear()
##   )
##
##   # Listen for memory warnings
##   mm.onLowMemory(proc() =
##     echo "Low memory - clearing caches"
##     clearNonEssentialData()
##   )

import jnim
import options
import sequtils
import ../../../core
import ../LifecycleManager/lifecycle_manager

# JNI bindings
# jnimport:
#   import android.app.ActivityManager as JAM
#   import android.app.ActivityManager$MemoryInfo as MemoryInfo
#   import android.content.Context
# 
type
  MemoryClass* = enum
    ## Device memory class (affects what you can cache)
    mcLow = "low"           # <128 MB (very old devices)
    mcMedium = "medium"     # 128-256 MB
    mcHigh = "high"         # 256-512 MB
    mcXLarge = "xlarge"     # 512+ MB (modern devices)

  MemoryInfo* = object
    ## Current memory status
    availableBytes*: int64     # Available memory in bytes
    totalBytes*: int64         # Total system memory
    threshold*: int64          # Low memory threshold
    isLowMemory*: bool         # Currently in low memory state

  MemoryCache = object
    ## Registered cache that can be cleared
    name: string
    clearCallback: proc()

  SdkMemoryManager* = ref object
    activityManager: jobject
    lowMemoryCallbacks: seq[proc()]
    registeredCaches: seq[MemoryCache]
    memoryClass: MemoryClass
    lifecycleManager: Option[SdkLifecycleManager]

#
# Initialization
#

proc detectMemoryClass(memoryClassMB: int): MemoryClass =
  ## Internal: Determine device memory class
  if memoryClassMB < 128:
    return mcLow
  elif memoryClassMB < 256:
    return mcMedium
  elif memoryClassMB < 512:
    return mcHigh
  else:
    return mcXLarge

proc newSdkMemoryManager*(): SdkMemoryManager =
  let ctx = getContext()
  let am = ctx.call("getSystemService", "activity".toJString)

  # Get device memory class
  let memoryClassMB = am.call("getMemoryClass").intValue
  let memClass = detectMemoryClass(memoryClassMB)

  result = SdkMemoryManager(
    activityManager: am,
    lowMemoryCallbacks: @[],
    registeredCaches: @[],
    memoryClass: memClass
  )

  # Hook into lifecycle for low memory events
  result.lifecycleManager = some(lifecycle())
  let lm = result.lifecycleManager.get()

  lm.onLowMemory(proc() =
    # System is low on memory - clear all registered caches
    for cache in result.registeredCaches:
      try:
        cache.clearCallback()
      except:
        echo "Error clearing cache '", cache.name, "': ", getCurrentExceptionMsg()

    # Notify low memory callbacks
    for callback in result.lowMemoryCallbacks:
      try:
        callback()
      except:
        echo "Error in low memory callback: ", getCurrentExceptionMsg()
  )

#
# Memory Query API
#

proc getMemoryInfo*(mm: SdkMemoryManager): MemoryInfo =
  ## Get current memory status
  let memInfo = MemoryInfo.new()
  mm.activityManager.call("getMemoryInfo", memInfo)

  result = MemoryInfo(
    availableBytes: memInfo.call("availMem").longValue,
    totalBytes: memInfo.call("totalMem").longValue,
    threshold: memInfo.call("threshold").longValue,
    isLowMemory: memInfo.call("lowMemory").boolValue
  )

proc getAvailableMemory*(mm: SdkMemoryManager): int64 =
  ## Get available memory in bytes
  return mm.getMemoryInfo().availableBytes

proc getTotalMemory*(mm: SdkMemoryManager): int64 =
  ## Get total system memory in bytes
  return mm.getMemoryInfo().totalBytes

proc getMemoryThreshold*(mm: SdkMemoryManager): int64 =
  ## Get low memory threshold in bytes
  return mm.getMemoryInfo().threshold

proc isLowMemory*(mm: SdkMemoryManager): bool =
  ## Check if system is currently in low memory state
  return mm.getMemoryInfo().isLowMemory

proc getMemoryUsagePercent*(mm: SdkMemoryManager): float =
  ## Get memory usage as percentage (0.0 - 1.0)
  let info = mm.getMemoryInfo()
  let used = info.totalBytes - info.availableBytes
  return used.float / info.totalBytes.float

proc getMemoryClass*(mm: SdkMemoryManager): MemoryClass =
  ## Get device memory class
  ## Useful for adjusting cache sizes based on device capabilities
  return mm.memoryClass

proc getMemoryClassMB*(mm: SdkMemoryManager): int =
  ## Get device memory class in MB (Android's memory class value)
  return mm.activityManager.call("getMemoryClass").intValue

proc getLargeMemoryClassMB*(mm: SdkMemoryManager): int =
  ## Get large heap memory class in MB
  ## Apps can request large heap in manifest (android:largeHeap="true")
  return mm.activityManager.call("getLargeMemoryClass").intValue

#
# Cache Registration
#

proc registerCache*(mm: SdkMemoryManager, name: string, clearCallback: proc()) =
  ## Register a cache that can be cleared under memory pressure
  ##
  ## Usage:
  ##   mm.registerCache("images", proc() =
  ##     imageCache.clear()
  ##   )
  ##
  ## The callback will be called automatically when:
  ## - System sends low memory warning
  ## - You manually call clearAllCaches()
  mm.registeredCaches.add(MemoryCache(
    name: name,
    clearCallback: clearCallback
  ))

proc unregisterCache*(mm: SdkMemoryManager, name: string) =
  ## Unregister a cache by name
  mm.registeredCaches = mm.registeredCaches.filterIt(it.name != name)

proc clearAllCaches*(mm: SdkMemoryManager) =
  ## Manually clear all registered caches
  ## Useful when user requests cache clear or before memory-intensive operation
  for cache in mm.registeredCaches:
    try:
      cache.clearCallback()
    except:
      echo "Error clearing cache '", cache.name, "': ", getCurrentExceptionMsg()

proc getRegisteredCacheNames*(mm: SdkMemoryManager): seq[string] =
  ## Get names of all registered caches
  return mm.registeredCaches.mapIt(it.name)

#
# Callbacks
#

proc onLowMemory*(mm: SdkMemoryManager, callback: proc()) =
  ## Register a callback for low memory warnings
  ##
  ## Called when system is low on memory. Use this to:
  ## - Clear caches
  ## - Release non-essential resources
  ## - Reduce memory usage
  ##
  ## Note: Registered caches are cleared automatically
  mm.lowMemoryCallbacks.add(callback)

#
# Helper Functions
#

proc shouldUseLargeCache*(mm: SdkMemoryManager): bool =
  ## Helper: Check if device can handle large caches
  ## Returns true if device has HIGH or XLARGE memory class
  return mm.memoryClass in {mcHigh, mcXLarge}

proc getRecommendedCacheSize*(mm: SdkMemoryManager, cacheType: string = "default"): int =
  ## Helper: Get recommended cache size in bytes based on device memory
  ##
  ## Conservative recommendations:
  ## - Low memory devices: Small caches only
  ## - Medium: Moderate caches
  ## - High/XLarge: Larger caches acceptable
  case mm.memoryClass:
  of mcLow:
    # Very conservative - minimal caching
    return 4 * 1024 * 1024  # 4 MB
  of mcMedium:
    # Moderate caching
    return 16 * 1024 * 1024  # 16 MB
  of mcHigh:
    # Comfortable caching
    return 32 * 1024 * 1024  # 32 MB
  of mcXLarge:
    # Large caches OK
    return 64 * 1024 * 1024  # 64 MB

#
# Debugging
#

proc debugPrintMemoryInfo*(mm: SdkMemoryManager): string =
  ## Get debug representation of memory status
  let info = mm.getMemoryInfo()
  let availMB = info.availableBytes div (1024 * 1024)
  let totalMB = info.totalBytes div (1024 * 1024)
  let thresholdMB = info.threshold div (1024 * 1024)
  let usagePercent = mm.getMemoryUsagePercent() * 100.0

  result = "MemoryManager - Status:\n"
  result &= "  Available: " & $availMB & " MB\n"
  result &= "  Total: " & $totalMB & " MB\n"
  result &= "  Threshold: " & $thresholdMB & " MB\n"
  result &= "  Usage: " & usagePercent.formatFloat(ffDecimal, 1) & "%\n"
  result &= "  Low Memory: " & $info.isLowMemory & "\n"
  result &= "  Memory Class: " & $mm.memoryClass & "\n"
  result &= "  Memory Class MB: " & $mm.getMemoryClassMB() & " MB\n"
  result &= "  Large Memory Class MB: " & $mm.getLargeMemoryClassMB() & " MB\n"
  result &= "  Registered Caches: " & $mm.registeredCaches.len & "\n"
  for cache in mm.registeredCaches:
    result &= "    - " & cache.name & "\n"

#
# Runtime Integration
#

proc sdkMemoryManager*(runtime: AndroidRuntime): SdkMemoryManager =
  ## Get or create the SdkMemoryManager instance
  ## Lazy initialization pattern
  if runtime.sdkMemoryManager.isNone:
    runtime.sdkMemoryManager = some(newSdkMemoryManager())
  return runtime.sdkMemoryManager.get()

# Convenience global accessor
proc memoryManager*(): SdkMemoryManager =
  ## Global accessor for SdkMemoryManager
  ## Requires AndroidRuntime to be initialized
  return runtime().sdkMemoryManager()

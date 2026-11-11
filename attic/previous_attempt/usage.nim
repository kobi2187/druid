import jnim
type
  AndroidContextKind = enum
    ackJvm,
    ackNative

  AndroidContext* = object
    case kind: AndroidContextKind
    of ackJvm:
      jvmContext: jobject
    of ackNative:
      activity: pointer      # AActivity*
      window: pointer        # ANativeWindow*
      assetManager: pointer  # AAssetManager*
      # Cached service handles
      locationManager: pointer  # ALocationManager*
      sensorManager: pointer    # ASensorManager*
    
    # Common properties
    apiLevel: int
    packageName: string
    
# =========== OR ================

# SDK Context
type SdkContext* = object
  javaContext*: jobject  # Directly accessible

# NDK Context - reflects actual NDK structure
type NdkContext* = object
  activity*: pointer     # AActivity*
  window*: pointer       # ANativeWindow*
  assetManager*: pointer # AAssetManager*

# Unified context type with transparent implementation
type AndroidContext* = object
  case kind*: AndroidContextKind
  of ackJvm:
    sdk*: SdkContext     # Directly accessible
  of ackNative:
    ndk*: NdkContext     # Directly accessible
  
  # Common properties
  apiLevel*: int
  packageName*: string



## perhaps with enum at init, to specify which features are wanted, and keep that set of enum. (wanted_features)
# according to which we initialize the managers.

# also an enum of choice: sdk/ndk/both -- this can be a compile time constant or passed at build time. (but let user know thru feature matrix or a simple cli app - if ndk is sufficient or not)

# at runtime we have, for example:
if hasVersion(26):
    use advanced 
elif hasVersion(24): # 24 or higher
    use normal
else:
    use legacy 

# if using the ndk based managers: it may lack certain procs that are available in the sdk. 
# TEST: see if we can use the error pragma for that.

# we only support version 24 and above.








# Clear separation of modules
import android/core      # Core types and utilities
import android/sdk       # SDK implementation
import android/ndk       # NDK implementation

# ==================

# SDK implementation
proc newSdkLocationManager*(ctx: SdkContext): SdkLocationManager =
  result = SdkLocationManager(javaContext: ctx.javaContext)

# NDK implementation
proc newNdkLocationManager*(ctx: NdkContext): NdkLocationManager = 
  result = NdkLocationManager(nativePtr: ctx.nativePtr)

# Factory based on context type
proc newLocationManager*(ctx: AndroidContext): auto =
  case ctx.kind
  of ackJvm:
    result = newSdkLocationManager(ctx.sdk)
  of ackNative:
    result = newNdkLocationManager(ctx.ndk)
    
    
    #=======================
    
# SDK implementation
proc requestLocationUpdates*(mgr: SdkLocationManager, callback: LocationCallback) =
  # SDK implementation
  discard

proc getLastLocation*(mgr: SdkLocationManager): Location =
  # SDK implementation
  discard

# NDK implementation  
proc requestLocationUpdates*(mgr: NdkLocationManager, callback: LocationCallback) =
  # NDK implementation
  discard

proc getLastLocation*(mgr: NdkLocationManager): Location =
  # NDK implementation
  discard

# Implementation-specific APIs clearly named
proc requestLocationUpdatesWithIntent*(mgr: SdkLocationManager, intent: pointer) =
  # SDK-specific implementation
  discard

proc registerDirectLocationCallback*(mgr: NdkLocationManager, callback: pointer) =
  # NDK-specific implementation
  discard

# =================

# SDK-specific function
proc requestLocationUpdatesWithIntent*(mgr: SdkLocationManager, intent: pointer) =
  ## SDK-only method: Registers for location updates using a PendingIntent
  ## Not available in NDK implementation
  discard

# NDK-specific function
proc registerDirectLocationCallback*(mgr: NdkLocationManager, callback: pointer) =
  ## NDK-only method: Direct callback for high-performance location updates
  ## Not available in SDK implementation
  discard

# ==================



# Developer explicitly chooses implementation approach
when defined(useNdk):
  # Initialize with NDK context
  let nativeCtx = getNativeContext()
  let ctx = initNdkContext(nativeCtx)
  let locationManager = newNdkLocationManager(ctx.ndk)
  
  # Use common API
  locationManager.requestLocationUpdates(callback)
  
  # Use NDK-specific API when needed
  locationManager.registerDirectLocationCallback(nativeCallback)
else:
  # Initialize with SDK context
  let javaCtx = getJavaContext()
  let ctx = initSdkContext(javaCtx)
  let locationManager = newSdkLocationManager(ctx.sdk)
  
  # Use common API
  locationManager.requestLocationUpdates(callback)
  
  # Use SDK-specific API when needed
  locationManager.requestLocationUpdatesWithIntent(pendingIntent)




# =============================

# Modules with clear separation
import android/sdk      # JNI/jnim approach
import android/ndk      # Direct NDK FFI approach

# Explicit context creation - developer chooses
proc main() =
  # Developer makes an explicit choice
  when defined(useNdk):
    let activity = android.ndk.getActivity()
    let ctx = initNdkContext(activity)
  else:
    let javaContext = android.sdk.getCurrentContext()
    let ctx = initSdkContext(javaContext)
  
  # API consistent from this point
  let locationService = newLocationService(ctx)
  locationService.requestLocationUpdates()




# if user chose to use hybrid = both sdk and ndk, the contexts are both initialized -- dev can mix and match, but should explicitly use the api (such as ndk.locationMgr.startLocationQuery(...) ), otherwise it's very confusing.

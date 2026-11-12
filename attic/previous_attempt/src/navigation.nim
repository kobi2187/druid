# navigation.nim - Navigation and routing

import android, options

type
  NavigationProvider* = enum
    Internal, GoogleMaps, Waze, AppleMaps
    
  TravelMode* = enum
    Driving, Walking, Bicycling, Transit
    
  RouteAvoidOption* = enum
    Tolls, Highways, Ferries, IndoorSteps
    
  NavigationOptions* = object
    provider*: NavigationProvider
    mode*: TravelMode
    avoid*: set[RouteAvoidOption]
    alternatives*: bool
    departureTime*: Option[Time]
    
  RouteStep* = object
    instructions*: string
    distance*: float  # meters
    duration*: int  # seconds
    startLocation*: LatLng  # from maps.nim
    endLocation*: LatLng  # from maps.nim
    polyline*: seq[LatLng]  # from maps.nim
    maneuver*: Option[string]
    
  RouteLeg* = object
    startAddress*: string
    endAddress*: string
    distance*: float  # meters
    duration*: int  # seconds
    steps*: seq[RouteStep]
    
  Route* = object
    summary*: string
    distance*: float  # meters
    duration*: int  # seconds
    legs*: seq[RouteLeg]
    polyline*: seq[LatLng]  # from maps.nim
    warnings*: seq[string]
    
  NavigationResult* = object
    routes*: seq[Route]
    
  NavigationCallback* = proc(result: Option[NavigationResult], error: Option[string])
  NavigationProgressCallback* = proc(distanceRemaining: float, durationRemaining: int, currentLocation: LatLng)
    
  NavigationManager* = ref object of Manager
    navigationProvider: NavigationProvider
    currentRoute: Option[Route]
    progressCallbacks: seq[NavigationProgressCallback]
    routeCallbacks: Table[string, NavigationCallback]
    location: pointer  # JNI reference to LocationManager or FusedLocationProvider
    directions: pointer  # JNI reference to DirectionsApi

# Constructor
proc newNavigationManager*(context: Context): NavigationManager
  ## Creates a new navigation manager

# Route planning
proc getRoute*(m: NavigationManager,
             origin: LatLng,
             destination: LatLng,
             waypoints: seq[LatLng] = @[],
             options: NavigationOptions = NavigationOptions(provider: Internal, mode: Driving, avoid: {}, alternatives: false),
             callback: NavigationCallback): string
  ## Gets route
  ## Returns request ID
  ## API 26+: Uses appropriate provider's API
  
proc getRouteByAddress*(m: NavigationManager,
                      originAddress: string,
                      destinationAddress: string,
                      waypointAddresses: seq[string] = @[],
                      options: NavigationOptions = NavigationOptions(provider: Internal, mode: Driving, avoid: {}, alternatives: false),
                      callback: NavigationCallback): string
  ## Gets route by address
  ## Returns request ID
  ## API 26+: Uses appropriate provider's API with geocoding

# Navigation
proc startNavigation*(m: NavigationManager,
                    route: Route,
                    progressCallback: Option[NavigationProgressCallback] = none(NavigationProgressCallback)): bool
  ## Starts turn-by-turn navigation
  ## API 26+: Uses appropriate provider's navigation intent
  
proc startNavigationByCoordinates*(m: NavigationManager,
                                 destination: LatLng,
                                 destinationName: Option[string] = none(string),
                                 mode: TravelMode = Driving): bool
  ## Starts navigation by coordinates
  ## API 26+: Uses appropriate provider's navigation intent
  
proc startNavigationByAddress*(m: NavigationManager,
                             address: string,
                             mode: TravelMode = Driving): bool
  ## Starts navigation by address
  ## API 26+: Uses appropriate provider's navigation intent

# Provider management
proc isProviderAvailable*(m: NavigationManager, provider: NavigationProvider): bool
  ## Checks if navigation provider is available
  ## API 26+: Checks if provider app is installed
  
proc setProvider*(m: NavigationManager, provider: NavigationProvider): bool
  ## Sets navigation provider
  ## API 26+: Updates internal provider setting
  
proc getAvailableProviders*(m: NavigationManager): seq[NavigationProvider]
  ## Gets available navigation providers
  ## API 26+: Checks installed apps

# Navigation state
proc stopNavigation*(m: NavigationManager): bool
  ## Stops navigation
  ## API 26+: Stops location updates and progress tracking
  
proc isNavigating*(m: NavigationManager): bool
  ## Checks if currently navigating
  ## API 26+: Checks internal state
  
proc getCurrentRoute*(m: NavigationManager): Option[Route]
  ## Gets current route
  ## API 26+: Returns internal route state
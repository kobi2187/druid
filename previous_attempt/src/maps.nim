# maps.nim - Maps and location-based services

import android, options

type
  LatLng* = object
    latitude*: float
    longitude*: float
    
  MapType* = enum
    Normal, Satellite, Terrain, Hybrid
    
  LocationMode* = enum
    Normal, NoTracking, FollowMe, FollowWithHeading
    
  CameraUpdate* = object
    center*: Option[LatLng]
    zoom*: Option[float]  # 2.0 to 21.0
    tilt*: Option[float]  # 0 to 60 degrees
    bearing*: Option[float]  # 0 to 360 degrees
    
  MapMarker* = object
    id*: string
    position*: LatLng
    title*: Option[string]
    snippet*: Option[string]
    draggable*: bool
    iconResourceId*: Option[int]
    
  MapPolyline* = object
    id*: string
    points*: seq[LatLng]
    width*: float
    color*: int
    
  MapPolygon* = object
    id*: string
    points*: seq[LatLng]
    strokeWidth*: float
    strokeColor*: int
    fillColor*: int
    
  MapCircle* = object
    id*: string
    center*: LatLng
    radius*: float  # meters
    strokeWidth*: float
    strokeColor*: int
    fillColor*: int
    
  MapMarkerClickListener* = proc(markerId: string): bool  # true to consume click
  MapClickListener* = proc(position: LatLng)
  MapCameraIdleListener* = proc(position: LatLng, zoom: float)
    
  MapsManager* = ref object of Manager
    mapFragment: pointer  # JNI reference
    googleMap: pointer    # JNI reference
    markers: Table[string, pointer]  # JNI references to markers
    polylines: Table[string, pointer]  # JNI references to polylines
    polygons: Table[string, pointer]  # JNI references to polygons
    circles: Table[string, pointer]  # JNI references to circles
    markerClickListener: Option[MapMarkerClickListener]
    mapClickListener: Option[MapClickListener]
    cameraIdleListener: Option[MapCameraIdleListener]
    activity: Option[Activity]

# Constructor
proc newMapsManager*(context: Context, activity: Option[Activity] = none(Activity)): MapsManager
  ## Creates a new maps manager
  ## Activity required for map fragment

# Map initialization
proc initialize*(m: MapsManager, 
               fragmentId: int,
               callback: proc(success: bool)): bool
  ## Initializes map in fragment
  ## API 26+: Uses SupportMapFragment
  ## Requires activity and Google Maps dependency
  
proc isAvailable*(m: MapsManager): bool
  ## Checks if Google Maps is available
  ## API 26+: Checks for Play Services and Maps library

# Map configuration
proc setMapType*(m: MapsManager, mapType: MapType): bool
  ## Sets map type
  ## API 26+: Uses GoogleMap.setMapType
  
proc setLocationEnabled*(m: MapsManager, enabled: bool): bool
  ## Enables/disables My Location layer
  ## API 26+: Uses GoogleMap.setMyLocationEnabled
  ## Requires ACCESS_FINE_LOCATION permission
  
proc setLocationMode*(m: MapsManager, mode: LocationMode): bool
  ## Sets location tracking mode
  ## API 26+: Uses GoogleMap.setLocationSource and camera updates

# Camera control
proc moveCamera*(m: MapsManager, update: CameraUpdate): bool
  ## Moves camera instantly
  ## API 26+: Uses GoogleMap.moveCamera
  
proc animateCamera*(m: MapsManager, 
                  update: CameraUpdate,
                  durationMs: Option[int] = none(int)): bool
  ## Animates camera
  ## API 26+: Uses GoogleMap.animateCamera
  
proc getCameraPosition*(m: MapsManager): tuple[position: LatLng, zoom: float, tilt: float, bearing: float]
  ## Gets current camera position
  ## API 26+: Uses GoogleMap.getCameraPosition

# Markers
proc addMarker*(m: MapsManager, marker: MapMarker): string
  ## Adds marker to map
  ## Returns marker ID
  ## API 26+: Uses GoogleMap.addMarker
  
proc updateMarker*(m: MapsManager, marker: MapMarker): bool
  ## Updates existing marker
  ## API 26+: Uses Marker.setPosition, setTitle, etc.
  
proc removeMarker*(m: MapsManager, markerId: string): bool
  ## Removes marker
  ## API 26+: Uses Marker.remove
  
proc setMarkerClickListener*(m: MapsManager, listener: MapMarkerClickListener): bool
  ## Sets marker click listener
  ## API 26+: Uses GoogleMap.setOnMarkerClickListener

# Shapes
proc addPolyline*(m: MapsManager, polyline: MapPolyline): string
  ## Adds polyline to map
  ## Returns polyline ID
  ## API 26+: Uses GoogleMap.addPolyline
  
proc updatePolyline*(m: MapsManager, polyline: MapPolyline): bool
  ## Updates existing polyline
  ## API 26+: Uses Polyline.setPoints, setColor, etc.
  
proc removePolyline*(m: MapsManager, polylineId: string): bool
  ## Removes polyline
  ## API 26+: Uses Polyline.remove
  
proc addPolygon*(m: MapsManager, polygon: MapPolygon): string
  ## Adds polygon to map
  ## Returns polygon ID
  ## API 26+: Uses GoogleMap.addPolygon
  
proc updatePolygon*(m: MapsManager, polygon: MapPolygon): bool
  ## Updates existing polygon
  ## API 26+: Uses Polygon.setPoints, setFillColor, etc.
  
proc removePolygon*(m: MapsManager, polygonId: string): bool
  ## Removes polygon
  ## API 26+: Uses Polygon.remove
  
proc addCircle*(m: MapsManager, circle: MapCircle): string
  ## Adds circle to map
  ## Returns circle ID
  ## API 26+: Uses GoogleMap.addCircle
  
proc updateCircle*(m: MapsManager, circle: MapCircle): bool
  ## Updates existing circle
  ## API 26+: Uses Circle.setCenter, setRadius, etc.
  
proc removeCircle*(m: MapsManager, circleId: string): bool
  ## Removes circle
  ## API 26+: Uses Circle.remove

# Event listeners
proc setMapClickListener*(m: MapsManager, listener: MapClickListener): bool
  ## Sets map click listener
  ## API 26+: Uses GoogleMap.setOnMapClickListener
  
proc setCameraIdleListener*(m: MapsManager, listener: MapCameraIdleListener): bool
  ## Sets camera idle listener
  ## API 26+: Uses GoogleMap.setOnCameraIdleListener
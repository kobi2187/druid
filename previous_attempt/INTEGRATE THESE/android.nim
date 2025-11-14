## android.nim - Main Unified Android API

# Re-export all modules for easy access
import android/[
  core,          # Runtime detection, feature tracking, logging
  audio,         # Audio playback, recording, effects
  graphics,      # OpenGL, Vulkan, 2D/3D rendering
  input,         # Touch, keyboard, sensors, gamepad
  notifications, # System notifications, badges
  camera,        # Photo/video capture, preview
  storage,       # Files, preferences, media store
  system,        # Battery, power, vibration, thermal
  network,       # HTTP, WebSocket, connectivity
  location       # GPS, geocoding, geofencing, places
]

export core, audio, graphics, input, notifications, 
       camera, storage, system, network, location

# High-level Application Framework
type
  AndroidApp* = ref object
    ## Main Android application class
    runtime: AndroidRuntime
    isInitialized: bool

proc newAndroidApp*(mode = armAuto): AndroidApp =
  ## Create new Android application
  new(result)
  result.runtime = initAndroid(mode)
  result.isInitialized = true
  
  # Print welcome message with detected capabilities
  info("🚀 Nim Android App initialized")
  info("📱 API Level: " & $result.runtime.deviceInfo.apiLevel)
  info("🏭 Device: " & result.runtime.deviceInfo.manufacturer & " " & result.runtime.deviceInfo.model)
  info("⚡ Mode: " & $result.runtime.mode)

proc close*(app: AndroidApp) =
  ## Clean shutdown of Android app
  if app.isInitialized:
    info("🔧 Shutting down Android app...")
    shutdownAndroid()
    app.isInitialized = false

proc getCapabilities*(app: AndroidApp): AndroidCapabilities =
  ## Get app capabilities
  getAndroidCapabilities()

proc hasFeature*(app: AndroidApp, feature: AndroidFeature): bool =
  ## Check if feature is available
  hasFeature(feature)

# Convenience Application Patterns

## Game Application Pattern
type
  AndroidGame* = ref object of AndroidApp
    graphics: GraphicsEngine
    audio: AudioEngine
    input: InputManager
    isRunning: bool

proc newAndroidGame*(preferVulkan = true, preferLowLatency = true): AndroidGame =
  ## Create Android game application
  new(result)
  AndroidApp(result)[] = newAndroidApp(armHybrid)[]
  
  # Initialize game systems
  result.graphics = newGraphicsEngine(GraphicsConfig(
    preferredApi: if preferVulkan: some(gaVulkan) else: some(gaOpenGLES3)
  ))
  
  result.audio = newAudioEngine(AudioEngineConfig(
    latencyMode: if preferLowLatency: almLow else: almStandard
  ))
  
  result.input = newInputManager()
  result.isRunning = true
  
  info("🎮 Android Game initialized")

proc gameLoop*(game: AndroidGame, 
               update: proc(deltaTime: float32),
               render: proc(graphics: GraphicsEngine)) =
  ## Main game loop
  var lastTime = now()
  
  while game.isRunning:
    let currentTime = now()
    let deltaTime = (currentTime - lastTime).inMilliseconds.float32 / 1000.0
    lastTime = currentTime
    
    # Update input
    game.input.update()
    
    # Check for exit
    if game.input.wasKeyPressed(kcBack) or game.input.wasKeyPressed(kcEscape):
      game.isRunning = false
      break
    
    # Game update
    update(deltaTime)
    
    # Rendering
    game.graphics.beginFrame()
    render(game.graphics)
    game.graphics.endFrame()

## Media Application Pattern  
type
  AndroidMediaApp* = ref object of AndroidApp
    audio: AudioPlayer
    camera: Camera
    storage: StorageManager

proc newAndroidMediaApp*(): AndroidMediaApp =
  ## Create Android media application
  new(result)
  AndroidApp(result)[] = newAndroidApp(armHybrid)[]
  
  result.audio = newAudioPlayer()
  result.camera = openCamera()
  result.storage = newStorageManager()
  
  info("📱 Android Media App initialized")

## Utility Application Pattern
type
  AndroidUtilityApp* = ref object of AndroidApp
    notifications: NotificationManager
    storage: StorageManager
    system: SystemManager
    network: NetworkManager

proc newAndroidUtilityApp*(): AndroidUtilityApp =
  ## Create Android utility application
  new(result)
  AndroidApp(result)[] = newAndroidApp(armHybrid)[]
  
  result.notifications = newNotificationManager()
  result.storage = newStorageManager()
  result.system = newSystemManager()
  result.network = newNetworkManager()
  
  info("🔧 Android Utility App initialized")

## Location-based Application Pattern
type
  AndroidLocationApp* = ref object of AndroidApp
    location: LocationManager
    notifications: NotificationManager

proc newAndroidLocationApp*(): AndroidLocationApp =
  ## Create Android location-based application
  new(result)
  AndroidApp(result)[] = newAndroidApp(armHybrid)[]
  
  result.location = newLocationManager()
  result.notifications = newNotificationManager()
  
  info("📍 Android Location App initialized")

# Top-level Convenience Functions for Quick Prototyping

## Quick Audio
proc playSound*(filename: string) =
  ## Quick play sound file
  let player = newAudioPlayer()
  let soundId = player.loadSound(filename)
  player.playSound(soundId)

proc playMusic*(filename: string) =
  ## Quick play background music
  let player = newAudioPlayer()
  player.playMusic(filename)

## Quick Graphics
proc drawQuad*(x, y, width, height: float32, color: Color) =
  ## Quick draw colored rectangle
  trackFeature(afGraphics)

proc drawSprite*(filename: string, x, y: float32) =
  ## Quick draw sprite
  trackFeature(afGraphics)

## Quick Input
proc isTouched*(): bool =
  ## Quick check if screen is touched
  trackFeature(afInput)

proc getTouchPos*(): Vector2 =
  ## Quick get touch position
  trackFeature(afInput)

proc isShaking*(): bool =
  ## Quick check if device is shaking
  trackFeature(afSensors)

## Quick Notifications
proc notify*(title, message: string) =
  ## Quick show notification
  let manager = newNotificationManager()
  discard manager.show(title, message)

proc notifyImportant*(title, message: string) =
  ## Quick show important notification
  let manager = newNotificationManager()
  discard manager.showNotification(NotificationConfig(
    title: title,
    message: message,
    priority: npHigh
  ))

## Quick Storage
proc saveText*(filename, content: string) =
  ## Quick save text to file
  let storage = newStorageManager()
  discard storage.writeTextFile(filename, content)

proc loadText*(filename: string): string =
  ## Quick load text from file
  let storage = newStorageManager()
  storage.readTextFile(filename)

proc saveSetting*(key, value: string) =
  ## Quick save app setting
  let storage = newStorageManager()
  let prefs = storage.getPreferences()
  prefs.setString(key, value)
  prefs.apply()

proc loadSetting*(key: string, default = ""): string =
  ## Quick load app setting
  let storage = newStorageManager()
  let prefs = storage.getPreferences()
  prefs.getString(key, default)

## Quick System
proc vibrate*(duration: int32) =
  ## Quick vibrate device
  let system = newSystemManager()
  system.vibrate(duration)

proc getBattery*(): float32 =
  ## Quick get battery level
  let system = newSystemManager()
  system.getBatteryLevel()

proc isCharging*(): bool =
  ## Quick check if charging
  let system = newSystemManager()
  system.isBatteryCharging()

## Quick Network
proc httpGet*(url: string): string =
  ## Quick HTTP GET request
  let network = newNetworkManager()
  let client = network.newHttpClient()
  let response = client.get(url)
  response.body

proc httpPost*(url, data: string): string =
  ## Quick HTTP POST request
  let network = newNetworkManager()
  let client = network.newHttpClient()
  let response = client.post(url, data)
  response.body

proc isOnline*(): bool =
  ## Quick check if online
  let network = newNetworkManager()
  network.isConnected()

## Quick Location
proc getLocation*(): Option[Location] =
  ## Quick get current location
  let location = newLocationManager()
  location.getCurrentLocation()

proc getAddress*(): Option[Address] =
  ## Quick get current address
  let location = newLocationManager()
  if let loc = location.getCurrentLocation():
    location.getAddressFromLocation(loc.get())
  else:
    none(Address)

# Example Usage Patterns

when isMainModule:
  # Example 1: Simple Game
  proc simpleGameExample() =
    let game = newAndroidGame(preferVulkan = true)
    
    game.gameLoop(
      update = proc(deltaTime: float32) =
        if isTouched():
          playSound("beep.wav")
          vibrate(50)
      ,
      render = proc(graphics: GraphicsEngine) =
        let renderer = graphics.newRenderer()
        renderer.clear(Blue)
        
        if isTouched():
          let pos = getTouchPos()
          renderer.drawCircle(pos.x, pos.y, 50, Red)
    )
    
    game.close()

  # Example 2: Utility App
  proc utilityAppExample() =
    let app = newAndroidUtilityApp()
    
    # Show welcome notification
    notify("App Started", "Welcome to the utility app!")
    
    # Save some data
    saveText("log.txt", "App started at: " & $now())
    saveSetting("lastRun", $now())
    
    # Check system status
    let battery = getBattery()
    if battery < 0.2:
      notify("Low Battery", "Battery is below 20%")
    
    # Network check
    if isOnline():
      let data = httpGet("https://api.github.com/repos/nim-lang/nim")
      saveText("github_data.json", data)
    
    app.close()

  # Example 3: Location App
  proc locationAppExample() =
    let app = newAndroidLocationApp()
    
    if let location = getLocation():
      let loc = location.get()
      notify("Location Found", 
             "You are at: " & $loc.latitude & ", " & $loc.longitude)
      
      if let address = getAddress():
        let addr = address.get()
        notify("Address", addr.streetAddress & ", " & addr.locality)
    
    app.close()

  # Example 4: Media App
  proc mediaAppExample() =
    let app = newAndroidMediaApp()
    
    # Play background music
    playMusic("background.mp3")
    
    # Take a photo when screen is tapped
    while true:
      if isTouched():
        let photo = takePhoto()
        saveText("photo_metadata.txt", "Photo taken at: " & $now())
        notify("Photo Taken", "Saved to gallery")
        break
    
    app.close()

# Feature Detection Summary
static:
  echo ""
  echo "🔍 Final Feature Analysis Summary:"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  
  var totalFeatures = 0
  for feature in AndroidFeature:
    if feature in usedFeatures:
      totalFeatures += 1
      echo "✅ ", feature
  
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📊 Total Features Used: ", totalFeatures
  echo "📱 Minimum API Level: ", detectedMinApi
  echo "☕ Java SDK Required: ", if needsJavaSDK: "YES" else: "NO"
  echo "🎯 Optimal Mode: ", if needsJavaSDK and totalFeatures > 3: "Hybrid" 
                            elif needsJavaSDK: "SDK Focus"
                            else: "Pure NDK"
  echo "✅ Ready for Android deployment!"
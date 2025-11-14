type AndroidFeature* = enum
  afLocation,        # Location tracking
  afCamera,          # Camera access
  afBluetooth,       # Bluetooth API
  afFileAccess,      # File system access
  afSensors,         # Device sensors
  afBackgroundTasks, # Background processing
  afNotifications,   # Notification system
  afMediaPlayback    # Audio/video playback

# Define availability of features on different API paths
const FeatureAvailability = {
  afLocation:        (sdk: true, ndk: (minLevel: 24, supported: true)),  # NDK needs API 24+
  afCamera:          (sdk: true, ndk: (minLevel: 24, supported: true)),  # NDK Camera API
  afBluetooth:       (sdk: true, ndk: (minLevel: 26, supported: true)),  # NDK needs Oreo+
  afFileAccess:      (sdk: true, ndk: (minLevel: 21, supported: true)),  # All NDK versions
  afSensors:         (sdk: true, ndk: (minLevel: 21, supported: true)),  # All NDK versions
  afBackgroundTasks: (sdk: true, ndk: (minLevel: 0, supported: false)),  # SDK only
  afNotifications:   (sdk: true, ndk: (minLevel: 0, supported: false)),  # SDK only
  afMediaPlayback:   (sdk: true, ndk: (minLevel: 21, supported: true)),  # NDK media APIs
}.toTable


type
  AndroidDeviceInfo* = object
    apiLevel*: int
    hasLowLatencyAudio*: bool
    hasAmplitudeControl*: bool
    hasCamera2Api*: bool
    hasGooglePlayServices*: bool
    manufacturer*: string
    model*: string

proc detectDeviceCapabilities*(): AndroidDeviceInfo
  discard # todo

# template trackPermission  # TODO



# then based on the used features, create managers etc that the runtime needs, as well as manifest with permissions needed
# we can even decide at compile time, if to use ndk or sdk for various services.
# user can choose useNdk = true, or we choose for him, if lowlatency is needed for example.
# in any case, we initialize the managers based on it.

type
  AnalyticsManager* = ref object
  AudioManager* = ref object
  # // AuthManager* = ref object
  BackgroundTaskManager* = ref object
  BiometricManager* = ref object
  BluetoothManager* = ref object
  CameraManager* = ref object
  ClipboardManager* = ref object
  ConnectivityManager* = ref object
  CryptographyManager* = ref object
  DatabaseManager* = ref object
  DownloadManager* = ref object
  FileManager* = ref object
  LifecycleManager* = ref object
  LocationManager* = ref object
  MediaManager* = ref object
  MemoryManager* = ref object
  NetworkManager* = ref object
  NFCManager* = ref object
  NimStorageManager* = ref object
  NotificationManager* = ref object
  PackageManager* = ref object
  PermissionManager* = ref object
  PowerManager* = ref object
  ResurrectionManager* = ref object
  SchedulerManager* = ref object
  SensorManager* = ref object
  SocialManager* = ref object
  StateManager* = ref object
  StorageManager* = ref object
  TelephonyManager* = ref object
  ThreadManager* = ref object
  VibrationManager* = ref object




type AndroidRuntime = object
  # context: the java context for jni usage.

  # managers: optional and set according to CT features used.
  activity* : Option[ActivityManager]
  analytics* : Option[AnalyticsManager]
  audio* = Option[AudioManager]
  backgroundTask* : Option[BackgroundTaskManager]
  biometric* : Option[BiometricManager]
  bluetooth* : Option[BluetoothManager]
  camera* : Option[CameraManager]
  clipboard* : Option[ClipboardManager]
  connectivity* : Option[ConnectivityManager]
  cryptography* : Option[CryptographyManager]
  database* : Option[DatabaseManager]
  download* : Option[DownloadManager]
  file* : Option[FileManager]
  lifecycle* : Option[LifecycleManager]
  location* : Option[LocationManager]
  media* : Option[MediaManager]
  memory* : Option[MemoryManager]
  network* : Option[NetworkManager]
  nfc* : Option[NFCManager]
  nimStorage* : Option[NimStorageManager]
  notification* : Option[NotificationManager]
  package* : Option[PackageManager]
  permission* : Option[PermissionManager]
  power* : Option[PowerManager]
  resurrection* : Option[ResurrectionManager]
  scheduler* : Option[SchedulerManager]
  sensor* : Option[SensorManager]
  social* : Option[SocialManager]
  state* : Option[StateManager]
  storage* : Option[StorageManager]
  telephony* : Option[TelephonyManager]
  thread* : Option[ThreadManager]
  vibration* : Option[VibrationManager]


var runtime* : AndroidRuntime {.threadvar.}  # singleton.


proc reestablishJavaConnection(rt: AndroidRuntime) =
  discard

proc initRuntime() # establishes jni connection etc.

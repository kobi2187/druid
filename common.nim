


# permissions

type
  PermissionCategory* = enum
    pcCamera = "Camera access for photos and videos"
    pcLocation = "Location access for relevant content"  
    pcStorage = "Storage access to save and load files"
    pcMicrophone = "Microphone access for audio recording"
    pcContacts = "Contact access to connect with friends"
    pcPhone = "Phone access for call-related features"
    pcCalendar = "Calendar access for scheduling"
    pcSensors = "Sensor access for activity tracking"


type
  AndroidPermission* = enum
    # Camera permissions
    apCamera = "android.permission.CAMERA"
    
    # Location permissions  
    apLocationFine = "android.permission.ACCESS_FINE_LOCATION"
    apLocationCoarse = "android.permission.ACCESS_COARSE_LOCATION"
    apLocationBackground = "android.permission.ACCESS_BACKGROUND_LOCATION"
    
    # Storage permissions
    apStorageRead = "android.permission.READ_EXTERNAL_STORAGE"
    apStorageWrite = "android.permission.WRITE_EXTERNAL_STORAGE"
    apStorageManage = "android.permission.MANAGE_EXTERNAL_STORAGE"  # Android 11+
    
    # Audio permissions
    apRecordAudio = "android.permission.RECORD_AUDIO"
    apModifyAudioSettings = "android.permission.MODIFY_AUDIO_SETTINGS"
    
    # Phone/SMS permissions
    apReadPhoneState = "android.permission.READ_PHONE_STATE"
    apCallPhone = "android.permission.CALL_PHONE"
    apSendSMS = "android.permission.SEND_SMS"
    apReceiveSMS = "android.permission.RECEIVE_SMS"
    apReadSMS = "android.permission.READ_SMS"
    
    # Contacts permissions
    apReadContacts = "android.permission.READ_CONTACTS"
    apWriteContacts = "android.permission.WRITE_CONTACTS"
    
    # Calendar permissions
    apReadCalendar = "android.permission.READ_CALENDAR"
    apWriteCalendar = "android.permission.WRITE_CALENDAR"
    
    # Sensors permissions
    apBodySensors = "android.permission.BODY_SENSORS"
    apActivityRecognition = "android.permission.ACTIVITY_RECOGNITION"
    
    # Network permissions  
    apInternet = "android.permission.INTERNET"
    apNetworkState = "android.permission.ACCESS_NETWORK_STATE"
    apWifiState = "android.permission.ACCESS_WIFI_STATE"
    apChangeWifiState = "android.permission.CHANGE_WIFI_STATE"
    
    # System permissions
    apVibrate = "android.permission.VIBRATE"
    apWakeLock = "android.permission.WAKE_LOCK"
    apSystemAlertWindow = "android.permission.SYSTEM_ALERT_WINDOW"
    apWriteSettings = "android.permission.WRITE_SETTINGS"
    
    # Bluetooth permissions
    apBluetooth = "android.permission.BLUETOOTH"
    apBluetoothAdmin = "android.permission.BLUETOOTH_ADMIN"
    apBluetoothConnect = "android.permission.BLUETOOTH_CONNECT"      # Android 12+
    apBluetoothScan = "android.permission.BLUETOOTH_SCAN"           # Android 12+
    apBluetoothAdvertise = "android.permission.BLUETOOTH_ADVERTISE" # Android 12+
    
    # Notification permissions  
    apPostNotifications = "android.permission.POST_NOTIFICATIONS"    # Android 13+

proc getPermissionsForCategory*(category: PermissionCategory): seq[AndroidPermission] =
  case category:
    of pcCamera: @[apCamera]
    of pcLocation: @[apLocationFine, apLocationCoarse]
    of pcStorage: @[apStorageRead, apStorageWrite]
    of pcMicrophone: @[apRecordAudio]
    of pcContacts: @[apReadContacts, apWriteContacts]
    of pcPhone: @[apReadPhoneState, apCallPhone]
    of pcCalendar: @[apReadCalendar, apWriteCalendar]
    of pcSensors: @[apBodySensors, apActivityRecognition]


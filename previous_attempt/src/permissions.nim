# permissions.nim - Permissions handling

import android, options

type
  PermissionStatus* = enum
    Granted, Denied, PermanentlyDenied, NeverAsked
    
  PermissionGroup* = enum
    ## Common permission groups
    Camera,
    Contacts,
    Location,
    Microphone,
    Phone,
    Sensors,
    Sms,
    Storage,
    Calendar,
    
  PermissionRequest* = object
    permissions*: seq[string]
    requestCode*: int
    rationaleMessage*: Option[string]
    
  PermissionCallback* = proc(permissions: seq[string], granted: seq[bool])
  SpecialPermissionCallback* = proc(granted: bool)
    
  PermissionManager* = ref object of Manager
    permissionCallbacks: Table[int, PermissionCallback]
    nextRequestCode: int
    activity: Option[Activity]

# Constructor
proc newPermissionManager*(context: Context, activity: Option[Activity] = none(Activity)): PermissionManager
  ## Creates a new permission manager
  ## Activity required for requesting permissions

# Permission status
proc getStatus*(m: PermissionManager, permission: string): PermissionStatus
  ## Gets permission status
  ## API 26+: Uses context.checkSelfPermission
  ## API 28+: Also checks shouldShowRequestPermissionRationale
  
proc getAllStatus*(m: PermissionManager, permissions: seq[string]): Table[string, PermissionStatus]
  ## Gets status for multiple permissions
  
proc hasPermission*(m: PermissionManager, permission: string): bool
  ## Checks if permission is granted
  
proc hasPermissions*(m: PermissionManager, permissions: seq[string]): bool
  ## Checks if all permissions are granted

# Permission mapping
proc getPermissionsInGroup*(m: PermissionManager, group: PermissionGroup): seq[string]
  ## Gets all permissions in a permission group
  ## API 26+: Uses modern permission constants
  ## API 29+: Groups are deprecated but mapping still useful

# Permission requesting
proc setActivity*(m: PermissionManager, activity: Activity)
  ## Sets activity for permission requests
  
proc request*(m: PermissionManager, 
            permission: string,
            callback: PermissionCallback): int
  ## Requests permission
  ## Returns request code
  ## Requires activity to be set
  ## API 26+: Uses requestPermissions
  
proc requestMultiple*(m: PermissionManager, 
                    permissions: seq[string],
                    callback: PermissionCallback): int
  ## Requests multiple permissions
  ## Returns request code
  ## Requires activity to be set
  
proc requestWithRationale*(m: PermissionManager,
                         permission: string,
                         rationale: string,
                         callback: PermissionCallback): int
  ## Requests permission with rationale dialog
  ## Returns request code
  ## Shows rationale dialog if needed
  ## Requires activity to be set

# Special permissions
proc requestSpecialPermission*(m: PermissionManager,
                             specialPermission: string,
                             callback: SpecialPermissionCallback): bool
  ## Requests special system permission via Settings
  ## For permissions like WRITE_SETTINGS, SYSTEM_ALERT_WINDOW
  ## API 29+: May have additional restrictions
  ## API 30+: Some special permissions have custom flows
  
proc openPermissionSettings*(m: PermissionManager): bool
  ## Opens app permission settings
  ## API 26+: Uses intent with Settings.ACTION_APPLICATION_DETAILS_SETTINGS
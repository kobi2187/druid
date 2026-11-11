# services.nim - Background services

import android, options, times

type
  ServiceType* = enum
    ## Service types for background operation
    Standard,           # Regular background service
    ForegroundLocation, # Location tracking service
    ForegroundCamera,   # Camera access service
    ForegroundMedia,    # Media playback service
    ForegroundPhoneCall, # Call related service
    ForegroundService,  # Generic foreground service
    DataSync,           # Data synchronization
    SystemExempt        # System exempt service (requires privileged perms)
    
  ServiceStartMode* = enum
    ## Service start modes
    Sticky,          # Restart with null intent if killed
    NonSticky,       # Don't restart if killed
    Redeliver        # Restart with last intent
    
  JobConstraints* = set[enum]
    ## Constraints for scheduled jobs
    RequireCharging,
    RequireBatteryNotLow,
    RequireDeviceIdle,
    RequireStorageNotLow,
    RequireNetwork,
    RequireUnmetered,
  
  JobInfo* = object
    ## Job configuration
    id*: int
    serviceAction*: string
    isPeriodic*: bool
    intervalMs*: Option[int64]  # For periodic jobs
    initialDelayMs*: Option[int64]
    deadlineMs*: Option[int64]  # Max execution delay
    constraints*: JobConstraints
    extras*: Table[string, string]
    isPersisted*: bool  # Survive reboots (requires permission)
    networkType*: NetworkType
    
  ServiceCallback* = proc(startId: int)
  JobCallback* = proc(params: Table[string, string])
    
  ServiceManager* = ref object of Manager
    activeServices: Table[string, tuple[type: ServiceType, pid: int]]
    serviceCallbacks: Table[string, ServiceCallback]
    jobCallbacks: Table[int, JobCallback]
    jobScheduler: pointer  # JNI reference
    serviceConnections: Table[string, pointer]  # JNI references

# Constructor
proc newServiceManager*(context: Context): ServiceManager
  ## Creates a new service manager

# Service control
proc startForegroundService*(m: ServiceManager,
                           serviceId: string,
                           serviceType: ServiceType,
                           notificationInfo: NotificationInfo,
                           callback: Option[ServiceCallback] = none(ServiceCallback)): bool
  ## Starts a foreground service
  ## API 26-28: Uses startForegroundService
  ## API 29-30: Requires foreground service permission
  ## API 31+: Requires specific foreground service type permission
                           
proc stopService*(m: ServiceManager, serviceId: string): bool
  ## Stops a service
  
proc isServiceRunning*(m: ServiceManager, serviceId: string): bool
  ## Checks if a service is running
  ## API 26+: Uses ActivityManager.getRunningServices
  ## This is best-effort and not 100% reliable on modern Android

# Job scheduling
proc scheduleJob*(m: ServiceManager, job: JobInfo, callback: JobCallback): bool
  ## Schedules a job for background execution
  ## API 26+: Uses JobScheduler with modern constraints
  ## API 28+: Has additional restrictions on periodic jobs
  ## API 31+: Has additional restrictions on exact timing
  
proc cancelJob*(m: ServiceManager, jobId: int)
  ## Cancels a scheduled job
  
proc cancelAllJobs*(m: ServiceManager)
  ## Cancels all scheduled jobs

# Work requests (higher-level API using WorkManager in the implementation)
proc scheduleOneTimeWork*(m: ServiceManager,
                         workId: string,
                         initialDelayMs: Option[int64] = none(int64),
                         constraints: JobConstraints = {},
                         inputData: Table[string, string] = initTable[string, string](),
                         callback: JobCallback): bool
  ## Schedules one-time work
  ## Implementation uses WorkManager
  
proc schedulePeriodicWork*(m: ServiceManager,
                          workId: string,
                          intervalMs: int64,
                          flexMs: int64,
                          constraints: JobConstraints = {},
                          inputData: Table[string, string] = initTable[string, string](),
                          callback: JobCallback): bool
  ## Schedules periodic work
  ## Implementation uses WorkManager
  
proc cancelWork*(m: ServiceManager, workId: string)
  ## Cancels scheduled work
# workmanager.nim - WorkManager integration

import android, options

type
  WorkState* = enum
    Enqueued, Running, Succeeded, Failed, Blocked, Cancelled
    
  NetworkType* = enum
    Not_Required, Connected, Unmetered, Not_Roaming, Metered
    
  WorkConstraints* = object
    requiresCharging*: bool
    requiresDeviceIdle*: bool
    requiresBatteryNotLow*: bool
    requiresStorageNotLow*: bool
    networkType*: NetworkType
    
  BackoffPolicy* = enum
    Linear, Exponential
    
  WorkRequest* = object
    id*: string
    workName*: string
    workType*: WorkType
    inputData*: Table[string, string]
    constraints*: WorkConstraints
    initialDelaySeconds*: int
    backoffDelaySeconds*: int
    backoffPolicy*: BackoffPolicy
    
  WorkType* = enum
    OneTime, Periodic
    
  PeriodicWorkRequest* = object
    intervalSeconds*: int
    flexIntervalSeconds*: Option[int]
    
  WorkInfo* = object
    id*: string
    state*: WorkState
    tags*: seq[string]
    outputData*: Table[string, string]
    runAttemptCount*: int
    
  WorkListener* = proc(workInfo: WorkInfo)
    
  WorkManager* = ref object of Manager
    listeners: Table[string, WorkListener]
    workManager: pointer  # JNI reference to WorkManager
    worker: pointer  # JNI reference to Worker

# Constructor
proc newWorkManager*(context: Context): WorkManager
  ## Creates a new work manager

# Work scheduling
proc enqueueOneTimeWork*(m: WorkManager,
                       workName: string,
                       inputData: Table[string, string] = initTable[string, string](),
                       constraints: WorkConstraints = WorkConstraints(),
                       initialDelaySeconds: int = 0,
                       backoffDelaySeconds: int = 30,
                       backoffPolicy: BackoffPolicy = Exponential): string
  ## Schedules one-time work
  ## Returns work ID
  ## API 26+: Uses WorkManager.enqueueUniqueWork
  
proc enqueuePeriodicWork*(m: WorkManager,
                        workName: string,
                        intervalSeconds: int,
                        flexIntervalSeconds: Option[int] = none(int),
                        inputData: Table[string, string] = initTable[string, string](),
                        constraints: WorkConstraints = WorkConstraints()): string
  ## Schedules periodic work
  ## Returns work ID
  ## API 26+: Uses WorkManager.enqueueUniquePeriodicWork
  
proc cancelWorkById*(m: WorkManager, workId: string): bool
  ## Cancels work by ID
  ## API 26+: Uses WorkManager.cancelWorkById
  
proc cancelWorkByName*(m: WorkManager, workName: string): bool
  ## Cancels work by name
  ## API 26+: Uses WorkManager.cancelUniqueWork
  
proc cancelAllWork*(m: WorkManager): bool
  ## Cancels all work
  ## API 26+: Uses WorkManager.cancelAllWork

# Work state
proc getWorkInfoById*(m: WorkManager, workId: string, listener: WorkListener): bool
  ## Gets work info by ID
  ## API 26+: Uses WorkManager.getWorkInfoById
  
proc getWorkInfosByName*(m: WorkManager, workName: string, listener: proc(workInfos: seq[WorkInfo])): bool
  ## Gets work infos by name
  ## API 26+: Uses WorkManager.getWorkInfosForUniqueWork
  
proc observeWorkById*(m: WorkManager, workId: string, listener: WorkListener): bool
  ## Observes work by ID
  ## API 26+: Uses WorkManager.getWorkInfoByIdLiveData
  
proc observeWorkByName*(m: WorkManager, workName: string, listener: proc(workInfos: seq[WorkInfo])): bool
  ## Observes work by name
  ## API 26+: Uses WorkManager.getWorkInfosForUniqueWorkLiveData

# Work constraints
proc createConstraints*(m: WorkManager,
                      requiresCharging: bool = false,
                      requiresDeviceIdle: bool = false,
                      requiresBatteryNotLow: bool = false,
                      requiresStorageNotLow: bool = false,
                      networkType: NetworkType = Not_Required): WorkConstraints
  ## Creates work constraints
  ## API 26+: Uses Constraints.Builder

# Worker implementation
proc registerWorker*(m: WorkManager, 
                   workerName: string, 
                   workerProc: proc(inputData: Table[string, string]): tuple[success: bool, outputData: Table[string, string]]): bool
  ## Registers worker implementation
  ## API 26+: Uses ListenableWorker subclass
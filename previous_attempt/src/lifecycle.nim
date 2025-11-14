# lifecycle.nim - Activity lifecycle management

import android, options

type
  ActivityState* = enum
    Created, Started, Resumed, Paused, Stopped, Destroyed
    
  LifecycleEvent* = enum
    OnCreate, OnStart, OnResume, 
    OnPause, OnStop, OnDestroy
    
  ConfigurationChange* = enum
    Orientation, Locale, FontScale, UiMode, ScreenSize
    
  LifecycleObserver* = ref object
    onCreateCallback*: Option[proc()]
    onStartCallback*: Option[proc()]
    onResumeCallback*: Option[proc()]
    onPauseCallback*: Option[proc()]
    onStopCallback*: Option[proc()]
    onDestroyCallback*: Option[proc()]
    
  ConfigChangeObserver* = proc(changes: set[ConfigurationChange])
    
  LifecycleManager* = ref object of Manager
    observers: seq[LifecycleObserver]
    configObservers: seq[ConfigChangeObserver]
    currentState: ActivityState
    activity: Option[Activity]

# Constructor
proc newLifecycleManager*(context: Context, activity: Option[Activity] = none(Activity)): LifecycleManager
  ## Creates a new lifecycle manager
  ## Activity required for proper monitoring

# State management
proc getCurrentState*(m: LifecycleManager): ActivityState
  ## Gets current activity state
  
proc setActivity*(m: LifecycleManager, activity: Activity)
  ## Sets activity for lifecycle monitoring
  
proc isChangingConfigurations*(m: LifecycleManager): bool
  ## Checks if activity is changing configurations
  ## API 26+: Uses activity.isChangingConfigurations()

# Lifecycle observation
proc createObserver*(onCreateFn: proc() = nil,
                   onStartFn: proc() = nil,
                   onResumeFn: proc() = nil,
                   onPauseFn: proc() = nil,
                   onStopFn: proc() = nil,
                   onDestroyFn: proc() = nil): LifecycleObserver
  ## Creates lifecycle observer with callbacks
  
proc addObserver*(m: LifecycleManager, observer: LifecycleObserver)
  ## Adds lifecycle observer
  
proc removeObserver*(m: LifecycleManager, observer: LifecycleObserver)
  ## Removes lifecycle observer
  
proc addConfigChangeObserver*(m: LifecycleManager, observer: ConfigChangeObserver)
  ## Adds configuration change observer
  
proc removeConfigChangeObserver*(m: LifecycleManager, observer: ConfigChangeObserver)
  ## Removes configuration change observer

# Internal dispatch hooks - called from JNI bridge
proc dispatchLifecycleEvent*(m: LifecycleManager, event: LifecycleEvent)
  ## Dispatches lifecycle event to observers
  
proc dispatchConfigurationChange*(m: LifecycleManager, changes: set[ConfigurationChange])
  ## Dispatches configuration change event
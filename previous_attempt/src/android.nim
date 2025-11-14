# android.nim - Core types and utilities

import std/options, std/tables, std/times, std/sequtils, std/sets, std/strutils

type
  # Core Android types
  Context* = ref object
    ## Android application context
    impl: pointer  # Raw JNI reference
    
  Activity* = ref object
    ## Android activity
    context: Context
    impl: pointer
    
  AndroidVersion* = enum
    Nougat = 24,     # API 24-25
    Oreo = 26,       # API 26-27
    Pie = 28,        # API 28
    Ten = 29,        # API 29
    Eleven = 30,     # API 30
    Twelve = 31,     # API 31-32
    Thirteen = 33    # API 33+
    
  AndroidException* = object of CatchableError
    ## Base exception for Android API errors
    
  PermissionDeniedException* = object of AndroidException
    ## Thrown when permission is denied
    
  ServiceUnavailableException* = object of AndroidException
    ## Thrown when a service is unavailable

proc currentVersion*(): AndroidVersion =
  ## Get the current Android version
  let apiLevel = getSystemProperty("ro.build.version.sdk").parseInt()
  for version in AndroidVersion:
    if ord(version) <= apiLevel and 
       (version == AndroidVersion.high or ord(version.succ) > apiLevel):
      return version

# Core manager interface
type Manager* = ref object of RootObj
  context: Context

method initialize*(m: Manager) {.base.} = discard
method dispose*(m: Manager) {.base.} = discard

# Permission handling
proc hasPermission*(context: Context, permission: string): bool
proc requestPermissions*(activity: Activity, permissions: seq[string], callback: proc(granted: seq[string], denied: seq[string]))

# Intent handling
type 
  Intent* = ref object
    action*: string
    data*: Option[string]
    extras*: Table[string, string]
    flags*: int
    
proc newIntent*(action: string): Intent
proc putExtra*[T](intent: Intent, key: string, value: T)
proc startActivity*(context: Context, intent: Intent): bool
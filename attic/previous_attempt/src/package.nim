# package.nim - Package and application management

import android, options, times

type
  PackageInfo* = object
    ## Package information
    packageName*: string
    versionName*: string
    versionCode*: int
    firstInstallTime*: Time
    lastUpdateTime*: Time
    isSystemApp*: bool
    
  ApplicationInfo* = object
    ## Application information
    packageName*: string
    name*: string
    processName*: string
    minSdkVersion*: int
    targetSdkVersion*: int
    icon*: int  # Resource ID
    
  PackageInstallStatus* = enum
    NotInstalled, Installed, Disabled, UpdateRequired
    
  PackageManager* = ref object of Manager
    packageCache: Table[string, PackageInfo]
    systemService: pointer  # JNI reference

# Constructor
proc newPackageManager*(context: Context): PackageManager
  ## Creates a new package manager

# Application info
proc getAppInfo*(m: PackageManager): ApplicationInfo
  ## Gets current application info
  ## API 26+: Uses context.getApplicationInfo()
  
proc getPackageInfo*(m: PackageManager): PackageInfo
  ## Gets current package info
  ## API 26+: Uses context.getPackageManager().getPackageInfo()
  
proc getAppName*(m: PackageManager): string
  ## Gets application name
  
proc getAppVersion*(m: PackageManager): string
  ## Gets application version

# Package queries
proc isPackageInstalled*(m: PackageManager, packageName: string): PackageInstallStatus
  ## Checks if package is installed
  ## API 30+: Package visibility restrictions apply
  
proc getInstalledPackages*(m: PackageManager): seq[PackageInfo]
  ## Gets all installed packages
  ## API 30+: Package visibility restrictions apply
  ## May require QUERY_ALL_PACKAGES permission
  
proc getPackageInfo*(m: PackageManager, packageName: string): Option[PackageInfo]
  ## Gets info for specific package
  ## API 30+: Package visibility restrictions apply
  
proc getApplicationName*(m: PackageManager, packageName: string): Option[string]
  ## Gets application name for package
  ## API 30+: Package visibility restrictions apply

# Launch and install
proc launchApp*(m: PackageManager, packageName: string): bool
  ## Launches application
  ## API 30+: Package visibility restrictions apply
  
proc installPackage*(m: PackageManager, uri: string): bool
  ## Initiates package installation
  ## API 26+: Uses PackageInstaller
  ## API 29+: User confirmation required
  ## API 30+: More restricted
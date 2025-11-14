import jnim

jclass android.app.AppComponentFactory* of JVMObject:
  proc instantiateClassLoader*(cl: ClassLoader, aInfo: ApplicationInfo): ClassLoader
  proc instantiateApplication*(cl: ClassLoader, className: string): Application
  proc instantiateActivity*(cl: ClassLoader, className: string, intent: Intent): Activity
  proc instantiateReceiver*(cl: ClassLoader, className: string, intent: Intent): BroadcastReceiver
  proc instantiateService*(cl: ClassLoader, className: string, intent: Intent): Service
  proc instantiateProvider*(cl: ClassLoader, className: string): ContentProvider
  DEFAULT*: AppComponentFactory {.`static`.}


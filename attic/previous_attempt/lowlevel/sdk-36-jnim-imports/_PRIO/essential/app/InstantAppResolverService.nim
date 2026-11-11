import jnim

jclass android.app.InstantAppResolverService* of Service:
  proc onGetInstantAppResolveInfo*(digestPrefix: seq[jint], token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppIntentFilter*(digestPrefix: seq[jint], token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppResolveInfo*(sanitizedIntent: Intent, hostDigestPrefix: seq[jint], token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppIntentFilter*(sanitizedIntent: Intent, hostDigestPrefix: seq[jint], token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppResolveInfo*(sanitizedIntent: Intent, hostDigestPrefix: seq[jint], userHandle: UserHandle, token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppIntentFilter*(sanitizedIntent: Intent, hostDigestPrefix: seq[jint], userHandle: UserHandle, token: string, callback: InstantAppResolutionCallback)
  proc onGetInstantAppResolveInfo*(request: InstantAppRequestInfo, callback: InstantAppResolutionCallback)
  proc onGetInstantAppIntentFilter*(request: InstantAppRequestInfo, callback: InstantAppResolutionCallback)
  proc attachBaseContext*(base: Context)
  proc onBind*(intent: Intent): IBinder
  EXTRA_RESOLVE_INFO*: string {.`static`.}
  EXTRA_SEQUENCE*: string {.`static`.}

jclass android.app.InstantAppResolverService.InstantAppResolutionCallback* of JVMObject:
  proc onInstantAppResolveInfo*(resolveInfo: List[InstantAppResolveInfo])

jclass android.app.InstantAppResolutionCallback* of JVMObject:
  proc onInstantAppResolveInfo*(resolveInfo: List[InstantAppResolveInfo])


import jnim

jclass android.telecom.CallerInfoAsyncQuery* of JVMObject:
  proc startQuery*(token: jint, context: Context, contactRef: Uri, listener: OnQueryCompleteListener, cookie: JObject): CallerInfoAsyncQuery {.`static`.}
  proc startQuery*(token: jint, context: Context, number: string, listener: OnQueryCompleteListener, cookie: JObject): CallerInfoAsyncQuery {.`static`.}
  proc startQuery*(token: jint, context: Context, number: string, listener: OnQueryCompleteListener, cookie: JObject, subId: jint): CallerInfoAsyncQuery {.`static`.}
  proc addQueryListener*(token: jint, listener: OnQueryCompleteListener, cookie: JObject)

jclass android.telecom.CallerInfoAsyncQuery.OnQueryCompleteListener* of JVMObject:
  proc onQueryComplete*(token: jint, cookie: JObject, ci: CallerInfo)

jclass android.telecom.OnQueryCompleteListener* of JVMObject:
  proc onQueryComplete*(token: jint, cookie: JObject, ci: CallerInfo)

jclass android.telecom.QueryPoolException* of SQLException:


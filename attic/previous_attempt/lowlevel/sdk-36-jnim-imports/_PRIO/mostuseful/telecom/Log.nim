import jnim

jclass android.telecom.Log* of JVMObject:
  proc d*(prefix: string, format: string, args: JObject) {.`static`.}
  proc d*(objectPrefix: JObject, format: string, args: JObject) {.`static`.}
  proc i*(prefix: string, format: string, args: JObject) {.`static`.}
  proc i*(objectPrefix: JObject, format: string, args: JObject) {.`static`.}
  proc v*(prefix: string, format: string, args: JObject) {.`static`.}
  proc v*(objectPrefix: JObject, format: string, args: JObject) {.`static`.}
  proc w*(prefix: string, format: string, args: JObject) {.`static`.}
  proc w*(objectPrefix: JObject, format: string, args: JObject) {.`static`.}
  proc e*(prefix: string, tr: Throwable, format: string, args: JObject) {.`static`.}
  proc e*(objectPrefix: JObject, tr: Throwable, format: string, args: JObject) {.`static`.}
  proc wtf*(prefix: string, tr: Throwable, format: string, args: JObject) {.`static`.}
  proc wtf*(objectPrefix: JObject, tr: Throwable, format: string, args: JObject) {.`static`.}
  proc wtf*(prefix: string, format: string, args: JObject) {.`static`.}
  proc wtf*(objectPrefix: JObject, format: string, args: JObject) {.`static`.}
  proc setSessionContext*(context: Context) {.`static`.}
  proc startSession*(shortMethodName: string) {.`static`.}
  proc startSession*(info: Session.Info, shortMethodName: string) {.`static`.}
  proc startSession*(shortMethodName: string, callerIdentification: string) {.`static`.}
  proc startSession*(info: Session.Info, shortMethodName: string, callerIdentification: string) {.`static`.}
  proc createSubsession*(): Session {.`static`.}
  proc getExternalSession*(): Session.Info {.`static`.}
  proc getExternalSession*(ownerInfo: string): Session.Info {.`static`.}
  proc cancelSubsession*(subsession: Session) {.`static`.}
  proc continueSession*(subsession: Session, shortMethodName: string) {.`static`.}
  proc endSession*() {.`static`.}
  proc registerSessionListener*(l: SessionManager.ISessionListener) {.`static`.}
  proc getSessionId*(): string {.`static`.}
  proc addEvent*(recordEntry: EventManager.Loggable, event: string) {.`static`.}
  proc addEvent*(recordEntry: EventManager.Loggable, event: string, data: JObject) {.`static`.}
  proc addEvent*(recordEntry: EventManager.Loggable, event: string, format: string, args: JObject) {.`static`.}
  proc registerEventListener*(e: EventManager.EventListener) {.`static`.}
  proc addRequestResponsePair*(p: EventManager.TimedEventPair) {.`static`.}
  proc dumpEvents*(pw: IndentingPrintWriter) {.`static`.}
  proc dumpEventsTimeline*(pw: IndentingPrintWriter) {.`static`.}
  proc setIsExtendedLoggingEnabled*(isExtendedLoggingEnabled: jboolean) {.`static`.}
  proc setUnitTestingEnabled*(isEnabled: jboolean) {.`static`.}
  proc isUnitTestingEnabled*(): jboolean {.`static`.}
  proc getSessionManager*(): SessionManager {.`static`.}
  proc setSessionManager*(context: Context, cleanSessionRunnable: java.lang.Runnable): SessionManager {.`static`.}
  proc setTag*(tag: string) {.`static`.}
  proc setLock*(lock: JObject) {.`static`.}
  proc isLoggable*(level: jint): jboolean {.`static`.}
  proc piiHandle*(pii: JObject): string {.`static`.}
  proc pii*(pii: JObject): string {.`static`.}
  proc getPackageAbbreviation*(componentName: ComponentName): string {.`static`.}
  proc getPackageAbbreviation*(packageName: string): string {.`static`.}
  TAG*: string {.`static`.}
  DEBUG*: jboolean {.`static`.}
  INFO*: jboolean {.`static`.}
  VERBOSE*: jboolean {.`static`.}
  WARN*: jboolean {.`static`.}
  ERROR*: jboolean {.`static`.}


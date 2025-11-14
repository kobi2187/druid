import jnim

jclass android.media.MediaSession2* of JVMObject:
  proc close*()
  proc getId*(): string
  proc getToken*(): Session2Token
  proc broadcastSessionCommand*(command: Session2Command, args: Bundle)
  proc sendSessionCommand*(controller: ControllerInfo, command: Session2Command, args: Bundle): JObject
  proc cancelSessionCommand*(controller: ControllerInfo, token: JObject)
  proc setPlaybackActive*(playbackActive: jboolean)
  proc isPlaybackActive*(): jboolean
  proc getConnectedControllers*(): List[ControllerInfo]

jclass android.media.MediaSession2.Builder* of JVMObject:
  proc setSessionActivity*(pi: PendingIntent): Builder
  proc setId*(id: string): Builder
  proc setSessionCallback*(executor: Executor, callback: SessionCallback): Builder
  proc setExtras*(extras: Bundle): Builder
  proc build*(): MediaSession2

jclass android.media.MediaSession2.ControllerInfo* of JVMObject:
  proc getRemoteUserInfo*(): RemoteUserInfo
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getConnectionHints*(): Bundle
  proc isTrusted*(): jboolean
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string

jclass android.media.MediaSession2.SessionCallback* of JVMObject:
  proc onConnect*(session: MediaSession2, controller: ControllerInfo): Session2CommandGroup
  proc onPostConnect*(session: MediaSession2, controller: ControllerInfo)
  proc onDisconnected*(session: MediaSession2, controller: ControllerInfo)
  proc onSessionCommand*(session: MediaSession2, controller: ControllerInfo, command: Session2Command, args: Bundle): Session2Command.Result
  proc onCommandResult*(session: MediaSession2, controller: ControllerInfo, token: JObject, command: Session2Command, result: Session2Command.Result)

jclass android.media.Builder* of JVMObject:
  proc setSessionActivity*(pi: PendingIntent): Builder
  proc setId*(id: string): Builder
  proc setSessionCallback*(executor: Executor, callback: SessionCallback): Builder
  proc setExtras*(extras: Bundle): Builder
  proc build*(): MediaSession2

jclass android.media.ControllerInfo* of JVMObject:
  proc getRemoteUserInfo*(): RemoteUserInfo
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getConnectionHints*(): Bundle
  proc isTrusted*(): jboolean
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string

jclass android.media.SessionCallback* of JVMObject:
  proc onConnect*(session: MediaSession2, controller: ControllerInfo): Session2CommandGroup
  proc onPostConnect*(session: MediaSession2, controller: ControllerInfo)
  proc onDisconnected*(session: MediaSession2, controller: ControllerInfo)
  proc onSessionCommand*(session: MediaSession2, controller: ControllerInfo, command: Session2Command, args: Bundle): Session2Command.Result
  proc onCommandResult*(session: MediaSession2, controller: ControllerInfo, token: JObject, command: Session2Command, result: Session2Command.Result)


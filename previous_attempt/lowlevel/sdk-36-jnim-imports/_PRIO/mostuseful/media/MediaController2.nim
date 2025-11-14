import jnim

jclass android.media.MediaController2* of JVMObject:
  proc close*()
  proc getConnectedToken*(): Session2Token
  proc isPlaybackActive*(): jboolean
  proc sendSessionCommand*(command: Session2Command, args: Bundle): JObject
  proc cancelSessionCommand*(token: JObject)

jclass android.media.MediaController2.Builder* of JVMObject:
  proc setConnectionHints*(connectionHints: Bundle): Builder
  proc setControllerCallback*(executor: Executor, callback: ControllerCallback): Builder
  proc build*(): MediaController2

jclass android.media.MediaController2.ControllerCallback* of JVMObject:
  proc onConnected*(controller: MediaController2, allowedCommands: Session2CommandGroup)
  proc onDisconnected*(controller: MediaController2)
  proc onPlaybackActiveChanged*(controller: MediaController2, playbackActive: jboolean)
  proc onSessionCommand*(controller: MediaController2, command: Session2Command, args: Bundle): Session2Command.Result
  proc onCommandResult*(controller: MediaController2, token: JObject, command: Session2Command, result: Session2Command.Result)

jclass android.media.Builder* of JVMObject:
  proc setConnectionHints*(connectionHints: Bundle): Builder
  proc setControllerCallback*(executor: Executor, callback: ControllerCallback): Builder
  proc build*(): MediaController2

jclass android.media.ControllerCallback* of JVMObject:
  proc onConnected*(controller: MediaController2, allowedCommands: Session2CommandGroup)
  proc onDisconnected*(controller: MediaController2)
  proc onPlaybackActiveChanged*(controller: MediaController2, playbackActive: jboolean)
  proc onSessionCommand*(controller: MediaController2, command: Session2Command, args: Bundle): Session2Command.Result
  proc onCommandResult*(controller: MediaController2, token: JObject, command: Session2Command, result: Session2Command.Result)


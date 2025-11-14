import jnim

jclass android.app.VoiceInteractor* of JVMObject:
  proc submitRequest*(request: Request): jboolean
  proc submitRequest*(request: Request, name: string): jboolean
  proc getActiveRequests*(): seq[Request]
  proc getActiveRequest*(name: string): Request
  proc supportsCommands*(commands: seq[string]): seq[jboolean]
  proc isDestroyed*(): jboolean
  proc registerOnDestroyedCallback*(executor: Executor, callback: Runnable): jboolean
  proc unregisterOnDestroyedCallback*(callback: Runnable): jboolean
  proc notifyDirectActionsChanged*()
  proc getPackageName*(): string
  KEY_CANCELLATION_SIGNAL*: string {.`static`.}

jclass android.app.VoiceInteractor.Request* of JVMObject:
  proc getName*(): string
  proc cancel*()
  proc getContext*(): Context
  proc getActivity*(): Activity
  proc onCancel*()
  proc onAttached*(activity: Activity)
  proc onDetached*()
  proc toString*(): string

jclass android.app.VoiceInteractor.ConfirmationRequest* of JVMObject:
  proc onConfirmationResult*(confirmed: jboolean, result: Bundle)

jclass android.app.VoiceInteractor.PickOptionRequest* of JVMObject:
  proc onPickOptionResult*(finished: jboolean, selections: seq[Option], result: Bundle)

jclass android.app.VoiceInteractor.CompleteVoiceRequest* of JVMObject:
  proc onCompleteResult*(result: Bundle)

jclass android.app.VoiceInteractor.AbortVoiceRequest* of JVMObject:
  proc onAbortResult*(result: Bundle)

jclass android.app.VoiceInteractor.CommandRequest* of JVMObject:
  proc onCommandResult*(isCompleted: jboolean, result: Bundle)

jclass android.app.VoiceInteractor.Prompt* of JVMObject:
  proc getVoicePromptAt*(index: jint): CharSequence
  proc countVoicePrompts*(): jint
  proc getVisualPrompt*(): CharSequence
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.Request* of JVMObject:
  proc getName*(): string
  proc cancel*()
  proc getContext*(): Context
  proc getActivity*(): Activity
  proc onCancel*()
  proc onAttached*(activity: Activity)
  proc onDetached*()
  proc toString*(): string

jclass android.app.ConfirmationRequest* of Request:
  proc onConfirmationResult*(confirmed: jboolean, result: Bundle)

jclass android.app.PickOptionRequest* of Request:
  proc onPickOptionResult*(finished: jboolean, selections: seq[Option], result: Bundle)

jclass android.app.PickOptionRequest.Option* of JVMObject:
  proc addSynonym*(synonym: CharSequence): Option
  proc getLabel*(): CharSequence
  proc getIndex*(): jint
  proc countSynonyms*(): jint
  proc getSynonymAt*(index: jint): CharSequence
  proc setExtras*(extras: Bundle)
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.Option* of JVMObject:
  proc addSynonym*(synonym: CharSequence): Option
  proc getLabel*(): CharSequence
  proc getIndex*(): jint
  proc countSynonyms*(): jint
  proc getSynonymAt*(index: jint): CharSequence
  proc setExtras*(extras: Bundle)
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Option] {.`static`.}

jclass android.app.CompleteVoiceRequest* of Request:
  proc onCompleteResult*(result: Bundle)

jclass android.app.AbortVoiceRequest* of Request:
  proc onAbortResult*(result: Bundle)

jclass android.app.CommandRequest* of Request:
  proc onCommandResult*(isCompleted: jboolean, result: Bundle)

jclass android.app.Prompt* of JVMObject:
  proc getVoicePromptAt*(index: jint): CharSequence
  proc countVoicePrompts*(): jint
  proc getVisualPrompt*(): CharSequence
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[Prompt] {.`static`.}


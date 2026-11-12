import jnim

jclass android.media.AudioManagerInternal* of JVMObject:
  proc setRingerModeDelegate*(delegate: RingerModeDelegate)
  proc getRingerModeInternal*(): jint
  proc setRingerModeInternal*(ringerMode: jint, caller: string)
  proc silenceRingerModeInternal*(caller: string)
  proc updateRingerModeAffectedStreamsInternal*()
  proc setAccessibilityServiceUids*(uids: IntArray)
  proc addAssistantServiceUid*(uid: jint, owningUid: jint)
  proc removeAssistantServiceUid*(uid: jint)
  proc setActiveAssistantServicesUids*(activeUids: IntArray)
  proc setInputMethodServiceUid*(uid: jint)


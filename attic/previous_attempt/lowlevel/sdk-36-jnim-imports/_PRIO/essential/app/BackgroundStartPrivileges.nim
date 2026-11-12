import jnim

jclass android.app.BackgroundStartPrivileges* of JVMObject:
  proc allowBackgroundActivityStarts*(originatingToken: IBinder): BackgroundStartPrivileges {.`static`.}
  proc merge*(other: BackgroundStartPrivileges): BackgroundStartPrivileges
  proc merge*(list: List[BackgroundStartPrivileges]): BackgroundStartPrivileges {.`static`.}
  proc allowsBackgroundActivityStarts*(): jboolean
  proc allowsBackgroundFgsStarts*(): jboolean
  proc allowsAny*(): jboolean
  proc allowsNothing*(): jboolean
  proc getOriginatingToken*(): IBinder
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  NONE*: BackgroundStartPrivileges {.`static`.}
  ALLOW_BAL*: BackgroundStartPrivileges {.`static`.}
  ALLOW_FGS*: BackgroundStartPrivileges {.`static`.}


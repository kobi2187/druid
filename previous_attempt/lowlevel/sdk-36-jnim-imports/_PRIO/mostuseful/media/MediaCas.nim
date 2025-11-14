import jnim

jclass android.media.MediaCas* of JVMObject:
  proc isSystemIdSupported*(CA_system_id: jint): jboolean {.`static`.}
  proc enumeratePlugins*(): seq[PluginDescriptor] {.`static`.}
  proc updateResourcePriority*(priority: jint, niceValue: jint): jboolean
  proc setResourceOwnershipRetention*(enabled: jboolean)
  proc isAidlHal*(): jboolean
  proc setEventListener*(listener: EventListener, handler: Handler)
  proc setPrivateData*(data: seq[jbyte])
  proc openSession*(): Session
  proc openSession*(sessionUsage: jint, scramblingMode: jint): Session
  proc processEmm*(data: seq[jbyte], offset: jint, length: jint)
  proc processEmm*(data: seq[jbyte])
  proc sendEvent*(event: jint, arg: jint, data: seq[jbyte])
  proc provision*(provisionString: string)
  proc refreshEntitlements*(refreshType: jint, refreshData: seq[jbyte])
  proc forceResourceLost*()
  proc close*()
  SCRAMBLING_MODE_RESERVED*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CSA1*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CSA2*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CSA3_STANDARD*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CSA3_MINIMAL*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CSA3_ENHANCE*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_CISSA_V1*: jint {.`static`.}
  SCRAMBLING_MODE_DVB_IDSA*: jint {.`static`.}
  SCRAMBLING_MODE_MULTI2*: jint {.`static`.}
  SCRAMBLING_MODE_AES128*: jint {.`static`.}
  SCRAMBLING_MODE_AES_CBC*: jint {.`static`.}
  SCRAMBLING_MODE_AES_ECB*: jint {.`static`.}
  SCRAMBLING_MODE_AES_SCTE52*: jint {.`static`.}
  SCRAMBLING_MODE_TDES_ECB*: jint {.`static`.}
  SCRAMBLING_MODE_TDES_SCTE52*: jint {.`static`.}
  SESSION_USAGE_LIVE*: jint {.`static`.}
  SESSION_USAGE_PLAYBACK*: jint {.`static`.}
  SESSION_USAGE_RECORD*: jint {.`static`.}
  SESSION_USAGE_TIMESHIFT*: jint {.`static`.}
  PLUGIN_STATUS_PHYSICAL_MODULE_CHANGED*: jint {.`static`.}
  PLUGIN_STATUS_SESSION_NUMBER_CHANGED*: jint {.`static`.}

jclass android.media.MediaCas.PluginDescriptor* of JVMObject:
  proc getSystemId*(): jint
  proc getName*(): string
  proc toString*(): string

jclass android.media.MediaCas.Session* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc setPrivateData*(data: seq[jbyte])
  proc processEcm*(data: seq[jbyte], offset: jint, length: jint)
  proc processEcm*(data: seq[jbyte])
  proc sendSessionEvent*(event: jint, arg: jint, data: seq[jbyte])
  proc getSessionId*(): seq[jbyte]
  proc close*()

jclass android.media.PluginDescriptor* of JVMObject:
  proc getSystemId*(): jint
  proc getName*(): string
  proc toString*(): string

jclass android.media.Session* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc setPrivateData*(data: seq[jbyte])
  proc processEcm*(data: seq[jbyte], offset: jint, length: jint)
  proc processEcm*(data: seq[jbyte])
  proc sendSessionEvent*(event: jint, arg: jint, data: seq[jbyte])
  proc getSessionId*(): seq[jbyte]
  proc close*()


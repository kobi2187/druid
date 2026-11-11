import jnim

jclass android.nfc.Tag* of JVMObject:
  proc createMockTag*(id: seq[jbyte], techList: seq[jint], techListExtras: seq[Bundle], cookie: jlong): Tag {.`static`.}
  proc getServiceHandle*(): jint
  proc getTechCodeList*(): seq[jint]
  proc getId*(): seq[jbyte]
  proc getTechList*(): seq[string]
  proc rediscover*(): Tag
  proc hasTech*(techType: jint): jboolean
  proc getTechExtras*(tech: jint): Bundle
  proc getTagService*(): INfcTag
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setConnectedTechnology*(technology: jint): jboolean
  proc getConnectedTechnology*(): jint
  proc setTechnologyDisconnected*()
  CREATOR*: Parcelable.Creator[Tag] {.`static`.}


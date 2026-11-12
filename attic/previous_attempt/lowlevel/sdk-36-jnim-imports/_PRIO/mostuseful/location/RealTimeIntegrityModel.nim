import jnim

jclass android.location.RealTimeIntegrityModel* of JVMObject:
  proc getBadSvid*(): jint
  proc getBadSignalTypes*(): List[GnssSignalType]
  proc getPublishDateSeconds*(): jlong
  proc getStartDateSeconds*(): jlong
  proc getEndDateSeconds*(): jlong
  proc getAdvisoryType*(): string
  proc getAdvisoryNumber*(): string
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[RealTimeIntegrityModel] {.`static`.}

jclass android.location.RealTimeIntegrityModel.Builder* of JVMObject:
  proc setBadSvid*(badSvid: jint): Builder
  proc setBadSignalTypes*(badSignalTypes: List[GnssSignalType]): Builder
  proc setPublishDateSeconds*(publishDateSeconds: jlong): Builder
  proc setStartDateSeconds*(startDateSeconds: jlong): Builder
  proc setEndDateSeconds*(endDateSeconds: jlong): Builder
  proc setAdvisoryType*(advisoryType: string): Builder
  proc setAdvisoryNumber*(advisoryNumber: string): Builder
  proc build*(): RealTimeIntegrityModel

jclass android.location.Builder* of JVMObject:
  proc setBadSvid*(badSvid: jint): Builder
  proc setBadSignalTypes*(badSignalTypes: List[GnssSignalType]): Builder
  proc setPublishDateSeconds*(publishDateSeconds: jlong): Builder
  proc setStartDateSeconds*(startDateSeconds: jlong): Builder
  proc setEndDateSeconds*(endDateSeconds: jlong): Builder
  proc setAdvisoryType*(advisoryType: string): Builder
  proc setAdvisoryNumber*(advisoryNumber: string): Builder
  proc build*(): RealTimeIntegrityModel


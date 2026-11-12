import jnim

jclass android.app.ProfilerInfo* of JVMObject:
  proc getClockTypeFromString*(type: string): jint {.`static`.}
  proc getFlagsForOutputVersion*(version: jint): jint {.`static`.}
  proc setAgent*(agent: string, attachAgentDuringBind: jboolean): ProfilerInfo
  proc closeFd*()
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  PROFILE_TYPE_REGULAR*: jint {.`static`.}
  PROFILE_TYPE_LOW_OVERHEAD*: jint {.`static`.}
  OUTPUT_VERSION_DEFAULT*: jint {.`static`.}
  CLOCK_TYPE_DEFAULT*: jint {.`static`.}
  CLOCK_TYPE_WALL*: jint {.`static`.}
  CLOCK_TYPE_THREAD_CPU*: jint {.`static`.}
  CLOCK_TYPE_DUAL*: jint {.`static`.}
  TRACE_FORMAT_VERSION_SHIFT*: jint {.`static`.}
  profileFile*: string
  profileFd*: ParcelFileDescriptor
  samplingInterval*: jint
  autoStopProfiler*: jboolean
  streamingOutput*: jboolean
  agent*: string
  attachAgentDuringBind*: jboolean
  clockType*: jint
  profilerOutputVersion*: jint
  CREATOR*: Parcelable.Creator[ProfilerInfo] {.`static`.}


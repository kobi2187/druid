import jnim

jclass android.util.MergedConfiguration* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc describeContents*(): jint
  proc setConfiguration*(globalConfig: Configuration, overrideConfig: Configuration)
  proc setGlobalConfiguration*(globalConfig: Configuration)
  proc setOverrideConfiguration*(overrideConfig: Configuration)
  proc setTo*(config: MergedConfiguration)
  proc unset*()
  proc getGlobalConfiguration*(): Configuration
  proc getOverrideConfiguration*(): Configuration
  proc getMergedConfiguration*(): Configuration
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(that: JObject): jboolean
  proc dump*(pw: PrintWriter, prefix: string)
  CREATOR*: Creator[MergedConfiguration] {.`static`.}


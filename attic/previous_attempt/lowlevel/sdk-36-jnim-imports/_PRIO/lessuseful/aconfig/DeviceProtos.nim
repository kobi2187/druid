import jnim

jclass android.aconfig.DeviceProtos* of JVMObject:
  proc loadAndParseFlagProtos*(): List[parsed_flag] {.`static`.}
  proc parsedFlagsProtoPaths*(): List[string] {.`static`.}
  PATHS*: string {.`static`.}


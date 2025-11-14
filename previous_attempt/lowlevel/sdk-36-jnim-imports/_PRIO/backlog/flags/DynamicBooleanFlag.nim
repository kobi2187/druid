import jnim

jclass android.flags.DynamicBooleanFlag* of BooleanFlagBase:
  proc getDefault*(): Boolean
  proc defineMetaData*(label: string, description: string, categoryName: string): DynamicBooleanFlag


import jnim

jclass android.flags.BooleanFlag* of BooleanFlagBase:
  proc getDefault*(): Boolean
  proc defineMetaData*(label: string, description: string, categoryName: string): BooleanFlag


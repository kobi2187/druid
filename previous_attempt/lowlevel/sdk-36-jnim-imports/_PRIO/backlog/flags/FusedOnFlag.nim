import jnim

jclass android.flags.FusedOnFlag* of BooleanFlagBase:
  proc getDefault*(): Boolean
  proc defineMetaData*(label: string, description: string, categoryName: string): FusedOnFlag


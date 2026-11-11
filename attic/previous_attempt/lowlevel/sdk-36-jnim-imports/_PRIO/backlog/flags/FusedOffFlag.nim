import jnim

jclass android.flags.FusedOffFlag* of BooleanFlagBase:
  proc getDefault*(): Boolean
  proc defineMetaData*(label: string, description: string, categoryName: string): FusedOffFlag


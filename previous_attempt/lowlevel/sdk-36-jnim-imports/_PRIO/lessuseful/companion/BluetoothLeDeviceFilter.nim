import jnim

jclass android.companion.BluetoothLeDeviceFilter* of JVMObject:
  proc getNamePattern*(): Pattern
  proc getScanFilter*(): ScanFilter
  proc getRawDataFilter*(): seq[jbyte]
  proc getRawDataFilterMask*(): seq[jbyte]
  proc getRenamePrefix*(): string
  proc getRenameSuffix*(): string
  proc getRenameBytesFrom*(): jint
  proc getRenameBytesLength*(): jint
  proc isRenameBytesReverseOrder*(): jboolean
  proc getDeviceDisplayName*(sr: ScanResult): string
  proc matches*(scanResult: ScanResult): jboolean
  proc getMediumType*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc getRenamePrefixLengthLimit*(): jint {.`static`.}
  CREATOR*: Creator[BluetoothLeDeviceFilter] {.`static`.}

jclass android.companion.BluetoothLeDeviceFilter.Builder* of JVMObject:
  proc setNamePattern*(regex: Pattern): Builder
  proc setScanFilter*(scanFilter: ScanFilter): Builder
  proc setRawDataFilter*(rawDataFilter: seq[jbyte], rawDataFilterMask: seq[jbyte]): Builder
  proc setRenameFromBytes*(prefix: string, suffix: string, bytesFrom: jint, bytesLength: jint, byteOrder: ByteOrder): Builder
  proc setRenameFromName*(prefix: string, suffix: string, nameFrom: jint, nameLength: jint): Builder
  proc build*(): BluetoothLeDeviceFilter

jclass android.companion.Builder* of OneTimeUseBuilder:
  proc setNamePattern*(regex: Pattern): Builder
  proc setScanFilter*(scanFilter: ScanFilter): Builder
  proc setRawDataFilter*(rawDataFilter: seq[jbyte], rawDataFilterMask: seq[jbyte]): Builder
  proc setRenameFromBytes*(prefix: string, suffix: string, bytesFrom: jint, bytesLength: jint, byteOrder: ByteOrder): Builder
  proc setRenameFromName*(prefix: string, suffix: string, nameFrom: jint, nameLength: jint): Builder
  proc build*(): BluetoothLeDeviceFilter


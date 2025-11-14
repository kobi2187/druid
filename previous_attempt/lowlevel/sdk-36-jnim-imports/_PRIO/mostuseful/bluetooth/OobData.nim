import jnim

jclass android.bluetooth.OobData* of JVMObject:
  proc getDeviceAddressWithType*(): seq[jbyte]
  proc getConfirmationHash*(): seq[jbyte]
  proc getRandomizerHash*(): seq[jbyte]
  proc getDeviceName*(): seq[jbyte]
  proc getClassicLength*(): seq[jbyte]
  proc getClassOfDevice*(): seq[jbyte]
  proc getLeTemporaryKey*(): seq[jbyte]
  proc getLeAppearance*(): seq[jbyte]
  proc getLeFlags*(): jint
  proc getLeDeviceRole*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  OOB_LENGTH_OCTETS*: jint {.`static`.}
  DEVICE_ADDRESS_OCTETS*: jint {.`static`.}
  CLASS_OF_DEVICE_OCTETS*: jint {.`static`.}
  CONFIRMATION_OCTETS*: jint {.`static`.}
  RANDOMIZER_OCTETS*: jint {.`static`.}
  LE_DEVICE_ROLE_OCTETS*: jint {.`static`.}
  LE_TK_OCTETS*: jint {.`static`.}
  LE_APPEARANCE_OCTETS*: jint {.`static`.}
  LE_DEVICE_FLAG_OCTETS*: jint {.`static`.}
  LE_DEVICE_ROLE_PERIPHERAL_ONLY*: jint {.`static`.}
  LE_DEVICE_ROLE_CENTRAL_ONLY*: jint {.`static`.}
  LE_DEVICE_ROLE_BOTH_PREFER_PERIPHERAL*: jint {.`static`.}
  LE_DEVICE_ROLE_BOTH_PREFER_CENTRAL*: jint {.`static`.}
  LE_FLAG_LIMITED_DISCOVERY_MODE*: jint {.`static`.}
  LE_FLAG_GENERAL_DISCOVERY_MODE*: jint {.`static`.}
  LE_FLAG_BREDR_NOT_SUPPORTED*: jint {.`static`.}
  LE_FLAG_SIMULTANEOUS_CONTROLLER*: jint {.`static`.}
  LE_FLAG_SIMULTANEOUS_HOST*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[OobData] {.`static`.}

jclass android.bluetooth.OobData.LeBuilder* of JVMObject:
  proc setDeviceName*(deviceName: seq[jbyte]): LeBuilder
  proc setLeTemporaryKey*(leTemporaryKey: seq[jbyte]): LeBuilder
  proc setRandomizerHash*(randomizerHash: seq[jbyte]): LeBuilder
  proc setLeFlags*(leFlags: jint): LeBuilder
  proc build*(): OobData

jclass android.bluetooth.OobData.ClassicBuilder* of JVMObject:
  proc setRandomizerHash*(randomizerHash: seq[jbyte]): ClassicBuilder
  proc setDeviceName*(deviceName: seq[jbyte]): ClassicBuilder
  proc setClassOfDevice*(classOfDevice: seq[jbyte]): ClassicBuilder
  proc build*(): OobData

jclass android.bluetooth.LeBuilder* of JVMObject:
  proc setDeviceName*(deviceName: seq[jbyte]): LeBuilder
  proc setLeTemporaryKey*(leTemporaryKey: seq[jbyte]): LeBuilder
  proc setRandomizerHash*(randomizerHash: seq[jbyte]): LeBuilder
  proc setLeFlags*(leFlags: jint): LeBuilder
  proc build*(): OobData

jclass android.bluetooth.ClassicBuilder* of JVMObject:
  proc setRandomizerHash*(randomizerHash: seq[jbyte]): ClassicBuilder
  proc setDeviceName*(deviceName: seq[jbyte]): ClassicBuilder
  proc setClassOfDevice*(classOfDevice: seq[jbyte]): ClassicBuilder
  proc build*(): OobData


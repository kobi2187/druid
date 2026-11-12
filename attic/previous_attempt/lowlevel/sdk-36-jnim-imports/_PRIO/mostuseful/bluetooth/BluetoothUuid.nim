import jnim

jclass android.bluetooth.BluetoothUuid* of JVMObject:
  proc containsAnyUuid*(uuidA: seq[ParcelUuid], uuidB: seq[ParcelUuid]): jboolean {.`static`.}
  proc parseUuidFrom*(uuidBytes: seq[jbyte]): ParcelUuid {.`static`.}
  proc uuidToBytes*(uuid: ParcelUuid): seq[jbyte] {.`static`.}
  proc is16BitUuid*(parcelUuid: ParcelUuid): jboolean {.`static`.}
  proc is32BitUuid*(parcelUuid: ParcelUuid): jboolean {.`static`.}
  A2DP_SINK*: ParcelUuid {.`static`.}
  A2DP_SOURCE*: ParcelUuid {.`static`.}
  ADV_AUDIO_DIST*: ParcelUuid {.`static`.}
  HSP*: ParcelUuid {.`static`.}
  HSP_AG*: ParcelUuid {.`static`.}
  HFP*: ParcelUuid {.`static`.}
  HFP_AG*: ParcelUuid {.`static`.}
  AVRCP*: ParcelUuid {.`static`.}
  AVRCP_CONTROLLER*: ParcelUuid {.`static`.}
  AVRCP_TARGET*: ParcelUuid {.`static`.}
  OBEX_OBJECT_PUSH*: ParcelUuid {.`static`.}
  HID*: ParcelUuid {.`static`.}
  HOGP*: ParcelUuid {.`static`.}
  PANU*: ParcelUuid {.`static`.}
  NAP*: ParcelUuid {.`static`.}
  BNEP*: ParcelUuid {.`static`.}
  PBAP_PCE*: ParcelUuid {.`static`.}
  PBAP_PSE*: ParcelUuid {.`static`.}
  MAP*: ParcelUuid {.`static`.}
  MNS*: ParcelUuid {.`static`.}
  MAS*: ParcelUuid {.`static`.}
  SAP*: ParcelUuid {.`static`.}
  HEARING_AID*: ParcelUuid {.`static`.}
  HAS*: ParcelUuid {.`static`.}
  MFI_HAS*: ParcelUuid {.`static`.}
  LE_AUDIO*: ParcelUuid {.`static`.}
  DIP*: ParcelUuid {.`static`.}
  VOLUME_CONTROL*: ParcelUuid {.`static`.}
  GENERIC_MEDIA_CONTROL*: ParcelUuid {.`static`.}
  GMAP*: ParcelUuid {.`static`.}
  MEDIA_CONTROL*: ParcelUuid {.`static`.}
  COORDINATED_SET*: ParcelUuid {.`static`.}
  CAP*: ParcelUuid {.`static`.}
  BATTERY*: ParcelUuid {.`static`.}
  BASS*: ParcelUuid {.`static`.}
  TMAP*: ParcelUuid {.`static`.}
  BASE_UUID*: ParcelUuid {.`static`.}
  UUID_BYTES_16_BIT*: jint {.`static`.}
  UUID_BYTES_32_BIT*: jint {.`static`.}
  UUID_BYTES_128_BIT*: jint {.`static`.}


import jnim

jclass android.nfc.NfcAntennaInfo* of JVMObject:
  proc getDeviceWidth*(): jint
  proc getDeviceHeight*(): jint
  proc isDeviceFoldable*(): jboolean
  proc getAvailableNfcAntennas*(): List[AvailableNfcAntenna]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[NfcAntennaInfo] {.`static`.}


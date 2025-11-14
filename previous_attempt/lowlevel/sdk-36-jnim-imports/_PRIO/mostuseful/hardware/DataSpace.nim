import jnim

jclass android.hardware.DataSpace* of JVMObject:
  proc pack*(standard: jint, transfer: jint, range: jint): jint {.`static`.}
  proc getStandard*(dataSpace: jint): jint {.`static`.}
  proc getTransfer*(dataSpace: jint): jint {.`static`.}
  proc getRange*(dataSpace: jint): jint {.`static`.}
  STANDARD_UNSPECIFIED*: jint {.`static`.}
  STANDARD_BT709*: jint {.`static`.}
  STANDARD_BT601_625*: jint {.`static`.}
  STANDARD_BT601_625_UNADJUSTED*: jint {.`static`.}
  STANDARD_BT601_525*: jint {.`static`.}
  STANDARD_BT601_525_UNADJUSTED*: jint {.`static`.}
  STANDARD_BT2020*: jint {.`static`.}
  STANDARD_BT2020_CONSTANT_LUMINANCE*: jint {.`static`.}
  STANDARD_BT470M*: jint {.`static`.}
  STANDARD_FILM*: jint {.`static`.}
  STANDARD_DCI_P3*: jint {.`static`.}
  STANDARD_ADOBE_RGB*: jint {.`static`.}
  TRANSFER_UNSPECIFIED*: jint {.`static`.}
  TRANSFER_LINEAR*: jint {.`static`.}
  TRANSFER_SRGB*: jint {.`static`.}
  TRANSFER_SMPTE_170M*: jint {.`static`.}
  TRANSFER_GAMMA2_2*: jint {.`static`.}
  TRANSFER_GAMMA2_6*: jint {.`static`.}
  TRANSFER_GAMMA2_8*: jint {.`static`.}
  TRANSFER_ST2084*: jint {.`static`.}
  TRANSFER_HLG*: jint {.`static`.}
  RANGE_UNSPECIFIED*: jint {.`static`.}
  RANGE_FULL*: jint {.`static`.}
  RANGE_LIMITED*: jint {.`static`.}
  RANGE_EXTENDED*: jint {.`static`.}
  DATASPACE_DEPTH*: jint {.`static`.}
  DATASPACE_DYNAMIC_DEPTH*: jint {.`static`.}
  DATASPACE_HEIF*: jint {.`static`.}
  DATASPACE_JPEG_R*: jint {.`static`.}
  DATASPACE_HEIF_ULTRAHDR*: jint {.`static`.}
  DATASPACE_UNKNOWN*: jint {.`static`.}
  DATASPACE_SCRGB_LINEAR*: jint {.`static`.}
  DATASPACE_SRGB*: jint {.`static`.}
  DATASPACE_SCRGB*: jint {.`static`.}
  DATASPACE_DISPLAY_P3*: jint {.`static`.}
  DATASPACE_BT2020_HLG*: jint {.`static`.}
  DATASPACE_BT2020_PQ*: jint {.`static`.}
  DATASPACE_ADOBE_RGB*: jint {.`static`.}
  DATASPACE_JFIF*: jint {.`static`.}
  DATASPACE_BT601_625*: jint {.`static`.}
  DATASPACE_BT601_525*: jint {.`static`.}
  DATASPACE_BT2020*: jint {.`static`.}
  DATASPACE_BT709*: jint {.`static`.}
  DATASPACE_DCI_P3*: jint {.`static`.}
  DATASPACE_SRGB_LINEAR*: jint {.`static`.}
  DATASPACE_DISPLAY_BT2020*: jint {.`static`.}


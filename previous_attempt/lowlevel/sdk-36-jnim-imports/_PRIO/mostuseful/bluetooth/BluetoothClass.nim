import jnim

jclass android.bluetooth.BluetoothClass* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc hasService*(service: jint): jboolean
  proc getMajorDeviceClass*(): jint
  proc getDeviceClass*(): jint
  proc getClassOfDevice*(): jint
  proc doesClassMatch*(profile: jint): jboolean
  ERROR*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothClass] {.`static`.}
  PROFILE_HEADSET*: jint {.`static`.}
  PROFILE_A2DP*: jint {.`static`.}
  PROFILE_OPP*: jint {.`static`.}
  PROFILE_HID*: jint {.`static`.}
  PROFILE_PANU*: jint {.`static`.}
  PROFILE_NAP*: jint {.`static`.}
  PROFILE_A2DP_SINK*: jint {.`static`.}

jclass android.bluetooth.Service* of JVMObject:
  LIMITED_DISCOVERABILITY*: jint {.`static`.}
  LE_AUDIO*: jint {.`static`.}
  POSITIONING*: jint {.`static`.}
  NETWORKING*: jint {.`static`.}
  RENDER*: jint {.`static`.}
  CAPTURE*: jint {.`static`.}
  OBJECT_TRANSFER*: jint {.`static`.}
  AUDIO*: jint {.`static`.}
  TELEPHONY*: jint {.`static`.}
  INFORMATION*: jint {.`static`.}

jclass android.bluetooth.Device* of JVMObject:
  COMPUTER_UNCATEGORIZED*: jint {.`static`.}
  COMPUTER_DESKTOP*: jint {.`static`.}
  COMPUTER_SERVER*: jint {.`static`.}
  COMPUTER_LAPTOP*: jint {.`static`.}
  COMPUTER_HANDHELD_PC_PDA*: jint {.`static`.}
  COMPUTER_PALM_SIZE_PC_PDA*: jint {.`static`.}
  COMPUTER_WEARABLE*: jint {.`static`.}
  PHONE_UNCATEGORIZED*: jint {.`static`.}
  PHONE_CELLULAR*: jint {.`static`.}
  PHONE_CORDLESS*: jint {.`static`.}
  PHONE_SMART*: jint {.`static`.}
  PHONE_MODEM_OR_GATEWAY*: jint {.`static`.}
  PHONE_ISDN*: jint {.`static`.}
  AUDIO_VIDEO_UNCATEGORIZED*: jint {.`static`.}
  AUDIO_VIDEO_WEARABLE_HEADSET*: jint {.`static`.}
  AUDIO_VIDEO_HANDSFREE*: jint {.`static`.}
  AUDIO_VIDEO_MICROPHONE*: jint {.`static`.}
  AUDIO_VIDEO_LOUDSPEAKER*: jint {.`static`.}
  AUDIO_VIDEO_HEADPHONES*: jint {.`static`.}
  AUDIO_VIDEO_PORTABLE_AUDIO*: jint {.`static`.}
  AUDIO_VIDEO_CAR_AUDIO*: jint {.`static`.}
  AUDIO_VIDEO_SET_TOP_BOX*: jint {.`static`.}
  AUDIO_VIDEO_HIFI_AUDIO*: jint {.`static`.}
  AUDIO_VIDEO_VCR*: jint {.`static`.}
  AUDIO_VIDEO_VIDEO_CAMERA*: jint {.`static`.}
  AUDIO_VIDEO_CAMCORDER*: jint {.`static`.}
  AUDIO_VIDEO_VIDEO_MONITOR*: jint {.`static`.}
  AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER*: jint {.`static`.}
  AUDIO_VIDEO_VIDEO_CONFERENCING*: jint {.`static`.}
  AUDIO_VIDEO_VIDEO_GAMING_TOY*: jint {.`static`.}
  WEARABLE_UNCATEGORIZED*: jint {.`static`.}
  WEARABLE_WRIST_WATCH*: jint {.`static`.}
  WEARABLE_PAGER*: jint {.`static`.}
  WEARABLE_JACKET*: jint {.`static`.}
  WEARABLE_HELMET*: jint {.`static`.}
  WEARABLE_GLASSES*: jint {.`static`.}
  TOY_UNCATEGORIZED*: jint {.`static`.}
  TOY_ROBOT*: jint {.`static`.}
  TOY_VEHICLE*: jint {.`static`.}
  TOY_DOLL_ACTION_FIGURE*: jint {.`static`.}
  TOY_CONTROLLER*: jint {.`static`.}
  TOY_GAME*: jint {.`static`.}
  HEALTH_UNCATEGORIZED*: jint {.`static`.}
  HEALTH_BLOOD_PRESSURE*: jint {.`static`.}
  HEALTH_THERMOMETER*: jint {.`static`.}
  HEALTH_WEIGHING*: jint {.`static`.}
  HEALTH_GLUCOSE*: jint {.`static`.}
  HEALTH_PULSE_OXIMETER*: jint {.`static`.}
  HEALTH_PULSE_RATE*: jint {.`static`.}
  HEALTH_DATA_DISPLAY*: jint {.`static`.}
  PERIPHERAL_NON_KEYBOARD_NON_POINTING*: jint {.`static`.}
  PERIPHERAL_KEYBOARD*: jint {.`static`.}
  PERIPHERAL_POINTING*: jint {.`static`.}
  PERIPHERAL_KEYBOARD_POINTING*: jint {.`static`.}

jclass android.bluetooth.Major* of JVMObject:
  MISC*: jint {.`static`.}
  COMPUTER*: jint {.`static`.}
  PHONE*: jint {.`static`.}
  NETWORKING*: jint {.`static`.}
  AUDIO_VIDEO*: jint {.`static`.}
  PERIPHERAL*: jint {.`static`.}
  IMAGING*: jint {.`static`.}
  WEARABLE*: jint {.`static`.}
  TOY*: jint {.`static`.}
  HEALTH*: jint {.`static`.}
  UNCATEGORIZED*: jint {.`static`.}


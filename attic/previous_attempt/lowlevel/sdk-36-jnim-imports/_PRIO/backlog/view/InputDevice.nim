import jnim

jclass android.view.InputDevice* of JVMObject:
  proc getDevice*(id: jint): InputDevice {.`static`.}
  proc getDeviceIds*(): seq[jint] {.`static`.}
  proc getId*(): jint
  proc getControllerNumber*(): jint
  proc getIdentifier*(): InputDeviceIdentifier
  proc getGeneration*(): jint
  proc getVendorId*(): jint
  proc getProductId*(): jint
  proc getDeviceBus*(): jint
  proc getDescriptor*(): string
  proc isVirtual*(): jboolean
  proc isExternal*(): jboolean
  proc isFullKeyboard*(): jboolean
  proc getName*(): string
  proc getSources*(): jint
  proc supportsSource*(source: jint): jboolean
  proc getKeyboardType*(): jint
  proc getKeyCharacterMap*(): KeyCharacterMap
  proc getKeyboardLanguageTag*(): string
  proc getKeyboardLayoutType*(): string
  proc hasKeys*(keys: jint): seq[jboolean]
  proc getKeyCodeForKeyLocation*(locationKeyCode: jint): jint
  proc getMotionRange*(axis: jint): MotionRange
  proc getMotionRange*(axis: jint, source: jint): MotionRange
  proc getMotionRanges*(): List[MotionRange]
  proc getViewBehavior*(): ViewBehavior
  proc getBluetoothAddress*(): string
  proc getVibrator*(): Vibrator
  proc getVibratorManager*(): VibratorManager
  proc getBatteryState*(): BatteryState
  proc getLightsManager*(): LightsManager
  proc getSensorManager*(): SensorManager
  proc isEnabled*(): jboolean
  proc enable*()
  proc disable*()
  proc hasMicrophone*(): jboolean
  proc hasButtonUnderPad*(): jboolean
  proc hasSensor*(): jboolean
  proc hasBattery*(): jboolean
  proc getHostUsiVersion*(): HostUsiVersion
  proc getAssociatedDisplayId*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  SOURCE_CLASS_MASK*: jint {.`static`.}
  SOURCE_CLASS_NONE*: jint {.`static`.}
  SOURCE_CLASS_BUTTON*: jint {.`static`.}
  SOURCE_CLASS_POINTER*: jint {.`static`.}
  SOURCE_CLASS_TRACKBALL*: jint {.`static`.}
  SOURCE_CLASS_POSITION*: jint {.`static`.}
  SOURCE_CLASS_JOYSTICK*: jint {.`static`.}
  SOURCE_UNKNOWN*: jint {.`static`.}
  SOURCE_KEYBOARD*: jint {.`static`.}
  SOURCE_DPAD*: jint {.`static`.}
  SOURCE_GAMEPAD*: jint {.`static`.}
  SOURCE_TOUCHSCREEN*: jint {.`static`.}
  SOURCE_MOUSE*: jint {.`static`.}
  SOURCE_STYLUS*: jint {.`static`.}
  SOURCE_BLUETOOTH_STYLUS*: jint {.`static`.}
  SOURCE_TRACKBALL*: jint {.`static`.}
  SOURCE_MOUSE_RELATIVE*: jint {.`static`.}
  SOURCE_TOUCHPAD*: jint {.`static`.}
  SOURCE_TOUCH_NAVIGATION*: jint {.`static`.}
  SOURCE_ROTARY_ENCODER*: jint {.`static`.}
  SOURCE_JOYSTICK*: jint {.`static`.}
  SOURCE_HDMI*: jint {.`static`.}
  SOURCE_SENSOR*: jint {.`static`.}
  SOURCE_ANY*: jint {.`static`.}
  MOTION_RANGE_X*: jint {.`static`.}
  MOTION_RANGE_Y*: jint {.`static`.}
  MOTION_RANGE_PRESSURE*: jint {.`static`.}
  MOTION_RANGE_SIZE*: jint {.`static`.}
  MOTION_RANGE_TOUCH_MAJOR*: jint {.`static`.}
  MOTION_RANGE_TOUCH_MINOR*: jint {.`static`.}
  MOTION_RANGE_TOOL_MAJOR*: jint {.`static`.}
  MOTION_RANGE_TOOL_MINOR*: jint {.`static`.}
  MOTION_RANGE_ORIENTATION*: jint {.`static`.}
  KEYBOARD_TYPE_NONE*: jint {.`static`.}
  KEYBOARD_TYPE_NON_ALPHABETIC*: jint {.`static`.}
  KEYBOARD_TYPE_ALPHABETIC*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[InputDevice] {.`static`.}

jclass android.view.InputDevice.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setGeneration*(generation: jint): Builder
  proc setControllerNumber*(controllerNumber: jint): Builder
  proc setName*(name: string): Builder
  proc setVendorId*(vendorId: jint): Builder
  proc setProductId*(productId: jint): Builder
  proc setDeviceBus*(deviceBus: jint): Builder
  proc setDescriptor*(descriptor: string): Builder
  proc setExternal*(external: jboolean): Builder
  proc setSources*(sources: jint): Builder
  proc setKeyboardType*(keyboardType: jint): Builder
  proc setKeyCharacterMap*(keyCharacterMap: KeyCharacterMap): Builder
  proc setHasVibrator*(hasVibrator: jboolean): Builder
  proc setHasMicrophone*(hasMicrophone: jboolean): Builder
  proc setHasButtonUnderPad*(hasButtonUnderPad: jboolean): Builder
  proc setHasSensor*(hasSensor: jboolean): Builder
  proc setHasBattery*(hasBattery: jboolean): Builder
  proc setKeyboardLanguageTag*(keyboardLanguageTag: string): Builder
  proc setKeyboardLayoutType*(keyboardLayoutType: string): Builder
  proc setUsiVersion*(usiVersion: HostUsiVersion): Builder
  proc setAssociatedDisplayId*(displayId: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc addMotionRange*(axis: jint, source: jint, min: jfloat, max: jfloat, flat: jfloat, fuzz: jfloat, resolution: jfloat): Builder
  proc setShouldSmoothScroll*(shouldSmoothScroll: jboolean): Builder
  proc build*(): InputDevice

jclass android.view.InputDevice.MotionRange* of JVMObject:
  proc getAxis*(): jint
  proc getSource*(): jint
  proc isFromSource*(source: jint): jboolean
  proc getMin*(): jfloat
  proc getMax*(): jfloat
  proc getRange*(): jfloat
  proc getFlat*(): jfloat
  proc getFuzz*(): jfloat
  proc getResolution*(): jfloat

jclass android.view.InputDevice.ViewBehavior* of JVMObject:
  proc shouldSmoothScroll*(axis: jint, source: jint): jboolean

jclass android.view.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setGeneration*(generation: jint): Builder
  proc setControllerNumber*(controllerNumber: jint): Builder
  proc setName*(name: string): Builder
  proc setVendorId*(vendorId: jint): Builder
  proc setProductId*(productId: jint): Builder
  proc setDeviceBus*(deviceBus: jint): Builder
  proc setDescriptor*(descriptor: string): Builder
  proc setExternal*(external: jboolean): Builder
  proc setSources*(sources: jint): Builder
  proc setKeyboardType*(keyboardType: jint): Builder
  proc setKeyCharacterMap*(keyCharacterMap: KeyCharacterMap): Builder
  proc setHasVibrator*(hasVibrator: jboolean): Builder
  proc setHasMicrophone*(hasMicrophone: jboolean): Builder
  proc setHasButtonUnderPad*(hasButtonUnderPad: jboolean): Builder
  proc setHasSensor*(hasSensor: jboolean): Builder
  proc setHasBattery*(hasBattery: jboolean): Builder
  proc setKeyboardLanguageTag*(keyboardLanguageTag: string): Builder
  proc setKeyboardLayoutType*(keyboardLayoutType: string): Builder
  proc setUsiVersion*(usiVersion: HostUsiVersion): Builder
  proc setAssociatedDisplayId*(displayId: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc addMotionRange*(axis: jint, source: jint, min: jfloat, max: jfloat, flat: jfloat, fuzz: jfloat, resolution: jfloat): Builder
  proc setShouldSmoothScroll*(shouldSmoothScroll: jboolean): Builder
  proc build*(): InputDevice

jclass android.view.MotionRange* of JVMObject:
  proc getAxis*(): jint
  proc getSource*(): jint
  proc isFromSource*(source: jint): jboolean
  proc getMin*(): jfloat
  proc getMax*(): jfloat
  proc getRange*(): jfloat
  proc getFlat*(): jfloat
  proc getFuzz*(): jfloat
  proc getResolution*(): jfloat

jclass android.view.ViewBehavior* of JVMObject:
  proc shouldSmoothScroll*(axis: jint, source: jint): jboolean


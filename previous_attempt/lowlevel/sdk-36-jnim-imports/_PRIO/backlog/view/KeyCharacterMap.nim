import jnim

jclass android.view.KeyCharacterMap* of JVMObject:
  proc obtainEmptyMap*(deviceId: jint): KeyCharacterMap {.`static`.}
  proc load*(deviceId: jint): KeyCharacterMap {.`static`.}
  proc load*(layoutDescriptor: string, overlay: string): KeyCharacterMap {.`static`.}
  proc getMappedKeyOrDefault*(scanCode: jint, defaultKeyCode: jint): jint
  proc get*(keyCode: jint, metaState: jint): jint
  proc getFallbackAction*(keyCode: jint, metaState: jint): FallbackAction
  proc getNumber*(keyCode: jint): jchar
  proc getMatch*(keyCode: jint, chars: seq[jchar]): jchar
  proc getMatch*(keyCode: jint, chars: seq[jchar], metaState: jint): jchar
  proc getDisplayLabel*(keyCode: jint): jchar
  proc getDeadChar*(accent: jint, c: jint): jint {.`static`.}
  proc getCombiningChar*(accent: jint): jint {.`static`.}
  proc getKeyData*(keyCode: jint, results: KeyData): jboolean
  proc getEvents*(chars: seq[jchar]): seq[KeyEvent]
  proc isPrintingKey*(keyCode: jint): jboolean
  proc getKeyboardType*(): jint
  proc getModifierBehavior*(): jint
  proc deviceHasKey*(keyCode: jint): jboolean {.`static`.}
  proc deviceHasKeys*(keyCodes: seq[jint]): seq[jboolean] {.`static`.}
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(obj: JObject): jboolean
  BUILT_IN_KEYBOARD*: jint {.`static`.}
  VIRTUAL_KEYBOARD*: jint {.`static`.}
  NUMERIC*: jint {.`static`.}
  PREDICTIVE*: jint {.`static`.}
  ALPHA*: jint {.`static`.}
  FULL*: jint {.`static`.}
  SPECIAL_FUNCTION*: jint {.`static`.}
  HEX_INPUT*: jchar {.`static`.}
  PICKER_DIALOG_INPUT*: jchar {.`static`.}
  MODIFIER_BEHAVIOR_CHORDED*: jint {.`static`.}
  MODIFIER_BEHAVIOR_CHORDED_OR_TOGGLED*: jint {.`static`.}
  COMBINING_ACCENT*: jint {.`static`.}
  COMBINING_ACCENT_MASK*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[KeyCharacterMap] {.`static`.}

jclass android.view.KeyCharacterMap.FallbackAction* of JVMObject:
  proc obtain*(): FallbackAction {.`static`.}
  proc recycle*()

jclass android.view.KeyData* of JVMObject:
  META_LENGTH*: jint {.`static`.}
  displayLabel*: jchar
  number*: jchar
  meta*: jchar

jclass android.view.UnavailableException* of AndroidRuntimeException:

jclass android.view.FallbackAction* of JVMObject:
  proc obtain*(): FallbackAction {.`static`.}
  proc recycle*()
  keyCode*: jint
  metaState*: jint


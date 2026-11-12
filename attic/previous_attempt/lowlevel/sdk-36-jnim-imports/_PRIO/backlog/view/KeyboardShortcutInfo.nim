import jnim

jclass android.view.KeyboardShortcutInfo* of JVMObject:
  proc getLabel*(): CharSequence
  proc getIcon*(): Icon
  proc clearIcon*()
  proc getKeycode*(): jint
  proc getBaseCharacter*(): jchar
  proc getModifiers*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[KeyboardShortcutInfo] {.`static`.}


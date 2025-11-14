import jnim

jclass android.view.KeyboardShortcutGroup* of JVMObject:
  proc getLabel*(): CharSequence
  proc getItems*(): List[KeyboardShortcutInfo]
  proc isSystemGroup*(): jboolean
  proc setPackageName*(packageName: CharSequence)
  proc getPackageName*(): CharSequence
  proc addItem*(item: KeyboardShortcutInfo)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[KeyboardShortcutGroup] {.`static`.}


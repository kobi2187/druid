import jnim

jclass android.content.ClipboardManager* of ClipboardManager:
  proc areClipboardAccessNotificationsEnabled*(): jboolean
  proc setClipboardAccessNotificationsEnabled*(enable: jboolean)
  proc setPrimaryClip*(clip: ClipData)
  proc setPrimaryClipAsPackage*(clip: ClipData, sourcePackage: string)
  proc clearPrimaryClip*()
  proc getPrimaryClip*(): ClipData
  proc getPrimaryClipDescription*(): ClipDescription
  proc hasPrimaryClip*(): jboolean
  proc addPrimaryClipChangedListener*(what: OnPrimaryClipChangedListener)
  proc removePrimaryClipChangedListener*(what: OnPrimaryClipChangedListener)
  proc getText*(): CharSequence
  proc setText*(text: CharSequence)
  proc hasText*(): jboolean
  proc getPrimaryClipSource*(): string
  DEVICE_CONFIG_SHOW_ACCESS_NOTIFICATIONS*: string {.`static`.}
  DEVICE_CONFIG_DEFAULT_SHOW_ACCESS_NOTIFICATIONS*: jboolean {.`static`.}
  DEVICE_CONFIG_ALLOW_VIRTUALDEVICE_SILOS*: string {.`static`.}
  DEVICE_CONFIG_DEFAULT_ALLOW_VIRTUALDEVICE_SILOS*: jboolean {.`static`.}


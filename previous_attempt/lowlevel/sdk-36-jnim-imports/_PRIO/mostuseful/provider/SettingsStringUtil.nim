import jnim

jclass android.provider.SettingsStringUtil* of JVMObject:
  DELIMITER*: string {.`static`.}

jclass android.provider.SettingsStringUtil.ColonDelimitedSet* of JVMObject:
  proc toString*(): string

jclass android.provider.SettingsStringUtil.ComponentNameSet* of JVMObject:
  proc add*(delimitedElements: string, element: ComponentName): string {.`static`.}
  proc remove*(delimitedElements: string, element: ComponentName): string {.`static`.}
  proc contains*(delimitedElements: string, element: ComponentName): jboolean {.`static`.}

jclass android.provider.SettingsStringUtil.SettingStringHelper* of JVMObject:
  proc read*(): string
  proc write*(value: string): jboolean
  proc modify*(change: Function[string, string]): jboolean

jclass android.provider.ColonDelimitedSet* of HashSet:
  proc toString*(): string

jclass android.provider.ColonDelimitedSet.OfStrings* of JVMObject:
  proc addAll*(delimitedElements: string, elements: Collection[string]): string {.`static`.}
  proc add*(delimitedElements: string, element: string): string {.`static`.}
  proc remove*(delimitedElements: string, element: string): string {.`static`.}
  proc contains*(delimitedElements: string, element: string): jboolean {.`static`.}

jclass android.provider.OfStrings* of ColonDelimitedSet:
  proc addAll*(delimitedElements: string, elements: Collection[string]): string {.`static`.}
  proc add*(delimitedElements: string, element: string): string {.`static`.}
  proc remove*(delimitedElements: string, element: string): string {.`static`.}
  proc contains*(delimitedElements: string, element: string): jboolean {.`static`.}

jclass android.provider.ComponentNameSet* of ColonDelimitedSet:
  proc add*(delimitedElements: string, element: ComponentName): string {.`static`.}
  proc remove*(delimitedElements: string, element: ComponentName): string {.`static`.}
  proc contains*(delimitedElements: string, element: ComponentName): jboolean {.`static`.}

jclass android.provider.SettingStringHelper* of JVMObject:
  proc read*(): string
  proc write*(value: string): jboolean
  proc modify*(change: Function[string, string]): jboolean


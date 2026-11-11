import jnim

jclass android.app.LocaleManager* of JVMObject:
  proc setApplicationLocales*(locales: LocaleList)
  proc setApplicationLocales*(appPackageName: string, locales: LocaleList)
  proc getApplicationLocales*(): LocaleList
  proc getApplicationLocales*(appPackageName: string): LocaleList
  proc getSystemLocales*(): LocaleList
  proc setSystemLocales*(locales: LocaleList)
  proc setOverrideLocaleConfig*(localeConfig: LocaleConfig)
  proc getOverrideLocaleConfig*(): LocaleConfig


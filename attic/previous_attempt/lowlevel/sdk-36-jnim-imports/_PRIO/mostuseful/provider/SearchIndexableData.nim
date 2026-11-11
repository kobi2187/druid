import jnim

jclass android.provider.SearchIndexableData* of JVMObject:
  proc toString*(): string
  context*: Context
  locale*: Locale
  enabled*: jboolean
  rank*: jint
  key*: string
  userId*: jint
  className*: string
  packageName*: string
  iconResId*: jint
  intentAction*: string
  intentTargetPackage*: string
  intentTargetClass*: string


import jnim

jclass android.util.KeyValueSettingObserver* of JVMObject:
  proc start*()
  proc stop*()
  proc getSettingValue*(resolver: ContentResolver): string
  proc update*(parser: KeyValueListParser)


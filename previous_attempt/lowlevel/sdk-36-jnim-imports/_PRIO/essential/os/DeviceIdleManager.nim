import jnim

jclass android.os.DeviceIdleManager* of JVMObject:
  proc endIdle*(reason: string)
  proc getSystemPowerWhitelistExceptIdle*(): seq[string]
  proc getSystemPowerWhitelist*(): seq[string]


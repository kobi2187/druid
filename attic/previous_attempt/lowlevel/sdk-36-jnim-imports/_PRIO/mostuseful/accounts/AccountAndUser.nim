import jnim

jclass android.accounts.AccountAndUser* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  account*: Account
  userId*: jint


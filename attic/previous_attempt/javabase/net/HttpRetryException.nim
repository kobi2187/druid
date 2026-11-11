import jnim

jclass java.net.HttpRetryException* of IOException:
  proc responseCode*(): jint
  proc getReason*(): string
  proc getLocation*(): string


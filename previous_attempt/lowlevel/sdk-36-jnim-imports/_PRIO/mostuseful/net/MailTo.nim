import jnim

jclass android.net.MailTo* of JVMObject:
  proc isMailTo*(url: string): jboolean {.`static`.}
  proc parse*(url: string): MailTo {.`static`.}
  proc getTo*(): string
  proc getCc*(): string
  proc getSubject*(): string
  proc getBody*(): string
  proc getHeaders*(): Map[string, string]
  proc toString*(): string
  MAILTO_SCHEME*: string {.`static`.}


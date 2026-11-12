import jnim

jclass android.os.ServiceSpecificException* of RuntimeException:
  proc toString*(): string
  errorCode*: jint


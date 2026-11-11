import jnim

jclass android.system.GaiException* of RuntimeException:
  proc getMessage*(): string
  proc rethrowAsUnknownHostException*(detailMessage: string): UnknownHostException
  proc rethrowAsUnknownHostException*(): UnknownHostException
  error*: jint


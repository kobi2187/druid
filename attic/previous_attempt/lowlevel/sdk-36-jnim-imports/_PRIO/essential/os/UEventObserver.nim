import jnim

jclass android.os.UEventObserver* of JVMObject:
  proc startObserving*(match: string)
  proc stopObserving*()
  proc onUEvent*(event: UEvent)

jclass android.os.UEventObserver.UEvent* of JVMObject:
  proc get*(key: string): string
  proc get*(key: string, defaultValue: string): string
  proc toString*(): string

jclass android.os.UEvent* of JVMObject:
  proc get*(key: string): string
  proc get*(key: string, defaultValue: string): string
  proc toString*(): string


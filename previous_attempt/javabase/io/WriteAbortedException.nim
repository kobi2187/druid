import jnim

jclass java.io.WriteAbortedException* of ObjectStreamException:
  proc getMessage*(): string
  proc getCause*(): Throwable
  detail*: Exception


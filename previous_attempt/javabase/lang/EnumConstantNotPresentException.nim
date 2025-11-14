import jnim

jclass java.lang.EnumConstantNotPresentException* of RuntimeException:
  proc enumType*(): Class[? extends Enum]
  proc constantName*(): string


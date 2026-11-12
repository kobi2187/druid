import jnim

jclass java.lang.Enum* of JVMObject:
  proc name*(): string
  proc ordinal*(): jint
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc compareTo*(o: E): jint
  proc getDeclaringClass*(): Class[E]
  proc describeConstable*(): Optional[EnumDesc[E]]
  proc valueOf*(enumClass: Class[T], name: string): T {.`static`.}

jclass java.lang.Enum.EnumDesc* of JVMObject:
  proc of*(enumClass: ClassDesc, constantName: string): EnumDesc[E] {.`static`.}
  proc resolveConstantDesc*(lookup: MethodHandles.Lookup): E
  proc toString*(): string

jclass java.lang.EnumDesc* of DynamicConstantDesc:
  proc of*(enumClass: ClassDesc, constantName: string): EnumDesc[E] {.`static`.}
  proc resolveConstantDesc*(lookup: MethodHandles.Lookup): E
  proc toString*(): string


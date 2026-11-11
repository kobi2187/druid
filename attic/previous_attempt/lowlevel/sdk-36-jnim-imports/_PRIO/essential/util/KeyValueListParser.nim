import jnim

jclass android.util.KeyValueListParser* of JVMObject:
  proc setString*(str: string)
  proc getInt*(key: string, def: jint): jint
  proc getLong*(key: string, def: jlong): jlong
  proc getFloat*(key: string, def: jfloat): jfloat
  proc getString*(key: string, def: string): string
  proc getBoolean*(key: string, def: jboolean): jboolean
  proc getIntArray*(key: string, def: seq[jint]): seq[jint]
  proc size*(): jint
  proc keyAt*(index: jint): string
  proc getDurationMillis*(key: string, def: jlong): jlong

jclass android.util.KeyValueListParser.IntValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jint
  proc getValue*(): jint
  proc setValue*(value: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.KeyValueListParser.LongValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jlong
  proc getValue*(): jlong
  proc setValue*(value: jlong)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.KeyValueListParser.StringValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): string
  proc getValue*(): string
  proc setValue*(value: string)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.KeyValueListParser.FloatValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jfloat
  proc getValue*(): jfloat
  proc setValue*(value: jfloat)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.IntValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jint
  proc getValue*(): jint
  proc setValue*(value: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.LongValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jlong
  proc getValue*(): jlong
  proc setValue*(value: jlong)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.StringValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): string
  proc getValue*(): string
  proc setValue*(value: string)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)

jclass android.util.FloatValue* of JVMObject:
  proc parse*(parser: KeyValueListParser)
  proc getKey*(): string
  proc getDefaultValue*(): jfloat
  proc getValue*(): jfloat
  proc setValue*(value: jfloat)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpProto*(proto: ProtoOutputStream, tag: jlong)


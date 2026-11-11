import jnim

jclass android.widget.Filter* of JVMObject:
  proc setDelayer*(delayer: Delayer)
  proc filter*(constraint: CharSequence)
  proc filter*(constraint: CharSequence, listener: FilterListener)
  proc convertResultToString*(resultValue: JObject): CharSequence

jclass android.widget.Filter.FilterListener* of JVMObject:
  proc onFilterComplete*(count: jint)

jclass android.widget.FilterListener* of JVMObject:
  proc onFilterComplete*(count: jint)


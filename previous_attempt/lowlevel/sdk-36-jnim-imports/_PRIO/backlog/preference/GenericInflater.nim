import jnim

jclass android.preference.Parent* of JVMObject:
  proc addItemFromInflater*(child: T)

jclass android.preference.Factory* of JVMObject:
  proc onCreateItem*(name: string, context: Context, attrs: AttributeSet): T


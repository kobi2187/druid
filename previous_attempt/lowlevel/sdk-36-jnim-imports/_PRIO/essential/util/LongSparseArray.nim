import jnim

jclass android.util.LongSparseArray* of JVMObject:
  proc clone*(): LongSparseArray[E]
  proc get*(key: jlong): E
  proc get*(key: jlong, valueIfKeyNotFound: E): E
  proc delete*(key: jlong)
  proc remove*(key: jlong)
  proc removeIf*(filter: LongObjPredicate[? super E])
  proc removeAt*(index: jint)
  proc firstIndexOnOrAfter*(key: jlong): jint
  proc lastIndexOnOrBefore*(key: jlong): jint
  proc put*(key: jlong, value: E)
  proc size*(): jint
  proc keyAt*(index: jint): jlong
  proc valueAt*(index: jint): E
  proc setValueAt*(index: jint, value: E)
  proc indexOfKey*(key: jlong): jint
  proc indexOfValue*(value: E): jint
  proc indexOfValueByValue*(value: E): jint
  proc clear*()
  proc append*(key: jlong, value: E)
  proc toString*(): string

jclass android.util.LongSparseArray.StringParcelling* of JVMObject:
  proc parcel*(array: LongSparseArray[string], dest: Parcel, parcelFlags: jint)
  proc unparcel*(source: Parcel): LongSparseArray[string]

jclass android.util.StringParcelling* of JVMObject:
  proc parcel*(array: LongSparseArray[string], dest: Parcel, parcelFlags: jint)
  proc unparcel*(source: Parcel): LongSparseArray[string]


import jnim

jclass android.util.LongSparseLongArray* of JVMObject:
  proc clone*(): LongSparseLongArray
  proc get*(key: jlong): jlong
  proc get*(key: jlong, valueIfKeyNotFound: jlong): jlong
  proc delete*(key: jlong)
  proc removeAt*(index: jint)
  proc put*(key: jlong, value: jlong)
  proc size*(): jint
  proc keyAt*(index: jint): jlong
  proc valueAt*(index: jint): jlong
  proc indexOfKey*(key: jlong): jint
  proc indexOfValue*(value: jlong): jint
  proc clear*()
  proc append*(key: jlong, value: jlong)
  proc toString*(): string

jclass android.util.LongSparseLongArray.Parcelling* of JVMObject:
  proc parcel*(array: LongSparseLongArray, dest: Parcel, parcelFlags: jint)
  proc unparcel*(source: Parcel): LongSparseLongArray

jclass android.util.Parcelling* of JVMObject:
  proc parcel*(array: LongSparseLongArray, dest: Parcel, parcelFlags: jint)
  proc unparcel*(source: Parcel): LongSparseLongArray

